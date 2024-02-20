<cfscript>
s = "1827121492050112345678181400"
bi = JavaCast("BigInteger", s)
rem = PrecisionEvaluate("bi mod 97") // 5.4.0.65-RC: 34; 6.0.0.451-BETA: 68
//rem = bi.mod(JavaCast("BigInteger", "97"))

writeDump([s, bi, rem, server.lucee.version])
</cfscript>
