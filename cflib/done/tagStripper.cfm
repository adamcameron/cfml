<cfsavecontent variable="code">
	<!doctype html>
    <html lang="en">
    <head>
    <meta charset="utf-8">
    <title></title>
    </head>
    <body>
    	<h1>Heading</h1>
		<div id="main">
			<p>
				<h2>Images</h2>
		    	<img src="slash.png" alt="With a slash" />
		    	<img src="noslash.png" alt="Without a slash">
			</p>
		</div>
		<script>

		</script>
		<styles>

		</styles>
    </body>
    </html>
</cfsavecontent>
<cfscript>
/**
 * Function to strip HTML tags, with options to preserve certain tags.
 * v2 by Ray Camden, fix to closing tag
 *
 * @param str 	 String to manipulate. (Required)
 * @param action 	 Strip or preserve. Default is strip. (Optional)
 * @param tagList 	 Tags to strip or perserve. (Optional)
 * @return Returns a string.
 * @author Rick Root (&#114;&#105;&#99;&#107;&#64;&#119;&#101;&#98;&#119;&#111;&#114;&#107;&#115;&#108;&#108;&#99;&#46;&#99;&#111;&#109;)
 * @version 2, July 2, 2008
 */
function tagStripper(str) {
	var i = 1;
	var action = 'strip';
	var tagList = '';
	var tag = '';

	if (ArrayLen(arguments) gt 1 and lcase(arguments[2]) eq 'preserve') {
		action = 'preserve';
	}
	if (ArrayLen(arguments) gt 2) tagList = arguments[3];

	if (trim(lcase(action)) eq "preserve") {
		// strip only those tags in the tagList argument
		for (i=1;i lte listlen(tagList); i = i + 1) {
			tag = listGetAt(tagList,i);
			str = REReplaceNoCase(str,"</?#tag#.*?>","","ALL");
		}
	} else {
		// strip all, except those in the tagList argument
		// if there are exclusions, mark them with NOSTRIP
		if (tagList neq "") {
			for (i=1;i lte listlen(tagList); i = i + 1) {
				tag = listGetAt(tagList,i);
				str = REReplaceNoCase(str,"<(/?#tag#.*?)>","___TEMP___NOSTRIP___\1___TEMP___ENDNOSTRIP___","ALL");
			}
		}
		// strip all remaining tsgs.  This does NOT strip comments
		str = reReplaceNoCase(str,"</{0,1}[A-Z].*?>","","ALL");
		// convert unstripped back to normal
		str = replace(str,"___TEMP___NOSTRIP___","<","ALL");
		str = replace(str,"___TEMP___ENDNOSTRIP___",">","ALL");
	}

	return str;
}

stripped = tagStripper(code,"strip","p,b,h1,h2,h3,h4,h5,h6,i,em,strong,a,table,thead,tbody,tr,td,th,li,ol,ul,strike,code,pre,blockquote");
</cfscript>
<cfdump var="#variables#">
