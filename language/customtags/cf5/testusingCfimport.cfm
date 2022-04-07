<!--- testusingCfimport.cfm --->
<cfimport taglib="." prefix="t">
<t:basic>
	Text within tags<br>
</t:basic>
<hr>

<t:basic exitMethod="exittag">
	Text within tags<br>
</t:basic>
<hr>

<t:basic exitMethod="exittemplate">
	Text within tags<br>
</t:basic>
<hr>