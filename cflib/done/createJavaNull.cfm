<cfscript>
function createJavaNull(){
	var vector = CreateObject("java", "java.util.Vector");
	vector.setSize(1);
	return vector.get(0);
}

jNull = createJavaNull();
cfNull = javaCast("null", "");

oComp = createObject("java", "CompareNulls");

</cfscript>

<cfoutput>
	oComp.compare("a", "b"): #oComp.compare("a", "b")#<br />
	oComp.compare("a", javaCast("null", "")): #oComp.compare("a", javaCast("null", ""))#<br />
	oComp.compare(javaCast("null", ""), javaCast("null", "")): #oComp.compare(javaCast("null", ""), javaCast("null", ""))#<br />
	oComp.compare(createJavaNull(), javaCast("null", "")): #oComp.compare(createJavaNull(), javaCast("null", ""))#<br />
</cfoutput>