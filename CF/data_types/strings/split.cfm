<cfset s = "This is my string. I think it's boring; but it demonstartes a point: I'm going to use it to demonstrate split(), spitting it on clause-delimiting punctuation.">

<cfset a = s.split("[\.,;:]")>

<cfdump var="#a#">