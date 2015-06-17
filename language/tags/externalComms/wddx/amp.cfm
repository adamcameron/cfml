<cfscript>
	st = structNew();
	st["key with & embedded"] = true;
	st["key with &amp; embedded"] = true;
	st.amp1 = "value with & embedded";
	st.amp2 = "value with &amp; embedded";
</cfscript>
<cfdump var="#st#" label="st Before">
<cfwddx action="cfml2wddx" input="#st#" output="w">
<cfdump var="#w#">
<cfwddx action="wddx2cfml" input="#w#" output="st">
<cfdump var="#st#" label="st After">