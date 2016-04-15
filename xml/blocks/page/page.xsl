<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../lib/bem/bem.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">

<xsl:template match="/" mode="head">
    <xsl:apply-imports/>
    <title><xsl:value-of select="page/@title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=yes"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link href="../blocks/page/page.less" rel="stylesheet" type="text/css"/>
</xsl:template>

<xsl:template match="/">
    <html>
        <head><xsl:apply-templates select="." mode="head"/></head>
        <body class="b-page l-grid_main">
            <xsl:apply-templates select="page" mode="b-page"/>
        </body>
    </html>    
</xsl:template>

<xsl:template match="page" mode="b-page">
    <div class="b-page__image">
        <div class="b-page__image-wrap" style="background-image: url('{@image}')"></div>
    </div>
    <xsl:variable name="page">
        <xsl:apply-templates select="*" mode="expand"/>
        <xsl:apply-templates select="../page/b-grid-visible"/>
    </xsl:variable>
    <xsl:copy-of select="bem:block($page)"/>
    
</xsl:template>

</xsl:stylesheet>