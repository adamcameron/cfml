	<cffunction access="remote" name="splitDoc" output="true" returntype="struct" hint="Removes an XML declaration and a doctype string from the document, and returns each part separately. This is to work around some shortcomings of CF's handling of XML validation. Returns a struct keyed on <em>xmlDeclaration</em>, <em>doctype</em> and <em>doc</em>.">
		<cfargument name="xmlString" type="string" required="true" hint="The XML string to process.">
		
		<cfscript>
			var stDocParts 		= structNew();
			var stReturn		= structNew();
			var sRegex			="(?x)	## ignore whitespace
				^						## start of doc
				\s*						## leading white space
				(<\?xml.*?>)?			## an xml declaration.  zero or one of them
				\s*						## intermediary whitespace
				(						## start a new group
					<!DOCTYPE.*?		## open a doctype, and match anything up to the next group
					(?:					##	match either: (we're using the parentheses for grouping, not matching: we don't want to return this)
						\[.*].*?>		## the DTD part of the doctype.  Anything within square brackets. zero or one of them, and don't pass the match back
						|				## OR
						.*?>			## a non dtd doctype
					) 					## end of the grouping for the OR statement
				)?						## end of the doctype group, which we're returning as a match.  Zero or one of them
				\s*						## some optional whitespace which we don't care about, 
				(						## the next group is the actual XML doc
					(?:					## again, just using this to group an OR expression
						<(\S+)[^>]*>	## matches any xml tag, with optional trailing attributes
						.*				## and everything else inside the outer tags
						</\4>			## and the closing tag for the one captured above
						|				## OR
						<(\S+)[^/>]*/>	## a single self-closed tag
					)					## end of OR grouping
				)						## so this group is the entire body of the XML doc.
				\s*						## trailing whitespace
				?						## end of doc
			";	// "(?x)^\s*(<\?xml.*?>)?\s*(<!DOCTYPE.*?(?:\[.*].*?>|.*?>))?\s*((?:<(\S+)[^>]*>.*</\4>|<(\S+)[^/>]*/>))\s*?"

			/* this returns four groups:
				1) the whole XML doc
				2) the XML tag
				3) the doctype tag
				4) the XML payload			
			*/
			stDocParts = REFindNoCase(sRegex, arguments.xmlString, 0, true);

			// might not be possible to not get all four: not sure.
			if (arrayLen(stDocParts.len) ge 2){
				// we've got at least an XML declaration (albeit possibly blank)
				if (stDocParts.len[2]){
					stReturn.xmlDeclaration = mid(arguments.xmlstring, stDocParts.pos[2], stDocParts.len[2]);
				}else{
					stReturn.xmlDeclaration = "";
				}
			}
			if (arrayLen(stDocParts.len) ge 3){
				// ... and a doctype
				if (stDocParts.len[3]){
					stReturn.docType = mid(arguments.xmlstring, stDocParts.pos[3], stDocParts.len[3]);
				}else{
					stReturn.docType = "";
				}
			}
			
			if (arrayLen(stDocParts.len) ge 4){
				// ... and a doc body
				stReturn.doc = trim(mid(arguments.xmlstring, stDocParts.pos[4], stDocParts.len[4]));
			}

			return stReturn;
		</cfscript>
	</cffunction>	

<cffile action="read" file="C:\webroots\shado70047\junk\data_types\xml\testSplitDoc\fbworks.xml" variable="x2">
<cfset s2 = splitDoc(xmlString=x2)>
<cfdump var="#s2#">

