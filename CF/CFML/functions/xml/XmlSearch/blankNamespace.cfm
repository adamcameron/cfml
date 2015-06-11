<cfxml variable="x">
    <aaa xmlns="http://localhost/">
        <bbb>
            <ccc>ddd</ccc>
        </bbb>
    </aaa>
</cfxml>
<cfset a = xmlSearch(x, "/:aaa/:bbb/:ccc")>

<cfdump var="#variables#">