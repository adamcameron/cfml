<cfset setLocale("pt_BR")>
<cfset Data = "10/16/2011"> 
<cfoutput>#DateFormat(Data,'dd/mm/yyyy')#<br /></cfoutput> 
<cfoutput>#lsDateFormat(createDate(2011,10,16),'dd/mm/yyyy', "pt_BR")#<br /></cfoutput> 