<!--- loop through a list of locales; show date values for now()--->
 <cfloop list = "#Server.Coldfusion.SupportedLocales#"
 index = "locale" delimiters = ",">
 <cfset oldlocale = setLocale(locale)>
  <cfoutput><p><B><I>#locale#</I></B>
 #LSDateFormat(now(), "mmm-dd-yyyy")#
 #LSDateFormat(now(), "mmmm d, yyyy")#
 #LSDateFormat(now(), "mm/dd/yyyy")#
 #LSDateFormat(now(), "d-mmm-yyyy")#
 #LSDateFormat(now(), "ddd, mmmm dd, yyyy")#
 #LSDateFormat(now(), "d/m/yy")#
 #LSDateFormat(now())#
 <hr noshade>
 </cfoutput>
 </cfloop>