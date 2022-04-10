<cfscript> 
	// Create the feed data structure and add the metadata. 
	myStruct = StructNew(); 
	mystruct.link = "http://www.domain.com"; 
	myStruct.title = "Title"; 
	mystruct.description = "Desc"; 
	mystruct.pubDate = Now(); 
	mystruct.version = "rss_2.0"; 
	
	/* Add the feed items. A more sophisticated application would use dynamic variables 
	    and support varying numbers of items. */ 
	myStruct.item = ArrayNew(1); 
	myStruct.item[1] = StructNew(); 
	myStruct.item[1].description = StructNew(); 
	myStruct.item[1].description.value = "Item 1 desc"; 
	myStruct.item[1].link = "http://www.domain.com?rss=1"; 
	myStruct.item[1].pubDate = Now(); 
	myStruct.item[1].title = "Item 1 title"; 
	myStruct.item[2] = StructNew(); 
	myStruct.item[2].description = StructNew(); 
	myStruct.item[2].description.value = "Item 2 desc"; 
	myStruct.item[2].link = "http://www.domain.com?rss=2"; 
	myStruct.item[2].pubDate = Now(); 
	myStruct.item[2].title = "Item 2 title"; 

</cfscript> 

<!--- Generate the feed and save it to a file and variable. ---> 
<cffeed action = "create" 
name = "#myStruct#" 
outputFile = "./liveDocs.xml"  
overwrite = "yes" 
xmlVar = "myXML"> 

<cfdump var="#variables#">