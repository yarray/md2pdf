#! /usr/bin/env python
'''
compiler from markdown file to pdf using wkhtmltopdf

Usage:
    compile.py [--script FILE] [--style FILE]
               [--pdf-options STRING] [--toc] <input> [<output>]
    compile.py (-h | --help)

Options:
    -h --help               Show help screen
    --script FILE           Script reference to be used in html
    --style FILE            The css stylesheet
    --pdf-options STRING    Options passed to wkhtmltopdf
    --toc                   Generate table of content
'''


import os
import sys

sys.path.append(os.path.join(os.path.dirname(__file__), 'lib'))
from docopt import docopt


COVERTOR = os.path.join(os.path.dirname(__file__), 'wkhtmltopdf-amd64')


def compile_to_html(source, toc=False):
    if toc:
        try:
            import markdown
            with open(source) as f:
                return markdown.markdown(f.read(), extensions=['toc'])
        except:
            return os.popen('markdown {0}'.format(source)).read()
    return os.popen('markdown {0}'.format(source)).read()


def build_sample(html, style):
    text = ''
    if style:
        text += '<head><link href="{0}" rel="stylesheet"></head>\n'\
                .format(style)

    return text + html


def write_html(html, name, script_name):
    text = '<html lang="en-us">'
    text += html
    if script_name:
        with open(script_name) as sc:
            text += sc.read()
    text += '</html>'
    with open(name, 'w') as f:
        f.write(text)


def generate_pdf(for_print, output, options):
    cmd = COVERTOR + ' --encoding utf-8 -s A4 ' + \
        (options + ' ' if options else '') + \
        './{0} --javascript-delay 1000 {1}'.format(for_print, output)
    print cmd
    os.system(cmd)


if __name__ == '__main__':
    args = docopt(__doc__)
    source = args['<input>']
    name, ext = os.path.splitext(source)
    out_name = args['<output>'] if args['<output>'] else (name + '.pdf')
    sample = name + '.sample.html'
    style = args['--style']
    script = args['--script']
    pdf_options = args['--pdf-options']

    html = compile_to_html(source, args['--toc'])

    write_html(build_sample(html, style), sample, script)
    generate_pdf(sample, out_name, pdf_options)
