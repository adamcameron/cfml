<cfset s = "This
is
my
string
to
split">

<cfset a = s.split("\n")>
<cfdump var="#a#">