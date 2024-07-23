<cfset d = now()>
<cfoutput>#d# #d mod 2#<br /></cfoutput>

<cfset d = dateAdd("d", now(), 1)>
<cfoutput>#d# #d mod 2#<br /></cfoutput>


<cfset d = dateAdd("d", now(), -1)>
<cfoutput>#d# #d mod 2#<br /></cfoutput>

<cfset d = createDate(2008,8,31)>
<cfoutput>#d# #d mod 2#<br /></cfoutput>

<cfset d = createDate(2008,9,1)>
<cfoutput>#d# #d mod 2#<br /></cfoutput>

<cfset d = createDate(2008,12,31)>
<cfoutput>#d# #d mod 2#<br /></cfoutput>

<cfset d = createDate(2009,1,1)>
<cfoutput>#d# #d mod 2#<br /></cfoutput>