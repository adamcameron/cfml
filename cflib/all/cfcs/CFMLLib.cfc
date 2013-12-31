<cfcomponent>

<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<!---
 Mimics the cfabort tag.
 
 @param showError 	 An error to throw. (Optional)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 16, 2002 
--->
<cffunction name="abort" output="false" returnType="void">
	<cfargument name="showError" type="string" required="false">
	<cfif isDefined("showError") and len(showError)>
		<cfthrow message="#showError#">
	</cfif>
	<cfabort>
</cffunction>

<cfscript>
/**
 * CFML implementation of Array.reduce()
 * v1.0 by Adam Cameron with assistance from Adam Tuttle and Russ Spivey
 * 
 * @param array 	 Array to reduce (Required)
 * @param callback 	 Callback function to use to reduce. Will receive the following arguments: element (of current iteration of the all), index, array, (optional) result (of preceeding call to callback()) (Required)
 * @return The result of the reduction. Can be any data type 
 * @author Adam Cameron (dac.cfml@gmail.com) 
 * @version 1.0, July 31, 2013 
 */
public any function arrayReduce(required array array, required any callback, any initialValue){
    var startIdx = 1;
    if (!structKeyExists(arguments, "initialValue")){
        if (arrayLen(array) > 0){
            var result = callback(array[1], 1, array);
            startIdx = 2;
        }else{
            return;
        }
    }else{
        var result = initialValue;
    }
    for (var i=startIdx; i <= arrayLen(array); i++){
        result = callback(array[i], i, array, result);
    }
    return result;
}
</cfscript>

<cfscript>
/**
 * Mimics the functionality of JavaScript Splice() method
(https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Array/splice)
 * version 0.1 by Joshua Miller
 * version 1.0 by Adam Cameron - reworking so it more closely emulates its Javascript namesake
 * 
 * @param array 	 The array to splice. (Required)
 * @param index 	 Index at which to start changing the array. If negative, will begin that many elements from the end. (Required)
 * @param howMany 	 An integer indicating the number of old array elements to remove. If howMany is 0, no elements are removed. In this case, you should specify at least one new element. If no howMany parameter is specified (second syntax above, which is a SpiderMonkey extension), all elements after index are removed. (Required)
 * @return The updated array. 
 * @author Joshua Miller (joshuamil@gmail.com) 
 * @version 1, July 24, 2012 
 */
function arraySplice(array, index, howMany) {
	var i = 0;
	
	// If negative, will begin that many elements from the end	
	if (index <= 0){
		index = arrayLen(array) + (index + 1);
	}

	// get rid of however many they specify
	for (i=1; i LE howMany; i++){
		if (index LE arrayLen(array)){
			arrayDeleteAt(array, index);
		}
	}

	for (i=4; i LE arrayLen(arguments); i++){
		if (index GE arrayLen(array)){
			arrayAppend(array, arguments[i]);
			index++;
		}else{
			arrayInsertAt(array, index+(i-4), arguments[i]);
		}
	}

	return array;
}
</cfscript>

<cfscript>
/**
 * Will recast a query column to a different datatype.
 * 
 * @param qry 	 Query to modify. (Required)
 * @param column 	 Column to modify. (Required)
 * @param datatype 	 Data type to convert to. (Required)
 * @return Returns a query. 
 * @author James Moberg (james@ssmedia.com) 
 * @version 1, June 14, 2011 
 */
function castQueryColumn(qry, column, datatype) {
	var columnData = arrayNew(1);
	var ii = "";
	var loop_len = arguments.qry.recordcount;
	var columnNames = arraytoList(arguments.qry.getMetaData().getColumnLabels());
	var qoq = new Query();
	var newQry = new Query();
	var javatype = '';
	
	datatype = lcase(datatype);

	if (Listfindnocase(columnNames, arguments.column) IS 0) {return arguments.qry;}

	switch(datatype){
		case "integer": {javatype = "int"; break;}
		case "bigint": {javatype = "long"; break;}
		case "decimal": {javatype = "BigDecimal"; break;}
		case "varchar": {javatype = "string"; break;}
		case "binary": {javatype = "byte"; break;}
		case "bit": {javatype = "boolean"; break;}
		default: {javatype = "string"; break;}
	}

	for (ii=1; ii lte loop_len; ii=ii+1) {
		if (isNull(arguments.qry[arguments.column][ii])) {
			arrayAppend(columnData, arguments.qry[arguments.column][ii]);
		} else if (listfindnocase("date,time", datatype) AND ISDate(arguments.qry[arguments.column][ii])) {	
			arrayAppend(columnData, parsedatetime(arguments.qry[arguments.column][ii]));	
		} else if (listfind("int,long,float,BigDecimal,string,byte,boolean", javatype)){
			arrayAppend(columnData, JavaCast(javatype, arguments.qry[arguments.column][ii]));	
		} else {
			arrayAppend(columnData, arguments.qry[arguments.column][ii]);	
		}
	}

  columnNames = ListDeleteAt(columnNames, Listfindnocase(columnNames, column));
  qoq.setAttributes(QoQsrcTable = arguments.qry);
  newQry = qoq.execute(sql="select #columnNames# from QoQsrcTable", dbtype="query");
  newQry = newQry.getResult();

  QueryAddColumn(newQry, column, datatype, columnData);

  return newQry;

}
</cfscript>

<!---
 Converts a feed of lorem ipsum text into a string for output.
 
 @param isFormatted 	 strips lorem ipsum text of punctuation and uppercase (Optional)
 @return returns a string 
 @author Bret Feddern (bret@bricecheddarn.com) 
 @version 0, April 29, 2010 
--->
<cffunction name="cfLipsum" output="no" returntype="string" displayname="cfLipsum" hint="get a lorem ipsum string from lipsum.com">
	<cfargument name="isFormatted" type="numeric" required="no" default="1" />

	<cfset var theXML = "" />
	<cfset var theGrab = "" />
	<cfset var theLipsum = "" />
	<cfset var theLipsumFeed = "http://www.lipsum.com/feed/xml" />
	
	<!--- get the xml feed --->
	<cfhttp url="#theLipsumFeed#" method="get" resolveUrl="false" />
	
	<!--- parse and search xml for lorem ipsum --->
	<cfset theXML = XMLParse(cfhttp.filecontent) />
	<cfset theGrab = XMLSearch(theXML, "/feed") />
	
	<!--- only one lorem ipsum element in the feed --->
	<cfset theLipsum = theGrab[1].lipsum.xmltext />
	
	<!--- strips lorem ipsum text of punctuation and uppercase --->
	<cfif arguments.isFormatted neq 1>
		<cfset theLipsum = lcase(rereplacenocase(theLipsum, "[^a-z0-9 ]", "", "all")) />
	</cfif>
	
	<cfreturn theLipsum />
</cffunction>

<cfscript>
/**
 * Creates functions for event-handling in CFML
 * v1.0 by Adam Cameron
 * 
 * @return A struct containing functions on(), off() and trigger() 
 * @author Adam Cameron (dac.cfml@gmail.com) 
 * @version 1.0, December 5, 2013 
 */
function createEventObject(){
	var eventContainer = {};
	return {
		on = function(required string event, required function handler, struct data={}){
			if (!structKeyExists(eventContainer, event)){
				eventContainer[event] = [];
			}
			arrayAppend(eventContainer[event], arguments);
		},
		trigger = function(required string event, struct additionalParameters={}){
			if (structKeyExists(eventContainer, event)){
				for (eventEntry in eventContainer[event]){
					var eventObj = {
						event = event,
						data = eventEntry.data
					};
					eventEntry.handler(event=eventObj, argumentCollection=additionalParameters);
				}
			}
		},
		off = function(required string event){
			structDelete(eventContainer, event);
		}
	};
}
</cfscript>

<cfscript>
/**
 * Returns a localised version of dayOfWeekAsInteger() (http://www.cflib.org/udf/dayOfWeekAsInteger)
 * v1.0 by Adam Cameron
 * 
 * @param locale 	 The locale to use when localising the returned function (Required)
 * @param iso 	 Whether to consider Sunday day 1 (default in CFML) or 7 (ISO standard) (Optional)
 * @return A function which performed localised dayOfWeekAsInteger() operations 
 * @author Adam Cameron (dac.cfml@gmail.com) 
 * @version 1.0, December 8, 2013 
 */
