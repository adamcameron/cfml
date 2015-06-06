<cffunction name="uCaseWordsForSolr" access="public" output="false" returntype="Any" >
    <cfargument name="string" type="string" default="" required="true" hint="String to run against" />
    <cfargument name="listOfWords" type="string" default="AND,OR,NOT,TO" required="false" hint="Comma-delim list of words to uCase" />

    <cfset var sLocal = StructNew() />

    <cfset sLocal.newString = lcase(arguments.string) /> <!--- lcase by default. mixed-case treated as case-sensitive by Solr --->
    <cfset sLocal.i = "" />

    <cfloop list="#arguments.listOfWords#" index="sLocal.i">

        <cfset sLocal.newString = reReplaceNoCase(sLocal.newString, "([^a-z])(#sLocal.i#)([^a-z])", "\1#ucase(sLocal.i)#\3", "all")/>

    </cfloop>

    <cfreturn sLocal.newString />
</cffunction>

<cfscript>
string function solrClean(required string input){
	var cleanText = trim(arguments.input);
	// List of bad charecters. "+ - && || ! ( ) { } [ ] ^ " ~ * ? : \" 
	// http://lucene.apache.org/core/3_6_0/queryparsersyntax.html#Escaping Special Characters
	var reBadChars = "\+|-|&&|\|\||!|\(|\)|{|}|\[|\]|\^|\""|\~|\*|\?|\:|\\";
	
	// Replace comma with OR
	cleanText = replace(cleanText, "," , " or " , "all");

	// Strip bad characters
	cleanText = reReplace(cleanText, reBadChars, " ", "all");

	// Clean up sequences of space characters
	cleanText = reReplace(cleanText, "\s+", " ", "all");

    // clean up wildcard characters as first characters
    cleanText = reReplace(cleanText, "(^[\*\?]{1,})", "");

	// uCaseWords - and=AND, etc - lcase rest. if keyword is mixed case - solr treats as case-sensitive!
	cleanText = uCaseWordsForSolr(cleanText);
	return trim(cleanText);
}
</cfscript>

<cfoutput>
	#solrClean("aaa+ - && || ! ( ) { } [ ] ^ "" ~ * ? : \bbb")#
</cfoutput>