<cfset o = createObject("java", "InnerClassTest$MyInnerClass").s>
<cfoutput>#o.f()#</cfoutput>