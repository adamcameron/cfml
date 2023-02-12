<pre>
<cfscript>
metadata = getApplicationMetadata()
writeDump(var=[
    "localMode: " = metadata?.localMode,
    "nullSupport: " = metadata?.nullSupport,
    "enableNullSupport: " = metadata?.enableNullSupport,
    "scopeCascading: " = metadata?.scopeCascading,
    "searchImplicitScopes: " = metadata?.searchImplicitScopes
], format="text")

function setToNull(){}

variables.someVar = "Don't ruin it"

function f() {
    local.someVar = setToNull()

    someVar = "I told you not to ruin it FFS"
}
f()
writeDump(var=[
    "variables.someVar after f(): " = variables.someVar
], format="text")
</cfscript>
