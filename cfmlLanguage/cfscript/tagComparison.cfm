<!--- tagComparison.cfm--->
<cfsavecontent variable="someVar">
	<cfset myContent = "this is the content">
	<cfoutput>#myContent#</cfoutput>
</cfsavecontent>

<cflock name="myLock" type="exclusive" timeout="1" throwontimeout="true">
	<!--- stuff to lock --->
</cflock>

<cfthread action="run" name="t1">
	<!--- code in thread --->
</cfthread>


<cfscript>
	savecontent variable="someVar" {
		myContent = "this is the content";
		writeOutput(myContent);
	}

	lock name="myLock" type="exclusive" timeout=1 throwontimeout=true {
		// stuff to lock
	}

	thread action="run" name="t1"{
		// code in thread
	}
</cfscript>