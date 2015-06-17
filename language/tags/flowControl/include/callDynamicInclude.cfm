<cfscript>
    sPrefix = "inc";
   
    include "#sPrefix#dynamicInclude.cfm" runonce="true";        // works fine
   
    sPath = sPrefix & "dynamicInclude.cfm";    // works fine
    include sPath runonce="true";

    include sPrefix & "dynamicInclude.cfm" runonce="true";    // parser error
</cfscript>