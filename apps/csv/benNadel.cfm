<cfset sCsvData = fileRead(expandPath("./complex.csv"))>
<cfset a = csvToArray(csv=sCsvData)>
<cfdump var="#a#">


<cffunction
	name="csvToArray"
	access="public"
	returntype="array"
	output="false"
	hint="I take a CSV file or CSV data value and convert it to an array of arrays based on the given field delimiter. Line delimiter is assumed to be new line / carriage return related.">
 
	<!--- Define arguments. --->
	<cfargument
		name="file"
		type="string"
		required="false"
		default=""
		hint="I am the optional file containing the CSV data."
		/>
 
	<cfargument
		name="csv"
		type="string"
		required="false"
		default=""
		hint="I am the CSV text data (if the file argument was not used)."
		/>
 
	<cfargument
		name="delimiter"
		type="string"
		required="false"
		default=","
		hint="I am the field delimiter (line delimiter is assumed to be new line / carriage return)."
		/>
 
	<cfargument
		name="trim"
		type="boolean"
		required="false"
		default="true"
		hint="I flags whether or not to trim the END of the file for line breaks and carriage returns."
		/>
 
	<!--- Define the local scope. --->
	<cfset var local = {} />
 
	<!---
		Check to see if we are using a CSV File. If so, then all we
		want to do is move the file data into the CSV variable. That
		way, the rest of the algorithm can be uniform.
	--->
	<cfif len( arguments.file )>
 
		<!--- Read the file into Data. --->
		<cfset arguments.csv = fileRead( arguments.file ) />
 
	</cfif>
 
	<!---
		ASSERT: At this point, no matter how the data was passed in,
		we now have it in the CSV variable.
	--->
 
	<!---
		Check to see if we need to trim the data. Be default, we are
		going to pull off any new line and carraige returns that are
		at the end of the file (we do NOT want to strip spaces or
		tabs as those are field delimiters).
	--->
	<cfif arguments.trim>
 
		<!--- Remove trailing line breaks and carriage returns. --->
		<cfset arguments.csv = reReplace(
			arguments.csv,
			"[\r\n]+$",
			"",
			"all"
			) />
 
	</cfif>
 
	<!--- Make sure the delimiter is just one character. --->
	<cfif (len( arguments.delimiter ) neq 1)>
 
		<!--- Set the default delimiter value. --->
		<cfset arguments.delimiter = "," />
 
	</cfif>
 
 
	<!---
		Now, let's define the pattern for parsing the CSV data. We
		are going to use verbose regular expression since this is a
		rather complicated pattern.
 
		NOTE: We are using the verbose flag such that we can use
		white space in our regex for readability.
	--->
	<cfsavecontent variable="local.regEx">(?x)
		<cfoutput>
 
			<!--- Make sure we pick up where we left off. --->
			\G
 
			<!---
				We are going to start off with a field value since
				the first thing in our file should be a field (or a
				completely empty file).
			--->
			(?:
 
				<!--- Quoted value - GROUP 1 --->
				"([^"]*+ (?>""[^"]*+)* )"
 
				|
 
				<!--- Standard field value - GROUP 2 --->
				([^"\#arguments.delimiter#\r\n]*+)
 
			)
 
			<!--- Delimiter - GROUP 3 --->
			(
				\#arguments.delimiter# |
				\r\n? |
				\n |
				$
			)
 
		</cfoutput>
	</cfsavecontent>
 
	<!---
		Create a compiled Java regular expression pattern object
		for the experssion that will be parsing the CSV.
	--->
	<cfset local.pattern = createObject(
		"java",
		"java.util.regex.Pattern"
		).compile(
			javaCast( "string", local.regEx )
			)
		/>
 
	<!---
		Now, get the pattern matcher for our target text (the CSV
		data). This will allows us to iterate over all the tokens
		in the CSV data for individual evaluation.
	--->
	<cfset local.matcher = local.pattern.matcher(
		javaCast( "string", arguments.csv )
		) />
 
 
	<!---
		Create an array to hold the CSV data. We are going to create
		an array of arrays in which each nested array represents a
		row in the CSV data file. We are going to start off the CSV
		data with a single row.
 
		NOTE: It is impossible to differentiate an empty dataset from
		a dataset that has one empty row. As such, we will always
		have at least one row in our result.
	--->
	<cfset local.csvData = [ [] ] />
 
	<!---
		Here's where the magic is taking place; we are going to use
		the Java pattern matcher to iterate over each of the CSV data
		fields using the regular expression we defined above.
 
		Each match will have at least the field value and possibly an
		optional trailing delimiter.
	--->
	<cfloop condition="local.matcher.find()">
 
		<!---
			Next, try to get the qualified field value. If the field
			was not qualified, this value will be null.
		--->
		<cfset local.fieldValue = local.matcher.group(
			javaCast( "int", 1 )
			) />
 
		<!---
			Check to see if the value exists in the local scope. If
			it doesn't exist, then we want the non-qualified field.
			If it does exist, then we want to replace any escaped,
			embedded quotes.
		--->
		<cfif structKeyExists( local, "fieldValue" )>
 
			<!---
				The qualified field was found. Replace escpaed
				quotes (two double quotes in a row) with an unescaped
				double quote.
			--->
			<cfset local.fieldValue = replace(
				local.fieldValue,
				"""""",
				"""",
				"all"
				) />
 
		<cfelse>
 
			<!---
				No qualified field value was found; as such, let's
				use the non-qualified field value.
			--->
			<cfset local.fieldValue = local.matcher.group(
				javaCast( "int", 2 )
				) />
 
		</cfif>
 
		<!---
			Now that we have our parsed field value, let's add it to
			the most recently created CSV row collection.
		--->
		<cfset arrayAppend(
			local.csvData[ arrayLen( local.csvData ) ],
			local.fieldValue
			) />
 
		<!---
			Get the delimiter. We know that the delimiter will always
			be matched, but in the case that it matched the end of
			the CSV string, it will not have a length.
		--->
		<cfset local.delimiter = local.matcher.group(
			javaCast( "int", 3 )
			) />
 
		<!---
			Check to see if we found a delimiter that is not the
			field delimiter (end-of-file delimiter will not have
			a length). If this is the case, then our delimiter is the
			line delimiter. Add a new data array to the CSV
			data collection.
		--->
		<cfif (
			len( local.delimiter ) &&
			(local.delimiter neq arguments.delimiter)
			)>
 
			<!--- Start new row data array. --->
			<cfset arrayAppend(
				local.csvData,
				arrayNew( 1 )
				) />
 
		<!--- Check to see if there is no delimiter length. --->
		<cfelseif !len( local.delimiter )>
 
			<!---
				If our delimiter has no length, it means that we
				reached the end of the CSV data. Let's explicitly
				break out of the loop otherwise we'll get an extra
				empty space.
			--->
			<cfbreak />
 
		</cfif>
 
	</cfloop>
 
 
	<!---
		At this point, our array should contain the parsed contents
		of the CSV value as an array of arrays. Return the array.
	--->
	<cfreturn local.csvData />
</cffunction>