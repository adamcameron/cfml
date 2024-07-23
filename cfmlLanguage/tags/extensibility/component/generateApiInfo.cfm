<cfapplication name="foo">
<cfset application.compatibility = structnew()>
<cfparam name="URL.cfcPath" default="">
<cfsetting enablecfoutputonly="true">
<cfoutput>
<style>
	body, td, th {
		font-family		: verdana;
		font-size		: 10px;
	}
	
	th {
		text-align		: left;
	}
	
	h4 {
		font-size		: 12px;
		font-weight		: bold;
		margin			: 0px;
	}
	
	h5 {
		font-size		: 11px;
		font-weight		: bold;
		margin			: 0px;
	}

	.small {
		font-size		: x-small;
	}
	.inheritance {
		padding-left	: 20px;
	}
</style>

<form method="get" action="#CGI.script_name#" name="frm1">
	<table>
		<tr>
			<td>CFC URL path</td>
			<td>
				<input type="text" name="cfcPath" value="#URL.cfcPath#" size="80" />
			</td>
			<td>
				<input type="submit" name="btnSubmit" value="Submit" />
			</td>
		</tr>
	</table>
</form>
</cfoutput>

<cfif len(URL.cfcPath)>
	<cfset sCfcFullPath = expandPath(URL.cfcPath)>
	<cfif fileExists(sCfcFullPath)>
		<cfset sDottedPath = reReplace(URL.cfcpath, "\.cfc$", "", "ONE")>
		<cfset sDottedPath = listChangeDelims(sDottedPath, ".", "/")>
		<cftry>
			<cfset o = createObject("component", sDottedPath)>
			<cfset stMetadata = getMetadata(o)>
			<cffile action="read" file="#sCfcFullPath#" variable="sCfcCode">
			<cfset aMethodMatches = reMatchNoCase("<cffunction.*?>", sCfcCode)>
			
			
			<cfoutput><div>#listDeleteAt(stMetadata.fullName, listLen(stMetadata.fullName, "."), ".")#</div></cfoutput>
			<cfoutput><h4>#listLast(sCfcFullPath, "\/")#</h4></cfoutput>
			<cfset aInheritance = arrayNew(1)>
			<cfset stThis = stMetadata>
			<cfloop condition="true">
				<cfif structKeyExists(stThis, "extends")>
					<cfset arrayPrepend(aInheritance, stThis.extends.fullname)>
					<cfset stThis = stThis.extends>
				<cfelse>
					<cfbreak>
				</cfif>
			</cfloop>
			<cfoutput><br /></cfoutput>
			<cfoutput><div class="small"></cfoutput>
			<cfloop index="i" from="1" to="#arrayLen(aInheritance)#">
				<cfoutput>#aInheritance[i]#<div class="inheritance"></cfoutput>
			</cfloop>
			<cfoutput><strong>#stMetadata.fullName#</strong></div></cfoutput>
			<cfoutput>#repeatString("</div>", arrayLen(aInheritance)-1)#</cfoutput>
			<cfoutput></div></cfoutput>
			<cfif structKeyExists(stMetadata, "hint")>
				<cfoutput><p>#stMetadata.hint#</p></cfoutput>
			</cfif>
			<cfoutput><h5>Method Summary</h5><br /></cfoutput>
			<cfif structKeyExists(stMetadata, "functions")>
				<cfloop index="iMethod" from="1" to="#arrayLen(aMethodMatches)#">
					<cfset sName = reReplaceNoCase(aMethodMatches[iMethod],'<cffunction.*?name="(.*?)".*?>', "\1", "ONE")>
					<cfset aMatchedMethod = structFindValue(stMetadata, sName, "ALL")>

					<!--- find the right one --->
					<cfset structDelete(variables, "stThisMethod")>
					<cfloop index="iMatch" from="1" to="#arrayLen(aMatchedMethod)#">
						<cfif reFindNoCase("\.functions\[\d+\]\.name", aMatchedMethod[iMatch].path)>
							<cfset stThisMethod = aMatchedMethod[iMatch].owner>
							<cfbreak>
						</cfif>
					</cfloop>

					<cfif structKeyExists(variables, "stThisMethod")>
						<cfif NOT (structKeyExists(stThisMethod, "access") AND stThisMethod.access EQ "private")>
							<cfoutput><strong>#stThisMethod.name#()</strong><br /><br /></cfoutput>
							<cfoutput><strong>Method prototype:</strong><br /></cfoutput>
							<cfoutput><cfif structKeyExists(stThisMethod, "access")>#stThisMethod.access#<cfelse>public</cfif> </cfoutput>
							<cfoutput><cfif structKeyExists(stThisMethod, "returntype")>#stThisMethod.returntype#<cfelse>any</cfif> </cfoutput>
							<cfoutput>#stThisMethod.name#(</cfoutput>
							<cfif structKeyExists(stThisMethod, "parameters")>
								<cfloop index="iParam" from="1" to="#arrayLen(stThisMethod.parameters)#">
									<cfif structKeyExists(stThisMethod.parameters[iParam], "required") AND NOT stThisMethod.parameters[iParam].required><cfoutput>[</cfoutput></cfif>
									<cfif iParam NEQ 1><cfoutput>, </cfoutput></cfif>
									<cfoutput><cfif structKeyExists(stThisMethod.parameters[iParam], "type")>#stThisMethod.parameters[iParam].type#<cfelse>any</cfif> </cfoutput>
									<cfoutput>#stThisMethod.parameters[iParam].name#</cfoutput>
									<cfif structKeyExists(stThisMethod.parameters[iParam], "default")>
										<cfif structKeyExists(stThisMethod.parameters[iParam], "type") AND stThisMethod.parameters[iParam].type EQ "string">
											<cfset cDefaultDelim = '"'>
										<cfelse>
											<cfset cDefaultDelim = ''>
										</cfif>
										<cfoutput>=#cDefaultDelim##stThisMethod.parameters[iParam].default##cDefaultDelim#</cfoutput>
									</cfif>
									<cfif structKeyExists(stThisMethod.parameters[iParam], "required") AND NOT stThisMethod.parameters[iParam].required><cfoutput>]</cfoutput></cfif>
								</cfloop><!--- end of looping over arguments --->
							</cfif><!--- end of whether there are arguments --->
							<cfoutput>)</cfoutput>
							<cfoutput><br /></cfoutput>
							<cfif structKeyExists(stThisMethod, "hint")>
								<cfoutput><br/><strong>Description:</strong><br/></cfoutput>
								<cfoutput>#stThisMethod.hint#</cfoutput>
								<cfif NOT (structKeyExists(stThisMethod, "output") AND stThisMethod.output EQ "false")><cfoutput><br />OUTPUT ENABLED FOR THIS METHOD<br /></cfoutput></cfif>
							</cfif>
							<cfif structKeyExists(stThisMethod, "parameters") AND arrayLen(stThisMethod.parameters)>
								<cfoutput><br /><br/><strong>Argument summary:</strong><br /></cfoutput>
								<cfloop index="iParam" from="1" to="#arrayLen(stThisMethod.parameters)#">
									<cfoutput>#stThisMethod.parameters[iParam].name#: </cfoutput>
									<cfif structKeyExists(stThisMethod.parameters[iParam], "hint")>
										<cfoutput>#stThisMethod.parameters[iParam].hint#</cfoutput>
									<cfelse>
										<cfoutput>[No further info]</cfoutput>
									</cfif>
									<cfoutput><br /></cfoutput>
								</cfloop>
							</cfif><!--- end of whether there are params --->
							<cfoutput><br /><br /><br /></cfoutput>
						</cfif><!--- non-private methods only --->
					</cfif><!--- end of whether the method from the file was found in the metadata --->
				</cfloop><!--- end of looping over methods --->
			<cfelse>
				<cfoutput>No methods for this component<br /></cfoutput>
			</cfif><!--- end of whether there are methods --->
			<cfcatch>
				<cfoutput>
					Error getting CFC metadata: #cfcatch.message# #cfcatch.detail#
					<cfdump var="#cfcatch#">
				</cfoutput>
			</cfcatch>
		</cftry>
	<cfelse>
		<cfoutput>File #URL.cfcPath# (#sCfcFullPath#) not found</cfoutput>
	</cfif>
</cfif>
