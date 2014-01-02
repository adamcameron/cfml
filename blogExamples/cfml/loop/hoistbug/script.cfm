<cfscript>
// script.cfm
function test() output=true {
	var colours = ["whero","karaka","kowhai","kakariki","kikorangi","tawatawa","mawhero"];

	writeOutput("#serializeJson(colours)#<br>");

	for (colour in colours){
		writeOutput("#colour#<br>");
	}

	var colour = "";
}

test();
</cfscript>
