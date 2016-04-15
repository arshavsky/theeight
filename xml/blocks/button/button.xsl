<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../lib/bem/bem.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/" mode="head">
    <xsl:apply-imports/>
    <link href="../blocks/button/button.less" rel="stylesheet" type="text/css"/>
</xsl:template>	

<xsl:template match="b-button" mode="expand">
    <b-button m:pin="{@pin}" m:diagonal="{@diagonal}">
        <xsl:apply-templates select="." mode="bem"/>
    </b-button>
</xsl:template>

<xsl:template match="b-button" mode="bem" >
    <button m:pin="{@pin}">
        <xsl:attribute name="class">
            <xsl:value-of select="local-name()"/>
            <xsl:apply-templates select="@m:*">
                <xsl:with-param name="name" select="local-name()"/>
            </xsl:apply-templates>
        </xsl:attribute>
        <span class="{name()}__ground"/>
        <span class="{name()}__label">
            <xsl:value-of select="."/>
        </span>
        <span class="{name()}__tip"/>
        <span class="{name()}__arrow"/>
    </button>   
</xsl:template>



</xsl:stylesheet>