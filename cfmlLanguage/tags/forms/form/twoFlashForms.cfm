Text at top<br />
<cfform format="flash" name="f1" id="f1" method="post" action="./twoFlashForms.cfm" height="75">
	<cfinput type="text" name="i1" id="i1" value="first form" />
	<cfinput type="submit" name="s1" id="s1" value="Submit" />
</cfform>
Text in middle<br />
<cfform format="flash" name="f2" id="f2" method="post" action="./twoFlashForms.cfm" height="75">
	<cfinput type="text" name="i2" id="i2" value="second form" />
	<cfinput type="submit" name="s2" id="s2" value="Submit" />
</cfform>
Text at botom<br />
<cfdump var="#form#">