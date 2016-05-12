<?xml version="1.0" encoding="UTF-8" ?>

<!-- https://github.com/engel731/Livre-or.git
Fait par Bazire Tanguy (engel731) le 03/05/2016
Document xsl openSource -->
 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output
        method="html"
        encoding="UTF-8"
        doctype-public="-//W3C//DTD HTML 4.01//EN"
        doctype-system="http://www.w3.org/TR/html4/strict.dtd"
        indent="yes" />
    
    <!-- Contenue complet livre d'or -->
    <xsl:template match="/">
        <xsl:for-each select="/livreOr/commentaire[@id=$index]">
            <xsl:call-template name="commentaire">
                <xsl:with-param name="id" select="@id" />
                <xsl:with-param name="note" select="@note" />
                <xsl:with-param name="titre" select="titre" />
                <xsl:with-param name="pseudo" select="pseudo" />
                <xsl:with-param name="contenu" select="contenu" />
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
 
    <!-- Structure commentaire -->
    <xsl:template name="commentaire">
        <xsl:param name="id"></xsl:param>
        <xsl:param name="note"></xsl:param>
        <xsl:param name="titre"></xsl:param>
        <xsl:param name="pseudo"></xsl:param>
        <xsl:param name="contenu"></xsl:param>
 
        <!-- Squelette html -->
        <article>
            <xsl:attribute name="id">art-<xsl:value-of select="$id" /></xsl:attribute>
            <h1><xsl:value-of select="$titre" /></h1>
            <p>
                <span id="pseudo"><xsl:value-of select="$pseudo" /></span>
               
                <xsl:element name="img">
                    <xsl:choose>
                        <xsl:when test="$note='quatre'">
                            <xsl:attribute name="src">../images/quatre.png</xsl:attribute>
                            <xsl:attribute name="alt">quatre/quatre</xsl:attribute>
                        </xsl:when>

                        <xsl:when test="$note='trois'">
                            <xsl:attribute name="src">../images/trois.png</xsl:attribute>
                            <xsl:attribute name="alt">trois/quatre</xsl:attribute>
                        </xsl:when>

                        <xsl:when test="$note='deux'">
                            <xsl:attribute name="src">../images/deux.png</xsl:attribute>
                            <xsl:attribute name="alt">deux/quatre</xsl:attribute>
                        </xsl:when>

                        <xsl:when test="$note='un'">
                            <xsl:attribute name="src">../images/un.png</xsl:attribute>
                            <xsl:attribute name="alt">un/quatre</xsl:attribute>
                        </xsl:when>

                        <xsl:when test="$note='zero'">
                            <xsl:attribute name="src">../images/zero.png</xsl:attribute>
                            <xsl:attribute name="alt">zero/quatre</xsl:attribute>
                        </xsl:when>
                        
                        <xsl:otherwise>
                            <xsl:attribute name="alt">Notation incomplète !</xsl:attribute>
                        </xsl:otherwise> 
                    </xsl:choose> 
                </xsl:element> 
                
                <span class="contenu"><xsl:value-of select="$contenu" /></span>
            </p>
        </article>
    </xsl:template>
 
</xsl:stylesheet>
