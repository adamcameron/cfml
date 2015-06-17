<!--- 
<cfset oPdfWs = createObject("webservice", "http://localhost:8301/shared/CF/CFML/tags/output/document/PdfWebService.cfc?wsdl")>

<cfset binPdf = oPdfWs.returnPdf(content="Adam @ #now()#")>

<cfheader name="Content-Disposition" value="attachment; filename=pdfWebService.pdf">
<cfcontent reset="true" type="application/pdf" variable="#binPdf#">
 --->

<cfhttp
	method		= "get"
	url			= "http://localhost:8301/shared/CF/CFML/tags/output/document/PdfWebService.cfc?wsdl&method=returnPdf&content=adam"
	result		= "stHttp"
	getasbinary	= "yes"
/>

<!--- <cfheader name="Content-Disposition" value="attachment; filename=pdfWebService.pdf"> --->
<!--- <cfcontent reset="true" type="application/pdf" variable="#stHttp.fileContent#"> --->

<cfdump var="#toString(sthttp.filecontent)#">

