<cfset sCsvData = fileRead(expandPath("./complex.csv"))>
<cfset a = CSVtoArray(sCsvData)>
<cfdump var="#a#">
<cfoutput>
<cfif arrayLen(a) NEQ 4>
	FAIL on arrayLen(): #arrayLen(a)#<br />
</cfif>
<!---<cfif listLen(q.columnList) NEQ 3>
	FAIL on columns: #q.columnList#<br />
</cfif>--->
</cfoutput>




<!---
 Converts a CSV file to an array.
 
 @param fileContent 	 Data to be parsed. (Required)
 @param charNewLine 	 New line character. Defaults to chr(13)chr(10) (Optional)
 @return Returns an array. 
 @author Duncan Loxton (&#100;&#117;&#110;&#99;&#97;&#110;&#64;&#115;&#105;&#120;&#102;&#105;&#118;&#101;&#46;&#99;&#111;&#46;&#117;&#107;) 
 @version 1, July 2, 2008 
--->
<cffunction name="CSVtoArray" returntype="array" output="false">

	<cfargument name="FileContent" type="string" required="yes" hint="The contents of a CSV file"/>
	<cfargument name="CharNewLine" required="no" hint="The line delimiter" default="#chr(13)##chr(10)#"/>

	<cfset var LineCount=0>
	<cfset var fileLined = arrayNew(1)>
	<cfset var Line = "">
	<cfset var Full_Word = "">
	<cfset var Quote_Search = False>
	<cfset var Value_Array = "">
	<cfset var Word = "">
	<cfset var Quote_Count = 0>
	<cfset var Search_Word = '"'>
	<cfset var temp = "">
	<cfset var LineList = "">

	<cfloop index="Line" list="#arguments.FileContent#" delimiters="#arguments.CharNewLine#">

		<cfset LineCount=LineCount+1>

		<cfif len(trim(Line)) and left(Line,2) neq ',,'>

			<!--- Initialising variables --->

			<cfset Full_Word = "">

			<!--- Putting a pair of double quotes at the first and last position if there is no data
				  also in between if field is empty --->

			<cfset Line=Replace(Line,   ",,", ","""",", "all")>
			<cfset Line=Replace(Line,   ",,", ","""",", "all")>
			<cfset Line=ReReplace(Line, "^,", """"",",  "all")>
			<cfset Line=ReReplace(Line, ",$", ",""""",  "all")>

			<cfset Quote_Search =False>
			<cfset Value_Array = ArrayNew(1)>

			<!--- Loop for each field data separated by comma --->

			<cfloop index="Word" list="#Line#" delimiters=",">

				<!--- Checking for first character whether it is double quote or not.
					  If it is double quote then check how many double quotes are in this word.
					  If odd then add it to next elements, else add it to array --->

				<cfif left(trim(Word),1) eq '"' or Quote_Search>

					<cfset Full_Word = Full_Word & Word>

					<!--- Initilizing Quote_Count --->

					<cfset Quote_Count = 0>
					<cfset Search_Word = """">

					<!--- Script for calculating number of double quote in Full_Word variable--->

					<cfscript>
						for(i=1; i LTE len(Full_Word); i = i + 1)
						{
							if(mid(Full_Word, i, len(Search_Word)) EQ Search_Word)
							{
								Quote_Count = Quote_Count + 1;
							}
						}
					</cfscript>

					<cfif (Quote_Count MOD 2) EQ 0>
						<cfset Full_Word=Replace(Full_Word, ",", "|", "all")>
						<cfset temp = ArrayAppend(Value_Array,replace(mid(Full_Word,2,len(Full_Word) - 2),"""""","""","all"))>
						<cfset Quote_Search = false>
						<cfset Full_Word = "">
					<cfelse>
						<cfset Quote_Search = true>
						<cfset Full_Word = Full_Word & ",">
					</cfif>

				<cfelse>

					<cfset temp = ArrayAppend(Value_Array, Word)>

				</cfif>

			</cfloop>

			<cfset LineList=ArrayToList(Value_Array)>

			<cfset LineList=Replace(LineList,   ",,", ","""",", "all")>
			<cfset LineList=Replace(LineList,   ",,", ","""",", "all")>
			<cfset LineList=ReReplace(LineList, "^,", """"",",  "all")>
			<cfset LineList=ReReplace(LineList, ",$", ",""""",  "all")>

			<!--- put what we know into an array --->
			<cfset fileLined[LineCount] = ArrayNew(1)>

			<cfloop from="1" to="#ListLen(LineList)#" index="j">
				<cfif ListLen(LineList) ge j>
					<cfset fileLined[LineCount][j] = trim(Replace(Replace(ListGetAt(LineList,j), '""', ''), '|', ',', 'all'))>
				</cfif>
			</cfloop>


		</cfif>

	</cfloop>

	<cfreturn fileLined>

</cffunction>
