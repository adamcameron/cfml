Tags<br>
<cffunction name="f1">
    [#arguments.x#]
</cffunction>

<cffunction name="g1" output="true">
    [#arguments.x#]
</cffunction>

<cffunction name="h1" output="false">
    [arguments.x#]
</cffunction>

<cffunction name="i1">
    <cfoutput>
        <cfscript>
            ```
                [#arguments.x#]
            ```
        </cfscript>
    </cfoutput>
</cffunction>


<cfset f1(x=1)>
<cfset g1(x=2)>
<cfset h1(x=3)>
<cfset i1(x=4)>
<hr>

Script<br>
<cfscript>
function f2(x){
    ```
    [#arguments.x#]
    ```
}
function g2(x) output=true {
    ```
    [#arguments.x#]
    ```
}
function h2(x) output=false {
    ```
    [#arguments.x#]
    ```
}
f2(x=1)
g2(x=2)
h2(x=3)
</cfscript>
