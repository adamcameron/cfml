<cfscript>
/**
 * Tests passed value to see if it is a properly formatted U.K. postcode (zip code).
 * v1 by Robert West
 * 
 * @param str      String to be checked. (Required)
 * @return Returns a Boolean. 
 * @author Duncan (duncan@duncancumming.co.uk) 
 * @version 2, October 30, 2008 
 */
function IsZipUK(str) {
return REFind("(GIR 0AA)|((([ABCDEFGHIJKLMNOPRSTUWYZ][0-9][0-9]?)|(([ABCDEFGHIJKLMNOPRSTUWYZ][ABCDEFGHKLMNOPQRSTUVWXY][0-9][0-9]?)|(([ABCDEFGHIJKLMNOPRSTUWYZ][0-9][ABCDEFGHJKSTUW])|([ABCDEFGHIJKLMNOPRSTUWYZ][ABCDEFGHKLMNOPQRSTUVWXY][0-9][ABEHMNPRVWXY])))) [0-9][ABDEFGHJLNPQRSTUWXYZ]{2})", str);
}
</cfscript>

<cfoutput>
OX4 1XP: #YesNoFormat(IsZipUK("OX4 1XP"))#<br>
OX11 0AL: #YesNoFormat(IsZipUK("OX11 0AL"))#<br>
O11 0AS: #YesNoFormat(IsZipUK("O11 0AS"))#<br>
RG1 AP: #YesNoFormat(IsZipUK("RG1 AP"))#<br>
WC1V 6RL: #YesNoFormat(IsZipUK("wc1v 6rL"))#<br>
W1 1AA: #YesNoFormat(IsZipUK("W1 1AA"))#<br>
</cfoutput>