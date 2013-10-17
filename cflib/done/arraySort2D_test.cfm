<cfinclude template="arraySort2D_new.cfm">

<cfset arr = [[1,'one,1'],[2,'two,2'],[3,'three,3']]>
<cfdump var="#ArraySort2D(arr, 2, "textnocase", "asc", "|")#">
