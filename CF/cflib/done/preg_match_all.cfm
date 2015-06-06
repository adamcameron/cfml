<cfflush interval="16">
<cfscript>
/**
 * Emulates the preg_match_all function in PHP for returning all regex matches along with their backreferences.
 * 
 * @param regex 	 Regular expression. (Required)
 * @param str 	 String to search. (Required)
 * @return Returns an array. 
 * @author Aaron Eisenberger (&#97;&#97;&#114;&#111;&#110;&#64;&#120;&#45;&#99;&#108;&#111;&#116;&#104;&#105;&#110;&#103;&#46;&#99;&#111;&#109;) 
 * @version 1, February 15, 2004 
 */
function preg_match_all(regex,str) {
	var results = arraynew(2);
	var pos = 1;
	var loop = 1;
	var match = "";
	var x= 1;
	
	while (REFind(regex, str, pos)) { 
		match = REFind(regex, str, pos, TRUE); 
		for (x = 1; x lte arrayLen(match.pos); x = x + 1) {
			if(match.len[x])
				results[x][loop] = mid(str, match.pos[x], match.len[x]);
			else
				results[x][loop] = '';
		}
		pos = match.pos[1] + match.len[1];
		loop = loop + 1;
	}
	return results;
}

s = "this is a string that has words of differing lengths, and I'm gonna regex it to return the words of a given length";
r = "\b(?:(\w{5})|(\w{6}))\b";


a1preg_match_all = preg_match_all(r, s);
a2reMatch = reMatch(r, s);
a3reFind = reFind(r, s, 1, true);
a4reFindAll = reFindAll(r, s);
a5stringFind = stringFind(r, s);
writeDump(variables);

</cfscript>

<!---
 Finds all occurences of a regex in a string.
 
 @param regExpression 	 The regular expression to test with (Required)
 @param string 	 String to search. (Required)
 @param start 	 Starting position. Defaults to 1. (Optional)
 @param caseSensitive 	 Whether or not to use case sensitive matching.  Defaults to false. (Optional)
 @return Returns an array of structs. 
 @author Raymond Selzer (&#114;&#97;&#121;&#109;&#111;&#110;&#100;&#64;&#107;&#105;&#110;&#103;&#99;&#111;&#109;&#109;&#101;&#100;&#105;&#97;&#46;&#99;&#111;&#109;) 
 @version 1, October 11, 2011 
--->
<cffunction name="reFindAll" output="yes" returntype="array">
	<cfargument name="regExpression" type="string" required="yes">
    <cfargument name="string" type="string" required="yes">
    <cfargument name="start" type="numeric" required="no" default="1">
    <cfargument name="caseSensitive" type="boolean" required="no" default="false">
    
    <cfset var result = arrayNew(1)>
    <cfset var matches = ''>
    
    <cfif caseSensitive>
    	<cfset matches = refind(regExpression,string,start,true)>
    <cfelse>
    	<cfset matches = refindnocase(regExpression,string,start,true)>
    </cfif>
    
    <cfloop condition="#matches.len[1]# neq 0">
    	
        <cfset result[arraylen(result) + 1] = matches> 
        <cfset start = matches.pos[1] + matches.len[1]>
        
        <cfif caseSensitive>
			<cfset matches = refind(regExpression,string,start,true)>
        <cfelse>
            <cfset matches = refindnocase(regExpression,string,start,true)>
        </cfif>
        
    </cfloop>
    
    <cfreturn result>
</cffunction>

<cfscript>
	array function stringFind(required string regex, required string string, numeric start=1, boolean all=false, boolean caseSensitive=false){
		var result	= [];
		var matches	= [];
		var i		= 0;
		var match	= "";
		
		if (caseSensitive){
			finder = function(regex, string, start){
				return reFindNoCase(regex, string, start, true);
			};
		}else{
			finder = function(regex, string, start){
				return reFind(regex, string, start, true);
			};
		}
		
		do {
			matches = finder(regex, string, start);
			if (matches.pos[1]){
				matches.string = [];
				for (i=1; i <= arrayLen(matches.pos); i++){
					if (matches.len[i]){
						match = mid(string, matches.pos[i], matches.len[i]);
					}else{
						match = "";
					}
					arrayAppend(matches.string, match);
				}
				arrayAppend(result, matches);
				if (!all){
					break;
				}
			}
			start = matches.pos[1] + matches.len[1];
		} while(matches.pos[1]);
		return result;
	}
</cfscript>

