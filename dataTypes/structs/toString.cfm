<cfset st1 = structNew()>
<cfset st1.foo = "bar">
<cfoutput>st1: #st1.toString()#<br /></cfoutput>
<cfset st2 = st1>
<cfoutput>st2: #st2.toString()#<br /></cfoutput>

<cfset st3 = duplicate(st1)>
<cfoutput>st3: #st3.toString()#<br /></cfoutput>