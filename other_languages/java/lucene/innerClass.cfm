<cfscript>
	oIndex	= createobject("java","org.apache.lucene.document.Field$Index");
	oIndexNo		= oIndex.NO;
	oIndexTokenised = oIndex.TOKENIZED;
	oStoreNo = createobject("java","org.apache.lucene.document.Field$Store").NO;
</cfscript>

<cfdump var="#oIndexNo#"> <!--- works fine --->

<cfdump var="#oStoreNo#"> <!--- works fine --->


<cfset oDoc = createObject("java", "org.apache.lucene.document.Document").init()>
<cfset oField = createObject("java", "org.apache.lucene.document.Field")>

<cfset oDoc.add(oField.init("id", 1, oStoreNo, oIndexTokenised))>