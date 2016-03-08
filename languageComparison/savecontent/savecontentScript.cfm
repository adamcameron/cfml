<cfscript>
savecontent variable="content" {
    writeOutput("Some text<br>");
    if (randRange(0,1)){
        result = "value if true";
    }else{
        result = "and if it's false";
    }
    writeOutput("#result#<br>");
    writeOutput("Message from include is:");
    include "./inc.cfm";
}

writeOutput(content);
</cfscript>