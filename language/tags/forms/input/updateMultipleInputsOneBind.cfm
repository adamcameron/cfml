<cfparam name="form.slctPerson" default="">

<script type="text/javascript">

	function getName(value){
		return value.split("|")[1];
	}

	function getSex(value){
		return value.split("|")[2];
	}

	function getDob(value){
		return value.split("|")[3];
	}
</script>

<cfform method="post" action="#CGI.script_name#">
	<cfselect name="slctPerson" id="slctPerson" bind="cfc:shared.cf.cfml.tags.forms.input.updateMultipleInputsOneBind.getOptions()" display="display" value="value" selected="#form.slctPerson#" bindonload="true" /><br />
	<cfinput type="hidden" bind="cfc:shared.cf.cfml.tags.forms.input.updateMultipleInputsOneBind.getDetails({slctPerson.value})" name="hdnDetails" bindonload="false" />
	<cfinput type="text" bind="javascript:getName({hdnDetails})" name="txtName" bindonload="false"  /><br />
	<cfinput type="text" bind="javascript:getSex({hdnDetails})" name="txtSex" bindonload="false"  /><br />
	<cfinput type="text" bind="javascript:getDob({hdnDetails})" name="txtDob" bindonload="false"  /><br />
</cfform>