<!--- startTagReturnsFalse.cfm --->
<cfimport taglib="lib" prefix="t">

<t:startTagReturnsFalse return="true">
	between tags<br>
</t:startTagReturnsFalse>
<hr>
<t:startTagReturnsFalse return="false">
	between tags<br>
</t:startTagReturnsFalse>
<hr>