<cfset s="First Line
Second Line
Third Line
">

<cfset st = reFind(".*", s, 1, true)>

<cfdump var="#st#">

<cfoutput>#mid(s, st.pos[1], st.len[1])#</cfoutput>