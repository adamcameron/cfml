<cfdump var="#url#" label="url">
<cfdump var="#form#" label="form">
 <cfquery name="q" datasource="d1">
	select	uuid, circuit_name, circuit_title, parent_circuit_uuid
	from	circuits
</cfquery>
 
<cfform action="./dsp_cfgrid.cfm" method="post" format="flash" name="f" id="f">
	<cfgrid onchange="submitForm();" name="g" format="flash" query="q" maxrows="10" href="http://localhost:8100/shared/cfml/cfform/dsp_cfgrid.cfm" sort="true" appendkey="true" highlightHref="true" hrefKey="uuid" selectmode="single" />
	<cfinput type="submit" name="s" value="Go %BB" />
</cfform>
&raquo;