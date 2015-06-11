<cfxml variable="x">
	<aaa>
		<bbb ccc="ddd">eee</bbb>
	</aaa>
</cfxml>

<cfif x eq toString(x)>
	Yup
<cfelse>
	Nup
</cfif>