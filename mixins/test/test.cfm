<cfscript>
myObject = new MyComponent()

writeOutput("callMyLibPublicMethodFromMyComponent: #myObject.callMyLibPublicMethodFromMyComponent()#<br>")
writeOutput("callMyLibPrivateMethodFromMyComponent: #myObject.callMyLibPrivateMethodFromMyComponent()#<br>")
writeOutput("callMyComponentPublicMethodFromMyLib: #myObject.callMyComponentPublicMethodFromMyLib()#<br>")
writeOutput("callMyComponentPrivateMethodFromMyLib: #myObject.callMyComponentPrivateMethodFromMyLib()#<br>")

writeDump(myObject)
</cfscript>