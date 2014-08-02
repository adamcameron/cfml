<!--- redden.cfm --->
<cfimport taglib="lib" prefix="t">

<t:RequiredToBeSubTag message="Called without BaseTag tag">
<hr>

<t:BaseTag>
	<t:RequiredToBeSubTag message="called with BaseTag tag">
</t:BaseTag>
<hr>