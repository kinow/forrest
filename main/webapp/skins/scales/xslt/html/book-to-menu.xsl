<?xml version="1.0"?>
<!--
  Copyright 2002-2005 The Apache Software Foundation or its licensors,
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
<!--
book2menu.xsl generates the HTML menu.  See the imported book2menu.xsl for
details.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="../../../common/xslt/html/book-to-menu.xsl"/>

  <xsl:template match="book">
    <div id="menu">
        <ul>
	      <xsl:apply-templates select="menu"/>
	    </ul>
    </div>
  </xsl:template>

  <xsl:template match="menu">
	<li>
    <h1><xsl:value-of select="@label"/></h1>
    <ul>
      <xsl:apply-templates/>
    </ul>
    </li>
  </xsl:template>

  <xsl:template match="menu-item[@type='hidden']"/>
    
    
   <!-- 
       FSO
       Show menu-items of this type only when the referenced page
       is currently open.
       Added to maintain context without having to show all pages always on the menu.
   --> 
   <xsl:template match="menu-item[@type='showWhenSelected']">
        
        <!-- Use apply-imports when overriding -->
        <xsl:variable name="href-nofrag">
            <xsl:call-template name="path-nofrag">
                <xsl:with-param name="path" select="@href" />
            </xsl:call-template>
        </xsl:variable>
        <!-- Compare with extensions stripped -->
        <xsl:variable name="node-path">
            <xsl:call-template name="normalize">
                <xsl:with-param name="path" select="concat($dirname, $href-nofrag)" />
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$node-path = $path-nofrag">
            
            <li>  
                <xsl:choose>
                    <xsl:when test="contains(@href, '#')">
                        <xsl:call-template name="selected-anchor" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="selected" />
                    </xsl:otherwise>
                </xsl:choose></li>
            
        </xsl:if>
        
   </xsl:template>  

  <xsl:template match="menu-item">
    <li>
     <xsl:apply-imports/>
    </li>
  </xsl:template>

  <xsl:template name="selected">
	<div class="current"><xsl:value-of select="@label"/></div>
  </xsl:template>

  <xsl:template name="print-external">
    <font color="#ffcc00">
      <xsl:apply-imports/>
    </font>
  </xsl:template>

</xsl:stylesheet>
