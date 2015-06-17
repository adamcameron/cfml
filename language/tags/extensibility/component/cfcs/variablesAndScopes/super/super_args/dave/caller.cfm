
<!--- <cfinvoke component="child" method="foo" arg1="value1" arg2="value2"> --->
<cfset test = createObject("component","child").foo(arg1="value1",arg2="value2")>
<!--- <cfset args = structNew()>
<cfset args.arg1 = "value1">
<cfset args.arg2 = "value2">
<cfset test = createObject("component","child").bar(argumentCollection=args)> --->
<cfdump var="#test#">