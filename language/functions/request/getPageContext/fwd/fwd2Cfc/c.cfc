<cfcomponent>

	<cffunction name="f" access="remote" returntype="void" output="true">
		<cfargument name="a">
		<cfset var sKey="">
		
		<cfoutput>#getCurrentTemplatePath()#</cfoutput>
		<cftry>
			<table border="1">
			<cfloop item="sKey" collection="#URL#">
				<tr><td>URL.#sKey#</td><td>#URL[sKey]#&nbsp;</td></tr>
			</cfloop>
			</table>
			<cfcatch>
				Error processing URL vars: [#cfcatch.message#][#cfcatch.detail#]
				</table>
			</cfcatch>
		</cftry>

		<cftry>
			<table border="1">
			<cfloop item="sKey" collection="#CGI#">
				<tr><td>CGI.#sKey#</td><td>#CGI[sKey]#&nbsp;</td></tr>
			</cfloop>
			</table>
				<cfcatch>
					Error processing CGI vars: [#cfcatch.message#][#cfcatch.detail#]
					</table>
				</cfcatch>
			</cftry>
	
			<cftry>
			<table border="1">
			<cfloop item="sKey" collection="#form#">
				<tr><td>form.#sKey#</td><td>#form[sKey]#&nbsp;</td></tr>
			</cfloop>
			</table>
			<cfcatch>
				Error processing form vars: [#cfcatch.message#][#cfcatch.detail#]
				</table>
			</cfcatch>
		</cftry>

		<cftry>
			<table border="1">
			<cfloop item="sKey" collection="#session#">
				<tr>
					<td>session.#sKey#</td>
					<td>
						<cfif isSimpleValue(session[sKey])>
							#session[sKey]#&nbsp;
						<cfelse>
							Complex value
						</cfif>
					</td>
				</tr>
			</cfloop>
			</table>
			<cfcatch>
				Error processing session vars: [#cfcatch.message#][#cfcatch.detail#]
				</table>
			</cfcatch>
		</cftry>

		<cftry>
			<table border="1">
			<cfloop item="sKey" collection="#application#">
				<tr>
					<td>application.#sKey#</td>
					<td>
						<cfif isSimpleValue(application[sKey])>
							#application[sKey]#&nbsp;
						<cfelse>
							Complex value
						</cfif>
					</td>
				</tr>
			</cfloop>
			</table>
			<cfcatch>
				Error processing application vars: [#cfcatch.message#][#cfcatch.detail#]
				</table>
			</cfcatch>
		</cftry>

		<cftry>
			<table border="1">
			<cfloop item="sKey" collection="#request#">
				<tr>
					<td>request.#sKey#</td>
					<td>
						<cfif isSimpleValue(request[sKey])>
							#request[sKey]#&nbsp;
						<cfelse>
							Complex value
						</cfif>
					</td>
				</tr>
			</cfloop>
			</table>
			<cfcatch>
				Error processing request vars: [#cfcatch.message#][#cfcatch.detail#]
				</table>
			</cfcatch>
		</cftry>
		
		<cfreturn>
	</cffunction>

</cfcomponent>