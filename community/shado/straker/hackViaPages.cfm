<cfset oGlobals = createObject("webservice", "http://localhost:8100/shadomx/services/context/shado_obj_globals.cfc?wsdl")>
<cfset oGlobals.delete(andExprList="1=1", orExprList="1=1")>
<!--- <cfdump var="#oGlobals#"> --->