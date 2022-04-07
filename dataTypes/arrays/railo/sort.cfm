<cfprocessingdirective pageencoding="UTF-8">
<cfscript>
frenchLetters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","é","à","è","ù","â","ê","î","ô","û","ë","ï","ü","ÿ","ç"];
frenchLetters.sort("text", "asc");
writeDump(frenchLetters);
</cfscript>