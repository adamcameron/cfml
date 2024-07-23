<!--- The following example analyzes the salary data in the cfdocexamples
database and generates a bar chart showing average salary by department. --->

<!--- Get the raw data from the database. --->
<cfquery name="GetSalaries" datasource="cfdocexamples">
    SELECT Departmt.Dept_Name, 
        Employee.Dept_ID, 
        Employee.Salary
    FROM Departmt, Employee
    WHERE Departmt.Dept_ID = Employee.Dept_ID
</cfquery>

<!--- Use a query of queries to generate a new query with --->
<!--- statistical data for each department. --->
<!--- AVG and SUM calculate statistics. --->
<!--- GROUP BY generates results for each department. --->
<cfquery dbtype = "query" name = "DataTable">
SELECT 
Dept_Name,
AVG(Salary) AS avgSal,
SUM(Salary) AS sumSal,
Dept_name + ' ('+ cast(AVG(Salary) as varchar) + ')' AS deptAvg

FROM GetSalaries
GROUP BY Dept_Name
</cfquery>

<!--- Reformat the generated numbers to show only thousands. --->
<cfloop index = "i" from = "1" to = "#DataTable.RecordCount#">
	<cfset DataTable.sumSal[i] = Round(DataTable.sumSal[i]/1000)*1000>
	<cfset DataTable.avgSal[i] = Round(DataTable.avgSal[i]/1000)*1000>
</cfloop>

<h1>Employee Salary Analysis</h1> 
<!--- Bar graph, from Query of Queries --->
<cfchart format="flash" xaxistitle="Department" yaxistitle="Salary Average"> 
	<cfchartseries type="bar" query="DataTable"	itemcolumn="deptAvg" valuecolumn="avgSal" />
</cfchart>
<hr />
<cfchart format="flash" xaxistitle="Department" yaxistitle="Salary Average"> 
	<cfchartseries type="bar">
		<cfloop query="DataTable">
			<cfset sLabel = "#Dept_name# (#avgSal#)">
			<cfchartdata item="#sLabel#" value="#avgSal#">
		</cfloop>
	</cfchartseries>
</cfchart>
