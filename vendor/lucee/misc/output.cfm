<cffunction name="f">
    [#arguments.x#]
</cffunction>

<cffunction name="g" output="true">
    [#arguments.x#]
</cffunction>

<cffunction name="h" output="false">
    [arguments.x#]
</cffunction>


<cfscript>
    f(x=1)
    g(x=2)
    h(x=3)

</cfscript>
