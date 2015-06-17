<cfdump var="#form#">
<cfset decryptedPassword = Decrypt("#FORM.txtPassword#","#hdnEncType#","AES","UU")>
<cfoutput>#decryptedPassword#</cfoutput>