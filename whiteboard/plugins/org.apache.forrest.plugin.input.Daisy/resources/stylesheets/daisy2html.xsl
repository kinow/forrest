<?xml version="1.0"?>
<!--
  Copyright 2002-2004 The Apache Software Foundation or its licensors,
  as applicable.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:p="http://outerx.org/daisy/1.0#publisher"
    xmlns:ns="http://outerx.org/daisy/1.0"
    version="1.0">
      
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="//ns:document/@name"/></title>
        <xsl:apply-templates select="//p:preparedDocument/ns:document/ns:fields/ns:field"/>
      </head>
      <body>
        <xsl:apply-templates select="p:page/p:publishedDocument/p:preparedDocument[@id='1']"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="ns:field">
    <xsl:for-each select="ns:string">
      <meta>
        <xsl:attribute name="name"><xsl:value-of select="../@name"/></xsl:attribute>
        <xsl:attribute name="content"><xsl:value-of select="."/></xsl:attribute>
      </meta>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="p:preparedDocument">
    <xsl:comment>Prepared Document: ID = <xsl:value-of select="@id"/></xsl:comment>
    <xsl:apply-templates select="ns:document/ns:parts/ns:part"/>
  </xsl:template>
  
  <xsl:template match="ns:part">
    <xsl:comment>Part: Name <xsl:value-of select="@name"/></xsl:comment>
    <xsl:if test="@name!='SimpleDocumentContent'">
      <h1><xsl:value-of select="@name"/></h1>
    </xsl:if>
    <xsl:apply-templates select="html/body"/>
  </xsl:template>
  
  <xsl:template match="ns:searchResult">
    <table>
        <xsl:apply-templates/>
    </table>
  </xsl:template>
  
  <xsl:template match="ns:titles">
    <tr>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>
  
  <xsl:template match="ns:title">
    <td>
      <xsl:apply-templates/>
    </td>
  </xsl:template>
  
  <xsl:template match="ns:rows">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="ns:row">
    <tr>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>
  
  <xsl:template match="ns:value">
    <td>
      <xsl:choose>
        <xsl:when test="position() = 1">
          <a>
            <xsl:attribute name="href"><xsl:value-of select="../@id"/>.daisy.html</xsl:attribute>
            <xsl:apply-templates/>
          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>
  
  <xsl:template match="body">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="p:daisyPreparedInclude">
    <xsl:variable name="id" select="@id"/>
    <h1><xsl:value-of select="//p:preparedDocument[@id=$id]/ns:document/@name"/></h1>
    <xsl:apply-templates select="//p:preparedDocument[@id=$id]"/>
  </xsl:template>
  
  <xsl:template match="p[@class='note']">
    <div class="frame note">
      <div class="label">Note</div>
      <div class="content"><xsl:apply-templates/></div>
    </div>
  </xsl:template>
  
  <xsl:template match="p[@class='fixme']">
    <div class="frame fixme">
      <div class="label">Fixme</div>
      <div class="content"><xsl:apply-templates/></div>
    </div>
  </xsl:template>
  
  <xsl:template match="p[@class='warning']">
    <div class="frame warning">
      <div class="label">Warning</div>
      <div class="content"><xsl:apply-templates/></div>
    </div>
  </xsl:template>
  
  <xsl:template match="a">
    <xsl:choose>
      <xsl:when test="starts-with(@href, 'daisy:')">
        <a>
          <xsl:attribute name="href"><xsl:value-of select="substring-after(@href, 'daisy:')"/>.daisy.html</xsl:attribute>
          <xsl:attribute name="description"><xsl:value-of select="@daisyDocumentName"/></xsl:attribute>
          <xsl:apply-templates/>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <a>
          <xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
          <xsl:attribute name="description"><xsl:value-of select="@daisyDocumentName"/></xsl:attribute>
          <xsl:apply-templates/>
        </a>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="img">
    <xsl:choose>
      <xsl:when test="starts-with(@src, 'daisy:')">
        <img>
          <xsl:attribute name="src"><xsl:value-of select="substring-after(@src, 'daisy:')"/>.daisy.img</xsl:attribute>
          <xsl:apply-templates/>
        </img>
      </xsl:when>
      <xsl:otherwise>
        <img>
          <xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
          <xsl:apply-templates/>
        </img>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="@ns:*|ns:*"/>
  <xsl:template match="@p:*|p:*"/>
  
  <xsl:template match="@*|*|text()|processing-instruction()|comment()">
    <xsl:copy>
      <xsl:apply-templates select="@*|*|text()|processing-instruction()|comment()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
