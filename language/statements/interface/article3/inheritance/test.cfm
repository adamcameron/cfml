<cfprocessingdirective pageencoding="utf-8">
<cfscript>
	months = ["Kohi-tatea","Hui-tanguru","Poutu-te-rangi","Paenga-whawha","Haratua","Pipiri","Hongongoi","Here-turi-koka","Mahuru","Whiringa-a-nuku","Whiringa-a-rangi","Hakihea"];
	monthCollection = new ArrayCollection(months);
	
	unorderedList = new UnorderedList(monthCollection);
	writeOutput(unorderedList.toList());
</cfscript>