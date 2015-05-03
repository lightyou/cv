<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
   <xsl:template match="/cv">
      <fo:root>
	 <fo:layout-master-set>
	    <fo:simple-page-master master-name="A4" page-width="210mm" page-height="297mm" margin-top="0.5cm" margin-bottom="0.5cm" margin-left="0.5cm" margin-right="0.5cm">
	       <fo:region-body/>	   
	    </fo:simple-page-master>
	 </fo:layout-master-set>

	 <fo:page-sequence master-reference="A4">
	    <fo:flow flow-name="xsl-region-body">
	       <fo:block font-family="sans-serif">
		  <fo:table width="100%" border-collapse="collapse" table-layout="fixed" >
		     <fo:table-column column-width="5cm"/>
		     <fo:table-column/>
		     <fo:table-body>
			<fo:table-row>
			   <fo:table-cell border-style="solid" border-width="0.5pt" padding="3pt">
			      <fo:block>
				 <xsl:apply-templates select="author"/>
			      </fo:block>
			   </fo:table-cell>
			   <fo:table-cell>
			      <fo:block>
				 <xsl:apply-templates select="photo"/>
			      </fo:block>
			   </fo:table-cell>
			</fo:table-row>
		     </fo:table-body>
		  </fo:table>
	       </fo:block>
	       <xsl:apply-templates select="title"/>
	       <fo:table table-layout="fixed" width="100%">
		  <fo:table-column column-width="0.5cm"/>
		  <fo:table-column column-width="0.3cm"/>
		  <fo:table-column/>
		     <fo:table-body>
			<fo:table-row>
			   <fo:table-cell background-color="rgb(255,185,107)" >
			      <fo:block>
				 &#160;
			      </fo:block>
			   </fo:table-cell>
			   <fo:table-cell>
			      <fo:block>
				 &#160;
			      </fo:block>
			   </fo:table-cell>
			   <fo:table-cell>
			      <fo:block space-before="0.5cm">
				 <xsl:apply-templates select="skills|experiences|education|languages|others"/>
			      </fo:block>
			   </fo:table-cell>
			</fo:table-row>
		     </fo:table-body>
		  </fo:table>
	    </fo:flow>
	 </fo:page-sequence>
      </fo:root>
   </xsl:template>

   <xsl:template match="author">
      <fo:block font-size="10pt" font-weight="bold">
	 <xsl:value-of select="firstname"/>&#160;<xsl:value-of select="surname"/>
      </fo:block>
      <fo:block font-size="8pt" >
	 <xsl:value-of select="address/street"/>
      </fo:block>
      <fo:block font-size="8pt" >
	 <xsl:value-of select="address/zipcode"/>&#160;<xsl:value-of select="address/town"/>
      </fo:block>
      <fo:block font-size="8pt" >
	 <xsl:value-of select="address/country"/>
      </fo:block>
      <fo:block font-size="8pt" >
	 <xsl:for-each select="address/phone/*">
	    &#x260E; <xsl:value-of select="name()"/> : <xsl:value-of select="."/>
	 </xsl:for-each>
      </fo:block>
      <fo:block font-size="8pt" >
	 <xsl:value-of select="age"/> years old
      </fo:block>
   </xsl:template>

   <xsl:template match="title">
      <fo:table table-layout="fixed" space-before="24pt" space-after="-34pt" border-style="none" background-color="rgb(135,200,255)" >
	<fo:table-column column-width="15cm"/>
	<fo:table-body>
	  <fo:table-row>
	    <fo:table-cell><fo:block>&#160;</fo:block></fo:table-cell>
	  </fo:table-row>
	</fo:table-body>
      </fo:table>
      <fo:block font-size="36pt" space-after="5pt" font-family="sans-serif">
	 <xsl:value-of select="."/>
      </fo:block>
   </xsl:template>

   <xsl:template match="skills">
      <fo:table font-size="8pt" table-layout="fixed" space-before="13pt" space-after="-22pt" border-style="none" background-color="rgb(168,255,140)" >
	<fo:table-column column-width="1.5cm"/>
	<fo:table-body>
	  <fo:table-row>
	    <fo:table-cell><fo:block>&#160;</fo:block></fo:table-cell>
	  </fo:table-row>
	</fo:table-body>
      </fo:table>
      <fo:block font-size="22pt" space-after="3pt" font-family="sans-serif" keep-with-next="100">
	 Skills
      </fo:block>
      <xsl:for-each select="skill">
	 <fo:block font-size="10pt" space-before="2pt" font-weight="bold" keep-with-next="50">
	    <xsl:value-of select ="title"/>
	 </fo:block>
	 <fo:block font-size="8pt" keep-together="30">
	    <xsl:apply-templates select="para"/>
	 </fo:block>
      </xsl:for-each>
   </xsl:template>

   <xsl:template match="experiences">
      <fo:table font-size="8pt" table-layout="fixed" space-before="13pt" space-after="-22pt" border-style="none" background-color="rgb(168,255,140)" >
	<fo:table-column column-width="8cm"/>
	<fo:table-body>
	  <fo:table-row>
	    <fo:table-cell><fo:block>&#160;</fo:block></fo:table-cell>
	  </fo:table-row>
	</fo:table-body>
      </fo:table>
      <fo:block font-size="22pt" space-after="3pt" font-family="sans-serif" keep-with-next="100">
	 Professional Experiences
      </fo:block>
      <xsl:for-each select="experience">
	 <fo:block keep-together="50" orphans="4" widows="5">
	    <fo:block font-size="12pt" space-before="9pt" font-weight="bold" text-align="end" line-height="0cm">
	       <xsl:value-of select ="date"/>
	    </fo:block>
	    <fo:block font-size="12pt"  font-weight="bold" color="blue" line-height="0cm" space-after="7pt">
	       <xsl:value-of select ="company"/>
	    </fo:block>
	    <fo:block font-size="10pt" font-weight="bold">
	       <xsl:value-of select="description/title"/>
	    </fo:block>
	    <xsl:apply-templates select="description/para"/> 
	 </fo:block>
      </xsl:for-each>
   </xsl:template>

   <xsl:template match="education">
      <fo:table font-size="8pt" table-layout="fixed" space-before="13pt" space-after="-22pt" border-style="none" background-color="rgb(168,255,140)" >
	<fo:table-column column-width="2.5cm"/>
	<fo:table-body>
	  <fo:table-row>
	    <fo:table-cell><fo:block>&#160;</fo:block></fo:table-cell>
	  </fo:table-row>
	</fo:table-body>
      </fo:table>
      <fo:block font-size="22pt" space-after="5pt" font-family="sans-serif" keep-with-next="100">
	 Education
      </fo:block>
      <xsl:apply-templates select="para"/>
   </xsl:template>
   
   <xsl:template match="languages">
      <fo:table font-size="8pt" table-layout="fixed" space-before="13pt" space-after="-22pt" border-style="none" background-color="rgb(168,255,140)" >
	<fo:table-column column-width="3cm"/>
	<fo:table-body>
	  <fo:table-row>
	    <fo:table-cell><fo:block>&#160;</fo:block></fo:table-cell>
	  </fo:table-row>
	</fo:table-body>
      </fo:table>
      <fo:block font-size="22pt" space-after="5pt" font-family="sans-serif" keep-with-next="100">
	 Languages
      </fo:block>
      <xsl:apply-templates select="para"/>
   </xsl:template>

   <xsl:template match="others">
      <fo:table font-size="8pt" table-layout="fixed" space-before="13pt" space-after="-22pt" border-style="none" background-color="rgb(168,255,140)" >
	 <fo:table-column column-width="1.5cm"/>
	<fo:table-body>
	  <fo:table-row>
	    <fo:table-cell><fo:block>&#160;</fo:block></fo:table-cell>
	  </fo:table-row>
	</fo:table-body>
      </fo:table>
      <fo:block font-size="22pt" space-after="5pt" font-family="sans-serif" keep-with-next="100">
	 Others
      </fo:block>
      <xsl:apply-templates select="para"/>
   </xsl:template>

   <xsl:template match="para">
      <fo:block font-size="10pt" text-indent="5pt" space-before="2pt" keep-together="200">
	 <xsl:apply-templates select="emphasis|text()"/>
      </fo:block>
   </xsl:template>
   
   <xsl:template match="emphasis">
      <fo:wrapper font-weight="bold" >
	 <xsl:value-of select="."/>
      </fo:wrapper> 
   </xsl:template>
</xsl:stylesheet>

