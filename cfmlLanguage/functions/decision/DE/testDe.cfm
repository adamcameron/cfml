<cfparam name="form.sEval" default="">
<form name="frmEval" id="frmEval" method="post" action="./testDe.cfm">
	<textarea name="sEval"><cfoutput>#form.sEval#</cfoutput></textarea><br />
	<input type="submit" name="btnSubmit" value="Evaluate &raquo;" />
</form>
<br />
<cfif CGI.request_method eq "post">
	<cfoutput><hr /><pre>#evaluate(de(form.sEval))#</pre><hr /></cfoutput>
</cfif>
