<cfset threads = arrayNew(1)>
<cfset threadPrefix = createUUID()>

<cffunction name="addThreadName" returntype="string" access="private" output="false">
<cfset var threadName = "t" & variables.threadPrefix & (arrayLen(variables.threads) + 1)>
<cfset arrayAppend(variables.threads, threadName)>
<cfreturn threadName>
</cffunction>

<cfset variables.mystruct = "">

<cfthread name="#addThreadName()#" action="run">
<cfthread action="sleep" duration="100" />
<cfset variables.mystruct = structNew()>
<cfset variables.mystruct.hello = "Hello World!">
</cfthread>

<cfthread name="#addThreadName()#" action="run">
</cfthread>

<cfthread name="#addThreadName()#" action="run">
</cfthread>

<cfthread name="#addThreadName()#" action="run">
</cfthread>

<cfloop array="#variables.threads#" index="i">
<cfoutput>#i#</cfoutput><br />
<cfthread action="join" name="#trim(i)#" timeout="2000" / >
</cfloop>

<cfdump var="#mystruct#" >