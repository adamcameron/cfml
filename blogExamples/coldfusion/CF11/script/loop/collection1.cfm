<cfscript>
numbers={one="tahi",two="rua",three="toru", four="wha"};
cfloop(collection=numbers, item="key"){
	writeOutput("#key#: #numbers[key]#<br>");
}
</cfscript>