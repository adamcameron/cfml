<!--- demo.cfm --->
<cfset m=1>
<cfset n=5>
<cfinvoke method="f" arg1=m arg2=n>

<cfscript>
	function f(){
		writeDump(arguments);
	}
</cfscript>