<cfscript>
    function log2Screen(string text){
        writeOutput("logged event: " & arguments.text);
    }
    
    
    o = new C(logger=log2Screen);
    
    o.setS(s="foo");
    
    f = o.getLogger();
    
    writeDump(var=variables);
</cfscript>