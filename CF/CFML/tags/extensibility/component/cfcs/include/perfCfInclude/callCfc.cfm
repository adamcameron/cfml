<cfset o = createObject("component", "c")>
Test f1()<br />
<cfset iFnStart = getTickCount()>
<cfset o.f1()>
<cfoutput>Total include execution time: #getTickCount() - iFnStart#<br /></cfoutput>
<hr />

Test f2()<br />
<cfset iFnStart = getTickCount()>
<cfset i = o.f2()>
<cfoutput>Loop execution time: #i#<br /></cfoutput>
<cfoutput>Total include execution time: #getTickCount() - iFnStart#<br /></cfoutput>
<hr />

Test f3()<br />
<cfset iFnStart = getTickCount()>
<cfset i = o.f3()>
<cfoutput>Loop execution time: #i#<br /></cfoutput>
<cfoutput>Total include execution time: #getTickCount() - iFnStart#<br /></cfoutput>
<hr />

Test f4()<br />
<cfset iFnStart = getTickCount()>
<cfset o.f4()>
<cfoutput>Total include execution time: #getTickCount() - iFnStart#<br /></cfoutput>
<hr />

Test f5()<br />
<cfset iFnStart = getTickCount()>
<cfset o.f5()>
<cfoutput>Total include execution time: #getTickCount() - iFnStart#<br /></cfoutput>
<hr />