<cfset srv = createObject("component", "service.MyService")>
<cfset i = createObject("component", "component.MyImplementation")>
<cfdump var="#isInstanceOf(i, "interface.MyInterface")#"> <!--- This will return "YES" --->
<cfset srv.setImplementation(i) /> <!--- Error occurs here --->