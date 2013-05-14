<cfcomponent output="false" hint="I am the Main Dashboard Service." singleton>

	<cfproperty name="coldbox" inject="coldbox" scope="instance">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->

	<cffunction name="init" access="public" returntype="any" output="false">
		<cfscript>
			instance = structnew();

			return this;
		</cfscript>
	</cffunction>

<!------------------------------------------- PUBLIC ------------------------------------------->

	<!--- Send a Bug Report --->
	<cffunction name="sendbugreport" access="public" returntype="void" output="false">
		<cfargument name="requestCollection" required="true" type="any" >
		<cfargument name="fwSettings"		 required="true" type="any">
		
		<!--- Send Bug Report. --->
		<cfset var myBugreport = "">
		<!--- Save the Report --->
		<cfsavecontent variable="mybugreport">
		<cfoutput>
		=========================================================
		BUG DETAILS
		=========================================================
		Date: #dateFormat(now(),"mmmm dd, YYYY")#
		Time: #TimeFormat(now(), "long")#
		From: #arguments.requestCollection.name#
		=========================================================
		BUG REPORT
		=========================================================
		#arguments.requestCollection.bugreport#
		=========================================================
		COLDBOX DETAILS
		=========================================================
		Version:    #arguments.fwSettings.version#
		Codename:   #arguments.fwSettings.codename#
		Suffix:     #arguments.fwSettings.suffix#
		O.S:        #server.os.toString()#
		CF Engine:  #server.ColdFusion.ProductName#
		CF Version: #server.ColdFusion.ProductVersion#
		=========================================================
		</cfoutput>
		</cfsavecontent>
		<!--- Send the bug report --->
		<cfmail to="bugs@coldbox.org"
				from="#arguments.requestCollection.email#"
				subject="Bug Report">
		#mybugreport#
		</cfmail>
	</cffunction>

</cfcomponent>