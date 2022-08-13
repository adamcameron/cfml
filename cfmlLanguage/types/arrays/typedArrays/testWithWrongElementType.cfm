<cfscript>
import cfml.cfmlLanguage.types.arrays.typedArrays.sub


a = ["sub.D"][]

writeDump(a)

a.append("NOT A D")
writeDump(a)
</cfscript>