function function createLocalisedDayOfWeekAsInteger(required string locale, boolean iso=false){
	var supportedLocales = SERVER.coldfusion.supportedLocales;
	if (!listFindNoCase(supportedLocales, locale)){
		throw(type="InvalidLocaleException", message="Invalid locale value specified", detail="Locale must be one of #supportedLocales#");
	}
	var baseDate = createDate(1972, 1, iso ? 31:30); // ie: in ISO mode, start on Mon. Otherwise CF mode: Sun
	var days = "";
	for (var i=0; i < 7; i++){
		days = listAppend(days, lsDateFormat(dateAdd("d", i, baseDate), "dddd", locale));
	}

	return function(required string day){
		var index = listFindNoCase(days, day);
		if (index){
			return index;
		}
		throw(type="ArgumentOutOfRangeException", message="Invalid day value", detail="day argument value (#day#) must be one of #days#");
	};
}
</cfscript>

<cfscript>
/**
 * Removes duplicate values from an array.
 * 
 * @param inputArray 	 Array to dedupe. (Required)
 * @return Returns an array. 
 * @author Dave Anderson (the.one.true.dave.anderson@gmail.com) 
 * @version 1, April 26, 2012 
 */
public array function deDupeArray(required array inputArray) {
	local.arrList = arrayToList(inputArray);
	local.retArr = inputArray;
	for (local.i = arrayLen(inputArray);i gte 1;i=i-1) {
		if (listValueCountNoCase(arrList,inputArray[i]) gt 1) {
			arrayDeleteAt(retArr,i);
			arrList = arrayToList(retArr);
		}
	}
	return retArr;
}
</cfscript>

<!---
 Mimics the cfdirectory, action=&quot;create&quot; command.
 
 @param directory 	 Name of directory to create. (Required)
 @param mode 	 Mode to apply to directory. (Optional)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="directoryCreate" output="false" returnType="void">
	<cfargument name="directory" type="string" required="true">
	<cfargument name="mode" type="string" required="false" default="">
	<cfif len(mode)>
		<cfdirectory action="create" directory="#directory#" mode="#mode#">
	<cfelse>
		<cfdirectory action="create" directory="#directory#">
	</cfif>
</cffunction>

<!---
 Mimics the cfdirectory tag, action=&quot;delete&quot; command.
 
 @param directory 	 The directory to delete. (Required)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="directoryDelete" output="false" returnType="void">
	<cfargument name="directory" type="string" required="true">
	<cfdirectory action="delete" directory="#directory#">
</cffunction>

<!---
 Mimics the cfdirectory, action=&quot;list&quot; command.
 Updated with final CFMX var code.
 Fixed a bug where the filter wouldn't show dirs.
 
 @param directory 	 The directory to list. (Required)
 @param filter 	 Optional filter to apply. (Optional)
 @param sort 	 Sort to apply. (Optional)
 @param recurse 	 Recursive directory list. Defaults to false. (Optional)
 @return Returns a query. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, April 8, 2004 
--->
<cffunction name="directoryList" output="false" returnType="query">
	<cfargument name="directory" type="string" required="true">
	<cfargument name="filter" type="string" required="false" default="">
	<cfargument name="sort" type="string" required="false" default="">
	<cfargument name="recurse" type="boolean" required="false" default="false">
	<!--- temp vars --->
	<cfargument name="dirInfo" type="query" required="false">
	<cfargument name="thisDir" type="query" required="false">
	<cfset var path="">
    <cfset var temp="">
	
	<cfif not recurse>
		<cfdirectory name="temp" directory="#directory#" filter="#filter#" sort="#sort#">
		<cfreturn temp>
	<cfelse>
		<!--- We loop through until done recursing drive --->
		<cfif not isDefined("dirInfo")>
			<cfset dirInfo = queryNew("attributes,datelastmodified,mode,name,size,type,directory")>
		</cfif>
		<cfset thisDir = directoryList(directory,filter,sort,false)>
		<cfif server.os.name contains "Windows">
			<cfset path = "\">
		<cfelse>
			<cfset path = "/">
		</cfif>
		<cfloop query="thisDir">
			<cfset queryAddRow(dirInfo)>
			<cfset querySetCell(dirInfo,"attributes",attributes)>
			<cfset querySetCell(dirInfo,"datelastmodified",datelastmodified)>
			<cfset querySetCell(dirInfo,"mode",mode)>
			<cfset querySetCell(dirInfo,"name",name)>
			<cfset querySetCell(dirInfo,"size",size)>
			<cfset querySetCell(dirInfo,"type",type)>
			<cfset querySetCell(dirInfo,"directory",directory)>
			<cfif type is "dir">
				<!--- go deep! --->
				<cfset directoryList(directory & path & name,filter,sort,true,dirInfo)>
			</cfif>
		</cfloop>
		<cfreturn dirInfo>
	</cfif>
</cffunction>

<!---
 Mimics the cfdirectory, action=&quot;rename&quot; command.
 
 @param directory 	 Directory to rename. (Required)
 @param newDirectory 	 New name for directory. (Required)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="directoryRename" output="false" returnType="void">
	<cfargument name="directory" type="string" required="true">
	<cfargument name="newDirectory" type="string" required="true">
	<cfdirectory action="rename" directory="#directory#" newDirectory="#newDirectory#">
</cffunction>

<!---
 Mimics the cfdump tag.
 Updated for final cfmx var scope - also, we only redo var if size bigger than top.
 
 @param var 	 The variable to dump. (Required)
 @param expand 	 Expand output. Defaults to true. (Optional)
 @param label 	 Label for dump. (Optional)
 @param top 	 Restricts output based on type. If array or query, top will represent the number of rows to show. If structure, will show this many keys. (Optional)
 @return Returns a string. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, October 16, 2002 
--->
<cffunction name="dump" returnType="string">
	<cfargument name="var" type="any" required="true">
	<cfargument name="expand" type="boolean" required="false" default="true">
	<cfargument name="label" type="string" required="false" default="">
	<cfargument name="top" type="numeric" required="false">
	
	<!--- var --->
    <cfset var type = "">
    <cfset var tempArray = arrayNew(1)>
    <cfset var temp_x = 1>
    <cfset var tempStruct = structNew()>
	<cfset var orderedKeys = "">
	<cfset var tempQuery = queryNew("")>
	<cfset var col = "">
	
	<!--- do filtering if top ---->
	<cfif isDefined("top")>
	
		<cfif isArray(var)>
			<cfset type = "array">
		</cfif>
		<cfif isStruct(var)>
			<cfset type="struct">
		</cfif>
		<cfif isQuery(var)>
			<cfset type="query">
		</cfif>
		
		<cfswitch expression="#type#">
		
			<cfcase value="array">
				<cfif arrayLen(var) gt top>
					<cfloop index="temp_x" from=1 to="#Min(arrayLen(var),top)#">
						<cfset tempArray[temp_x] = var[temp_x]>
					</cfloop>
					<cfset var = tempArray>
				</cfif>
			</cfcase>
			
			<cfcase value="struct">
				<cfif listLen(structKeyList(var)) gt top>
					<cfset orderedKeys = listSort(structKeyList(var),"text")>
					<cfloop index="temp_x" from=1 to="#Min(listLen(orderedKeys),top)#">
						<cfset tempStruct[listGetAt(orderedKeys,temp_x)] = var[listGetAt(orderedKeys,temp_x)]>
					</cfloop>
					<cfset var = tempStruct>
				</cfif>
			</cfcase>
			
			<cfcase value="query">
				<cfif var.recordCount gt top>
					<cfset tempQuery = queryNew(var.columnList)>
					<cfloop index="temp_x" from=1 to="#min(var.recordCount,top)#">
						<cfset queryAddRow(tempQuery)>
						<cfloop index="col" list="#var.columnList#">
							<cfset querySetCell(tempQuery,col,var[col][temp_x])>
						</cfloop>
					</cfloop>
					<cfset var = tempQuery>
				</cfif>
			</cfcase>
			
		</cfswitch>
		
	</cfif>
	
	<cfdump var="#var#" expand="#expand#" label="#label#">
