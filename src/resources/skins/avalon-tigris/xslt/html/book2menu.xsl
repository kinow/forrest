<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="path"/> <!-- filename, eg 'index.html' -->

  <xsl:include href="pathutils.xsl"/>
  <xsl:variable name="filename">
    <xsl:call-template name="filename">
      <xsl:with-param name="path" select="$path"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:template match="book">
    <div class="menuBar">
      <xsl:apply-templates select="menu"/>
    </div>
  </xsl:template>

  <xsl:template match="menu">
    <div class="menu">
      <span class="menuLabel"><xsl:value-of select="@label"/></span>
       <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="menu-item">
    <div class="menuItem">
       <xsl:choose>
        <xsl:when test="starts-with(@href, $filename)">
          <span class="menuSelected"><xsl:value-of select="@label"/></span>
        </xsl:when>
        <xsl:otherwise>
          <a href="{@href}"><xsl:value-of select="@label"/></a>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <xsl:template match="external">
    <li>
       <xsl:choose>
        <xsl:when test="starts-with(@href, $filename)">
         <span class="externalSelected"><xsl:value-of select="@label"/></span>
        </xsl:when>
        <xsl:otherwise>
          <a href="{@href}" target="_blank"><xsl:value-of select="@label"/></a>
        </xsl:otherwise>
      </xsl:choose>
    </li>
  </xsl:template>

  <xsl:template match="menu-item[@type='hidden']"/>

  <xsl:template match="external[@type='hidden']"/>

</xsl:stylesheet>
