<?xml version="1.0"?>
<!--
  Copyright 2002-2004 The Apache Software Foundation
                                                                                                    
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
<!--
Generates a lucene:index for the whole site with CInclude elements where lucene:documents should be pulled in.
Input is expected to be in standard book.xml format. @hrefs should be normalized, although unnormalized hrefs can be
handled by uncommenting the relevant section.

f.g.haas@gmx.net (stealing shamelessly from jefft@apache.org)
-->
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:cinclude="http://apache.org/cocoon/include/1.0"
  xmlns:lucene="http://apache.org/cocoon/lucene/1.0">

  <!-- Java class name of the Lucene analyzer to be used -->
  <xsl:param name="analyzer"/>

  <!-- Directory where the lucene index will be created (relative to
  Forrest working directory as determined by servlet engine) -->
  <xsl:param name="directory"/>
 
  <!-- Should the index be updated if it already exists? If false and
  the index already exists, the index is re-created, and the original
  index is discarded. -->
  <xsl:param name="update-index"/>
  
  <!-- Index merge factor (see Lucene documentation) -->
  <xsl:param name="merge-factor"/>  

  <!-- The extension of the lucene index fragments. -->
  <xsl:param name="extension" select="'.lucene'"/>


  <!-- Creates the lucene:index root element from the Forrest
  book. -->
  <xsl:template match="book">
    <lucene:index analyzer="{$analyzer}"
      directory="{$directory}"
      create="{not(boolean($update-index))}"
      merge-factor="{$merge-factor}">
      <xsl:apply-templates select="menu|menu-item"/>
    </lucene:index>
  </xsl:template>

  <!-- Recursively processes menu elements. -->
  <xsl:template match="menu">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="menu-item[@type='hidden']"/>  <!-- Ignore hidden items -->
  <xsl:template match="menu-item[contains(@href, '#')]"/>  <!-- Ignore #frag-id items -->
  <xsl:template match="menu-item[starts-with(@href, 'http:')]"/>  <!-- Ignore absolute http urls -->
  <xsl:template match="menu-item[starts-with(@href, 'https:')]"/>  <!-- Ignore absolute https urls -->

  <!-- Inserts a cinclude:include element for document referenced by
  menu item. -->
  <xsl:template match="menu-item">
    <cinclude:include>
      <xsl:attribute name="src">
        <xsl:text>cocoon://</xsl:text>
        <xsl:value-of select="concat(substring-before(@href, '.'), $extension)"/>
      </xsl:attribute>
    </cinclude:include>
  </xsl:template>

</xsl:stylesheet>