</cffunction>

<!---
 Mimics the cfexecute tag.
 Updated for CFMX var scope.
 
 @param name 	 Program to execute. (Required)
 @param args 	 Args to pass. Can be string or array. (Optional)
 @param timeout 	 Time to wait for program execution. (Optional)
 @param outputFile 	 File to save results. (Optional)
 @return Returns a string. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 16, 2002 
--->
<cffunction name="execute" output="false" returnType="string">
	<cfargument name="name" type="string" required="true">
	<cfargument name="args" type="any" required="false" default="">
	<cfargument name="timeout" type="string" required="false" default="0">
	<cfargument name="outputfile" type="string" required="false" default="">

	<cfset var result = "">
	
	<cfsavecontent variable="result">
		<cfif len(outputFile)>
			<cfexecute name="#name#" arguments="#args#" timeout="#timeout#" outputfile="#outputfile#"/>
		<cfelse>
			<cfexecute name="#name#" arguments="#args#" timeout="#timeout#"/>
		</cfif>
	</cfsavecontent>
	<cfreturn result>
</cffunction>

<!---
 Mimics the cffile, action=&quot;append&quot; command.
 
 @param file 	 The file to append. (Required)
 @param output 	 The data to append. (Required)
 @param mode 	 Defines permissions for a file on non-Windows systems. (Optional)
 @param addNewLine 	 If true, a new line character is added to output. (Optional)
 @param attributes 	 File attributes. (Optional)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="fileAppend" output="false" returnType="void">
	<cfargument name="file" type="string" required="true">
	<cfargument name="output" type="string" required="true">
	<cfargument name="mode" type="string" default="" required="false">
	<cfargument name="addNewLine" type="boolean" default="yes" required="false">
	<cfargument name="attributes" type="string" default="" required="false">
	<cfif mode is "">
		<cffile action="append" file="#file#" output="#output#" addNewLine="#addNewLine#" attributes="#attributes#">	
	<cfelse>
		<cffile action="append" file="#file#" output="#output#" mode="#mode#" addNewLine="#addNewLine#" attributes="#attributes#">	
	</cfif>
</cffunction>

<!---
 Mimics the cffile, action=&quot;copy&quot; command.
 Will not work in CF8.
 
 @param source 	 Source file to copy. (Required)
 @param destination 	 Path to copy file to. (Required)
 @param mode 	 Defines permissions for a file on non-Windows systems. (Optional)
 @param attributes 	 File attributes. (Optional)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, September 18, 2007 
--->
<cffunction name="fileCopy" output="false" returnType="void">
	<cfargument name="source" type="string" required="true">
	<cfargument name="destination" type="string" required="true">
	<cfargument name="mode" type="string" default="" required="false">
	<cfargument name="attributes" type="string" default="" required="false">
	<cfif len(mode)>
		<cffile action="copy" source="#source#" destination="#destination#" mode="#mode#">
	<cfelse>
		<cffile action="copy" source="#source#" destination="#destination#" attributes="#attributes#">
	</cfif>
</cffunction>

<!---
 Mimics the cffile, action=&quot;delete&quot; command.
 
 @param file 	 The file to delete. (Required)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="fileDelete" output="false" returnType="void">
	<cfargument name="file" type="string" required="true">
	<cffile action="delete" file="#file#">	
</cffunction>

<!---
 Returns information about a file.
 Updated for CMFX var scope.
 
 @param fileName 	 File to inspect. (Required)
 @return Returns a query. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="fileInfo" output="false" returntype="query">
	<cfargument name="fileName" type="string" required="true">

	<cfset var directory = "">
	<cfset var getFile = queryNew("")>
	
	<cfif not fileExists(fileName)>
		<cfthrow message="fileInfo error: #fileName# does not exist.">
	</cfif>
	<cfset directory = getDirectoryFromPath(fileName)>
	<cfdirectory name="getFile" directory="#directory#" filter="#getFileFromPath(fileName)#">
	<cfreturn getFile>
</cffunction>

<!---
 Mimics the cffile, action=&quot;move&quot; command.
 
 @param source 	 Souce file to move. (Required)
 @param destination 	 Path to move file to. (Required)
 @param mode 	 Defines permissions for a file on non-Windows systems. (Required)
 @param attributes 	 File attributes. (Optional)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="fileMove" output="false" returnType="void">
	<cfargument name="source" type="string" required="true">
	<cfargument name="destination" type="string" required="true">
	<cfargument name="mode" type="string" default="" required="false">
	<cfargument name="attributes" type="string" required="false" default="">
	<cfif len(mode)>
		<cffile action="move" source="#source#" destination="#destination#" mode="#mode#">
	<cfelse>
		<cffile action="move" source="#source#" destination="#destination#" attributes="#attributes#">
	</cfif>	
</cffunction>

<!---
 Mimics the cffile, action=&quot;write&quot; command.
 
 @param file 	 The file to write to. (Required)
 @param output 	 The data to write. (Required)
 @param mode 	 Defines permissions for a file on non-Windows systems. (Optional)
 @param addNewLine 	 If true, a new line character is added to output. (Optional)
 @param attributes 	 File attributes. (Optional)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="fileWrite" output="false" returnType="void">
	<cfargument name="file" type="string" required="true">
	<cfargument name="output" type="string" required="true">
	<cfargument name="mode" type="string" default="" required="false">
	<cfargument name="addNewLine" type="boolean" default="yes" required="false">
	<cfargument name="attributes" type="string" default="" required="false">
	<cfif mode is "">
		<cffile action="write" file="#file#" output="#output#" addNewLine="#addNewLine#" attributes="#attributes#">	
	<cfelse>
		<cffile action="write" file="#file#" output="#output#" mode="#mode#" addNewLine="#addNewLine#" attributes="#attributes#">	
	</cfif>
</cffunction>

<!---
 Mimics the CFFLUSH tag and sends all content to the screen.
 Version 2 by RCamden (ray@camdenfamily.com)
 
 @param interval 	 Flushes output each time this number of bytes becomes available. (Required)
 @return Returns nothing. 
 @author Eric C. Davis (cflib@10mar2001.com) 
 @version 2, April 22, 2003 
--->
<cffunction name="flush" returnType="void">
	<cfargument name="interval"  type="numeric" required="false">
	<cfif isDefined("interval")>
		<cfflush interval="#interval#">
	<cfelse>
		<cfflush>
	</cfif>
</cffunction>

<!---
 Returns a struct with the bank holidays of Germany
 
 @param iYear 	 Defaults to current year (Optional)
 @return Returns a struct 
 @author Sigi Heckl (siegfried.heckl@siemens.com) 
 @version 0, March 13, 2011 
--->
<cffunction name="getBankHolidays" access="public" output="false" returntype="struct" hint="general bank holidays for DE">
  <cfargument name="iYear" type="numeric" default="#datepart('yyyy',now())#" hint="year for calculation" />

    //definition of constant holidays
    <cfset var strResult = {newyear     = createDate(arguments.iYear,1,1),
                            dayOfWork   = createDate(arguments.iYear,5,1),
                            christmas1  = createDate(arguments.iYear,12,25),
                            christmas2  = createDate(arguments.iYear,12,26),
                            nationalDay = createDate(arguments.iYear,10,3)
                           } />
    <cfset var local     = {} />

    //easter formula to get variable holidays
    <cfset local.k  = round(arguments.iYear / 100) />
    <cfset local.m  = 15 + round((3*local.k +3)/4) - round((8*local.k+13)/25) />
    <cfset local.s  = 2 - round((3*local.k+3)/4) />
    <cfset local.a  = arguments.iYear mod 19 />
    <cfset local.d  = (19*local.a+local.m) mod 30 />
    <cfset local.r  = round((local.d + round(local.a/11))/29) />
    <cfset local.og = 21 + local.d - local.r />
    <cfset local.sz = 7 - (arguments.iYear + round(arguments.iYear/4) + local.s) mod 7 />
    <cfset local.oe = 7 - (local.og-local.sz) mod 7 />
    <cfset local.os = local.og + local.oe />
    <cfset local.om = 3 />
    <cfif local.os GT 31>
      <cfset local.os = local.os - 31 />
      <cfset local.om = 4 />
    </cfif>

    <cfset local.easterSunday    = createDate(arguments.iYear, local.om, local.os) />
    <cfset strResult.osterMonday = dateAdd('d',1,local.easterSunday) />
    <cfset strResult.goodFriday  = dateAdd('d',-2,local.easterSunday) />
    <cfset strResult.whitsun     = dateAdd('d',50,local.easterSunday) />
    <cfset strResult.ascension   = dateAdd('d',39,local.easterSunday) />

    <CFRETURN strResult />
