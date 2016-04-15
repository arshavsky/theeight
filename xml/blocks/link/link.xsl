<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../lib/bem/bem.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/" mode="head">
    <xsl:apply-imports/>
    <link href="../blocks/link/link.less" rel="stylesheet" type="text/css"/>
    <script src="../blocks/link/link.js" type="text/javascript"></script>
</xsl:template> 

<xsl:template match="b-link" mode="expand">
    <b-link>
        <xsl:apply-templates select="../b-link" mode="bem"/>
    </b-link>
</xsl:template>

<xsl:template match="b-link" mode="bem">
    <div class="{name()}">
        <a class="{name()}" m:color="{@color}" href="{@href}">
            <xsl:attribute name="class">
                <xsl:value-of select="local-name()"/>
                <xsl:apply-templates select="@m:*">
                    <xsl:with-param name="name" select="local-name()"/>
                </xsl:apply-templates>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </a>   
    </div>
</xsl:template>
            
</xsl:stylesheet>  





