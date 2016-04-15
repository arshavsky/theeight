<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../lib/bem/bem.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/" mode="head">
    <xsl:apply-imports/>
    <link href="../blocks/footer/footer.less" rel="stylesheet" type="text/css"/>
</xsl:template> 

<xsl:template match="b-footer" mode="expand">
    <b-footer l:grid="{@grid}">
        <xsl:apply-templates select="b-social" mode="expand"/>
        <!-- <copyright>
            <xsl:apply-templates select="copyright" mode="b-footer"/>
        </copyright> -->
        <link>
            <xsl:apply-templates select="link" mode="b-footer"/>
        </link>
        <lemniscate>
            <b-image src="../assets/i/marque.svg" url="http://thelemniscate.com"/>
        </lemniscate>
    </b-footer>    
</xsl:template>

<xsl:template match="link" mode="b-footer">
    <b-link href="{@href}" m:type="white">
        <xsl:value-of select="."/>
    </b-link>
</xsl:template>

</xsl:stylesheet>