</cffunction>

<!---
 Returns the requested percentile()
 v0.9 by Dan Bracuk
 v1.0 by Adam Cameron. Adjusting slightly to more-closely replicate the Excel functions
 
 @param values 	 Array of numeric values to return percentile for. (Required)
 @param percentile 	 Percentile to calculate (0-100). (Required)
 @param inclusive 	 Whether to perform an inclusive (percentile()) or exclusive (percentile.exc()) calculation. Will throw a PercentileOutOfBounds exception if using exclusive percentile and 'percentile' falls outwith 1/(n+1) and n/(n+1), where 'n' is the length of the values array. (Optional)
 @return Returns a numeric that is the specified percentile score given the values in the passed-in array. 
 @author Dan Bracuk (bracuk@pathcom.com) 
 @version 1.0, November 21, 2012 
--->
<cffunction name="getExcelPercentile" returntype="numeric" output="false" hint="Equivalent to the MS Excel percentile() / percentile.exc() functions.">
	<cfargument name="values" type="array" required="true" hint="Array of numeric values to return percentile for.">
	<cfargument name="percentile" type="numeric" required="true" hint="Percentile to calculate (0-100).">
	<cfargument name="inclusive" type="boolean" required="false" default="true" hint="Whether to perform an inclusive (percentile()) or exclusive (percentile.exc()) calculation. Will throw a PercentileOutOfBounds exception if using exclusive percentile and 'percentile' falls outwith 1/(n+1) and n/(n+1), where 'n' is the length of the values array.">

	<cfscript>
		var rangeArray = arguments.values;
		var rangePoint = 0;
		var integerPart = 0;
		var decimalPart = 0;
		var returnValue = 0;
		var pctile = arguments.percentile * .01;
		var numberOfValues = arrayLen(arguments.values);

		arraySort(rangeArray, "numeric");

		if (!inclusive) {
			rangePoint = (numberOfValues - 1) * pctile + 1;
		}
		else {
			rangePoint = (numberOfValues + 1) * pctile;
		}

		if (rangePoint > numberOfValues || rangePoint < 1){
			throw(type="PercentileOutOfBounds", message="Percentile out of bounds", detail="PERCENTILE falls outwith 1/(n+1) and n/(n+1), where 'n' is the length of the VALUES array.");
		}

		if (rangePoint > numberOfValues) {
			rangePoint = numberOfValues;
		}
		else if (rangePoint < 1) {
			rangePoint = 1;
		}

		// if rangePoint is an integer, return that array element
		if (round(rangePoint) == rangePoint) {
			returnValue = rangeArray[rangePoint] ;
		}
		else {
			integerPart = int(rangePoint);
			decimalPart = rangePoint - integerPart;
			returnValue = rangeArray[integerPart] + decimalPart * (rangeArray[integerPart + 1] - rangeArray[integerPart]);
		}
		return returnValue;
	</cfscript>
</cffunction>

<cfscript>
/**
 * UTF8-aware implementation of getProfileSections()
 * * version 0.1 by Reinhard Jung
 * * version 1.0 by Adam Cameron - convert into single UDF &amp; mirror usage of getProfileSections()
 * * version 1.1 by Adam Cameron (with help from Simon Baynes).  Removing debug code; correcting fileClose() behaviour
 * 
 * @param iniPath 	 Full path to ini file to parse. (Required)
 * @return Struct keyed by profile section, the values being comma-delimited lists of section entries 
 * @author Reinhard Jung (reinhard.jung@gmail.com) 
 * @version 1, July 27, 2012 
 */
function getProfileSectionsUTF8(iniPath) {
	var iniFile			= "";
	var line			= "";
	var profileSections = structNew();
	var thisSection		= "";

	try {
		iniFile = fileOpen(iniPath, "read", "UTF-8");
		line	= "";
		
		while (!fileIsEOF(iniFile)) {
			line = FileReadLine(iniFile);

			findSection = reFind("^\s*\[([^\]]+)\]", line, 1, true);	// eg: [sectionName]
			if (arrayLen(findSection.pos) gt 1){	// we're in a section
				thisSection = mid(line, findSection.pos[2], findSection.len[2]);
				profileSections[thisSection] = "";
				continue;
			}

			if (listLen(line, "=")){	// ie: not empty
				profileSections[thisSection] = listAppend(profileSections[thisSection], listFirst(line, "="));
			}			
		}
	}
	finally {
		if (iniFile != ""){	// assuming it's not its default value, it's safe to assume it's a file handle
			fileClose(iniFile);
		}
	}
	return profileSections;
}
</cfscript>

<cfscript>
/**
 * Unicode language translator ((UTF-8))
 * version 0.1 by Pyae Phyoe Shein
 * version 1.0 by Adam Cameron - code tidy &amp; return a value rather than output it.  Added support for sections, as per getProfileString(). Make function usage analogous to getProfileString()
 * 
 * @param iniPath 	 Full path to ini file to parse. (Required)
 * @param section 	 Section of the ini file to parse. (Optional)
 * @param entry 	 Entry within that section to return value of. (Optional)
 * @return Returns the value of the entry if found, otherwise an empty string 
 * @author Pyae Phyoe Shein (pyaephyoeshein@gmail.com) 
 * @version 1.0, July 24, 2012 
 */
function getProfileStringUTF8(iniPath, section, entry) {
	var iniFile		= "";
	var line		= "";
	var inSection	= false;

	section		= "[#section#]";
	
	try {
		iniFile = fileOpen(iniPath, "read", "UTF-8");
		line	= "";
		
		// scan the file for the section
		while (!fileIsEOF(iniFile)) {
			line = FileReadLine(iniFile);

			// keep track if we've found the correct section
			if (line == section){
				inSection = true;
				continue;
			}
			
			// if we're in the correct section and we find a match, we're done: return its value
			if (inSection && listFirst(line, "=") == entry){
				return listRest(line, "=");
			}
			
			// if we get to another section, then we didn't find the match: exit
			if (inSection && reFind("^\s*\[[^\]]+\]", line)){
				return "";
			}
		}
	}
	catch (any e){
		rethrow;
	}
	finally {
		fileClose(iniFile);
	}
	// we got to the end of the file and didn't find it
	return "";
}
</cfscript>

<cfscript>
/**
 * Gets the difference between the largest and smallest values in a given data set (statistics)
 * v0.9 by Rodell Basalo
 * v1.0 by Adam Cameron (simplified logic)
 * 
 * @param samples 	 Array of values to return range for (Required)
 * @return Returns a numeric value that is the range of the samples 
 * @author Rodell Basalo (delroekid@gmail.com) 
 * @version 1.0, July 25, 2013 
 */
numeric function getRange(required array samples){
	if (arrayIsEmpty(arguments.samples)){
		throw(type="IllegalArgumentException", message="sample argument is empty", detail="The sample array must contain at least one element");
	}
	return arrayMax(arguments.samples) - arrayMin(arguments.samples);
}
</cfscript>

