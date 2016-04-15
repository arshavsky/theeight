<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../lib/bem/bem.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/" mode="head">
    <xsl:apply-imports/>
    <link href="../blocks/input/input.less" rel="stylesheet" type="text/css"/>
</xsl:template> 

<xsl:template match="b-input" mode="expand">
    <b-input width="{@width}" hint="{@hint}" value="{.}" m:pin="{@pin}">
    	<xsl:apply-templates select="../b-input" mode="bem"/>
    </b-input>
</xsl:template>

<xsl:template match="b-input" mode="bem">
    <div class="input" style="width: {@width}px" value="{@value}">
        <xsl:attribute name="class">
            <xsl:value-of select="local-name()"/>
            <xsl:apply-templates select="@m:*">
                <xsl:with-param name="name" select="local-name()"/>
            </xsl:apply-templates>
        </xsl:attribute>
        <input class="b-input__input" style="width: {@width}px" placeholder="{@hint}" value="{@value}" m:pin="{@pin}"/>
        <div class="b-input__ground"></div>
    </div>
</xsl:template>

</xsl:stylesheet>