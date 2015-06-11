<cfform name="frm" id="frm" method="post" action="./action.cfm">
<cfinput name="winter" type="text" validate="integer" validateat="onsubmit" message="Please enter only whole numbers less than four digits" value="0" maxlength="3">
<input type="submit" name="btnSubmit" value="Go &raquo;" />
</cfform>