<!---
	Function: balanceTags
	Description: Adds end tags to balance XHTML excerpt.
	Assumptions: - Input is the truncated source from well-balanced, properly-nested XHTML.
	@param string
--->
<cffunction name="balanceTags" access="public" output="false" returntype="string" hint="Takes (possibly truncated) XHTML content and balances the tags">
	<cfargument name="string" type="string" required="true" hint="The HTML string to balance">
	<cfset var returnString = arguments.string>
	<cfset var tagStack = arrayNew(1)>
	<cfset var tag = "">
	<cfset var tagString = "">
	<cfset var word = "">
	<cfset var startPosition = 1>

	<!--- First, find any broken tags (as opposed to broken elements) --->
	<!--- Loop backwards through text one char at a time --->
	<!--- If you find a < before a > then there is a broken tag --->
	<cfset startPosition = len(returnString)>
	<cfloop condition="startPosition GT 0">
		<cfif find("<",returnString,startPosition) GT 0>
			<!--- This represents a broken tag. Truncate the string at this position --->
			<cfset returnString = left(returnString,startPosition-1)>
			<cfbreak>
		<cfelseif find(">",returnString,startPosition) GT 0>
			<!--- Found the end of the tag (properly ended), so we can break the loop --->
			<cfbreak>
		<cfelse>
			<!--- Check the next char to the left --->
			<cfset startPosition = startPosition-1>
		</cfif>
	</cfloop>

	<!--- Reset start position to begin at the first char --->
	<cfset startPosition = 1>

	<!--- Next, find any broken elements (i.e. start tags without end tags --->
	<cfloop condition="startPosition GT 0 AND startPosition LT len(returnString)">
		<cfset startPosition = find("<",returnString,startPosition)>
		<cfset tag = REFind("</?[A-Za-z]+[^>]*>",returnString,startPosition,true)>
		<cfif tag.len[1] GT 0>
			<cfset tagString = mid(returnString,tag.pos[1],tag.len[1])>
			<!--- Check for self-closing tag --->
			<cfif REFind("\s*/\s*>",tagString) GT 0>
				<!--- Do nothing --->
			<cfelse>
				<cfset word = REFind("/?[A-Za-z]+",tagString,1,true)>
				<cfif word.len[1] GT 0>
					<!--- Is this a start tag or an end tag? --->
					<cfif NOT find("/",mid(tagString,word.pos[1],word.len[1]))>
						<!--- Start tag: Push the word (start tag) onto the stack --->
						<cfset arrayAppend(tagStack,mid(tagString,word.pos[1],word.len[1]))>
					<cfelse>
						<!--- End tag: Pop word --->
						<cfset arrayDeleteAt(tagStack,arrayLen(tagStack))>
						<!--- TODO:
						What if the tags are not only unbalanced, but not properly nested?
						E.g. "<div><p>Here is <strong>some</p><p>text</strong></p></div>"
						We could try to insert the end tag before the closing of the parent tag.
						Although then we would have a stray end tag.
						--->
					</cfif>
				</cfif>
			</cfif>
			<!--- Ignore everything that was part of the current tag --->
			<cfset startPosition = tag.pos[1]+tag.len[1]>
			<!--- Advance to next tag --->
			<cfset startPosition = find("<",returnString,startPosition)>
		</cfif>
	</cfloop>

	<!--- While the stack is not empty, pop items from the stack --->
	<cfloop condition="arrayLen(tagStack) GT 0">
		<!--- Add the popped word (top of stack) as an end tag --->
		<cfset returnString = returnString & "</" & tagStack[ArrayLen(tagStack)] & ">">
		<cfset arrayDeleteAt(tagStack,arrayLen(tagStack))>
	</cfloop>

	<cfreturn returnString>
</cffunction>


<cfset baseLine = '<div><p>Here is some<br/><em>well-balanced</em><br /> <strong>XHTML</strong>'>
<cfsavecontent variable="baseLine">
	<table border="1">
		<thead>
			<tr><th>Col1</th><th>Col2</th></tr>
		</thead>
		<tbody>
			<tr><td>Row 1 Col1</td><td>Row 1 Col2</td></tr>
			<tr><td>Row 2 Col1</td><td>Row 2 Col2</td></tr>
			<tr><td>Row 3 Col1</td><td>Row 3 Col2</td></tr>
		</tbody>
	</table>
</cfsavecontent>
<cfoutput>
	<cfset string = baseLine>
	src: #htmlEditFormat(string)#<br />
	result:#htmlEditFormat(balanceTags(string))#
	<br /><hr />
	<cfset string = left(baseLine,50)>
	src: #htmlEditFormat(string)#<br />
	result:#htmlEditFormat(balanceTags(string))#
	<br /><hr />
	<cfset string = left(baseLine,65)>
	src: #htmlEditFormat(string)#<br />
	result:#htmlEditFormat(balanceTags(string))#
	<br /><hr />
	<cfset string = left(baseLine,130)>
	src: #htmlEditFormat(string)#<br />
	result:#htmlEditFormat(balanceTags(string))#
</cfoutput>
