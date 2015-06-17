<cfcomponent hint="Provides Lorem Ipsum data" output="false">

	<cfset init()>

	<cffunction name="init" access="public" returntype="LoremIpsum" output="false" hint="Initialises the data provider">
		<cfset var qparaCount = false>

		<cfquery name="qParaCount" datasource="intranet">
			select	count(lor_id) as paraCount
			from	tbl_loremipsum
		</cfquery>
		<cfset variables.iParaCount = qParaCount.paraCount[1]>

		<cfreturn this>
	</cffunction>


	<cffunction name="getText" returntype="string" access="public" output="false" hint="Gets some Lorem Ipsum from an online RSS feed.">
		<cfargument name="number"	type="numeric"	required="true" hint="Number to generate.">
		<cfargument name="unit"		type="string"	required="false" default="paragraphs" hint="One of <em>paragraphs</em> or <em>words</em>.">

		<cfscript>
			var stData		= structNew();
			var x			= "";
			var sText		= "";
			var lParas		= "";
			var iParaCount	= variables.iParaCount;
			var iRandom		= 0;
			var qParas		= false;
			var iWords		= 0;

			if (not isValid("integer", arguments.number)){
				arguments.number = 1;
			}
		</cfscript>
		<cfif arguments.unit eq "paragraphs">
			<cfscript>
				// generate a list of paras to fetch
				while (listLen(lParas) lt arguments.number){
					iRandom = randRange(1, iParaCount);
					if (not listFind(lParas, iRandom)){
						lParas = listAppend(lParas, iRandom);
					}
				}
			</cfscript>
			<cfquery name="qParas" datasource="intranet">
				select	lor_text
				from	tbl_loremipsum
				where	lor_id in (<cfqueryparam value="#lParas#" cfsqltype="CF_SQL_INTEGER" list="true" null="#not listLen(lParas)#">)
			</cfquery>
			<cfloop query="qParas">
				<cfset sText = sText & "<p>#lor_text#</p>">
			</cfloop>
			<cfreturn sText>
		<cfelseif arguments.unit eq "words">
			<!--- while the number of words we've got is less than the number we've been asked for, keep getting more words from the DB --->
			<cfloop condition="#listLen(sText, ' ')# lt #arguments.number#">
				<cfscript>
					// get a para ID which we've not used yet
					while (listFind(lParas, iRandom)){
						iRandom = randRange(1, iParaCount);
					}
					// remember we've used it.
					lParas = listAppend(lParas, iRandom);
				</cfscript>
				<cfquery name="qParas" datasource="intranet" maxrows="1">
					select	lor_text
					from	tbl_loremipsum
					where	lor_id	= <cfqueryparam value="#iRandom#" cfsqltype="CF_SQL_INTEGER">
					and		rownum	= 1
				</cfquery>
				<!--- grab some words from the para --->
				<cfset sText = sText & " " & listLeft(list=qParas.lor_text[1], elements=arguments.number - listLen(sText, " "), delimiter=" ")>
			</cfloop><!--- if we need more, go get another para --->
		</cfif>
		<cfreturn sText>
	</cffunction>


	<cffunction name="listLeft" access="private" returntype="string" output="false" hint="Returns the first n elements of a list">
		<cfargument name="list" type="string" required="true" hint="List to use">
		<cfargument name="elements" type="numeric" required="true" hint="Number of elements to return">
		<cfargument name="delimiter" type="string" required="false" default="," hint="Delimiter to use">

		<cfscript>
			// this basically sets the nth element to end with a chr(31) (unit separator), and then treats the thing as a chr(31)-delimited list, grabbing the first element

			var cDelim = chr(31);	// unit separator
			if (listLen(arguments.list, arguments.delimiter) le arguments.elements){
				return arguments.list;
			}else{
				arguments.list = listSetAt(arguments.list, arguments.elements, "#listGetAt(arguments.list, arguments.elements, arguments.delimiter)##cDelim#", arguments.delimiter);
				return listFirst(arguments.list, cDelim);
			}
		</cfscript>
	</cffunction>


</cfcomponent>