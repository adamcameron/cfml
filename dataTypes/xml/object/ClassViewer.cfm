<cfscript>
	oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer");
	x			= xmlNew();
	x.xmlRoot	=  xmlElemNew(x, "base");

	for (i=1; i le 5; i=i+1){
		x.base.xmlChildren[i] = xmlElemNew(x, "firstLevelItem#i#");
		x.base.xmlChildren[i].xmlText = "Level #i#";
		for (j=1; j le 5; j=j+1){
			x.base.xmlChildren[i].xmlChildren[j] = xmlElemNew(x, "secondLevelItem#i#_#j#");
			x.base.xmlChildren[i].xmlChildren[j].xmlText = "Item #j#";
		}
	}

</cfscript>
<pre>
<cfoutput>#oCv.viewObject(x)#</cfoutput>
</pre>

<cfdump var="#x#">
