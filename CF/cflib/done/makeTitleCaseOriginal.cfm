<cfscript>
	myStr = "there is an angry monkey in my closet!";
	writeOutput("String before passed to function - " & myStr);
	writeOutput("String after passed to function - " & makeTitleCase(myStr));
	
</cfscript>

<cffunction name="makeTitleCase" access="public" returntype="string" output="no">
	<cfargument name="str" type="string" required="yes"/>
    <cfargument name="excludeList" type="string" required="no" default="is,an,the,at,by,for,of,in,up,on,to,and,as,but,if,or,nor,a"/>

    <cfscript>
    	var i = 1;
    	var wordArray = "";
    
		if(arguments.str.trim().length() EQ 0) {
			return arguments.str;	
		}
		wordArray = listToArray(arguments.str," ");
		for(i=1;i<=arrayLen(wordArray);i++) {
			if(not listfindnocase(arguments.excludeList,wordArray[i])) {
				wordArray[i] = wordArray[i].substring(0, 1).toUpperCase() &  wordArray[i].substring(1);	
			}
		}
	
    </cfscript>
    <cfreturn arrayToList(wordArray," ")/>
</cffunction>
