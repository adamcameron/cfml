<cfflush interval="16">
<cfscript>
	param name="url.count" default=10;

	// variables.parsedXML.XMLrootElement.XMLChildElement[variables.i].id.xmlText
	variables.parsedXML = {
		XMLrootElement = {
			XMLChildElement = []
		}
	};
	
	for (i=1; i <= url.count; i++){
		id = {
			xmlText = "xmlText #i#"
		};
		variables.parsedXML.XMLrootElement.XMLChildElement[i] = {
			id = id
		};
	}
//	writeDump(variables.parsedXML);
</cfscript>
Long version:<br />
<cfsilent>
<cfscript>	
	iStart = getTickCount();
	for (i=1; i <= url.count; i++){
		writeOutput(variables.parsedXML.XMLrootElement.XMLChildElement[i].id.xmlText & "<br />");
	}
</cfscript>	
</cfsilent>
<cfoutput>Execution time: #getTickCount()-iStart#<br /><hr /></cfoutput>

Short version:<br />
<cfsilent>
<cfscript>	
	iStart = getTickCount();
	a = variables.parsedXML.XMLrootElement.XMLChildElement;
	for (i=1; i <= url.count; i++){
		writeOutput(a[i].id.xmlText & "<br />");
	}
</cfscript>	
</cfsilent>
<cfoutput>Execution time: #getTickCount()-iStart#<br /><hr /></cfoutput>
