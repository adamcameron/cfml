<cfset data1 =  [ [432,32,"Jan-16"], [323,21,"Feb-16"], [543,54,"Mar-16"], [423,32,"Apr-16"], [554,53,"May-16"], [121,66,"Jun-16"], [764,76,"Jul-16"], [662,65,"Aug-16"], [217,23,"Sep-16"], [887,89,"Oct-16"], [1476,121,"Nov-16"], [1098,104,"Dec-16"]]>
<cfset data2 =  [ [54,3,"Jan-16"], [32,2,"Feb-16"], [12,5,"Mar-16"], [76,3,"Apr-16"], [54,5,"May-16"], [32,6,"Jun-16"], [87,7,"Jul-16"], [43,6,"Aug-16"], [5,2,"Sep-16"], [43,8,"Oct-16"], [32,12,"Nov-16"], [4,10,"Dec-16"]]>
<cfset data3 =  [ [321,122,"Jan-16"], [432,131,"Feb-16"], [263,124,"Mar-16"], [143,142,"Apr-16"], [563,153,"May-16"], [633,216,"Jun-16"], [222,126,"Jul-16"], [244,115,"Aug-16"], [577,93,"Sep-16"], [353,59,"Oct-16"], [553,181,"Nov-16"], [423,154,"Dec-16"]]>
<cfset data4 =  [ [53,6,"Jan-16"], [42,1,"Feb-16"], [12,27,"Mar-16"], [4,9,"Apr-16"], [63,12,"May-16"], [32,16,"Jun-16"], [12,17,"Jul-16"], [54,5,"Aug-16"], [23,2,"Sep-16"], [43,18,"Oct-16"], [12,28,"Nov-16"], [8,19,"Dec-16"]]>

<!--- Create queries from arrays --->
<cfset query1 = queryNew("howmany,totalcost,unitDate", "integer,integer,varchar", data1)>
<cfset query2 = queryNew("howmany,totalcost,unitDate", "integer,integer,varchar", data2)>
<cfset query3 = queryNew("howmany,totalcost,unitDate", "integer,integer,varchar", data3)>
<cfset query4 = queryNew("howmany,totalcost,unitDate", "integer,integer,varchar", data4)>
<cfchart chartwidth="500" chartheight="350" format="png" xAxisTitle="Month" yAxisTitle="Messages sent"  title="Chart 1" showxgridlines="yes" showygridlines="yes" show3d="yes" seriesplacement="stacked" showlegend="yes" tooltip="#{"text": "%kv<br> %v by %t" }#" plot="#{"border-width":1, "border-color":"black", "bar-width":14, "bar-space":10, "thousands-separator":"," }#" >
	<cfchartseries query="query1" itemcolumn="unitDate" valuecolumn="howmany" serieslabel="Email" type="bar" seriescolor="green" />
	<cfchartseries query="query2" itemcolumn="unitDate" valuecolumn="howmany" serieslabel="Phone" type="bar" seriescolor="blue" />
	<cfchartseries query="query3" itemcolumn="unitDate" valuecolumn="howmany" serieslabel="SMS" type="bar" seriescolor="##ddcc00" />
	<cfchartseries query="query4" itemcolumn="unitDate" valuecolumn="howmany" serieslabel="Fax" type="bar" seriescolor="red"  />
</cfchart>