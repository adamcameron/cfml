<cfscript>
// GeneratePBKDFKey.cfm

result = generatePBKDFKey("PBKDF2WithHmacSHA1", "some string", "some salt", 1000, 512);
writeDump([result]);

</cfscript>