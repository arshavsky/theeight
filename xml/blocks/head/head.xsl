<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../lib/bem/bem.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/" mode="head">
    <xsl:apply-imports/>
    <link href="../blocks/head/head.less" rel="stylesheet" type="text/css"/>
</xsl:template> 

<xsl:template match="b-head" mode="expand">
    <b-head l:grid="{@grid}">
        <xsl:apply-templates select="b-logo" mode="expand"/>
        <xsl:apply-templates select="subtitle" mode="b-head"/>
    </b-head>
</xsl:template>

<xsl:template match="subtitle" mode="b-head">
    <subtitle>
        <xsl:value-of select="."/>
    </subtitle>
</xsl:template>

</xsl:stylesheet>