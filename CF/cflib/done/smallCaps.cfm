<cffunction name="smallCaps" returntype="string" access="public" output="false" description="Styles and returns text.">
	<cfargument name="inputText" type="string" required="true">
	<cfargument name="largerClassName" type="string" required="false" default="SCLarger">
	<cfset inputText = ucase(trim(inputText))>
	<cfset var prefixText = '<span class="#largerClassName#">'>
	<cfset var suffixtext = '</span>'>
	<cfset var outputText = prefixText><!--- ALWAYS START WITH A LARGE LETTER--->
	<cfset var insertSuffixAfterNextChar = true><!--- THIS WILL TELLS OUR LOOP WHEN TO INSERT THE SUFFIXTEXT--->
	<cfset var i = 0>
		
	<!--- WE'RE GOING LOOP THROUGH AND WRAP THE FIRST LETTER OF EACH WORD IN A SPAN CLASS BLOCK---->
	<cfloop from="1" to="#len(inputText)#" index="i">
		<cfset var currentChar = Mid(inputText,i,1)>
		<cfset outputText = outputText & currentChar>
		<cfif insertSuffixAfterNextChar>
        	<cfset outputText = outputText & SuffixText>
        	<cfset insertSuffixAfterNextChar = false><!---NOT TO INSERT THE SUFFIXTEXT NEXT TIME--->
        </cfif>	
		<cfif currentChar EQ " ">
			<cfset outputText = outputText & prefixText><!--- ALWAYS ADD THE PREFIXTEXT AFTER A SPACE--->
			<cfset insertSuffixAfterNextChar = true><!--- THIS WILL TELLS OUR LOOP TO INSERT THE SUFFIXTEXT--->
		</cfif>
    </cfloop>	
	<cfreturn outputText>
</cffunction>

<cfset TextToConvert = "Title of a Book">
<cfdocument format="PDF" filename="#expandPath('./smallCaps.pdf')#" overwrite="true">
<cfoutput>
<html>
	<head>
		<style type="text/css" media="screen">
			.SmallCaps{font-size:24pt;}
			.SmallCaps .SCLarger{font-size:36pt;}
		</style>
	</head>
	<body>
		<div class="SmallCaps">#SmallCaps(TextToConvert)#</div>
		
		<div style="font-variant:small-caps">#TextToConvert#</div>
	</body>
</html>
</cfoutput>
</cfdocument>