<cfscript>
/**
 * Calculates geodetic distance between two points specified by latitude/longitude using Vincenty inverse formula for ellipsoids: http://www.movable-type.co.uk/scripts/latlong-vincenty.html
 * version 0.1 by Stephen Withington
 * version 1.0 by Adam Cameron: throwing exceptions for error conditions instead of returning invalid strings
 * 
 * @param lat1 	 Latitude of first point as a decimal (Required)
 * @param lon1 	 Longitude of first point as a decimal (Required)
 * @param lat2 	 Latitude of second point as a decimal (Required)
 * @param lon2 	 Longitude of second point as a decimal (Required)
 * @param units 	 Units of measure, one of: m (metres, default), km (kilometres),sm (statutory miles), nm (nautical miles), yd (yards), ft (feet), in (inches), cm (centimetres), mm (millimetres). (Optional)
 * @return Returns a numeric value that is the distance between the two points 
 * @author Stephen Withington (stephenwithington@gmail.com) 
 * @version 1, August 26, 2012 
 */
numeric function getVincentyDistance(required numeric lat1, required numeric lon1, required numeric lat2, required numeric lon2, string units="m" ) {
	// WGS-84 ellipsoid params
	var a = 6378137;
	var b = 6356752.314245;
	var f = 1 / 298.257223563;

	var L = ( lon2 - lon1 ) * pi() / 180;
	var U1 = atn( ( 1 - f ) * tan( lat1 * pi() / 180 ) );
	var U2 = atn( ( 1 - f ) * tan( lat2 * pi() / 180 ) );
	var sinU1 = sin( U1 );
	var cosU1 = cos( U1 );
	var sinU2 = sin( U2 );
	var cosU2 = cos( U2 );
	var lambda = L;
	var lambdaP = '';
	var iterLimit = 100;
	var sinLambda = '';
	var cosLambda = '';
	var sinSigma = '';
	var cosSigma = '';
	var sigma = '';
	var sinAlpha = '';
	var cosSqAlpha = '';
	var cos2SigmaM = '';
	var C = '';
	var uSq = '';
	var AA = '';
	var BB = '';
	var deltaSigma = '';
	var s = '';
	var Math = createObject( 'java', 'java.lang.Math' );

	if ( lat1 > 90 || lat1 < -90 || lon1 > 180 || lon1 < -180 || lat2 > 90 || lat2 < -90 || lon2 > 180 || lon2 < -180 ) {
		throw(
			type	= "InvalidCoordinatesException",
			message	= "Invalid coordinates",
			detail	= "Latitude must be between 0deg and +/-90deg. (south latitude is negative). Longitude must be between 0deg and +/-180deg. (west longitude is negative)"
		);
	};

	if ( not structKeyExists( arguments, 'units' ) or not listFindNoCase( 'm,km,sm,nm,yd,ft,in,cm,mm', arguments.units ) ) {
		arguments.units = 'sm'; // default to statute miles
	};

	do {
		sinLambda = sin( lambda );
		cosLambda = cos( lambda );
		sinSigma = sqr( ( cosU2 * sinLambda ) * ( cosU2 * sinLambda ) + ( cosU1 * sinU2 - sinU1 * cosU2 * cosLambda ) * ( cosU1 * sinU2 - sinU1 * cosU2 * cosLambda ) );
		if ( sinSigma == 0 ) { return 0; };  // co-incident points
		cosSigma = sinU1 * sinU2 + cosU1 * cosU2 * cosLambda;
		sigma = Math.ATan2( JavaCast( 'double', sinSigma ), javaCast( 'double', cosSigma ) ); // CFML doesn't have a native ATan2() method avail.
		sinAlpha = cosU1 * cosU2 * sinLambda / sinSigma;
		cosSqAlpha = 1 - sinAlpha * sinAlpha;
		cos2SigmaM = cosSigma - 2 * sinU1 * sinU2 / cosSqAlpha;
		if ( not IsNumeric( cos2SigmaM ) ) { cos2SigmaM = 0; }; // equatorial line: cosSqAlpha=0 (§6)
		C = f / 16 * cosSqAlpha * ( 4 + f * ( 4 - 3 * cosSqAlpha ) );
		lambdaP = lambda;
		lambda = L + ( 1 - C ) * f * sinAlpha * ( sigma + C * sinSigma * ( cos2SigmaM + C * cosSigma * ( -1 + 2 * cos2SigmaM * cos2SigmaM ) ) );
	} while ( abs( lambda - lambdaP ) > 0.000000000001 and --iterLimit > 0 );

	if ( iterLimit == 0 ) {
		throw(
			type	= "FormulaFailureException",
			message	= "Formula failed to converge",
			detail	= "Nearly-antipodal points may fail to give a solution"
		);
	};

	uSq = cosSqAlpha * ( a * a - b * b ) / ( b * b );
	AA = 1 + uSq / 16384 * ( 4096 + uSq * ( -768 + uSq * ( 320 - 175 * uSq ) ) );
	BB = uSq / 1024 * ( 256 + uSq * ( -128 + uSq * ( 74 - 47 * uSq ) ) );
	deltaSigma = BB * sinSigma * ( cos2SigmaM + BB / 4 * ( cosSigma * ( -1 + 2 * cos2SigmaM * cos2SigmaM ) - BB / 6 * cos2SigmaM * ( -3 + 4 * sinSigma * sinSigma ) * ( -3 + 4 * cos2SigmaM * cos2SigmaM ) ) );
	s = b * AA * ( sigma - deltaSigma );
	s = NumberFormat( s, .999 ); // round to 1mm precision
	
	switch( arguments.units ) {
		case 'm' : // meters 
			break;
		case 'km' : s = s * 0.001; // kilometers
			break;
		case 'nm' : s = s * 0.000539956803; // nautical miles
			break;
		case 'yd' : s = s * 1.0936133; // yards
			break;
		case 'ft' : s = s * 3.2808399; // feet
			break;
		case 'in' : s = s * 39.3700787; // inches
			break;
		case 'cm' : s = s * 100; // centimeters
			break;
		case 'mm' : s = s * 1000; // millimeters
			break;
		default : s = s * 0.000621371192; // statute miles
	};

	return s;
};
</cfscript>

<cfscript>
/**
 * Support for the &quot;Do Not Track&quot; HTTP header
 * v1.0 by Indy Griffiths
 * v1.1 by Adam Cameron slight performance optimisation and rename
 * 
 * @return Returns a boolean indicating if the header was found and set to 1 
 * @author Indy Griffiths (indy@indygriffiths.com) 
 * @version 1.1, December 4, 2013 
 */
function hasDoNotTrackHeader() {
	var requestHeaders = getHttpRequestData().headers;
	return structKeyExists(requestHeaders, "DNT") && requestHeaders.DNT == 1;
}
</cfscript>

