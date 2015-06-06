<cfset oCv = createObject("java", "ClassViewer")>

<cfset st = structnew()>

<cfxml variable="st.x1">
	<base>
		<middle>
			<inner id="foo">bar</inner>
		</middle>
	</base>
</cfxml>

<cfxml variable="st.x2">
	<base>
		<middle>
			<inner id="foo">bar</inner>
		</middle>
	</base>
</cfxml>

<cfxml variable="st.x3">
	<base>
		<middle>
			<INNER id="bar">foo</INNER>
		</middle>
	</base>
</cfxml>

<cfset st.x4 = st.x1>

<cfoutput>
	st.x1.equals(st.x1): [#st.x1.equals(st.x1)#]<br />
	st.x1.equals(st.x2): [#st.x1.equals(st.x2)#]<br />
	st.x1.equals(st.x3): [#st.x1.equals(st.x3)#]<br />
	st.x1.equals(st.x4): [#st.x1.equals(st.x4)#]<br />
	<br />
	st.x1 eq st.x1: [#st.x1 eq st.x1#]<br />
	st.x1 eq st.x2: [#st.x1 eq st.x2#]<br />
	st.x1 eq st.x3: [#st.x1 eq st.x3#]<br />
	st.x1 eq st.x4: [#st.x1 eq st.x4#]<br />
	<br />
	compare(st.x1, st.x1): [#compare(st.x1, st.x1)#]<br />
	compare(st.x1, st.x2): [#compare(st.x1, st.x2)#]<br />
	compare(st.x1, st.x3): [#compare(st.x1, st.x3)#]<br />
	compare(st.x1, st.x4): [#compare(st.x1, st.x4)#]<br />
</cfoutput>
<cfdump var="#st#" expand="false">

<pre>
<cfoutput>#oCv.viewObject(st.x1)#</cfoutput>
</pre>
