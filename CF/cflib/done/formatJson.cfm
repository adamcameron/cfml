<cfscript>
// formatJSON() :: formats and indents JSON string
// based on blog post @ http://ketanjetty.com/coldfusion/javascript/format-json/
// modified for CFScript By Ben Koshy @animexcom
// usage: result = formatJSON('STRING TO BE FORMATTED') OR result = formatJSON(StringVariableToFormat);

public string function formatJSON(str) {
	var fjson = '';
    var pos = 0;
    var strLen = len(arguments.str);
	var indentStr = chr(9); // Adjust Indent Token If you Like
    var newLine = chr(10); // Adjust New Line Token If you Like <BR>
	
	for (var i=1; i<strLen; i++) {
		var char = mid(arguments.str,i,1);
		
		if (char == '}' || char == ']') {
			fjson &= newLine;
			pos = pos - 1;
			
			for (var j=1; j<pos; j++) {
				fjson &= indentStr;
			}
		}
		
		fjson &= char;	
		
		if (char == '{' || char == '[' || char == ',') {
			fjson &= newLine;
			
			if (char == '{' || char == '[') {
				pos = pos + 1;
			}
			
			for (var k=1; k<pos; k++) {
				fjson &= indentStr;
			}
		}
	}
	
	return fjson;
}	
</cfscript>

<cfdirectory action="list" directory="#expandPath('./done/')#" name="files">

<pre>
<cfoutput>#formatJSON(serializeJSON(files))#</cfoutput>
</pre>