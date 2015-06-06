<cffunction name="htmTable2Query" returnType="query" output="no">    
	<cfargument name="tab" type="string" required="true">	
		
	 <cfset tab=Replace(tab,'</tr>','</TR>','ALL')>
	 <cfset tab=Replace(tab,'<tr>','<TR>','ALL')>
	 <cfset tab=Replace(tab,' ',' ','ALL')> 
 	 <cfset tab=tagStripper(tab,'strip','table,tr,td,th')>
	 
 		<cfset xml = XmlParse(tab)>
 		<cfset TRArray = xmlSearch(xml, "//TR"  )>   
	 	<cfset my_list="">
	 	<cfset TR =  TRArray[1] > 
		<cfloop from="1" to="#arraylen(TR.XmlChildren)#" index="i"> 			
			<cfset x=trim(replace(trim(TR.XmlChildren[i].XmlText),' ','_','ALL'))>			 
			 <cfset x=ReReplace(x,'[^A-Za-z0-9_]*','','ALL')>			 	 
			<cfset my_list=ListAppend(my_list,x)>			
		</cfloop> 	 	 
	 	<cfset q=QueryNew('#my_list#')>  		
	 	<cfloop from="2" to=#Arraylen(TRArray)# index="n">
	 		<cfset TR =  TRArray[n] > 
	 	 	<cfset temp = QueryAddRow(q)>
			<cfloop from="1" to="#arraylen(TR.XmlChildren)#" index="i"> 			
				<cfset Temp = QuerySetCell(q, #ListGetAt(my_list,i)#, #TR.XmlChildren[i].XmlText#)>
			</cfloop>	 	 
	 	</cfloop> 	 
	<cfreturn q>
</cffunction>  

<cfhttp url="http://countrycode.org/"  method="GET" ></cfhttp>   
<cfset start=FindNocase('<table',cfhttp.fileContent,1)>
<cfset fini=FindNocase('</table>',cfhttp.fileContent,start)>
<cfset tab=Mid(cfhttp.fileContent,start,fini-start+8)> 
<cfset q=htmTable2Query(tab)>
<cfdump var="#q#">