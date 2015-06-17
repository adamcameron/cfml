<cfset temp = SetLocale("English (UK)")>

<cfset tdate = "Wed, 26 Aug 2009 21:10:11 +0000">

 
<cfoutput>
Locale = #GetLocale()#
<br />
String: #tdate#
<br />
IsDate #IsDate(tdate)#
<br />
Parse #ParseDateTime(tdate)#
<br />
LS Parse #LSParseDateTime(tdate)#
<br />
<cfset d = LSParseDateTime(tdate)>
lsDateFormat: #lsDateFormat(d, "yyyy-mm-dd")# #lsTimeFormat(d, "HH:MM:SS")#
 

</cfoutput>