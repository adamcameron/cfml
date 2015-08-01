<cfscript>
	cv = createObject("java", "me.adamcameron.miscellany.ClassViewer");
	xDoc			= xmlNew();
	xDoc.xmlRoot	=  xmlElemNew(xDoc, "base");

	for (i=1; i le 5; i=i+1){
		xDoc.base.xmlChildren[i] = xmlElemNew(xDoc, "firstLevelItem#i#");
		xDoc.base.xmlChildren[i].xmlText = "Level #i#";
		for (j=1; j le 5; j=j+1){
			xDoc.base.xmlChildren[i].xmlChildren[j] = xmlElemNew(xDoc, "secondLevelItem#i#_#j#");
			xDoc.base.xmlChildren[i].xmlChildren[j].xmlText = "Item #j#";
		}
	}

</cfscript>
<cfdump var="#xDoc.getLength()#" label="getLength">
<!--- <cfdump var="#xDoc.base.getFirstNode()#" label="getFirstNode"> --->

<pre>
<cfoutput>#cv.viewObject(xDoc)#</cfoutput>
</pre>

<cfdump var="#xDoc#">
