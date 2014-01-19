<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:outline="http://code.google.com/p/wkhtmltopdf/outline"
                xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
              doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
              indent="yes" />
  <xsl:template match="outline:outline">
    <html>
      <head>
        <title>Table of Content</title>
        <style>
          hb {
            font-size: 36px;
            font-weight: lighter;
            white-space: wrap;
            font-family: "Open Sans Light";
          }

          hb+ul {
            margin-top: 80px;
          }

          hb+ul>li {
            margin-bottom: 30px;
          }

          div {
              display: inline-block;
              width: 97%;
              border-bottom: 1px dashed rgb(200,200,200);
          }
          div a {
              border-bottom: 1px solid white;
              padding-right: 10px;
          }
          span {float: right;}
          li {
              margin-bottom: 10px;
              font-family: Contra;
          }
          li:last-child {
              margin-bottom: 0;
          }
          ul {
              font-size: 18px;
              list-style: none;
              padding-left: 0;
          }
          ul ul {
              padding-left: 20px;
              margin-top: 10px;
          }
          a {text-decoration:none; color: black;}
          ul > li:before {
              content: "\25b7";
              margin-right: 5px;
              display: inline-block;
          }
        </style>
      </head>
      <body>
        <hb>Table of Content</hb>
        <ul><xsl:apply-templates select="outline:item/outline:item"/></ul>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="outline:item">
    <li>
      <xsl:if test="@title!=''">
        <div>
          <a>
            <xsl:if test="@link">
              <xsl:attribute name="href"><xsl:value-of select="@link"/></xsl:attribute>
            </xsl:if>
            <xsl:if test="@backLink">
              <xsl:attribute name="name"><xsl:value-of select="@backLink"/></xsl:attribute>
            </xsl:if>
            <xsl:value-of select="@title" /> 
          </a>
          <span> <xsl:value-of select="@page" /> </span>
        </div>
      </xsl:if>
      <ul>
        <xsl:apply-templates select="outline:item"/>
      </ul>
    </li>
  </xsl:template>
</xsl:stylesheet>
