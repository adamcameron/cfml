<cftry>
    <cfdump var="#getSafeHTML('|<?ai aaa')#">
    <cfcatch>
        <cfdump var="#cfcatch#">
    </cfcatch>
</cftry>
