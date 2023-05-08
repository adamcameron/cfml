<cfscript>
writeOutput("before reset in main: #C::myStaticVar#<br>")
C::reset()
writeOutput("after reset in main: #C::myStaticVar#<br>")
C::myStaticVar = "set in main"
writeOutput("after change in main: #C::myStaticVar#<br>")

cfhttp(method="get", url="http://localhost:8888/cfml/cfmlLanguage/static/separateRequests/sub/secondary.cfm");
writeOutput("from sub: #cfhttp.fileContent#<br>")

</cfscript>
