<cfprocessingdirective pageencoding="utf-8">
<cfset s1 = "Fenêtres françaises">

<cfset s2 = reReplace(s1, "\w", "_", "ALL")>

<cfdump var="#variables#">