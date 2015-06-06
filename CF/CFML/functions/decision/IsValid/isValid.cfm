<cfoutput>

Invalid as the local part is too long (64 chars):<br />
<cfset sLocal = "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij">
<cfset sDomain = "domain.com">
<cfset sEmail = "#sLocal#@#sDomain#">
Address: #sEmail#<br />
Length of local: #len(sLocal)#<br />
isValid? #isValid("email", sEmail)#
<br /><hr />

Invalid as the domain part is too long (255 chars):<br />
<cfset sLocal = "a">
<cfset sDomain = "123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0.com">
<cfset sEmail = "#sLocal#@#sDomain#">
Address: #sEmail#<br />
Length of domain: #len(sDomain)#<br />
isValid? #isValid("email", sEmail)#
<br /><hr />

Valid using slightly obscure but valid chars in local:<br />
<cfset sLocal = "a!a">
<cfset sDomain = "domain.com">
<cfset sEmail = "#sLocal#@#sDomain#">
Address: #sEmail#<br />
isValid? #isValid("email", sEmail)#
<br /><hr />

Valid using slightly obscure but valid chars in local:<br />
<cfset sLocal = "a=a">
<cfset sDomain = "domain.com">
<cfset sEmail = "#sLocal#@#sDomain#">
Address: #sEmail#<br />
isValid? #isValid("email", sEmail)#
<br /><hr />

Valid using quoted string in local:<br />
<cfset sLocal = '"John Smith"'>
<cfset sDomain = "domain.com">
<cfset sEmail = "#sLocal#@#sDomain#">
Address: #sEmail#<br />
isValid? #isValid("email", sEmail)#
<br /><hr />

Valid using escaped @ local:<br />
<cfset sLocal = "Abc\@def">
<cfset sDomain = "domain.com">
<cfset sEmail = "#sLocal#@#sDomain#">
Address: #sEmail#<br />
isValid? #isValid("email", sEmail)#
<br /><hr />

Valid using escaped space local:<br />
<cfset sLocal = "Fred\ Bloggs">
<cfset sDomain = "domain.com">
<cfset sEmail = "#sLocal#@#sDomain#">
Address: #sEmail#<br />
isValid? #isValid("email", sEmail)#
<br /><hr />

Other valid example from http://tools.ietf.org/html/rfc3696:<br />
<cfset sLocal = "$A12345">
<cfset sDomain = "domain.com">
<cfset sEmail = "#sLocal#@#sDomain#">
Address: #sEmail#<br />
isValid? #isValid("email", sEmail)#
<br /><hr />

Other valid example from http://tools.ietf.org/html/rfc3696:<br />
<cfset sLocal = "!def!xyz%abc">
<cfset sDomain = "domain.com">
<cfset sEmail = "#sLocal#@#sDomain#">
Address: #sEmail#<br />
isValid? #isValid("email", sEmail)#
<br /><hr />

</cfoutput>