<cfcomponent output="false" hint="I help to parse large XML files by matching patterns and then only parsing sub-nodes of the document.">


	<cffunction name="Init" access="public" returntype="any" output="false" hint="I return an intialized object.">
		<cfargument name="Nodes" type="string" required="true" hint="I am the list of node names that will be parsed using regular expressions.">
		<cfargument name="XmlFilePath" type="string" required="true" hint="I am the file path for the large XML file to be parsed.">
		<cfargument name="BufferSize" type="numeric" required="false" default="#(1024 * 1024 * 5)#" hint="I am the size of the buffer which will be used to make reads to the input stream.">

		<!--- Define the local scope. --->
		<cfset var LOCAL = {} />

		<!---
			Create the regular expression pattern based on the
			node list. We have to match both standard nodes and
			self-closing nodes. The first thing we have to do is
			clean up the node list.
		--->
		<cfset LOCAL.Nodes = ListChangeDelims(ARGUMENTS.Nodes, "|", ", ")>

		<!--- Define the pattern. --->
		<cfset LOCAL.Pattern = "(<(#LOCAL.Nodes#)\b[^>]*?(/){0}>[\w\W]*?</\2>)|(<(#LOCAL.Nodes#)\b[^>]*(/)?>)">

		<!--- Set up the instance variables. --->
		<cfset VARIABLES.Instance = {
			DataBuffer		= "",
			iBuffer			= arguments.bufferSize,
			sRegex			= LOCAL.Pattern,
			fData			= fileOpen(ARGUMENTS.XmlFilePath, "read")
		}>

		<cfreturn THIS>
	</cffunction>


	<cffunction name="Close" access="public" returntype="void" output="false" hint="This closes the input file stream. It is recommended that you call this if you finish before all nodes have been matched.">
		<cfset fileClose(VARIABLES.instance.fData)>
		<cfreturn>
	</cffunction>


	<cffunction name="GetNextNode" access="public" returntype="any" output="false" hint="I return the next node in the XML document. If no node can be found, I return VOID.">
		<cfset var LOCAL = {}>

		<cfset LOCAL.stMatch = reFindNoCase(VARIABLES.Instance.sRegex, VARIABLES.Instance.DataBuffer, 1, true)>

		<!--- Try to find the next node. --->
		<cfif LOCAL.stMatch.pos[1] gt 0>
			<cfset LOCAL.XMLData = mid(VARIABLES.Instance.DataBuffer, LOCAL.stMatch.pos[1], LOCAL.stMatch.len[1])>

			<!--- Now that we have the pattern matched, we need to figure out how many characters to leave in our buffer.--->
			<cfset LOCAL.CharsToLeave = Len(VARIABLES.Instance.DataBuffer) - (LOCAL.stMatch.pos[1] + LOCAL.stMatch.len[1])>

			<!--- Check to see if we have any characters to leave in the buffer after this match. --->
			<cfif LOCAL.CharsToLeave>
				<!--- Trim the buffer. --->
				<cfset VARIABLES.Instance.DataBuffer = Right(VARIABLES.Instance.DataBuffer,	LOCAL.CharsToLeave)>
			<cfelse>
				<!--- No character data should be left in the buffer. Just set it to empyt string.	--->
				<cfset VARIABLES.Instance.DataBuffer = "">
			</cfif>

			<!--- Now that we have the buffer updated, parse the XML data and return the root element. --->
			<cfreturn XmlParse(Trim(LOCAL.XMLData)).XmlRoot>
		<cfelse>
			<!---
			The pattern matcher could not find the next node.	This might be because our buffer does contain enough information.
			Let's try to read more of ourXML file into the buffer.
			--->

			<!--- Read input stream into local buffer. --->
			<cfif not fileIsEof(VARIABLES.Instance.fData)>
				<cfset LOCAL.sData = fileRead(VARIABLES.Instance.fData, VARIABLES.Instance.iBuffer)>
				<cfset VARIABLES.Instance.DataBuffer &= LOCAL.sData>
				<cfreturn GetNextNode()>
			<cfelse>
				<cfset THIS.Close()><!--- Release the file input stream. --->
				<!--- No more data to be matched. --->
				<cfreturn>
			</cfif>
		</cfif>
	</cffunction>

</cfcomponent>