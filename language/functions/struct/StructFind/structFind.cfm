<cfset st = structNew()>
<cfset st.key1 = "yep">
<!--- <cfset st.key2 = "nope"> --->

<cfoutput>
structFind(st, "key1"): #structFind(st, "key1")#<br />
st["key1"]: #st["key1"]#<br />

<cftry>
	structFind(st, "key2"): #structFind(st, "key2")#<br />
	<cfcatch>
		Didn't *think* that would work<br />
	</cfcatch>
</cftry>

<cftry>
	st["key2"]: #st["key2"]#<br />
	<cfcatch>
		*Knew* that wouldn't work<br />
	</cfcatch>
</cftry>
</cfoutput>