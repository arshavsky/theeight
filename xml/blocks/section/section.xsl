<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../lib/bem/bem.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/" mode="head">
    <xsl:apply-imports/>
    <link href="../blocks/section/section.less" rel="stylesheet" type="text/css"/>
</xsl:template> 

<xsl:template match="b-section" mode="expand">
	<b-section l:grid="{@grid}">
		<section-heading>
			<h1><xsl:value-of select="{@title}"/></h1>
		</section-heading>
	
		<xsl:apply-templates select="b-carousel" mode="expand"/>

		<headign>
			<h3><xsl:value-of select="heading"/></h3>
		</heading>
		
		<text>
			<p><xsl:value-of select="text"/></p>
		</text>
	</b-section>
</xsl:template>