<!---
 Mimics the CFHTMLHEAD tag.
 
 @param text 	 Text to insert. (Required)
 @return Does not return a value. 
 @author Kreig Zimmerman (kkz@foureyes.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="HTMLHead" output="false" returnType="void">
	<cfargument name="text" type="string" required="yes">
	<cfhtmlhead text="#text#">
</cffunction>

<!---
 Mimics the CFHEADER tag.
 
 @param name 	 Name used when passing name/value pairs. (Optional)
 @param value 	 Value used when passing name/value pairs. (Optional)
 @param statuscode 	 Status code used when passing statuscode/statustext pairs. (Optional)
 @param statustext 	 Status text used when passing statuscode/statustext pairs. (Optional)
 @return Returns nothing. 
 @author Kreig Zimmerman (kkz@foureyes.com) 
 @version 1, September 20, 2002 
--->
<cffunction name="HTTPHeader" output="false" returnType="void">
	<cfargument name="name" type="string" default="">
	<cfargument name="value" type="string" default="">
	<cfargument name="statuscode" type="string" default="">
	<cfargument name="statustext" type="string" default="">
	<cfif Len(name) and Len(value)>
		<cfheader name="#name#" value="#value#">
	<cfelseif Len(statuscode) and Len(statustext)>
		<cfheader statuscode="#statuscode#" statustext="#statustext#">
	</cfif>
</cffunction>

<!---
 Mimics the cfinclude tag.
 Changed output to true so the included doc could display something.
 
 @param template 	 The template to include. (Required)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, August 3, 2005 
--->
<cffunction name="include" output="true" returnType="void">
	<cfargument name="template" type="string" required="true">
	<cfinclude template="#template#">
</cffunction>

<!---
 indentXml pretty-prints XML and XML-like markup without requiring valid XML.
 
 @param xml 	 XML string to format. (Required)
 @param indent 	 String used for creating the indention. Defaults to a space. (Optional)
 @return Returns a string. 
 @author Barney Boisvert (bboisvert@gmail.com) 
 @version 2, July 30, 2010 
--->
<cffunction name="indentXml" output="false" returntype="string">
  <cfargument name="xml" type="string" required="true" />
  <cfargument name="indent" type="string" default="  "
    hint="The string to use for indenting (default is two spaces)." />
  <cfset var lines = "" />
  <cfset var depth = "" />
  <cfset var line = "" />
  <cfset var isCDATAStart = "" />
  <cfset var isCDATAEnd = "" />
  <cfset var isEndTag = "" />
  <cfset var isSelfClose = "" />
  <cfset xml = trim(REReplace(xml, "(^|>)\s*(<|$)", "\1#chr(10)#\2", "all")) />
  <cfset lines = listToArray(xml, chr(10)) />
  <cfset depth = 0 />
  <cfloop from="1" to="#arrayLen(lines)#" index="i">
    <cfset line = trim(lines[i]) />
    <cfset isCDATAStart = left(line, 9) EQ "<![CDATA[" />
    <cfset isCDATAEnd = right(line, 3) EQ "]]>" />
    <cfif NOT isCDATAStart AND NOT isCDATAEnd AND left(line, 1) EQ "<" AND right(line, 1) EQ ">">
      <cfset isEndTag = left(line, 2) EQ "</" />
      <cfset isSelfClose = right(line, 2) EQ "/>" OR REFindNoCase("<([a-z0-9_-]*).*</\1>", line) />
      <cfif isEndTag>
        <!--- use max for safety against multi-line open tags --->
        <cfset depth = max(0, depth - 1) />
      </cfif>
      <cfset lines[i] = repeatString(indent, depth) & line />
      <cfif NOT isEndTag AND NOT isSelfClose>
        <cfset depth = depth + 1 />
      </cfif>
    <cfelseif isCDATAStart>
      <!---
      we don't indent CDATA ends, because that would change the
      content of the CDATA, which isn't desirable
      --->
      <cfset lines[i] = repeatString(indent, depth) & line />
    </cfif>
  </cfloop>
  <cfreturn arrayToList(lines, chr(10)) />
</cffunction>

<cfscript>
/**
 * Converts ini file(s) to a struct.
 * 
 * @param iniFiles 	 Array of ini files. (Required)
 * @return Returns a struct. 
 * @author Dave Anderson (the.one.true.dave.anderson@gmail.com) 
 * @version 0, April 26, 2012 
 */
public struct function iniToStruct(array iniFiles) {
	var config = {};
	for (local.f IN iniFiles) {
		local.inifile = fileExists(f) ? f : expandPath(f);
		local.sections = getProfileSections(local.iniFile); 
		for (local.k IN sections) {
			for (local.v IN listToArray(sections[k])) {
				config[k][v] = getProfileString(local.iniFile,k,v);
			}
		}
	}
	return config;
}
</cfscript>

<cfscript>
/**
 * determine if IP is with in a range.
 * 04-mar-2010 renamed to IPinRange so as not to conflict w/existing UDF
 * 
 * @param start 	 start IP range (Required)
 * @param end 	 end IP range (Required)
 * @param ip 	 IP to test if in range (Required)
 * @return Returns a boolean. 
 * @author A. Cole (acole76@NOSPAMgmail.com) 
 * @version 0, March 4, 2010 
 */
function isIpInRange(start, end, ip)
	{
		var startArray = listtoarray(arguments.start, ".");
		var endArray = listtoarray(arguments.end, ".");
		var ipArray = listtoarray(arguments.ip, ".");
		var s = ((16777216 * startArray[1]) + (65536 * startArray[2]) + (256 * startArray[3]) + startArray[4]);
		var e = ((16777216 * endArray[1]) + (65536 * endArray[2]) + (256 * endArray[3]) + endArray[4]);
		var c = ((16777216 * ipArray[1]) + (65536 * ipArray[2]) + (256 * ipArray[3]) + ipArray[4]);
		
		return isvalid("range", c, s, e);
	}
</cfscript>

<cfscript>
/**
 * Validates an array of [anything].
 * version 1.0 by Adam Cameron
 * 
 * @param object 	 The object to validate (Required)
 * @param validator 	 The callback to use to validate each element in the array (Required)
 * @return Returns a boolean 
 * @author Adam Cameron (adamcameroncoldfusion@gmail.com) 
 * @version 1.0, December 19, 2012 
 */
function isArrayOf(object, validator){
    if (!isArray(object)){
        return false;
    }

    for (var element in object){
        if (!validator(element)){
            return false;
        }
    }
    return true;
}
</cfscript>

<!---
 Checks the server's ColdFusion product version
 
 @param MinimumVersionNumber 	 Minimum ColdFusion version (Required)
 @return Returns a boolean. 
 @author Jon Hartmann (jon.hartmann@gmail.com) 
 @version 1, April 14, 2011 
--->
<cffunction name="isColdFusionVersionAtleast" access="private" output="false" returntype="boolean">
	<cfargument name="MinimumVersionNumber" type="string" required="true" />

	<cfset Local.VersionData = ListToArray(Server.ColdFusion.ProductVersion) />
	<cfset Local.TestVersionData = ListToArray(Arguments.MinimumVersionNumber) />
	<cfset Local.Result = true />
	<cfset local.x = "">
	
	<cfloop from="1" to="#Min(ArrayLen(Local.TestVersionData), ArrayLen(Local.VersionData))#" index="x">
		<cfif Local.VersionData[x] lt Local.TestVersionData[x]>
			<cfset Local.Result = false />
			<cfbreak />
		<cfelseif Local.VersionData[x] gt Local.TestVersionData[x]>
			<cfbreak />
		</cfif>
	</cfloop>

	<cfreturn Local.Result />
</cffunction>

<!---
 Checks if a string is an ODBC formatted date, time, or timestamp
 version 0.1 by Paul Klinkenberg
 version 1.0 by Adam Cameron - adding date validation so it will fail invalid dates such as Feb 31.
 
 @param str 	 The string to validate (Required)
 @return True if the string is a correctly-formatted ODBC date string, otherwise false 
 @author Paul Klinkenberg (pauL@ongevraagdadvies.nl) 
 @version 1, July 24, 2012 
--->
<cffunction name="isODBCDate" access="public" returntype="boolean" output="false">
	<cfargument name="str" required="yes" type="string">
	<cfscript>
		// test the format
		if (!(len(str) gt 10 and refindNoCase("^\{(d|t|ts) \'([1-3][0-9]{3}\-[0-1][0-9]\-[0-3][0-9] ?)?([0-2][0-9]:[0-5][0-9]:[0-5][0-9])?\'\}$", str))){
			return false;
		}
		// test that it's actually a valid date (ie: not 31 Feb, etc)
		try {
			parseDateTime(str);
			return true;
		}
		catch (any e){
			return false;
		}
	</cfscript>
</cffunction>

<!---
 Mimics the cflocation tag.
 
 @param url 	 URL to cflocate to. (Required)
 @param addToken 	 Specifies wether CFTOKEN info should be appended. Defaults to true. (Optional)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="location" output="false" returnType="void">
	<cfargument name="url" type="string" required="true">
	<cfargument name="addToken" type="boolean" default="true" required="false">
	<cflocation url="#url#" addToken="#addToken#">
</cffunction>

<cfscript>
/**
 * Gets the nth percentile of the given population
 * v0.9 by rodell basalo
 * v1.0 by Adam Cameron (improved argument/variable naming, simplified logic slightly)
 * 
 * @param population 	 An array of population values (Required)
 * @param percentile 	 The percentile to return value for (Required)
 * @return Returns a numeric value that is the value from the population that is the specified percentile 
 * @author rodell basalo (delroekid@gmail.com) 
 * @version 1.0, July 8, 2013 
 */
public numeric function getNthPercentile(required array population, required numeric percentile){
	if (percentile < 0 || percentile > 100){
		throw(type="ArgumentOutOfRangeException", message="percentile argument value out of range", detail="The percentile argument must be in the range 1-100")
	}
	arraySort(population, "numeric");

	var populationSize = arrayLen(population);
	var nthPercentIndex = round((percentile/100) * populationSize + 0.5);

	return population[min(nthPercentIndex, populationSize)];
}
</cfscript>

<cfscript>
/**
 * Parses an INI file into a structure.
 * 
 * @param codefile 	 FIle to read. (Required)
 * @return Returns a struct. 
 * @author Dave Long (dave@davejlong.com) 
 * @version 1, April 14, 2011 
 */
function parseINI(string codefile) {
	var i = '';
	var codes = structNew();
	local.sections = getProfileSections(arguments.codefile);
	for(local.section IN local.sections){
		codes[local.section] = structNew();
		local.keys = local.sections[local.section];
		for(i=1;i LTE listLen(local.keys);i++){
			codes[local.section][listGetAt(local.keys,i)] = getProfileString(arguments.codefile,local.section,listGetAt(local.keys,i));
		}			
	}
	
	return codes;
}
</cfscript>

<cfscript>
/**
 * Analogous to reReplace()/reReplaceNoCase(), except the replacement is the result of a callback, not a hard-coded string
 * v1.0 by Adam Cameron
 * 
 * @param string 	 The string to process (Required)
 * @param regex 	 The regular expression to match (Required)
 * @param callback 	 A UDF which takes arguments match (substring matched), found (a struct of keys pos,len,substring, which is subexpression breakdown of the match), offset (where in the string the match was found), string (the string the match was found within) (Required)
 * @param scope 	 Number of replacements to make: either ONE or ALL (Optional)
 * @param caseSensitive 	 Whether the regex is handled case-sensitively (Optional)
 * @return A string with substitutions made 
 * @author Adam Cameron (dac.cfml@gmail.com) 
 * @version 1.0, July 18, 2013 
 */
string function replaceWithCallback(required string string, required string regex, required any callback, string scope="ONE", boolean caseSensitive=true){
	if (!isCustomFunction(callback)){ // for CF10 we could specify a type of "function", but not in CF9
		throw(type="Application", message="Invalid callback argument value", detail="The callback argument of the replaceWithCallback() function must itself be a function reference.");
	}
	if (!isValid("regex", scope, "(?i)ONE|ALL")){
		throw(type="Application", message="The scope argument of the replaceWithCallback() function has an invalid value #scope#.", detail="Allowed values are ONE, ALL.");
	}
	var startAt	= 1;

	while (true){	// there's multiple exit conditions in multiple places in the loop, so deal with exit conditions when appropriate rather than here
		if (caseSensitive){
			var found = reFind(regex, string, startAt, true);
		}else{
			var found = reFindNoCase(regex, string, startAt, true);
		}
		if (!found.pos[1]){ // ie: it didn't find anything
			break;
		}
		found.substring=[];	// as well as the usual pos and len that CF gives us, we're gonna pass the actual substrings too
		for (var i=1; i <= arrayLen(found.pos); i++){
			found.substring[i] = mid(string, found.pos[i], found.len[i]);
		}
		var match = mid(string, found.pos[1], found.len[1]);
		var offset = found.pos[1];

		var replacement = callback(match, found, offset, string);

		string = removeChars(string, found.pos[1], found.len[1]);
		string = insert(replacement, string, found.pos[1]-1);

		if (scope=="ONE"){
			break;
		}
		startAt = found.pos[1] + len(replacement);
	}
	return string;
}
</cfscript>

<!---
 REReplaceCallback behaves like REReplace, except instead of supplying a replacement string, you supply a function to invoke on each match.
 
 @param string 	 String to parse. (Required)
 @param pattern 	 Regex pattern to use. (Required)
 @param callback 	 UDF to be used as a callback. (Required)
 @param scope 	 How many replacements should be made. Defaults to one. (Optional)
 @return Returns a string. 
 @author Barney Boisvert (bboisvert@gmail.com) 
 @version 1, March 10, 2010 
--->
<cffunction name="REReplaceCallback" access="private" output="false" returntype="string">
  <cfargument name="string" type="string" required="true" />
  <cfargument name="pattern" type="string" required="true" />
  <cfargument name="callback" type="any" required="true" />
  <cfargument name="scope" type="string" default="one" />
  <cfscript>
  var start = 0;
  var match = "";
  var parts = "";
  var replace = "";
  var i = "";
  var l = "";
  while (true) {
    match = REFind(pattern, string, start, true);
    if (match.pos[1] EQ 0) {
      break;
    }
    parts = [];
    l = arrayLen(match.pos);
    for (i = 1; i LTE l; i++) {
      if (match.pos[i] EQ 0) {
        arrayAppend(parts, "");
      } else {
        arrayAppend(parts, mid(string, match.pos[i], match.len[i]));
      }
    }
    replace = callback(parts);
    start = start + len(replace);
    string = mid(string, 1, match.pos[1] - 1) & replace & removeChars(string, 1, match.pos[1] + match.len[1] - 1);
    if (scope EQ "one") {
      break;
    }
  }
  return string;
  </cfscript>
</cffunction>

<cfscript>
/**
 * I convert a string to ASCII characters.
 * 
 * @param str 	 String to parse. (Required)
 * @return Returns a string. 
 * @author Stephen Withington (steve@stephenwithington.com) 
 * @version 1, June 17, 2010 
 */
function stringToAscii(str) {
	var local = StructNew();
	local.oldStr = '';
	local.newStr = '';
	if ( StructKeyExists(arguments, 'str') and IsSimpleValue(arguments.str) ) {
		local.oldStr = arguments.str;
		for ( local.i=1; local.i lte Len(arguments.str); local.i++ ) {
			local.newStr = local.newStr & '&##' & Asc(Left(local.oldStr,1)) & ';';
			local.oldStr = RemoveChars(local.oldStr,1,1);
		};
	};
	return local.newStr;
};
</cfscript>

<cfscript>
/**
 * Removes all extended and non-printing ASCII characters from a string.
 * v2 by Adam Cameron
 * 
 * @param str 	 String to modify. (Required)
 * @return Returns a string. 
 * @author Kevin Benore (Kevin@Benore.net) 
 * @version 2, August 30, 2011 
 */
function stripExtendedAscii(str) {
  return reReplace(arguments.str, "[^\x20-\x7E]", "", "ALL"); // 0x20 = space, chr(32); \0x7E = ~ / tilde, chr(126)
};
</cfscript>

<!---
 Mimics the CFTHROW tag.
 
 @param Type 	 Type for exception. (Optional)
 @param Message 	 Message for exception. (Optional)
 @param Detail 	 Detail for exception. (Optional)
 @param ErrorCode 	 Error code for exception. (Optional)
 @param ExtendedInfo 	 Extended Information for exception. (Optional)
 @param Object 	 Object to throw. (Optional)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="throw" output="false" returnType="void" hint="CFML Throw wrapper">
	<cfargument name="type" type="string" required="false" default="Application" hint="Type for Exception">
	<cfargument name="message" type="string" required="false" default="" hint="Message for Exception">
	<cfargument name="detail" type="string" required="false" default="" hint="Detail for Exception">
	<cfargument name="errorCode" type="string" required="false" default="" hint="Error Code for Exception">
	<cfargument name="extendedInfo" type="string" required="false" default="" hint="Extended Info for Exception">
	<cfargument name="object" type="any" hint="Object for Exception">
	
	<cfif not isDefined("object")>
		<cfthrow type="#type#" message="#message#" detail="#detail#" errorCode="#errorCode#" extendedInfo="#extendedInfo#">
	<cfelse>
		<cfthrow object="#object#">
	</cfif>
	
</cffunction>

<!---
 Replaces cffile upload, handling security checks and providing better error handling.
 
 @param filefield 	 Form field containing the file. (Required)
 @param destination 	 Directory of the destination. (Required)
 @param allowedextensions 	 List of allowed extensions. See code for default. (Optional)
 @param nameconflict 	 Specifies how to handle name conflicts. Defaults to makeUniqe. (Optional)
 @param invalidExtensionMessage 	 Message used for invalid extensions. Defaults to: The uploaded file has an invalid extension. (Optional)
 @param tempDirectory 	 Temporary directory used for uploads. Defaults to getTempDirectory(). (Optional)
 @return Returns a struct. 
 @author David Hammond (dave@modernsignal.com) 
 @version 1, November 26, 2010 
--->
<cffunction name="uploadFile" hint="Replaces cffile upload, handling file extension checking and providing better error handling." output="false" returntype="struct">
	<cfargument name="FileField" required="true" type="string">
	<cfargument name="Destination" required="true" type="string">
	<cfargument name="AllowedExtensions" default="ai,asx,avi,bmp,csv,dat,doc,docx,fla,flv,gif,html,ico,jpeg,jpg,m4a,mov,mp3,mp4,mpa,mpg,mpp,pdf,png,pps,ppsx,ppt,pptx,ps,psd,qt,ra,ram,rar,rm,rtf,svg,swf,tif,txt,vcf,vsd,wav,wks,wma,wps,xls,xlsx,xml,zip" type="string">
	<cfargument name="NameConflict" default="MakeUnique" type="string">
	<cfargument name="InvalidExtensionMessage" default="The uploaded file has an invalid extension." type="string">
	<cfargument name="TempDirectory" default="#getTempDirectory()#">
	<cfset var tempPath = "">
	<cfset var serverPath = "">
	<cfset var file = "">
	<cfset var fileName = "">
	<cfset var baseFileName = "">
	<cfset var i = 0>
	<cfset var skip = false>
	
	<!--- Make sure the destination directory exists. --->
	<cfif Not DirectoryExists(destination)>
		<cfthrow type="InvalidDestination" message="Destination directory ""#HtmlEditFormat(destination)#"" does not exist.">
	</cfif>

	<!--- Upload to temp directory. --->
	<cffile action="upload" filefield="#Arguments.FileField#" destination="#Arguments.TempDirectory#" nameconflict="MakeUnique">
	<cfset tempPath = ListAppend(cffile.ServerDirectory, cffile.ServerFile, "\/")>

	<!--- Check file extension --->
	<cfif Not ListFindNoCase(Arguments.AllowedExtensions,cffile.clientFileExt)>
		<!--- Bad file extension.  Delete file. --->
		<cfif FileExists(tempPath)>
			<cffile action="Delete" file="#tempPath#">
		</cfif>
		<!--- Throw error --->
		<cfthrow type="InvalidExtension" message="#Arguments.InvalidExtensionMessage#">
	</cfif>
	
	<!--- Replace bad characters in file name --->
	<cfset fileName = REReplaceNoCase(cffile.clientFileName,"[^\w_-]","","ALL")>
	<cfset file = fileName & "." & cffile.ClientFileExt>
	<cfset serverPath = ListAppend(destination, file, "\/")>
	
	<cfif FileExists(serverPath)>
		<!--- Handle name conflict --->
		<cfswitch expression="#Arguments.NameConflict#">
			<cfcase value="MakeUnique">
				<!--- Remove number if it exists --->
				<cfset baseFileName = REReplace(fileName,"_[\d]+$","")>
				<!--- Find an unused filename --->
				<cfloop condition="FileExists(serverPath)">
					<cfset i = i + 1>
					<cfset fileName = baseFileName & "_" & i>
					<cfset file = fileName & "." & cffile.ClientFileExt>
					<cfset serverPath = ListAppend(destination, file, "\/")>
				</cfloop>
				<cfset cffile.FileWasRenamed = false>
			</cfcase>
			<cfcase value="Error">
				<cffile action="Delete" file="#tempPath#">
				<cfthrow type="FileExists" message="The file #serverPath# already exists.">
			</cfcase>
			<cfcase value="Skip">
				<cfset skip = true>
				<cffile action="Delete" file="#tempPath#">
				<cfset cffile.FileWasSaved = false>
			</cfcase>
			<cfcase value="Overwrite">
				<cffile action="Delete" file="#serverPath#">
				<cfset cffile.FileWasOverwritten = true>
			</cfcase>
		</cfswitch>
	</cfif>
	
	<cfif Not skip>
		<!--- Rename and move file to destination directory --->
		<cffile action="rename" source="#tempPath#" destination="#serverPath#">
		<cfset cffile.ServerFileName = file>
		<cfset cffile.ServerFile = file>
		<cfset cffile.ServerDirectory = destination>
	</cfif>
				
	<cfreturn cffile>
</cffunction>

<!---
 Allows for deserialization of WDDX data.
 Updated for CFMX var syntax.
 
 @param input 	 A valid WDDX string. (Required)
 @return Returns deserialized data. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, October 16, 2002 
--->
<cffunction name="wddxDeserialize" output="false" returnType="any">
	<cfargument name="input" type="string" required="true">

	<cfset var output="">
	
	<cfwddx action="wddx2cfml" input="#input#" output="output">
	<cfreturn output>
</cffunction>

<!---
 Reads a file containing WDDX and returns the CF variable.
 Updated for CFMX var scope syntax.
 
 @param file 	 File to read and deserialize. (Required)
 @return Returns deserialized data. 
 @author Nathan Dintenfass (nathan@changemedia.com) 
 @version 2, October 15, 2002 
--->
<cffunction name="WDDXFileRead" output="no">
	<cfargument name="file" required="yes">
	
	<cfset var tempPacket = "">
	<cfset var tempVar = "">
	
	<!--- make sure the file exists, otherwise, throw an error --->
	<cfif NOT fileExists(file)>
		<cfthrow message="WDDXFileRead() error: File Does Not Exist" detail="The file #file# called in WDDXFileRead() does not exist">
	</cfif>
	<!--- read the file --->
	<cffile action="read" file="#file#" variable="tempPacket">
	<!--- make sure it is a valid WDDX Packet --->
	<cfif NOT isWDDX(tempPacket)>
		<cfthrow message="WDDXFileRead() error: Bad Packet" detail="The file #file# called in WDDXFileRead() does not contain a valid WDDX packet">		
	</cfif>
	<!--- deserialize --->
	<cfwddx action="wddx2cfml" input="#tempPacket#" output="tempVar">
	<cfreturn tempVar>    
</cffunction>

<!---
 Write a flat file containing a WDDX packet of any CF variable
 Updated for CFMX var scope syntax.
 
 @param file 	 The file to write to. (Required)
 @param var 	 The value to serialize. (Required)
 @return Does not return a value. 
 @author Nathan Dintenfass (nathan@changemedia.com) 
 @version 2, October 15, 2002 
--->
<cffunction name="WDDXFileWrite" output="no" returnType="void">
	<cfargument name="file" required="yes">
	<cfargument name="var" required="yes">
	
	<cfset var tempPacket = "">
	
	<!--- serialize --->
	<cfwddx action="cfml2wddx" input="#var#" output="tempPacket">
	<!--- write the file --->
	<cffile action="write" file="#file#" output="#tempPacket#">
</cffunction>

<!---
 Allows for serialization to WDDX.
 Updated for CFMX var scope syntax.
 
 @param input 	 The value to serialize. (Required)
 @param useTimeZoneInfo 	 Indicates whether to output time-zone information when serializing CFML to WDDX. The default is yes. (Optional)
 @return Returns a WDDX packet. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, October 16, 2002 
--->
<cffunction name="wddxSerialize" output="false" returnType="string">
	<cfargument name="input" type="any" required="true">
	<cfargument name="useTimeZoneInfo" type="boolean" required="false" default="true">
	
	<cfset var output="">
	
	<cfwddx action="cfml2wddx" input="#input#" output="output" useTimeZoneInfo="#useTimeZoneInfo#">
	<cfreturn output>
</cffunction>








</cfcomponent>