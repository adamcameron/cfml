<cfscript>
import cfmlInDocker.miscellaneous.importTest.package.subpackage.Implementation

o = new Implementation()

writeDump(var=o, format="text")
</cfscript>
