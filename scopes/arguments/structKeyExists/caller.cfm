<cfset o = createObject("component", "C")>

<cfset st1 = o.f()>
<cfdump var="#st1#" label="f() no args">


<cfset st2 = o.f(arg1=true, arg3=true)>
<cfdump var="#st2#" label="f() named args, skipping arg2">


<cfset stArgs = structNew()>
<cfset stArgs.arg1 = true>
<cfset stArgs.arg3 = true>
<cfset st3 = o.f(argumentCollection=stArgs)>
<cfdump var="#st3#" label="f() argCollection, skipping arg2">


<cfset st1 = o.g()>
<cfdump var="#st1#" label="g() no args">


<cfset st2 = o.g(arg1=true, arg3=true)>
<cfdump var="#st2#" label="g() named args, skipping arg2">


<cfset stArgs = structNew()>
<cfset stArgs.arg1 = true>
<cfset stArgs.arg3 = true>
<cfset st3 = o.g(argumentCollection=stArgs)>
<cfdump var="#st3#" label="g() argCollection, skipping arg2">

