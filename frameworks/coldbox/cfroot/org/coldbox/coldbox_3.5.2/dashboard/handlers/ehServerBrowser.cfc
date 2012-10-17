<!---
Author			:	Luis Majano
Create Date		:	September 19, 2006
Update Date		:	September 25, 2006
Description		:

This is the File Browser Handler

--->
<cfcomponent name="ehServerBrowser" extends="baseHandler" output="false">
	
	<!--- Pre Handler --->
	<cffunction name="preHandler" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any" required="true">
		<cfset event.setLayout("Layout.Ajax")>
	</cffunction>
	
	<!--- dsp Browser --->
	<cffunction name="dspBrowser" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<cfset var currentRootLen = 0>
		<cfset var slash = "/">
		<cfset var tmpOldDir = "">
		
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehBrowser = "ehServerBrowser.dspBrowser">
		<cfset rc.xehNewFolder = "ehServerBrowser.doNewFolder">
		
		<cfset rc.oSession = getPlugin("SessionStorage")>
		
		<!--- Check for callback. --->
		<cfif event.valueExists("callbackItem")>
			<cfset rc.oSession.setvar("callBackItem", event.getValue("callbackItem") )>
		<cfelseif not rc.oSession.exists("callBackItem")>
			<cfdump var="You need a callBackItem in order to use the browser chooser">
			<cfaborT>
		</cfif>
		
		<!--- Get Computer Roots --->
		<cfset rc.roots = createObject("java","java.io.File").listRoots()>
		
		<!--- Select Default Computer Root if not set in our perm storage. --->
		<cfif not rc.oSession.exists("computerRoot")>
			<cfset rc.oSession.setVar("computerRoot", rc.roots[1].getAbsolutePath())>
		</cfif>
		
		<!--- Check if there is no incoming computer root change --->
		<cfif not event.valueExists('computerRoot')>
			<!--- Set Computer Root, from session storage --->
			<cfset rc.computerRoot = rc.oSession.getVar('computerRoot')>
		<cfelse>
			<!--- This means we are changing the root --->
			<cfset rc.computerRoot = urlDecode(rc.computerRoot)>
			<cfset rc.oSession.setVar("computerRoot", rc.computerRoot)>
			<!--- The current dir --->
			<cfset rc.dir = rc.computerRoot>
		</cfif>
		
		<!--- Test if incoming directory is blank --->
		<cfif not event.valueExists("dir") or event.getValue("dir") eq "">
			<!--- Test if we have an old location, else set back to the root --->
			<cfif rc.oSession.getVar("currentRoot") neq "">
				<cfset event.setValue("dir",rc.oSession.getVar("currentRoot"))>
			<cfelse>
				<cfset event.setValue("dir",rc.computerRoot)>
			</cfif>
		<cfelse>
			<!--- Decode the incoming directory --->
			<cfset rc.dir = urlDecode(rc.dir)>
		</cfif>
		
		<!--- Init The Current Root we have asked or I am located in --->
		<cfset rc.currentRoot = rc.dir>
		
		<!--- Setup the old root if unequal to compuer root eq to the old current root. --->
		<cfif rc.currentRoot neq rc.computerRoot>
			<cfset tmpOldDir = listdeleteAt(rc.currentRoot,listLen(rc.currentRoot,slash),slash)>
			<cfif tmpOldDir.length() eq 0>
				<cfset tmpOldDir = slash>
			</cfif>
			<cfset rc.oSession.setvar("oldRoot",tmpOldDir)>
		</cfif>
		
		<cftry>
			<!--- Get Dir Listing --->
			<cfdirectory action="list" directory="#rc.currentRoot#" name="rc.qryDir" sort="name">
			
			<!--- Sort --->
			<cfset rc.qryDir = getPlugin("QueryHelper").sortQuery(rc.qryDir,"Type,Name")>
			<!--- Save the current root --->
			<cfset rc.oSession.setVar("currentRoot", rc.currentRoot)>
			
			<cfcatch type="any">
				<cfdump var="#cfcatch#"><cfabort>
				<cfset rc.qryDir = QueryNew("")>
				<cfset getPlugin("MessageBox").setMessage("warning", "An error occurred reading directory. #cfcatch.message# - #cfcatch.detail#")>	
			</cfcatch>
		</cftry>	
		
		<!--- Set the slash we will use if the root has a slash already --->
		<cfif right(rc.currentroot,1) eq slash>
			<cfset rc.thisSlash = "">
		<cfelse>
			<cfset rc.thisSlash = slash>
		</cfif>
		
		<!--- Set the view --->
		<cfset event.setView("tags/serverbrowser")>
	</cffunction>
	
	
	<!--- Create a new folder --->
	<cffunction name="doNewFolder" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any" required="true">
		<cfset var rc = event.getCollection()>
		<cfset var newDir = "">
		
		<!--- Check for incoming params --->
		<cfif len(trim(event.getValue("newFolder",""))) eq 0>
			<cfset getPlugin("MessageBox").setMessage("warning", "Please enter a valid folder name.")>
		<cfelse>
		    <cfset newDir = event.getValue("dir") & "/" & event.getValue("NewFolder")>
			<cfdirectory action="create" directory="#newDir#">
			<cfset getPlugin("MessageBox").setMessage("info", "Folder Created Successfully")>
		</cfif>
		
		<!--- Set the next event --->
		<cfset setNextEvent("ehServerBrowser.dspBrowser","dir=#event.getValue("dir")#")>
	</cffunction>
	
	<!--- ************************************************************* --->
</cfcomponent>