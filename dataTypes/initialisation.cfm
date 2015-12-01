<cfscript>
s = "true";
b = true;
i = 1;
f = 1.1;

writeDump(var=[
{literal="String", actual=s.getClass().getName(), value=s},
{literal="Boolean", actual=b.getClass().getName(), value=b},
{literal="Integer", actual=i.getClass().getName(), value=i},
{literal="Float", actual=f.getClass().getName(), value=f}
], label="Types");	
</cfscript>