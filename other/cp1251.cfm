<cfquery name="q" datasource="test1251">
	select		rsn_id, rsn_text
	from		tbl_russian
	order by	rsn_id
</cfquery>
<cfoutput query="q">
[#rsn_id#][#rsn_text#]<br />
</cfoutput>