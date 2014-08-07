<!--- testScriptVersion.cfm --->
<cfimport taglib="." prefix="t">
<t:scriptversion>
	Text within tags<br>
</t:scriptversion>
<hr>

<t:scriptversion exitMethod="exittag">
	Text within tags<br>
</t:scriptversion>
<hr>

<t:scriptversion exitMethod="exittemplate">
	Text within tags<br>
</t:scriptversion>
<hr>