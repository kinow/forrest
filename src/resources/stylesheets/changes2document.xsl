<?xml version="1.0"?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

 <xsl:import href="copyover.xsl"/>
 
 <xsl:param name="bugtracking-url"/>

 <!-- FIXME (JJP):  bugzilla is hardwired -->
 <xsl:variable name="bugzilla" select="'http://nagoya.apache.org/bugzilla/'"/>
 <xsl:variable name="buglist" select="concat($bugzilla, 'buglist.cgi?bug_id=')"/>

 <xsl:template match="/">
  <xsl:apply-templates select="//changes"/>
 </xsl:template>
 
 <xsl:template match="changes">
  <document>
   <header>
    <title><xsl:text>History of Changes</xsl:text></title>
   </header>
   <body>
    <p><link href="changes.rss"><img src="images/rss.png" alt="RSS"/></link></p>    
    <xsl:apply-templates/>
   </body>
  </document>
 </xsl:template>

 <xsl:template match="release">
  <section id="version_{@version}">
   <title><xsl:text>Version </xsl:text><xsl:value-of select="@version"/> (<xsl:value-of select="@date"/>)</title>
   <ul>
     <!-- To sort types by add,remove,update,fix. Look nicer -->
     <xsl:apply-templates select="action[@type='add']"/>
     <xsl:apply-templates select="action[@type='remove']"/>
     <xsl:apply-templates select="action[@type='update']"/>
     <xsl:apply-templates select="action[@type='fix']"/>
   </ul>
  </section>
 </xsl:template>

 <xsl:template match="action">
  <li>
   <icon src="images/{@type}.jpg" alt="{@type}"/>
   <xsl:apply-templates/>
   <xsl:text>(</xsl:text><xsl:value-of select="@dev"/><xsl:text>)</xsl:text>

   <xsl:if test="@due-to and @due-to!=''">
    <xsl:text> Thanks to </xsl:text>
    <xsl:choose>
     <xsl:when test="@due-to-email and @due-to-email!=''">
      <link href="mailto:{@due-to-email}">
       <xsl:value-of select="@due-to"/>
      </link>
     </xsl:when>
     <xsl:otherwise>
      <xsl:value-of select="@due-to"/>
     </xsl:otherwise>
    </xsl:choose>
    <xsl:text>.</xsl:text>
   </xsl:if>

   <xsl:if test="@fixes-bug">
    <xsl:text> Fixes </xsl:text>
    <xsl:choose>
     <xsl:when test="contains(@fixes-bug, ',')">
      <link href="{$buglist}{translate(normalize-space(@fixes-bug),' ','')}">
       <xsl:text>bugs </xsl:text><xsl:value-of select="normalize-space(@fixes-bug)"/>
      </link>
     </xsl:when>
     <xsl:otherwise>
      <link href="{$bugtracking-url}{@fixes-bug}">
       <xsl:text>bug </xsl:text><xsl:value-of select="@fixes-bug"/>
      </link>
     </xsl:otherwise>
    </xsl:choose>
    <xsl:text>.</xsl:text>
   </xsl:if>
  </li>
 </xsl:template>

</xsl:stylesheet>
