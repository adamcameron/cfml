<HTML>
<HEAD>
</HEAD>
<BODY>

<h2>
Cfchart memory leak demo</h2>
<p>
This page will automatically refresh until the memory leak and eventual out of memory error from Java occurs. To stop auto refresh, comment out JavaScript at end of script.</p>

<!--- Create arrays of random data which we later turn into queries for the charts --->

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

<cfchart chartwidth="500" chartheight="250" format="png" xAxisTitle="Month" yAxisTitle="£ Cost of Messages" showxgridlines="yes" showygridlines="yes" show3d="no" markersize="4" seriesplacement="default" showlegend="yes" title="Chart 2" tooltip="#{"text": "%kv<br> £%v by %t", "font-size":10}#" plot="#{"thousands-separator":",", "decimals":2 }#" >
 <cfchartseries query="query2" itemcolumn="unitDate" valuecolumn="totalcost" serieslabel="Phone" type="line" seriescolor="blue" />
 <cfchartseries query="query3" itemcolumn="unitDate" valuecolumn="totalcost" serieslabel="SMS" type="line" seriescolor="##ddcc00" />
 <cfchartseries query="query4" itemcolumn="unitDate" valuecolumn="totalcost" serieslabel="Fax" type="line" seriescolor="red" />
</cfchart>

<!--- Zingcharts attributes for styling pie charts --->

<cfset plotarea ={ "adjustLayout":false, "alpha":1, "margin-top":0, "margin-right":0, "margin-left":0, "margin-bottom":0}>
 <cfset border = { "borderColor":"none"}>
<cfset legend = { "visible":false, "adjust-layout":false, "alpha":0.7}>
<cfset plot = { "highlight":false, "value-box":{  "placement":"in",  "connected":true,  "text":"%t%v",  "font-color":"##000",  "font-size":11,  "callout":false,  "background-color":"##fff",  "border-radius":3,  "alpha":0.8,  "type":"all",  "thousands-separator":"," }}>

<cfchart chartwidth="245" chartheight="200" format="png" show3d="no" title="Chart 3" plotarea="#plotarea#" border="#border#" legend="#legend#" plot="#plot#" tooltip = "#{"text": "%t%v"}#" >
 <cfchartseries type="pie" colorlist="blue,yellow,red">
  <cfchartdata item="Phone £" value="#Round(405)#">
  <cfchartdata item="SMS £" value="#Round(819)#">
  <cfchartdata item="Fax £" value="#Round(87)#">
 </cfchartseries>
</cfchart>

<cfset plot = { "highlight":false, "value-box":{  "placement":"in",  "connected":true,  "text":"%v",  "font-color":"##000",  "font-size":11,  "callout":false,  "background-color":"##fff",  "border-radius":3,  "alpha":0.8,  "type":"all",  "thousands-separator":"," }}>
<cfchart chartwidth="245" chartheight="200" format="png" show3d="no" title="Chart 4" plotarea="#plotarea#" border="#border#" legend="#legend#" plot="#plot#" tooltip = "#{"text": "%t: %v", "font-size":10, "font-weight":"bold", "border-radius":"7px", "border-width":1, "border-color":"black", "shadow-color":"##000", "thousands-separator":"," }#" >
 <cfchartseries type="pie" paintstyle="light" colorlist="green,blue,yellow,red">
  <cfchartdata item="Email" value="10756">
  <cfchartdata item="Phone" value="987">
  <cfchartdata item="SMS" value="1421">
  <cfchartdata item="Fax" value="41">
 </cfchartseries>
</cfchart>

<cfchart chartwidth="500" chartheight="250" format="png" xAxisTitle="Month" yAxisTitle="Emails Sent" showxgridlines="yes" showygridlines="yes" show3d="no" markersize="4" seriesplacement="default" showlegend="no" title="Chart 5">
 <cfchartseries query="query1" itemcolumn="unitDate" valuecolumn="howmany" type="line" seriescolor="green" />
</cfchart>

<cfchart chartwidth="500" chartheight="250" format="png" xAxisTitle="Month" yAxisTitle="Calls Made" showxgridlines="yes" showygridlines="yes" show3d="no" markersize="4" seriesplacement="default" showlegend="no" title="Chart 6">
 <cfchartseries query="query2" itemcolumn="unitDate" valuecolumn="howmany" type="line" seriescolor="blue" />
</cfchart>

<cfchart chartwidth="500" chartheight="250" format="png" xAxisTitle="Month" yAxisTitle="SMS Sent" showxgridlines="yes" showygridlines="yes" show3d="no" markersize="4" seriesplacement="default" showlegend="no" title="Chart 7">
 <cfchartseries query="query3" itemcolumn="unitDate" valuecolumn="howmany" type="line" seriescolor="yellow" />
</cfchart>

<cfchart chartwidth="500" chartheight="250" format="png" xAxisTitle="Month" yAxisTitle="Faxes Sent" showxgridlines="yes" showygridlines="yes" show3d="no" markersize="4" seriesplacement="default" showlegend="no" title="Chart 8">
 <cfchartseries query="query4" itemcolumn="unitDate" valuecolumn="howmany" type="line" seriescolor="red" />
</cfchart>


<!--- Automatically refresh as soon as this page has loaded --->

<script>
document.location=document.location.href;</script>

</BODY>
</HTML>
