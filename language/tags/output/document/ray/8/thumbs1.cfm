<cfset dir = expandPath("./") & "thumbs">
<cfif not directoryExists(dir)>
   <cfdirectory action="create" directory="#dir#">
</cfif>

<cfdocument format="pdf" name="mypdf">
<h1>Top 10 Reasons why ColdFusion 8 Kicks Rear</h1>

<p>
10. Ajax UI controls make my design suck less.<br />
9. 500% faster. Seriously - 500% faster. That's like... fast.<br />
8. &lt;cfajaxproxy> - Couldn't Adobe make Ajax easier? No.<br />
7. Debugging. Not that CF developers make mistakes.<br />
6. No more d*** custom MySQL drivers.<br />
5. PDF toolset that makes PDF sexy. And that's saying a lot.<br />
4. Interaces. Yeah, I said Interfaces. Whooyah.<br />
3. Server Monitor - and it's all Flex.<br />
2. Server Monitor API - in case you don't want it all Flex.<br />
1. It's not Dot Net.<br />
</p>
</cfdocument>

<!--- <cfpdf action="thumbnail" source="mypdf" destination="#dir#" resolution="high" scale="50" overwrite="true"> --->
<cfpdf action="thumbnail" source="mypdf" destination="#dir#" resolution="high" scale="50" overwrite="true" imagePrefix="t">