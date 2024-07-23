<cfparam name="URL.str" default="">

<cfdump var="#reFindNoCase("(?![a])[a]{2}(?![a])", URL.str, 1, true)#">
