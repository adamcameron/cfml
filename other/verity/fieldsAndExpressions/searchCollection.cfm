<cfparam name="URL.min" default="0" type="integer">
<cfparam name="URL.max" default="1000" type="integer">

<cfsearch
	collection	= "#sCollectionName#"
	criteria	= "CF_CUSTOM1 > #URL.min#"
	name		= "qResults"
>

<cfdump var="#qResults#">
<cfdump var="#URL#">