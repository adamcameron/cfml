Steps to Reproduce:<br> 
<cfset secretKey = "Hq/WFySQfzQsO0mp2ixJDA==" />
<cfset encStr = encrypt("someText", secretKey,"AES/CBC/PKCS5Padding","hex") >
<cfset decStr = decrypt(encStr, secretKey, "AES/CBC/PKCS5Padding","hex") >
<cfoutput>#encStr#</cfoutput><br>
<cfoutput>#decStr#</cfoutput><br>
<br>
vs.<br>
<br>
<cfset encStr = encrypt("someText", "Hq/WFySQfzQsO0mp2ixJDA==","AES/CBC/PKCS5Padding","hex") >
<cfset decStr = decrypt(encStr, "Hq/WFySQfzQsO0mp2ixJDA==", "AES/CBC/PKCS5Padding","hex") >
<cfoutput>#encStr#</cfoutput><br>
<cfoutput>#decStr#</cfoutput><br>
<br>
Second round:<br>
<br>
<cfset secretKey = "Hq/WFySQfzQsO0mp2ixJDA==" />
<cfset encStr = encrypt("someText", secretKey,"AES/CBC/PKCS5Padding","hex") >
<cfset decStr = decrypt(encStr, secretKey, "AES/CBC/PKCS5Padding","hex") >
<cfoutput>#encStr#</cfoutput><br>
<cfoutput>#decStr#</cfoutput><br>
<br>
vs.<br>
<br>
<cfset encStr = encrypt("someText", "Hq/WFySQfzQsO0mp2ixJDA==","AES/CBC/PKCS5Padding","hex") >
<cfset decStr = decrypt(encStr, "Hq/WFySQfzQsO0mp2ixJDA==", "AES/CBC/PKCS5Padding","hex") >
<cfoutput>#encStr#</cfoutput><br>
<cfoutput>#decStr#</cfoutput><br>
