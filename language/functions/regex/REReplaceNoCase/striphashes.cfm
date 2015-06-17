<cfset s = "lalala ##objBHv(stuff)## lalalala">

<cfoutput>#reReplacenoCase(s, "##objbhv[^##]+##", "", "ALL")#</cfoutput>
