<cfoutput>
<cfset notAnEmailAddress = " not.valid@example.com ">
isValid("email","#notAnEmailAddress#"): #isValid("email",notAnEmailAddress)#<br>

<cfset notANumeric = " 1 ">
isValid("integer","#notANumeric#"): #isValid("integer",notANumeric)#<br>
isValid("numeric","#notANumeric#"): #isValid("numeric",notANumeric)#<br>
isNumeric("#notANumeric#"): #isNumeric(notANumeric)#<br>
isValid("float","#notANumeric#"): #isValid("float",notANumeric)#<br>

<cfset notAUuid = " #createUuid()# ">
isValid("uuid","#notAUuid#"): #isValid("uuid",notAUuid)#<br>
</cfoutput>