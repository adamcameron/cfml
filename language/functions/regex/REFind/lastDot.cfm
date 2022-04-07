<cfscript>
	function preserveLastDot(str){
		var lastDotMatch = reFind("\.[^\.]*$", arguments.str);	// ie: the LAST ($) sequence of dot-followed-by-anything-that's-not-dots
		var firstBit = "";
		var lastBit	= "";
		if (lastDotMatch){
			firstBit = replace(left(arguments.str, lastDotMatch), ".", "", "ALL");	// get rid of all the leading dots before the last dot
			if (lastDotMatch neq len(arguments.str))	lastBit = right(arguments.str, len(arguments.str)-lastDotMatch);	// right() doesn't work with a length arg of zero, so make sure it's not
			return firstBit & "." & lastBit;
		}else{
			return arguments.str;
		}
		
	}

	writeOutput(preserveLastDot("here.is.a.dotty.string.i.only.want.the.last.dot.to.be.preserved") & "<br />");
	writeOutput(preserveLastDot("this.dotty.string.ends.with.a.dot.") & "<br />");
	writeOutput(preserveLastDot("this string has not dots at all") & "<br />");
	writeOutput("[" & preserveLastDot("") & "]<br />");
</cfscript>