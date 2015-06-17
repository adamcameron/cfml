<cfcomponent>


	<cffunction name="originalMethodName">
		<cfset var oCv = createObject("java", "ClassViewer")>
		<cfset var o = getPageContext().getFusionContext().getServlet().getServletInfo()>
		<cfdump var="#o#">

		<pre>
		<cfoutput>
		#oCv.viewObject(o)#
		</cfoutput>
		</pre>
	</cffunction>

</cfcomponent>