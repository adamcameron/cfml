<cfset birthDate = CreateDate(1945, 6, 27)>
<cfset eighteenBirthday = DateAdd('yyyy', 18, birthDate)>
<cfdump var="#eighteenBirthday#">