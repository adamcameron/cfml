<!--- CHILD.CFC --->
<cfcomponent hint="child component" extends="parent">
        <cffunction name="f1">
                <cfreturn "f1 child">
        </cffunction>

        <cfinclude template="inc.cfm">
</cfcomponent>
