<cfset st.list = "red,green,blue,apples are red,trees are green,the sky is blue,bananas are yellow">
<cfset st.array = listToArray(st.list)>
<cfdump var="#st#">
<cfoutput>
	listFind(st.list, "green"): [#listFind(st.list, "green")#]<br />
	listContains(st.list, "green"): [#listContains(st.list, "green")#]<br />

	arrayFind(st.array, "green"): [#arrayFind(st.array, "green")#]<br />
	arrayContains(st.array, "green"): [#arrayContains(st.array, "green")#]<br />
	<hr />
	listFind(st.list, "yellow"): [#listFind(st.list, "yellow")#]<br />
	listContains(st.list, "yellow"): [#listContains(st.list, "yellow")#]<br />

	arrayFind(st.array, "yellow"): [#arrayFind(st.array, "yellow")#]<br />
	arrayContains(st.array, "yellow"): [#arrayContains(st.array, "yellow")#]<br />
</cfoutput>
