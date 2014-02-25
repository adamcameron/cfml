<!--- wddx.cfm--->
<cfset literalNotation = {
	lowercase = true,
	UPPERCASE = true,
	mixedCase = true
}>
<cfwddx action="cfml2wddx" input="#literalNotation#" output="wddx">
<cfwddx action="wddx2cfml" input="#wddx#" output="cf">

<cfdump var="#[{original=literalNotation},{wddx=wddx},{deserialised=cf}]#" label="struct with dot notation">
