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

<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:forrest="http://apache.org/forrest/templates/1.0"  
  xmlns:xi="http://www.w3.org/2001/XInclude"
  xmlns:alias="http://www.w3.org/1999/XSL/TransformAlias">
    <xsl:namespace-alias 
         stylesheet-prefix="alias" result-prefix="xsl"/>

	<xsl:param name="format"/>

  <xsl:template match="/">
    <alias:stylesheet version="1.0">
	    <xsl:for-each select="forrest:views/forrest:view[@type=$format]//forrest:contract">
	      <xi:include href="cocoon://get.contract.{$format}.{@name}"/>
	    </xsl:for-each>
    </alias:stylesheet>
  </xsl:template>

</xsl:stylesheet>
