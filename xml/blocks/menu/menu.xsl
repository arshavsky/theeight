<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../lib/bem/bem.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/" mode="head">
    <xsl:apply-imports/>
    <link href="../blocks/menu/menu.less" rel="stylesheet" type="text/css"/>
</xsl:template>

<xsl:template match="b-menu" mode="expand">
	<b-nav l:grid="{@grid}">
		<link>
            <xsl:apply-templates select="link" mode="b-menu"/>
        </link>
	</b-nav>
</xsl:template>

<xsl:template match="link" mode="b-menu">
    <item href="{@href}">
        <xsl:value-of select="."/>
    </item>
</xsl:template>

</xsl:stylesheet><!---->
