<cfscript>
string function highlightKeywords(required string str, required string keywords, struct highlight){
	var keyword		= "";
	var replacement	= "";
	
	param name="highlight.tag"			default="em";
	param name="highlight.attributes"	default="";
	
	for (var index=1; index <= listLen( arguments.keywords ); index++){
		keyword = listGetAt(arguments.keywords, index);
		replacement = "<#highlight.tag#";
		if (len(highlight.attributes)){
			replacement &= " #highlight.attributes#";
		}
		replacement &= ">" & keyword & "</#highlight.tag#>";

		arguments.str = reReplaceNoCase( arguments.str, "\b#keyword#\b", replacement, "all" );
	}
	return arguments.str;
}
</cfscript>

<cfoutput>
<cfset l = "foo">
<cfset s = "foo zfooz foo foo zfoo fooz">
#l#<br />
#s#<br />
#highlightKeywords(s, l)#<br />
<hr />

<cfset l = "foo,bar">
<cfset s = "foo bar zfooz zbarz foo bar foo bar">
#l#<br />
#s#<br />
#highlightKeywords(s, l, {tag="span", attributes='style="color:red;"'})#<br />
<hr />

<cfset s = "fooz bar zfooz zbarz foo bar foo zbar">
#l#<br />
#s#<br />
#highlightKeywords(s, l, {tag="strong"})#<br />
<hr />
</cfoutput>