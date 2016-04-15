<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "bem.dtd">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" version="4.0" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
            <html xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
            <head>
                <xsl:apply-templates select="." mode="head"/>
            </head>
            <xsl:apply-templates select="." mode="bem"/>
        </html>
    </xsl:template>

    <xsl:template match="*" mode="bem">
        <div>
            <xsl:apply-templates select="." mode="m"/>
            <xsl:apply-templates select="*" mode="bem"/>
            <xsl:value-of select="text()"/>
        </div>  
    </xsl:template>

    <xsl:template match="*" mode="m">
        <xsl:copy-of select="@*[namespace-uri() = '' and name() != 'class']"/>
        <xsl:choose>
            <xsl:when test="starts-with(local-name(), 'b-')">
                <xsl:apply-templates select="." mode="b"/>
            </xsl:when>    
            <xsl:when test="starts-with(local-name(), 'l-')">
                <xsl:apply-templates select="." mode="l"/>
            </xsl:when>  
            <xsl:when test="@mode = 'htm'">
                <xsl:apply-templates select="." mode="htm"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="." mode="e"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="*" mode="htm">
        <xsl:attribute name="class">
            <xsl:value-of select="local-name()"/>
        </xsl:attribute>
    </xsl:template>

    <!-- <xsl:template match="*" mode="l">
        <xsl:attribute name="class">
            <xsl:value-of select="local-name()"/>
        </xsl:attribute>
    </xsl:template> -->

    <xsl:template match="*" mode="l">
        <xsl:copy-of select="@*[namespace-uri() = '' and name() != 'class']"/>
        <xsl:apply-templates select="." mode="layout"/>
        <xsl:apply-templates select="@l:*">
            <xsl:with-param name="name" select="local-name()"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="*" mode="layout">
        <xsl:attribute name="class">
            <xsl:value-of select="local-name()"/>
            <xsl:apply-templates select="@m:*" mode="layout">
                <xsl:with-param name="name" select="local-name()"/>
            </xsl:apply-templates>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="@m:*" mode="layout">
        <xsl:param name="name"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="$name"/>
        <xsl:text>_</xsl:text>
        <xsl:value-of select="local-name()"/>
    </xsl:template>

    <xsl:template match="*" mode="b">
        <xsl:attribute name="class">
            <xsl:value-of select="local-name()"/>
            <xsl:apply-templates select="@m:*">
                <xsl:with-param name="name" select="local-name()"/>
            </xsl:apply-templates>
            <xsl:apply-templates select="@l:*">
                <xsl:with-param name="name" select="local-name()"/>
            </xsl:apply-templates>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="*" mode="e">
        <xsl:param name="name">
            <xsl:variable name="ancestors" select="ancestor::*[starts-with(local-name(), 'b-')]"/>
            <xsl:value-of select="local-name($ancestors[position() = last()])"/>
            <xsl:text>__</xsl:text>
            <xsl:value-of select="local-name()"/>
        </xsl:param>

        <xsl:attribute name="class">
            <xsl:value-of select="$name"/>
            <xsl:apply-templates select="@m:*">
                <xsl:with-param name="name" select="$name"/>
            </xsl:apply-templates>
            <xsl:apply-templates select="@l:*">
                <xsl:with-param name="name" select="$name"/>
            </xsl:apply-templates>
        </xsl:attribute>

        <!-- <xsl:attribute name="class">
            <xsl:value-of select="$name"/>
            <xsl:apply-templates select="@l:*">
                <xsl:with-param name="name" select="$name"/>
            </xsl:apply-templates>
        </xsl:attribute> -->
    </xsl:template>

    <xsl:template match="@m:*">
        <xsl:param name="name"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="$name"/>
        <xsl:text>_</xsl:text>
        <xsl:value-of select="local-name()"/>_<xsl:value-of select="."/>
    </xsl:template>

    <!-- <xsl:template match="@l:grid">
        <xsl:text> </xsl:text>
        <xsl:text>l-grid_</xsl:text>
        <xsl:value-of select="."/>
    </xsl:template> -->

    <xsl:template match="@l:grid">
        <xsl:call-template name="tokenize">
            <xsl:with-param name="pText" select="concat(., ',')"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="tokenize">
        <xsl:param name="pText"/>
        <xsl:if test="string-length($pText)">
            <xsl:text> </xsl:text>
            <xsl:text>l-grid_</xsl:text>
            <xsl:value-of select="substring-before($pText, ',')"/>

            <xsl:call-template name="tokenize">
                <xsl:with-param name="pText" select="substring-after($pText, ',')"/>
            </xsl:call-template>
      </xsl:if>
    </xsl:template>

    <xsl:template match="@*"/>

    <func:function name="bem:block">
        <xsl:param name="block"/>
        <func:result>
            <xsl:apply-templates select="exsl:node-set($block)" mode="bem"/>
        </func:result>
    </func:function>
    
</xsl:stylesheet>