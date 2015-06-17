<!--- testExitBug.cfm --->
<cfparam name="URL.exitmethod" default="">
<cfimport taglib="." prefix="tag">
<tag:exitBug exitmethod="#URL.exitmethod#">
	inner text
</tag:exitBug>