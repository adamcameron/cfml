<!--- cfparam.cfm --->
<cfparam name="fn" type="function" default="#function(name){return 'G''day, #name#'}#">
<cfoutput>#fn("Zachary")#</cfoutput>