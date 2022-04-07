<cfscript>
x = hmac("string", generateSecretKey("AES"), "MD5");
</cfscript>