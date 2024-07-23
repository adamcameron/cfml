<cfsetting enablecfoutputonly="true">
<cfset lBoolean = "TRUE,FALSE">

<cfoutput><table border="1"><thead><tr><th>IMP</th></cfoutput>
	<cfloop index="x" list="#lBoolean#">
		<cfoutput><th>x=#x#</th></cfoutput>
	</cfloop>
<cfoutput></tr></thead><tbody></cfoutput>
<cfloop index="y" list="#lBoolean#">
	<cfoutput><tr><th>y=#y#</th></cfoutput>
		<cfloop index="x" list="#lBoolean#">
			<cfoutput><td>#x# IMP #y# = #trueFalseFormat(x IMP y)#</td></cfoutput>
		</cfloop>
	<cfoutput></tr></cfoutput>
</cfloop>
<cfoutput></tbody></table><br /></cfoutput>


<cfoutput><table border="1"><thead><tr><th>x EQV y</th></cfoutput>
	<cfloop index="x" list="#lBoolean#">
		<cfoutput><th>x=#x#</th></cfoutput>
	</cfloop>
<cfoutput></tr></thead><tbody></cfoutput>

<cfloop index="y" list="#lBoolean#">
	<cfoutput><tr><th>y=#y#</th></cfoutput>
		<cfloop index="x" list="#lBoolean#">
			<cfoutput><td>#x# EQV #y# = #trueFalseFormat(x EQV y)#</td></cfoutput>
		</cfloop>
	<cfoutput></tr></cfoutput>
</cfloop>
<cfoutput></tbody></table><br /></cfoutput>



<cfoutput><table border="1"><thead><tr><th>NOT (x AND NOT y)</th></cfoutput>
	<cfloop index="x" list="#lBoolean#">
		<cfoutput><th>x=#x#</th></cfoutput>
	</cfloop>
<cfoutput></tr></thead><tbody></cfoutput>

<cfloop index="y" list="#lBoolean#">
	<cfoutput><tr><th>y=#y#</th></cfoutput>
		<cfloop index="x" list="#lBoolean#">
			<cfoutput><td>NOT (#x# AND NOT #y#) = #trueFalseFormat(NOT (x AND NOT y))#</td></cfoutput>
		</cfloop>
	<cfoutput></tr></cfoutput>
</cfloop>
<cfoutput></tbody></table><br /></cfoutput>


<cfscript>
	function trueFalseFormat(b){
		if (b){
			return TRUE;
		}else{
			return FALSE;
		}
	}
</cfscript>