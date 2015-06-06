<cfscript>
	s = "";
	for (i=1; i le 255; i=i+1){
		s = s & chr(i);
	}

	x = xmlNew();
	x.xmlRoot = xmlElemNew(x, "aaa");
	x.xmlRoot.xmlChildren[1] = xmlElemNew(x, "bbb");
	x.xmlRoot.xmlChildren[2] = xmlElemNew(x, "bbb");

	try{
		x.xmlRoot.xmlChildren[1].xmlText = s;
	} catch (any e){
		writeOutput("Failed: [#e.message#]<br />");
	}

	try{
		x.xmlRoot.xmlChildren[2].xmlText = xmlFormat(s);
	} catch (any e){
		writeOutput("Failed: [#e.message#]<br />");
	}

	s = x.xmlRoot.xmlChildren[1].xmlText;
	for (i=1; i le len(s); i=i+1){
		c = mid(s, i, 1);
		n = asc(c);
		if (n neq i){
			sColour = "red";
		}else{
			sColour = "green";
		}
		writeOutput('<span style="color:#sColour#;">[#i#][#c#][#n#]</span><br />');
	}

	writeOutput("<hr />");

	s = x.xmlRoot.xmlChildren[2].xmlText;
	for (i=1; i le len(s); i=i+1){
		c = mid(s, i, 1);
		n = asc(c);
		if (n neq i){
			sColour = "red";
		}else{
			sColour = "green";
		}
		writeOutput('<span style="color:#sColour#;">[#i#][#c#][#n#]</span><br />');
	}

</cfscript>
<cfdump var="#variables#">

