<?xml version="1.0"?>
<!--
site2xhtml.xsl is the final stage in HTML page production.  It merges HTML from
document2html.xsl, tab2menu.xsl and book2menu.xsl, and adds the site header,
footer, searchbar, css etc.  As input, it takes XML of the form:

<site>
  <div class="menu">
    ...
  </div>
  <div class="tab">
    ...
  </div>
  <div class="content">
    ...
  </div>
</site>

$Id: site2xhtml.xsl,v 1.2 2003/01/17 01:19:38 crossley Exp $
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="../../../common/xslt/html/site2xhtml.xsl"/>

  <xsl:variable name="header-color" select="'#FFFFFF'"/>
  <xsl:variable name="header-color2" select="'#a5b6c6'"/>  
  <xsl:variable name="menu-border" select="'#F7F7F7'"/>
  <xsl:variable name="background-bars" select="'#CFDCED'"/>


  <xsl:template match="site">
    <html>
      <head>
        <title><xsl:value-of select="div[@class='content']/table/tr/td/h1"/></title>
        <link rel="stylesheet" href="{$root}skin/page.css" type="text/css"/>
      </head>
      <body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
      
    <!-- ================================= top bar with logo's and search box ===================================  -->

    <xsl:comment>================= start Banner ==================</xsl:comment>
    
     <table cellspacing="0" cellpadding="0" border="0" width="100%" summary="header with logos">
      <tr>

        <xsl:comment>================= start Group Logo ==================</xsl:comment>
        <td bgcolor="{$header-color}">
          <xsl:if test="$config/group-url">
            <xsl:call-template name="renderlogo">
              <xsl:with-param name="name" select="$config/group-name"/>
              <xsl:with-param name="url" select="$config/group-url"/>
              <xsl:with-param name="logo" select="$config/group-logo"/>
              <xsl:with-param name="root" select="$root"/>
            </xsl:call-template>
          </xsl:if>
        </td>
        <xsl:comment>================= end Group Logo ==================</xsl:comment>
        <xsl:comment>================= start Project Logo ==================</xsl:comment>
        <td bgcolor="{$header-color}" align="center" width="100%">
          <xsl:call-template name="renderlogo">
            <xsl:with-param name="name" select="$config/project-name"/>
            <xsl:with-param name="url" select="$config/project-url"/>
            <xsl:with-param name="logo" select="$config/project-logo"/>
            <xsl:with-param name="root" select="$root"/>
          </xsl:call-template>
        </td>
        <xsl:comment>================= end Project Logo ==================</xsl:comment>

       <xsl:comment>================= start Search ==================</xsl:comment>
        <td bgcolor="{$header-color}" rowspan="2" valign="top">
          <xsl:if test="not($config/disable-search) or
            $config/disable-search='false' and $config/searchsite-domain and
            $config/searchsite-name">
            <form method="get" action="http://www.google.com/search" target="_blank">
              <table bgcolor="{$menu-border}" cellpadding="0" cellspacing="0" border="0" summary="search">
                <tr>
                  <td colspan="3" bgcolor="#a5b6c6"><img src="{$spacer}" alt="" width="1" height="10" /></td>
                </tr>
                <tr>
                  <td colspan="3"><img src="{$spacer}" alt="" width="1" height="8" /></td>
                </tr>                
                <tr>
                  <td><img src="{$spacer}" alt="" width="1" height="1" /></td>
                  <td nowrap="nowrap">
                    <input type="hidden" name="sitesearch" value="{$config/searchsite-domain}"/>
                    <input type="text" id="query" name="q" size="15"/>
                    <img src="{$spacer}" alt="" width="5" height="1" />
                    <input type="submit" value="Search" name="Search"/>
                    <br />
                    <span class="search">
                      the <xsl:value-of select="$config/searchsite-name"/> site
                      <!-- setting search options off for the moment -->
                      <!--
                      <input type="radio" name="web" value="web"/>web site&#160;&#160;<input type="radio" name="mail" value="mail"/>mail lists
                      -->
                    </span>
                  </td>
                  <td><img src="{$spacer}" alt="" width="1" height="1" /></td>
                </tr>
              
                <tr>
                  <td colspan="3"><img src="{$spacer}" alt="" width="1" height="7" /></td>
                </tr>
                            
                <tr>
                  <td class="bottom-left-thick"></td>
                  <td bgcolor="#a5b6c6"><img src="{$spacer}" alt="" width="1" height="1" /></td>
                  <td class="bottom-right-thick"></td>
                </tr>
              </table>
            </form>
          </xsl:if>
        </td>
        <xsl:comment>================= end Search ==================</xsl:comment>
       
        <td bgcolor="{$header-color}"><img src="{$spacer}" alt="" width="10" height="10" /></td>
      </tr>
      <tr>
        <td colspan="2" bgcolor="{$header-color}" valign="bottom">
          <xsl:comment>================= start Tabs ==================</xsl:comment>
          <xsl:apply-templates select="div[@class='tab']"/>
          <xsl:comment>================= end Tabs ==================</xsl:comment>
        </td>
        <td bgcolor="{$header-color}"><img src="{$spacer}" height="1" width="1" alt="" /></td>
      </tr>
      <tr>
        <td colspan="4" bgcolor="{$header-color2}"><img src="{$spacer}" alt="" height="10" width="1" /></td>
      </tr>
    </table>
    <xsl:comment>================= end Banner ==================</xsl:comment>
    

    <xsl:comment>================= start Menu, NavBar, Content ==================</xsl:comment>
    <table cellspacing="0" cellpadding="0" border="0" width="100%" bgcolor="#ffffff" summary="page content">
      <tr>
        <td valign="top">
          <table cellpadding="0" cellspacing="0" border="0" summary="menu">
            <tr>
              <xsl:comment>================= start left top NavBar ==================</xsl:comment>
              <td valign="top" rowspan="3">
                <table cellspacing="0" cellpadding="0" border="0" summary="blue line">
                  <tr><td bgcolor="{$header-color2}"><img src="{$spacer}" alt="" height="1" width="10" /></td></tr>
                  <tr><td bgcolor="{$background-bars}"><font face="Arial, Helvetica, Sans-serif" size="4" color="{$menu-border}">&#160;</font></td></tr>
                  <tr><td bgcolor="{$header-color}"><img src="{$spacer}" alt="" height="1" width="10" /></td></tr>
                </table>
              </td>
              <xsl:comment>================= end left top NavBar ==================</xsl:comment>
              
              <td bgcolor="{$header-color2}"><img src="{$spacer}" alt="" height="1" width="1" /></td>
              <td bgcolor="{$menu-border}" valign="bottom"><img src="{$spacer}" alt="" height="10" width="10" /></td>
              <td bgcolor="{$menu-border}" valign="top" nowrap="nowrap">
                  
                <xsl:comment>================= start Menu items ==================</xsl:comment>
                <!-- original: <xsl:apply-templates select="div[@class='menu']"/>    -->
                
                 <div class="menu"><ul>                
                  <xsl:for-each select = "div[@class='menu']/ul/li">
                  	 <li><font color="#000000"><xsl:value-of select="font"/></font>
                       <ul>
                  	    <xsl:for-each select = "ul/li">
                  	    
						<xsl:choose>
							<xsl:when test="a">
							  <li><a href="{a/@href}"><xsl:value-of select="a" /></a></li>
							</xsl:when>
							<xsl:otherwise>
							 <li>
							   <span class="sel"><xsl:value-of select="span" /></span></li>
						       <ul> 
						         <xsl:for-each select = "//toc/tocc">
						         
						         <xsl:choose>
						         	<xsl:when test="string-length(toca)>15">
						         	  <li><a href="{toca/@href}"><xsl:value-of select="substring(toca,0,15)" />...</a></li>
						         	</xsl:when>
						         	<xsl:otherwise>
						              <li><a href="{toca/@href}"><xsl:value-of select="toca" /></a></li>						         	 
						         	</xsl:otherwise>
						         </xsl:choose>
						         	
						        	<ul> 
						              <xsl:for-each select = "toc2/tocc">	
						              
								          <xsl:choose>
								         	<xsl:when test="string-length(toca)>15">
								         	  <li><a href="{toca/@href}"><xsl:value-of select="substring(toca,0,15)" />...</a></li>
								         	</xsl:when>
								         	<xsl:otherwise>
								              <li><a href="{toca/@href}"><xsl:value-of select="toca" /></a></li>						         	 
								         	</xsl:otherwise>
								         </xsl:choose>
						         
						              </xsl:for-each>   
                                    </ul>
						         </xsl:for-each>   
                               </ul>
							</xsl:otherwise>
						</xsl:choose>
                  	                
                       </xsl:for-each>
                      </ul>                      
                    </li>
                  </xsl:for-each>
                 </ul></div>
                 
                <xsl:comment>================= end Menu items ==================</xsl:comment>
              </td>
              <td bgcolor="{$menu-border}" valign="bottom"><img src="{$spacer}" alt="" height="10" width="10" /></td>
              <td bgcolor="{$header-color2}"><img src="{$spacer}" alt="" height="1" width="1" /></td>
            </tr>
            
            <tr>
              <td class="bottom-left-thick" rowspan="2" colspan="2"></td>
              <td bgcolor="{$header-color2}"><img src="{$spacer}" alt="" border="0" width="10" height="10" /></td>
              <td class="bottom-right-thick" rowspan="2" colspan="2"></td>
            </tr>
            <tr>
              <td bgcolor="{$header-color2}" height="1"><img src="{$spacer}" alt="" height="1" width="1" /></td>
            </tr>
          </table>
        </td>
       
        <td width="100%" valign="top">
          <table cellspacing="0" cellpadding="0" border="0" width="100%" summary="content">
          
            <xsl:comment>================= start middle NavBar ==================</xsl:comment>          
            <tr><td bgcolor="{$header-color2}" colspan="4"><img src="{$spacer}" alt="" height="1" width="10" /></td></tr>
            <tr>
              <td bgcolor="{$background-bars}" width="10" align="left"><img src="{$spacer}" alt="" height="1" width="10" /></td>
              <td bgcolor="{$background-bars}" width="50%" align="left">
                <!-- ============ Page number =========== -->
                <span class="trail">
                &#160;        
                 <script type="text/javascript" language="JavaScript" src="{$root}skin/breadcrumbs.js"></script>          
                <!-- <b>Page 1 of 5</b> -->
                </span>
                  <img src="{$spacer}" alt="" height="8" width="10" />
              </td>
              <td bgcolor="{$background-bars}" width="50%" align="right">
                <!-- ============ Page navigation =========== -->
                <font face="Arial, Helvetica, Sans-serif" size="3" color="{$menu-border}">
                &#160;
                <!-- <b>&#171; prev&#160;&#160;<font size="4">[3]</font>&#160;&#160;next &#187;</b> -->
                </font>
                  <img src="{$spacer}" alt="" height="8" width="10" />
              </td>
              <td bgcolor="#CFDCED" width="10"><img src="{$spacer}" alt="" height="1" width="10" /></td>
            </tr>
            <tr><td bgcolor="{$header-color2}" colspan="4"><img src="{$spacer}" alt="" height="1" width="10" /></td></tr>
            <xsl:comment>================= end middle NavBar ==================</xsl:comment>

            <xsl:comment>================= start Content==================</xsl:comment>
            <tr>
              <td width="10" align="left"><img src="{$spacer}" alt="" height="1" width="10" /></td>
              <td width="100%" align="left">
                <xsl:apply-templates select="div[@class='content']"/>
              </td>
              <td width="10"><img src="{$spacer}" alt="" height="1" width="10" /></td>
            </tr>
            <xsl:comment>================= end Content==================</xsl:comment>
            
          </table>
        </td>
      </tr>
    </table>
    <xsl:comment>================= end Menu, NavBar, Content ==================</xsl:comment>

    <xsl:comment>================= start Footer ==================</xsl:comment>
    <table border="0" height="20" width="100%" cellpadding="0" cellspacing="0" summary="footer">
      <tr>
        <td bgcolor="{$menu-border}" height="1" colspan="2">
          <img src="{$spacer}" alt="" width="1" height="1" />
          <a href="{$skin-img-dir}/label.gif"/>
          <a href="{$skin-img-dir}/page.gif"/>
          <a href="{$skin-img-dir}/chapter.gif"/>
          <a href="{$skin-img-dir}/chapter_open.gif"/>
          <a href="{$skin-img-dir}/current.gif"/>
          <a href="/favicon.ico"/>
        </td>
      </tr>
      <tr>
       <xsl:if test="$config/host-logo and not($config/host-logo = '')">
          <div class="host">
            <img src="{$root}skin/images/spacer.gif" width="10" height="1" alt=""/>
            <xsl:call-template name="renderlogo">
              <xsl:with-param name="name" select="$config/host-name"/>
              <xsl:with-param name="url" select="$config/host-url"/>
              <xsl:with-param name="logo" select="$config/host-logo"/>
              <xsl:with-param name="root" select="$root"/>
            </xsl:call-template>
          </div>
        </xsl:if>
      <td width="90%" align="center" class="copyright" bgcolor="{$header-color2}" colspan="2">
          <span class="footnote">Copyright &#169;
          <xsl:value-of select="$config/year"/>&#160;<xsl:value-of
          select="$config/vendor"/> All rights reserved.
              <br/><script language="JavaScript" type="text/javascript"><![CDATA[<!--
              document.write(" - "+"Last Published: " + document.lastModified);
            //  -->]]></script></span>
        </td>
      <td class="logos" bgcolor="{$header-color2}" align="right" nowrap="nowrap">
        <xsl:if test="$filename = 'index.html' and $config/credits">
          <xsl:for-each select="$config/credits/credit">
            <xsl:variable name="name" select="name"/>
            <xsl:variable name="url" select="url"/>
            <xsl:variable name="image" select="image"/>
            <xsl:variable name="width" select="width"/>
            <xsl:variable name="height" select="height"/>
            <a href="{$url}">
            <img alt="{$name} logo" valign="top" border="0">
              <xsl:attribute name="src">
                <xsl:if test="not(starts-with($image, 'http://'))"><xsl:value-of select="$root"/></xsl:if>
                <xsl:value-of select="$image"/>
              </xsl:attribute>
              <xsl:if test="$width"><xsl:attribute name="width"><xsl:value-of select="$width"/></xsl:attribute></xsl:if>
              <xsl:if test="$height"><xsl:attribute name="height"><xsl:value-of select="$height"/></xsl:attribute></xsl:if>
            </img>
            <img src="{$spacer}" border="0" alt="" width="5" height="1" />
            </a>
          </xsl:for-each>
        </xsl:if>
        </td>
      </tr>
    </table>
    <xsl:comment>================= end Footer ==================</xsl:comment>    
      </body>
    </html>
    </xsl:template>
    
    
   <xsl:template match="toc|toc2|tocc|toca">
   </xsl:template>
  
      
    <xsl:template match="node()|@*" priority="-1">
      <xsl:copy>
        <xsl:apply-templates select="@*"/>
        <xsl:apply-templates/>
      </xsl:copy>
  </xsl:template>
  
  
  
  
</xsl:stylesheet>
