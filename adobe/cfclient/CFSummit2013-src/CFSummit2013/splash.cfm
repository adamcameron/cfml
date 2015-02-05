<!---
	Custom tag to display splash image
	Attributes :
		parent - Id of parent div 
--->

<cfclient>
	<cfif thisTag.executionMode eq "start">
		<cfset displaySplash()>
	</cfif>
	
	<cffunction name="displaySplash" >
		<cfset $("##title-bar").hide()>
		<cfset var parent_div = $("##"+attributes.parent)>
		<cfsavecontent variable="tmphtml" >
			<img src="images/splash.jpg" width="100%" height="100%">
		</cfsavecontent>		
		
		<cfset $(parent_div).append(tmphtml)>
		<cfset setTimeout(hideSplash,2000)>
	</cffunction>
	
	<cffunction name="hideSplash" >
		<cfset $("##title-bar").show()>
		<cfset eval("document.location.hash='##/home'")>
	</cffunction>
	
</cfclient>
