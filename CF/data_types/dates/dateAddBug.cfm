 <cfset startDate = createDate(1900,1,1)>
 <cfset endDate = createDate(2050,1,1)>
  
 <cfloop from="#startDate#" to="#endDate#" index="date">
 	
<!---  	<cftry> --->
 		<cfset dateNextMonth = dateAdd("m",1,date)>
 		<cfoutput>#LSDateFormat(date,"dd-mm-yyyy")# 
#LSTimeFormat(date,"hh:mm:ss")#<br></cfoutput>
 	
<!---  		<cfcatch type="Any">
 			<cfoutput>#LSDateFormat(date,"dd-mm-yyyy")# #LSTimeFormat(date,"hh:mm:ss")# 
- ERROR<br></cfoutput>
 		</cfcatch>
 	</cftry> --->
 </cfloop>