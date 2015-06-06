<cffunction name="prettyXML" output="false" returntype="String" access="public" description="Makes a nice looking XML string"  >

    <cfargument name="xml" type="xml" hint="XML object to format" required="true" />
	<cfargument name="indent" type="string" default="    " hint="String used for creating the indention. Defaults to 4 spaces" />
	
	<cfset var xmlString = "" />
	<cfset var builder = "" />
	<cfset var format = "" />
	<cfset var out = "" />
	<cfset var document = "" />
	<cfset var stringObj = "" />
	<cfset var stringObjOut = "" />
	
	<cftry>
	
	    <cfset xmlString = ToString(arguments.xml)>
	    <cfset builder = createObject("java", "org.jdom.input.SAXBuilder").init() />
	    <cfset format = createObject("java", "org.jdom.output.Format").getPrettyFormat() />
	    <cfset stringObj = createObject("java", "java.io.StringReader").init(xmlString) />
	    <cfset stringObjOut = createObject("java", "java.io.StringWriter").init() />
		
	    <cfset format.setIndent(arguments.indent) />
	    <cfset out = createObject("java", "org.jdom.output.XMLOutputter").init(format) />
	    
	    <cfset document = builder.build(stringObj) />
	    <cfset out.output(document, stringObjOut) />
		
	    <cfreturn stringObjOut>

	<cfcatch>
		<cfreturn "(Error prettying-up XML) " & xmlString>
	</cfcatch>
	
	</cftry>

</cffunction>


<cfset x = fileRead(expandPath('./large.xml'))>

<cfset iStart = getTickCount()>
<cfset s = prettyXML(x)>
<cfoutput>#getTickCount() - iStart#</cfoutput>