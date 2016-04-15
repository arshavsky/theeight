<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../lib/bem/bem.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/" mode="head">
    <xsl:apply-imports/>
    <link href="../blocks/image/image.less" rel="stylesheet" type="text/css"/>
</xsl:template> 

<xsl:template match="b-image" mode="bem">
    <xsl:choose>
        <xsl:when test="@url">
            <a href="{@url}">
                <img>
                    <xsl:apply-templates select="." mode="m"/>
                </img>    
            </a>
        </xsl:when>
        <xsl:otherwise>
            <img src="{.}">
                <xsl:apply-templates select="." mode="m"/>
            </img>
        </xsl:otherwise>
    </xsl:choose>
    <div class="b-image__hint"><xsl:value-of select="hint"/></div>
</xsl:template>

</xsl:stylesheet>