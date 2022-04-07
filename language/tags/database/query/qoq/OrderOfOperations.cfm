<!--- Create a virtual query to hold the data ---> <cfset q = querynew("EmpName,salary,taxes,medicare,ira")>
<cfset queryAddRow(q)>
<cfset querySetCell(q,"EmpName","Shlomy")>
<cfset querySetCell(q,"salary","97")>
<cfset querySetCell(q,"taxes","13")>
<cfset querySetCell(q,"medicare","7")>
<cfset querySetCell(q,"ira","11")>
<cfset queryAddRow(q)>
<cfset querySetCell(q,"EmpName","David")>
<cfset querySetCell(q,"salary","97")>
<cfset querySetCell(q,"taxes","13")>
<cfset querySetCell(q,"medicare","7")>
<cfset querySetCell(q,"ira","11")>

<!--- dump original data --->
<cfdump var="#q#" label="original data">

<!--- miscalculation when simply using minus --->
<cfquery name="qofq" dbtype="query">
select sum(salary)-sum(taxes)-sum(medicare)-sum(ira) as TotalPayable from q
</cfquery>
<cfdump var="#qofq#" label="select sum(salary)-sum(taxes)-sum(medicare)-sum(ira) as TotalPayable from q">

<cfquery name="qofq" dbtype="query">
select	((sum(salary) - sum(taxes)) - sum(medicare)) - sum(ira) as TotalPayable from q
</cfquery>
<cfdump var="#qofq#" label="select ((sum(salary) - sum(taxes)) - sum(medicare)) - sum(ira) as TotalPayable from q">
