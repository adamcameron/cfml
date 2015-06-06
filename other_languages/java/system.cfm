<cfset o = createObject("java", "java.lang.System")>

<cfset s = o.getEnv("foo")>

<cfoutput>[#s#]</cfoutput>