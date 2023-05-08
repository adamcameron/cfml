<cfset sTagName			= 'index status="stStatus"'>
<cfset lAttribs2Process = "title,body,category,categoryTree">
<cfset lAttribs2Output	= "collection,action,type,key,extensions,recurse,language,custom1,custom2,custom3,custom4,query">

<!---
<cfset lAttribs2Process = "title,category,categoryTree,urlPath,prefix">
<cfset lAttribs2Output	= "collection,action,type,key,extensions,recurse,language,custom1,custom2,custom3,custom4">
 --->
<pre>
<cfoutput>#htmlEditFormat(generateStatements(tagName=sTagName, conditionalList=lAttribs2Process, outputList=lAttribs2Output))#</cfoutput>
</pre>


<cffunction name="generateStatements" returntype="string" output="false" hint="Recursively builds attribute conditional statements">#
	<cfargument name="tagName"			type="string" required="true"				hint="Tag to build statements for.">
	<cfargument name="conditionalList"	type="string" required="true"				hint="List of conditional attributes to test for.">
	<cfargument name="outputList"		type="string" required="true"				hint="List of attributes to output.">
	<cfargument name="indentLevel"		type="string" required="false"	default="0"	hint="Tabs to indent tags with.">

	<cfscript>
		var sReturn		= "";
		var sAttribute	= "";
		var sTab		= chr(9);
		var sCrLf		= chr(13) & chr(10);
		var sIndent		= repeatString(sTab, arguments.indentLevel);
		var i			= 0;

		if (listLen(arguments.conditionalList)){
			// we need to output a conditional for the first attribute on the conditionalList, and then recurse on the rest
			sAttribute = listFirst(arguments.conditionalList);
			sReturn	= sIndent & "<" & 'cfif structKeyExists(arguments, "#sAttribute#")>#sCrLf#';

			sReturn	= sReturn & generateStatements(
				tagName			= arguments.tagName,
				conditionalList	= listRest(arguments.conditionalList),
				outputList		= listAppend(arguments.outputList, sAttribute),	// this attribute DOES exist, so pass it with the ones to outputList
				indentLevel		= arguments.indentLevel + 1
			);
			sReturn	= sReturn & "#sIndent#<" & "cfelse><" & "!--- #sAttribute# doesn't exist --->#sCrLf#";

			sReturn	= sReturn & generateStatements(
				tagName			= arguments.tagName,
				conditionalList	= listRest(arguments.conditionalList),
				outputList		= arguments.outputList,				// this argument DOESN'T exist, so do NOT pass it with the outputList
				indentLevel		= arguments.indentLevel + 1
			);
			sReturn	= sReturn & "#sIndent#<" & "/cfif><" & "!--- end of whether #sAttribute# exists --->#sCrLf#";

		}else{
			// we're at the end of the line: output the tag
			sReturn =  "#sIndent#<cf" & arguments.tagName;
			for (i=1; i le listLen(arguments.outputList); i=i+1){
				sAttribute = listGetAt(arguments.outputList, i);
				sReturn = sReturn & ' #sAttribute#="##arguments.#sAttribute###"';
			}
			sReturn = sReturn & ">#sCrLf#";
		}
		return sReturn;
	</cfscript>
</cffunction>