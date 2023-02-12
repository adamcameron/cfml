<cfscript>
    metadata = getApplicationMetadata()
    writeDump([
        localMode = metadata?.localMode,
        nullSupport = metadata?.nullSupport,
        enableNullSupport = metadata?.enableNullSupport,
        scopeCascading = metadata?.scopeCascading,
        searchImplicitScopes = metadata?.searchImplicitScopes
    ])


    function setToNull(){}

    variables.someVar = "Don't ruin it"


    function f() {
        local.someVar = setToNull()

        someVar = "I told you not to ruin it FFS"
    }
    function g() {
        //local.someVar = setToNull()

        someVar = "I told you not to ruin it FFS"
    }

    f()
    writeDump([
        "variables.someVar after f()" = variables.someVar
    ])

    g()
    writeDump([
        "variables.someVar after g()" = variables.someVar
    ])

    </cfscript>
