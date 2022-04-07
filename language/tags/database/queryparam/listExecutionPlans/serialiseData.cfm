<cfquery name="qOut" datasource="mysite">
	select		lor_id, lor_text
	from		tbl_loremipsum
	order by	lor_id
</cfquery>
<cfwddx action="cfml2wddx" input="#qOut#" output="wOut">
<cffile action="write" file="#expandPath('./data.xml')#" output="#wOut#">