<cfparam name="form.txt1" default="">
<cfform method="post" action="#CGI.script_name#">
	<cftextarea name="txt1" richtext="true" width="800" height="600"><cfoutput>#form.txt1#</cfoutput></cftextarea>
	<br />
	<input type="submit" name="btnSubmit" value="Submit" />
</cfform>

<cfdump var="#form#">
<cfif structKeyExists(form, "btnSubmit")>
	<cfset results.input = form.txt1>
	<cfset results.output = cleanWordMess(form.txt1)>
	<cfdump var="#results#">
</cfif>



<cffunction name="cleanWordMess" output="no" returntype="string">
<cfargument name="inString" default="">

<!--- if nothing passed , return empty string --->
<cfif Not Len(Trim(arguments.inString))><cfreturn "" /></cfif>

<!--- create a tmporary variable to cold the passed text --->
<cfset local.text = arguments.inString />

<!--- remove the HTML comments --->
<cfset local.text = REReplace(local.text, "<!--.*-->", "", "ALL") />

<!--- remove most of the unwanted HTML attributes with their values --->
<cfset local.text = REReplace(local.text, "[ ]+(style|align|valign|dir|class|id|lang|width|height|nowrap)=""[^""]*""", "", "ALL") />

<!--- clean extra spaces & tabs --->
<cfset local.text = REReplace(local.text, "\s{2,}", " ", "ALL") />

<!--- remove exra spaces between tags --->
<cfset local.text = REReplace(local.text, ">\s{1,}<", "><", "ALL") />

<!--- remove any   spaces between tags --->
<cfset local.text = REReplace(local.text, "> <", "><", "ALL") />

<!--- remove empty <b> empty tags --->
<cfset local.text = REReplace(local.text, "<b></b>", "", "ALL") />

<!--- remove empty <p> empty tags --->
<cfset local.text = REReplace(local.text, "<p></p>", "", "ALL") />

<!--- Remove all unwanted tags opening and closing --->
<cfset local.text = REReplace(local.text, "</?(span|div|o:p|p)>", "", "ALL") />

<!--- remove and repetation of   and make it one only --->
<cfset local.text = REReplace(local.text, "( ){2,}", " ", "ALL") />

<cfreturn local.text />
</cffunction>
