<cfset o = createObject("component", "c")>
<cfoutput>
	#o.f()#<br />
	<cftry>
		#o.f()#<br />
		<cfcatch>
			<cfdump var="#o#" label="It doesn't work because you've overwritten the function f() with the string 'fubar'">
		</cfcatch>
	</cftry>
	<hr />
	#o.g()#<br />
	<cfset o.g = "more fubar">
	<cftry>
		#o.g()#<br />
		<cfcatch>
			<cfdump var="#o#" label="It doesn't work because you've overwritten the function g() with the string 'more fubar'">
		</cfcatch>
	</cftry>
</cfoutput>
