<cfset o = createObject("component", "c")>
<cfset e = o.originalMethodName()>
<hr />
<cfset pointertoMethod = o.originalMethodName>
<cfset e = pointertoMethod()>
