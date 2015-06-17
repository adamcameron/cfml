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
		<cfset LOCAL.Pattern = ("(?i)" & "<(#LOCAL.Nodes#)\b[^>]*(?<=/)>|" & "<(#LOCAL.Nodes#)\b[^>]*>[\w\W]*?</\2>")>

		<!--- Set up the instance variables. --->
		<cfset VARIABLES.Instance = {
			Pattern = CreateObject("java", "java.util.regex.Pattern").Compile(JavaCast("string", LOCAL.Pattern)),
			DataBuffer = "",
			TransferBuffer = RepeatString( " ", ARGUMENTS.BufferSize ).GetBytes(),
			InputStream = ""
		}>

		<!---
			Setup the file intput stream. This buffere input
			stream will all us to read in the XML file in
			chunks rather than as a whole.
		--->
		<cfset VARIABLES.Instance.InputStream = CreateObject("java", "java.io.BufferedInputStream").Init(
			CreateObject("java", "java.io.FileInputStream").Init(JavaCast("string", ARGUMENTS.XmlFilePath))
		)>

		<cfreturn THIS>
	</cffunction>


	<cffunction name="Close" access="public" returntype="void" output="false" hint="This closes the input file stream. It is recommended that you call this if you finish before all nodes have been matched.">
		<cfset VARIABLES.Instance.InputStream.Close()>
		<cfreturn>
	</cffunction>


	<cffunction name="GetNextNode" access="public" returntype="any" output="false" hint="I return the next node in the XML document. If no node can be found, I return VOID.">
		<cfset var LOCAL = {} />

		<cfset LOCAL.Matcher = VARIABLES.Instance.Pattern.Matcher(JavaCast("string", VARIABLES.Instance.DataBuffer))>

		<!--- Try to find the next node. --->
		<cfif LOCAL.Matcher.Find()>
			<cfset LOCAL.XMLData = LOCAL.Matcher.Group()>

			<!--- Now that we have the pattern matched, we need to figure out how many characters to leave in our buffer.--->
			<cfset LOCAL.CharsToLeave = (Len( VARIABLES.Instance.DataBuffer ) -	(LOCAL.Matcher.Start() + Len( LOCAL.XMLData )))>

			<!--- Check to see if we have any characters to leave in the buffer after this match. --->
			<cfif LOCAL.CharsToLeave>
				<!--- Trim the buffer. --->
				<cfset VARIABLES.Instance.DataBuffer = Right(VARIABLES.Instance.DataBuffer,	LOCAL.CharsToLeave)>
			<cfelse>
				<!--- No character data should be left in the buffer. Just set it to empyt string.	--->
				<cfset VARIABLES.Instance.DataBuffer = "">
			</cfif>

			<!--- Now that we have the buffer updated, parse the XML data and return the root element. --->
			<cfreturn XmlParse( Trim( LOCAL.XMLData)).XmlRoot>
		<cfelse>
			<!---
			The pattern matcher could not find the next node.	This might be because our buffer does contain enough information.
			Let's try to read more of ourXML file into the buffer.
			--->

			<!--- Read input stream into local buffer. --->
			<cfset LOCAL.BytesRead = VARIABLES.Instance.InputStream.Read(VARIABLES.Instance.TransferBuffer,	JavaCast("int", 0), JavaCast("int", ArrayLen(VARIABLES.Instance.TransferBuffer)))>

			<!---
				Check to see if we read any bytes. If we didn't
				then we have run out of data to read and cannot
				possibly match any more node patterns; just
				return void.
			--->
			<cfif (LOCAL.BytesRead EQ -1)>
				<cfset THIS.Close()><!--- Release the file input stream. --->
				<!--- No more data to be matched. --->
				<cfreturn>
			<cfelse>
				<!---
					We have read data in from the buffered file
					input stream. Now, let's append that to our
					internal buffer. Be sure to only move over
					the bytes that were read - this might not
					include the whole buffer contents.
				--->
				<cfset VARIABLES.Instance.DataBuffer &= Left(ToString(VARIABLES.Instance.TransferBuffer), LOCAL.BytesRead)>
			</cfif>

			<!---
				Now that we have updated our buffer, we want to
				give the pattern matcher another change to find
				the node pattern.
			--->
			<cfreturn GetNextNode()>
		</cfif>
	</cffunction>

</cfcomponent>