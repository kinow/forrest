<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<forrest:views xmlns:forrest="http://apache.org/forrest/templates/1.0" 
  xmlns:jx="http://apache.org/cocoon/templates/jx/1.0">
<!-- The following variables are used to contact data models and/or contracts. -->
  <jx:set var="getRequest" value="#{$cocoon/parameters/getRequest}"/>
  <jx:set var="getRequestExtension" value="#{$cocoon/parameters/getRequestExtension}" />
<!-- CSS View of the request e.g. index.dispatcher.css -->
  <forrest:view type="css" hooksXpath="/">
    <forrest:contract name="branding-theme-profiler">
      <forrest:properties contract="branding-theme-profiler">
        <forrest:property name="branding-theme-profiler-theme">
          Pelt</forrest:property>
        <forrest:property name="branding-theme-profiler">
<!-- These values are used for the generated CSS files.
    They essentially "override" the default colors defined in the chosen theme.
    There are four duplicate "groups" of colors below, denoted by comments:
      Color group: Forrest, Krysalis, Collabnet, and Lenya using Pelt.
    They are provided for example only. To customize the colors of any theme,
    uncomment one of these groups of color elements and change the values
    of the particular color elements that you wish to change.
    Note that by default, all color groups are commented-out which means that
    the default colors provided by the theme are being used.
  -->
