<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../lib/bem/bem.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">

<xsl:template match="/" mode="head">
    <xsl:apply-imports/>
    <link href="../blocks/grid/grid.less" rel="stylesheet" type="text/css"/>
    <script src="../blocks/grid/grid.js" type="text/javascript"></script>
</xsl:template>

<xsl:template match="l-grid" mode="expand">
	<l-grid l:grid="wrap">
		<xsl:apply-templates select="*" mode="expand"/>
	</l-grid>
</xsl:template>

<xsl:template match="b-grid-visible">
	<b-see-grid l:grid="wrap,margin-x">
		<cols>
		<xsl:for-each select="col">
			<col/>
		</xsl:for-each>
		</cols>
	</b-see-grid>
</xsl:template>

</xsl:stylesheet>