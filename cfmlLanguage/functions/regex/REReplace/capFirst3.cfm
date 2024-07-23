<cffunction name="CapFirstRay" returntype="string" output="false">
	<cfargument name="str" type="string" required="true" />

	<cfset var newstr = "" />
	<cfset var word = "" />
	<cfset var separator = "" />

	<cfloop index="word" list="#arguments.str#" delimiters=" ">
		<cfset newstr = newstr & separator & UCase(left(word,1)) />
		<cfif len(word) gt 1>
			<cfset newstr = newstr & right(word,len(word)-1) />
		</cfif>
		<cfset separator = " " />
	</cfloop>

	<cfreturn newstr />
</cffunction>


<cffunction name="capFirst" returntype="string" output="false">
	<cfargument name="string" required="true" hint="String to capitalise">
	<cfreturn reReplace(arguments.string, "(^\b|[^\w'])(\w)", "\1\u\2", "all")>
</cffunction>

<cfscript>
	testStr = "this is a test sentence,it has punctuation and it's also got a couple of apostrophe's (sic).the function should cap-first all words,i hope.plural numbers like 2s and 3s seem to work,too,for some reason.it,however,preserves wholly CAPITALISED word(s)";
	writeOutput(testStr & "<br /><hr />");
	writeOutput("Ray: " & capFirstRay(testStr) & "<br /><hr />");
	writeOutput("Me : " & capFirst(testStr) & "<br /><hr />");
</cfscript>
