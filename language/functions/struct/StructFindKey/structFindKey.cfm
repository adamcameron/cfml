<cfscript>
	st = {
		people = [
			{
				first="Frances",
				second="Allan",
				address={
					street="11 Augustus Tce",
					suburb="parnell"
				}
			},
			{
				first="Adam",
				second="Cameron",
				address={
					street="34 Aldred Road",
					suburb="Remuera"
				}
			}
		]
	};
	a = structFindKey(st, "street", "all");
</cfscript>
<cfdump var="#a#">