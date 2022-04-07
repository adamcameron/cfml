<cfset st = evaluate("{COLOURS={[red, green, blue]},PEOPLE={[{LASTNAME={Cameron},FIRSTNAME={Adam}}, {LASTNAME={Doe},FIRSTNAME={Jane}}]}}")>
<cfdump var="#st#">