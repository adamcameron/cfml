<cfparam name="URL.method" type="regex" pattern="^(?i)(?:createobject|cfinvoke|cfinvokeargument)$">
<cfparam name="URL.iterations" type="integer" default="0">

<cfset iTotal = 0>

<cfif URL.iterations GT 0>
	<cfloop index="i" from="1" to="#URL.iterations#">
		<cfset sMessage = "Hello World @ #now()#">
		<cfswitch expression="#URL.method#">
			<cfcase value="createobject">
				<cfset iBefore = getTickCount()>
				<cfset sResult = createObject("C").echo(message=sMessage)>
				<cfset iAfter = getTickCount()>
			</cfcase>
			<cfcase value="cfinvoke">
				<cfset iBefore = getTickCount()>
				<cfinvoke component="C" method="echo" message="#sMessage#" returnvariable="sResult">
				<cfset iAfter = getTickCount()>
			</cfcase>
			<cfcase value="cfinvokeargument">
				<cfset iBefore = getTickCount()>
				<cfinvoke component="C" method="echo" returnvariable="sResult">
					<cfinvokeargument name="message" value="#sMessage#">
				</cfinvoke>
				<cfset iAfter = getTickCount()>
			</cfcase>
		</cfswitch>	
		<cfset iRuntime = iAfter - iBefore>
	
		<cfif NOT structKeyExists(variables, "iMinimum")>
			<cfset iMinimum = iRuntime>
		<cfelseif iRuntime LT iMinimum>
			<cfset iMinimum = iRuntime>
		</cfif>
	
		<cfif NOT structKeyExists(variables, "iMaximum")>
			<cfset iMaximum = iRuntime>
		<cfelseif iRuntime GT iMaximum>
			<cfset iMaximum = iRuntime>
		</cfif>
		
		<cfset iTotal += iRuntime>
	</cfloop>
	
	<cfoutput>
		Minimum: #iMinimum#ms<br />
		Maximum: #iMaximum#ms<br />
		Mean: #iTotal / URL.iterations#ms<br />
	</cfoutput>
<cfelse>
	Test not run<br />
</cfif>