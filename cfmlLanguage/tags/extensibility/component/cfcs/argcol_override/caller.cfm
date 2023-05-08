<cfset o= createObject("component", "c")>

<cfdump var="#o.f(a1='a1',a2='a2',a3='a3',a4='a4')#" label="ALL ARGS PASSED SEPARATELY">

<cfset s = o.structBuild(a1='a1',a2='a2',a3='a3',a4='a4')>

<cfdump var="#o.f(argumentCollection=s)#" label="ALL ARGS PASSED AS STRUCT">

<cfdump var="#o.f(a1='OVERRIDE', argumentCollection=s)#" label="ALL ARGS PASSED AS STRUCT, A1 OVERRIDDEN">

<cfinvoke component="#o#" method="f" returnvariable="result">
	<cfinvokeargument name="argumentCollection" value="#s#">
	<cfinvokeargument name="a1" value="OVERRIDE">
</cfinvoke>
<cfdump var="#result#" label="ALL ARGS PASSED AS STRUCT, A1 OVERRIDDEN, CFINVOKE">

<cfinvoke component="#o#" method="f" returnvariable="result" argumentCollection="#s#">
	<cfinvokeargument name="a1" value="OVERRIDE">
</cfinvoke>
<cfdump var="#result#" label="ALL ARGS PASSED AS STRUCT, A1 OVERRIDDEN, CFINVOKE">

<cfinvoke component="#o#" method="f" returnvariable="result" argumentCollection="#s#" a1="OVERRIDE">
<cfdump var="#result#" label="ALL ARGS PASSED AS STRUCT, A1 OVERRIDDEN, CFINVOKE">