<cfscript>
function f(){                              writeOutput("Top: arguments: #arguments.foo#; unscoped: #foo#<br>");
    foo        = "unscoped";               writeOutput("After unscoped: arguments: #arguments.foo#; unscoped: #foo#<br>");
    //var foo    = "var";                    writeOutput("After var: arguments: #arguments.foo#; unscoped: #foo#<br>");
    return {arguments=arguments,foo=foo};
}

result = f(foo="arg");
writeDump(var=result);
</cfscript>


