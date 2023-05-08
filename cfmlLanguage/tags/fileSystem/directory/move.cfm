<cfset sSrc = "C:\temp\deleteme\src\sub\moveme\">
<cfset sDest = "C:\temp\deleteme\dest\sub\movedme\">

<cfdirectory action="rename" directory="#sSrc#" newdirectory="#sDest#">