<!-- Color group: Forrest: example colors similar to forrest.apache.org
    Some of the element names are obscure, so comments are added to show how
    the "pelt" theme uses them, other themes might use these elements in a different way.
    Tip: temporarily change the value of an element to red (#ff0000) and see the effect.
     pelt: breadtrail: the strip at the top of the page and the second strip under the tabs
     pelt: header: top strip containing project and group logos
     pelt: heading|subheading: section headings within the content
     pelt: navstrip: the strip under the tabs which contains the published date
     pelt: menu: the left-hand navigation panel
     pelt: toolbox: the selected menu item
     pelt: border: line border around selected menu item
     pelt: searchbox: the background of the searchbox
     pelt: body: any remaining parts, e.g. the bottom of the page
     pelt: footer: the second from bottom strip containing credit logos and published date
     pelt: feedback: the optional bottom strip containing feedback link
-->
<!-- Color group: pelt -->
<!--
    <color name="breadtrail" value="#CFDCED" font="#0F3660" link="#0F3660" vlink="#0F3660" hlink="#000066"/>
    <color name="header" value="#294563"/>
    <color name="tab-selected" value="#4A6D8C" link="#0F3660" vlink="#0F3660" hlink="#000066"/>
    <color name="tab-unselected" value="#B5C7E7" link="#0F3660" vlink="#0F3660" hlink="#000066"/>
    <color name="subtab-selected" value="#4A6D8C" link="#0F3660" vlink="#0F3660" hlink="#000066"/>
    <color name="subtab-unselected" value="#4A6D8C" link="#0F3660" vlink="#0F3660" hlink="#000066"/>
    <color name="heading" value="#294563"/>
    <color name="subheading" value="#4A6D8C"/>
    <color name="published" value="#4A6D8C" font="#FFFFFF"/>
    <color name="feedback" value="#4A6D8C" font="#FFFFFF" align="center"/>
    <color name="navstrip" value="#4A6D8C" font="#FFFFFF" link="#0F3660" vlink="#0F3660" hlink="#000066"/>
    <color name="menu" value="#4A6D8C" font="#CFDCED" link="#FFFFFF" vlink="#FFFFFF" hlink="#FFCF00"/>    
    <color name="toolbox" value="#CFDCED"/>
    <color name="border" value="#999999"/>
    <color name="dialog" value="#4A6D8C"/>
    <color name="searchbox" value="#4A6D8C" font="#000000"/>
    <color name="body" value="#FFFFFF" link="#0F3660" vlink="#009999" hlink="#000066"/>
    <color name="table" value="#7099C5"/>    
    <color name="table-cell" value="#F0F0FF"/>    
    <color name="highlight" value="#FFFF00"/>
    <color name="fixme" value="#CC6600"/>
    <color name="note" value="#006699"/>
    <color name="warning" value="#990000"/>
    <color name="code" value="#CFDCED"/>
    <color name="footer" value="#CEDFEF"/>
-->
<!-- Color group: Krysalis -->
<!--
    <color name="header"    value="#FFFFFF"/>

    <color name="tab-selected" value="#a5b6c6" link="#000000" vlink="#000000" hlink="#000000"/>
    <color name="tab-unselected" value="#F7F7F7"  link="#000000" vlink="#000000" hlink="#000000"/>
    <color name="subtab-selected" value="#a5b6c6"  link="#000000" vlink="#000000" hlink="#000000"/>
    <color name="subtab-unselected" value="#a5b6c6"  link="#000000" vlink="#000000" hlink="#000000"/>

    <color name="heading" value="#a5b6c6"/>
    <color name="subheading" value="#CFDCED"/>
        
    <color name="navstrip" value="#CFDCED" font="#000000" link="#000000" vlink="#000000" hlink="#000000"/>
    <color name="toolbox" value="#a5b6c6"/>
    <color name="border" value="#a5b6c6"/>
        
    <color name="menu" value="#F7F7F7" link="#000000" vlink="#000000" hlink="#000000"/>    
    <color name="dialog" value="#F7F7F7"/>
            
    <color name="body"    value="#ffffff" link="#0F3660" vlink="#009999" hlink="#000066"/>
    
    <color name="table" value="#a5b6c6"/>    
    <color name="table-cell" value="#ffffff"/>    
    <color name="highlight" value="#ffff00"/>
    <color name="fixme" value="#cc6600"/>
    <color name="note" value="#006699"/>
    <color name="warning" value="#990000"/>
    <color name="code" value="#a5b6c6"/>
        
    <color name="footer" value="#a5b6c6"/>
-->
<!-- Color group: Collabnet -->
<!--
    <color name="header"    value="#003366"/>

    <color name="tab-selected" value="#dddddd" link="#555555" vlink="#555555" hlink="#555555"/>
    <color name="tab-unselected" value="#999999" link="#ffffff" vlink="#ffffff" hlink="#ffffff"/>
    <color name="subtab-selected" value="#cccccc" link="#000000" vlink="#000000" hlink="#000000"/>
    <color name="subtab-unselected" value="#cccccc" link="#555555" vlink="#555555" hlink="#555555"/>

    <color name="heading" value="#003366"/>
    <color name="subheading" value="#888888"/>
    
    <color name="navstrip" value="#dddddd" font="#555555"/>
    <color name="toolbox" value="#dddddd" font="#555555"/>
    <color name="border" value="#999999"/>
    
    <color name="menu" value="#ffffff"/>    
    <color name="dialog" value="#eeeeee"/>
            
    <color name="body"      value="#ffffff"/>
    
    <color name="table" value="#ccc"/>    
    <color name="table-cell" value="#ffffff"/>   
    <color name="highlight" value="#ffff00"/>
    <color name="fixme" value="#cc6600"/>
    <color name="note" value="#006699"/>
    <color name="warning" value="#990000"/>
    <color name="code" value="#003366"/>
        
    <color name="footer" value="#ffffff"/>
-->
<!-- Color group: Lenya using pelt-->
<!--<color name="header" value="#ffffff"/>

    <color name="tab-selected" value="#E5E4D9" link="#000000" vlink="#000000" hlink="#000000"/>
    <color name="tab-unselected" value="#F5F4E9" link="#000000" vlink="#000000" hlink="#000000"/>
    <color name="subtab-selected" value="#000000" link="#000000" vlink="#000000" hlink="#000000"/>
    <color name="subtab-unselected" value="#E5E4D9" link="#000000" vlink="#000000" hlink="#000000"/>

    <color name="heading" value="#E5E4D9"/>
    <color name="subheading" value="#000000"/>
    <color name="published" value="#000000"/>
    <color name="navstrip" value="#E5E4D9" font="#000000"/>
    <color name="toolbox" value="#CFDCED" font="#000000"/>
    <color name="border" value="#999999"/>

    <color name="menu" value="#E5E4D9" font="#000000" link="#000000" vlink="#000000" hlink="#000000"/>
    <color name="dialog" value="#CFDCED"/>
    <color name="body" value="#ffffff" />

    <color name="table" value="#ccc"/>
    <color name="table-cell" value="#ffffff"/>
    <color name="highlight" value="#ffff00"/>
    <color name="fixme" value="#cc6600"/>
    <color name="note" value="#006699"/>
    <color name="warning" value="#990000"/>
    <color name="code" value="#003366"/>

    <color name="footer" value="#E5E4D9"/>-->
        </forrest:property>
      </forrest:properties>
    </forrest:contract>
  </forrest:view>
<!-- HTML View of the request (e.g. index.html)-->
  <forrest:view type="html" hooksXpath="/html/body">
<!-- 
        @type defines this structurer to html.
        @hooksXpath defines where all hooks will be injected (as prefix).
        -->
    <forrest:contract name="branding-css-links">
<!-- More information around this contract
        http://marc.theaimsgroup.com/?l=forrest-dev&m=113473237805195&w=2
        -->
<!--Note: The forrest:properties element does not exit anymore (in comparison to a previous versions) -->
      <forrest:property name="branding-css-links-input">
        <css url="common.css" media="screen" rel="alternate stylesheet" 
          theme="common"/>
        <css url="leather-dev.css" media="screen" rel="alternate stylesheet" 
          theme="common"/>
        <css url="pelt.screen.css" media="screen" theme="Pelt"/>
<!-- You can request url specific css as defined above, 
          but beware that you need to use the *.dispatcher.css extension!!!-->
        <css prefix="" url="#{$getRequest}.dispatcher.css" media="screen" theme="Pelt"/>
        <css url="pelt.print.css" media="print"/>
        <css>/* Extra css */ 
p.quote {
 margin-left: 2em; 
 padding: .5em; 
 background-color: #f0f0f0; 
 font-family: monospace; 
}</css>
      </forrest:property>
    </forrest:contract>
    <forrest:contract name="siteinfo-meta" dataURI="lm://project.build-info">
      <forrest:property name="custom">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
      </forrest:property>
      <forrest:property name="theme" value="pelt"/>
    </forrest:contract>
    <forrest:contract name="siteinfo-meta-navigation" 
      dataURI="cocoon://#{$getRequest}.navigation.xml"/>
    <forrest:contract name="siteinfo-meta-icon">
      <forrest:property name="siteinfo-meta-icon">
        <favicon-url>favicon.ico</favicon-url>
      </forrest:property>
    </forrest:contract>
    <forrest:hook name="container">
      <forrest:contract name="branding-breadcrumbs">
        <forrest:property name="branding-breadcrumbs">
          <trail>
            <link1 name="Apache Forrest" href="http://forrest.apache.org/"/>
          </trail>
        </forrest:property>
      </forrest:contract>
      <forrest:hook name="header">
        <forrest:contract name="branding-tagline">
          <forrest:property name="branding-tagline-name">new 
            seed</forrest:property>
          <forrest:property name="branding-tagline-tagline">powered by the 
            dispatcher</forrest:property>
        </forrest:contract>
        <forrest:hook class="logo">
          <forrest:contract name="branding-logo">
            <forrest:property name="branding-logo-name">Apache Forrest Logo</forrest:property>
            <forrest:property name="branding-logo-description">Apache Forrest</forrest:property>
            <forrest:property name="branding-logo-url">
              http://forrest.apache.org/</forrest:property>
            <forrest:property name="branding-logo-logo">
              images/project-logo.png</forrest:property>
          </forrest:contract>
        </forrest:hook>
        <forrest:hook class="logo">
          <forrest:contract name="branding-logo">
            <forrest:property name="branding-logo-name">plugin logo</forrest:property>
            <forrest:property name="branding-logo-description">
              org.apache.forrest.plugin.internal.dispatcher plugin for Apache Forrest</forrest:property>
            <forrest:property name="branding-logo-url">
            http://forrest.apache.org/pluginDocs/</forrest:property>
            <forrest:property name="branding-logo-logo">
              images/project.png</forrest:property>
          </forrest:contract>
        </forrest:hook>
<!-- -->
        <forrest:contract name="search-input">
          <forrest:property name="input-size">25</forrest:property>
          <forrest:property name="search-input">
            <search name="MyProject" domain="example.org" provider="google"/>
          </forrest:property>
        </forrest:contract>
        <forrest:hook name="nav-main-hook">
          <forrest:contract name="nav-main" 
            dataURI="cocoon://#{$getRequest}.navigation.xml"/>
          <forrest:hook name="publishedStrip" nbsp="true">
            <forrest:contract name="nav-main-sub" 
              dataURI="cocoon://#{$getRequest}.navigation.xml"/>
            <forrest:contract name="siteinfo-last-published"/>
          </forrest:hook>
        </forrest:hook>
      </forrest:hook>
      <forrest:hook name="page">
        <forrest:hook class="breadtrail" nbsp="true" />
<!--<forrest:contract name="branding-breadcrumbs">
          <forrest:property name="branding-breadcrumbs">
            <trail>
              <link1 name="myGroup" href="http://www.apache.org/"/>
              <link2 name="myProject" href="http://forrest.apache.org/"/>
              <link3 name="" href=""/>
            </trail>
          </forrest:property>
        </forrest:contract>-->
        <forrest:hook name="leftbar">
          <forrest:contract name="nav-section" 
            dataURI="cocoon://#{$getRequest}.navigation.xml">
            <forrest:property name="nav-section-toc" nugget="get.tov">
              <jx:import 
                uri="cocoon://#{$cocoon/parameters/getRequest}.toc.xml"/>
            </forrest:property>
            <forrest:property name="expanding">true</forrest:property>
<!--<forrest:property name="toc" max-depth="2"/>-->
          </forrest:contract>
<!-- <forrest:contract name="genericMarkup">
            <forrest:property name="genericMarkup">
              <hr/>
            </forrest:property>
    </forrest:contract>-->
<!-- <forrest:contract name="search-input">
            <forrest:property name="input-size">18</forrest:property>
            <forrest:property name="search-input">
              <search name="MyProject" domain="example.org" provider="google"/>
            </forrest:property>
    </forrest:contract>-->
          <forrest:contract name="siteinfo-credits">
            <forrest:property name="box-location">credit</forrest:property>
            <forrest:property name="top-separator">true</forrest:property>
<!--<forrest:property name="siteinfo-credits">
              <credits>
                <credit>
                  <name>Built with Apache Forrest</name>
                  <url>http://forrest.apache.org/</url>
                  <image>images/built-with-forrest-button.png</image>
                  <width>88</width>
                  <height>31</height>
                </credit>
              </credits>
      </forrest:property>-->
          </forrest:contract>
<!-- <forrest:contract name="genericMarkup">
            <forrest:property name="genericMarkup">
              <hr/>
            </forrest:property>
    </forrest:contract>-->
          <forrest:contract name="content-motd-page">
            <forrest:property name="content-motd-page">
              <motd>
<!--FIXME: motd-page location needs removing
These options are not effective anymore in dispatcher
 Need to be removed in Structurer and contracts usage/decription-->
<!--<motd-option pattern="index.html">
                  <motd-title>sample</motd-title>
                  <motd-page location="page">
                    This is an example of a Message of the day (MOTD).
                  </motd-page>
                  <motd-page-url>index.html</motd-page-url>
	  </motd-option>-->
                <motd-option pattern="samples/faq.html">
                  <motd-title></motd-title>
                  <motd-page location="both"> How to enable this MOTD is on 
                    this page. </motd-page>
                  <motd-page-url>#motd</motd-page-url>
                </motd-option>
              </motd>
            </forrest:property>
          </forrest:contract>
          <forrest:contract name="nav-section-round-bottom"/>
        </forrest:hook>
<!--
        <forrest:hook name="export-link">
          <forrest:contract name="content-pdf-link"/>
        </forrest:hook>
-->
        <forrest:hook name="content">
<!-- FIXME - Problem with ndeSetTextSize() script from fontsize.js not compliant between Pelt and Leather-dev... -->
<!-- <forrest:hook class="trail">
            <forrest:contract name="branding-fontsize"/>
    </forrest:hook>-->
          <forrest:contract name="content-title" 
            dataURI="cocoon://#{$getRequest}.title.xml"/>
          <forrest:contract name="content-abstract" 
            dataURI="cocoon://#{$getRequest}.abstract.xml"/>
          <forrest:contract name="content-minitoc" 
            dataURI="cocoon://#{$getRequest}.toc.xml">
            <forrest:property name="content-minitoc-conf" max-depth="2" 
              min-sections="1" location="page"/>
          </forrest:contract>
          <forrest:contract name="content-main" 
            dataURI="cocoon://#{$getRequest}.body.xml">
            <forrest:property name="content-main-conf">
              <headings type="underlined"/>
            </forrest:property>
          </forrest:contract>
<!--
          <forrest:contract name="content-authors">
              <forrest:property name="content-authors" nugget="get.authors">
                <jx:import uri="cocoon://#{$cocoon/parameters/getRequest}.authors.xml"/>
              </forrest:property>
          </forrest:contract>
          -->
        </forrest:hook>
      </forrest:hook>
      <forrest:hook name="footer">
        <forrest:hook class="lastmodified">
          <forrest:contract name="siteinfo-last-published"/>
        </forrest:hook>
        <forrest:hook class="copyright">
          <forrest:contract name="siteinfo-copyright">
            <forrest:property name="siteinfo-copyright">
              <copyright>
                <year inception="true">2002</year>
                <vendor>The Apache Software Foundation.</vendor>
                <copyright-link>http://www.apache.org/licenses/</copyright-link>
              </copyright>
            </forrest:property>
          </forrest:contract>
        </forrest:hook>
        <forrest:contract name="siteinfo-compliance-links"/>
        <forrest:contract name="siteinfo-credits">
          <forrest:property name="box-location">credit</forrest:property>
          <forrest:property name="top-separator">false</forrest:property>
          <forrest:property name="use-br">false</forrest:property>
          <forrest:property name="siteinfo-credits">
            <credits>
              <credit>
                <name>Built with Apache Forrest</name>
                <url>http://forrest.apache.org/</url>
                <image>images/built-with-forrest-button.png</image>
                <width>88</width>
                <height>31</height>
              </credit>
              <credit role="accueil">
                <name>Built with Cocoon</name>
                <url>http://cocoon.apache.org/</url>
                <image>http://forrest.apache.org/images/built-with-cocoon.gif</image>
              </credit>
            </credits>
          </forrest:property>
        </forrest:contract>
<!-- <forrest:contract name="siteinfo-feedback">
          <forrest:properties contract="siteinfo-feedback">
            <forrest:property name="siteinfo-feedback">
              <feedback to="the Webmaster"
                href="mailto:webmaster@example.org?subject=Feedback&#160;" >
                Send feedback about the website to:
              </feedback>
            </forrest:property>
          </forrest:properties>
  </forrest:contract>-->
      </forrest:hook>
    </forrest:hook>
  </forrest:view>
</forrest:views>
