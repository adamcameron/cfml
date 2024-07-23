<cfoutput>
<div style="font-family: 'courier new', sans-serif; font-size: small;">
<cfloop index="i" from="1" to="10">
[#insert("-", createUuid(), 23)#] [#createUuid()#]<br />
</cfloop>
</div>
</cfoutput>