<!--- invokeargument.cfm --->
<cfinvoke component="C" method="callFunctionWith">
	<cfinvokeargument name="name" value="Zachary">
	<cfinvokeargument name="fn" value="#function(name){return 'G''day, #name#'}#">
</cfinvoke>