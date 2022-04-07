<cfparam name="URL.properties" default="5">
<cfparam name="URL.objects" default="5">

<cfsetting enablecfoutputonly="true">

<cfset oab	= "<">
<cfset crlf	= chr(13) & chr(10)>
<cfset tab	= chr(9)>
<cfset co	= "createObject">

<cfsavecontent variable="sCfc">
	<cfoutput>#oab#cfcomponent output="false" hint="Test CFC with #URL.properties# getters and setters">#crlf#</cfoutput>
	<cfoutput>#crlf##crlf#</cfoutput>
	<cfloop index="i" from="1" to="#URL.properties#">
		<cfoutput>#tab##oab#cfset variables.prop#i# = "">#crlf#</cfoutput>
	</cfloop>
	<cfoutput>#crlf##crlf#</cfoutput>

	<cfoutput>#tab##oab#cffunction name="init" output="false" returntype="Test#URL.properties#" access="public" hint="Initialises CFC">#crlf#</cfoutput>
	<cfloop index="i" from="1" to="#URL.properties#">
		<cfoutput>#tab##tab##oab#cfargument name="prop#i#" type="string" required="false" hint="Value for prop#i#">#crlf#</cfoutput>
	</cfloop>
	<cfloop index="i" from="1" to="#URL.properties#">
		<cfoutput>#tab##tab##oab#cfif structKeyExists(arguments, "prop#i#")>#crlf#</cfoutput>
		<cfoutput>#tab##tab##tab##oab#cfset variables.prop#i# = arguments.prop#i#>#crlf#</cfoutput>
		<cfoutput>#tab##tab##oab#/cfif>#crlf#</cfoutput>
	</cfloop>
	<cfoutput>#tab##tab##oab#cfreturn this>#crlf#</cfoutput>
	<cfoutput>#tab##oab#/cffunction>#crlf#</cfoutput>
	<cfoutput>#crlf##crlf#</cfoutput>



	<cfloop index="i" from="1" to="#URL.properties#">
		<cfoutput>#tab##oab#cffunction name="getProp#i#" output="false" returntype="string" access="public" hint="Returns value of prop#i#">#crlf#</cfoutput>
		<cfoutput>#tab##tab##oab#cfreturn variables.prop#i#>#crlf#</cfoutput>
		<cfoutput>#tab##oab#/cffunction>#crlf#</cfoutput>
		<cfoutput>#crlf##crlf#</cfoutput>

		<cfoutput>#tab##oab#cffunction name="setProp#i#" output="false" returntype="void" access="public" hint="Sets value of prop#i#">#crlf#</cfoutput>
		<cfoutput>#tab##tab##oab#cfargument name="prop#i#" type="string" required="true" hint="Value for prop#i#">#crlf#</cfoutput>
		<cfoutput>#tab##tab##oab#cfset variables.prop#i# = arguments.prop#i#>#crlf#</cfoutput>
		<cfoutput>#tab##oab#/cffunction>#crlf#</cfoutput>
		<cfoutput>#crlf##crlf#</cfoutput>
	</cfloop>
	<cfoutput>#oab#/cfcomponent>#crlf#</cfoutput>
</cfsavecontent>
<cffile action="write" file="#expandPath('./')#Test#URL.properties#.cfc" output="#sCfc#">


<cfsavecontent variable="sCfm">
	<cfloop index="i" from="1" to="#URL.objects#">
		<cfoutput>#oab#cfset o#i# = #co#("component", "Test#URL.properties#")>#crlf#</cfoutput>
		<cfoutput>#oab#cfset o#i# =o#i#.init(#crlf#</cfoutput>
		<cfloop index="j" from="1" to="#URL.properties#">
			<cfoutput>#tab#prop#j# = "value#j#"<cfif j neq URL.properties>,</cfif>#crlf#</cfoutput>
		</cfloop>
		<cfoutput>)>#crlf#</cfoutput>
	</cfloop>
</cfsavecontent>
<cffile action="write" file="#expandPath('./')#Test#URL.properties#.cfm" output="#sCfm#">