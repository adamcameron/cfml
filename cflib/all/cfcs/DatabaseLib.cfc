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
 Backs up a database to a zip file.
 
 @param dbsource 	 DNS. (Required)
 @return Returns a string. 
 @author Darwan Leonardo Sitepu (dlns2001@yahoo.com) 
 @version 1, January 8, 2013 
--->
<cffunction name="backupDatabase" returnType="string" output="false">
    <cfargument name="dbsource" type="string" required="true">
    <cftry>
        <cfdbinfo datasource="#arguments.dbsource#" name="tables" type="tables" />
        <cfsilent>
            <cfset data = StructNew() />
            <cfloop query="tables">  <!--- grab all data from table --->  
                <cftry>
                    <cfset data[Table_Name] = StructNew() />  
                    <cfdbinfo datasource="#datasource#" table="#Table_Name#" name="qryTableFields" type="columns" />  
                    <cfset data[Table_Name].schema = qryTableFields />  
                    <cfquery name="getData" datasource="#datasource#" debug="no" cachedwithin=#CreateTimeSpan(0,0,0,10)# >SELECT * FROM [#Table_Name#]</cfquery>    
                    <cfset data[Table_Name].data = getData />            
                <cfcatch></cfcatch>
                </cftry>
            </cfloop><!--- Now serialize into one ginormous string --->
        </cfsilent>
        <cfwddx action="cfml2wddx" input="#data#" output="packet" /><!--- file to store zip --->
        <cfset zfile = expandPath("./data.zip") /><!--- Now zip this baby up --->
        <cfzip action="zip" file="#zfile#" overwrite="true"><cfzipparam content="#packet#" entrypath="data.packet.xml" /></cfzip>
        <cfreturn "I retrieved #tables.recordCount# tables from datasource #datasource# and saved it to #zfile#.">
    <cfcatch>
    	<cfreturn "Backup Database Is Failed..">
    </cfcatch>
    </cftry>
</cffunction>

<!---
 Search SQL Server Stored Procedures for a value.
 
 @param datasource 	 Database to search. (Required)
 @param searchstring 	 Name to search for. (Required)
 @return Returns a query of stored procedure names that match. 
 @author Jose Diaz (bleachedbug@gmail.com) 
 @version 1, November 14, 2007 
--->
<cffunction name="cfStoredProcSearch" access="public" returntype="query" output=false>

	<cfargument name="datasource" type="string" required="true"/>
	<cfargument name="searchString" type="string" required="true"/>
	<cfset var qStoredProcSearch = "">

	<cfquery name="qStoredProcSearch" datasource="#arguments.datasource#">
		select name
		from sysobjects s
		   , syscomments c
		where s.id = c.id and text like '%#arguments.searchString#%'
	</cfquery>


	<cfreturn qStoredProcSearch />

</cffunction>

<!---
 Eksport SQL Data to Mysql
 
 @param table 	 Table to read. (Required)
 @param dbsource 	 DSN. (Required)
 @return Returns a string. 
 @author Darwan Leonardo Sitepu (dlns2001@yahoo.com) 
 @version 1, January 11, 2011 
--->
<cffunction name="EkporSQLTable" returnType="string" output="false">
	<cfargument name="table" type="string" required="true">
    <cfargument name="dbsource" type="string" required="true">
	<cfset var theTable = "#arguments.table#">
    <cfset var theFileContent = ""><!--- to save the content SQL to a file --->		
    <cfset var theFields = "">
    <cfset var theSQL = "">
    <cfset var theFIELD = "">
    <cfset var theVALUE = "">
    <cfset var kolom = "">
    <cfset var theDate = "">
    <cfset var tables = "">
    <cfset var i = "">
    <cfset var qRead = "">
    	
    <cfloop list="#theTable#" index="tables" delimiters=",">
        <cfquery name="qRead" datasource="#arguments.dbsource#" debug="no">
            select * from #tables#
        </cfquery>    
        <cfif qRead.recordCount gt 0>
            <cfset theFields = getMetaData(qRead)>	
            <cfloop query="qRead">
                <cfset theSQL = "">
                <cfset theFIELD = "INSERT INTO #tables#_temp (">
                <cfset theVALUE = "VALUES ( ">
                <!--- THE KOLOM N VALUE --------------------------------------------------------------------------------->	
                <cfloop index="i" from="1" to="#arrayLen(theFields) -1#">
                    <cfset kolom = evaluate("qRead.#theFields[i].name#")>
                    <cfset theFIELD = theFIELD & " " & theFields[i].name & ",">                
                    <!--- CHECK THE TYPE -------------------------------------------------------------------------------->
                    <cfswitch expression="#theFields[i].TypeName#">
                        <cfcase value="number">
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " " & kolom & ",">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="numeric">
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " " & kolom & ",">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="float">
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " " & kolom & ",">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="integer">
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " " & kolom & ",">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="text">
                            <cfif FindNoCase("'",kolom,1)>
                                <cfset kolom = ReplaceNoCase(kolom,"'","","ALL")>
                            </cfif>							
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " '" & kolom & "',">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="varchar">
                            <cfif FindNoCase("'",kolom,1)>
                                <cfset kolom = ReplaceNoCase(kolom,"'","","ALL")>
                            </cfif>
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " '" & kolom & "',">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="char">
                            <cfif FindNoCase("'",kolom,1)>
                                <cfset kolom = ReplaceNoCase(kolom,"'","","ALL")>
                            </cfif>
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " '" & kolom & "',">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="varchar2">
                            <cfif FindNoCase("'",kolom,1)>
                                <cfset kolom = ReplaceNoCase(kolom,"'","","ALL")>
                            </cfif>
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " '" & kolom & "',">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfcase value="date">
                            <!--- format TO MYSQL --->
                            <cfif kolom neq "">
                                <cfset theDate = dateformat(kolom, "yyyy-mm-dd")>								
                                <cfset theVALUE = theVALUE & " '" & theDate & "',">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfcase>
                        <cfdefaultcase>
                            <cfif kolom neq "">
                                <cfset theVALUE = theVALUE & " '" & kolom & "',">
                            <cfelse>
                                <cfset theVALUE = theVALUE & " NULL,">
                            </cfif>
                        </cfdefaultcase>
                    </cfswitch>
                </cfloop>
                <cfset kolom = evaluate("qRead.#theFields[i].name#")>
                <cfset theFIELD = theFIELD & " " & theFields[i].name & ")">
                <!--- CHECK THE TYPE -------------------------------------------------------------------------------->
                <cfswitch expression="#theFields[i].TypeName#">
                    <cfcase value="number">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " " & kolom & ")">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="numeric">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " " & kolom & ")">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="float">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " " & kolom & ")">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="integer">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " " & kolom & ")">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="text">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " '" & kolom & "')">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="varchar">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " '" & kolom & "')">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="char">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " '" & kolom & "')">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="varchar2">
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " '" & kolom & "')">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfcase value="date">
                        <!--- format TO MYSQL --->
                        <cfif kolom neq "">
                            <cfset theDate = dateformat(kolom, "yyyy-mm-dd")>								
                            <cfset theVALUE = theVALUE & " '" & theDate & "')">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfcase>
                    <cfdefaultcase>
                        <cfif kolom neq "">
                            <cfset theVALUE = theVALUE & " '" & kolom & "')">
                        <cfelse>
                            <cfset theVALUE = theVALUE & " NULL)">
                        </cfif>
                    </cfdefaultcase>
                </cfswitch>		
                <cfset theSQL = theSQL & "" & theFIELD & " " & theVALUE>						
                <cfif theFileContent neq "">
                    <cfset theFileContent = theFileContent &";<br>"& theSQL>
                <cfelse>
                    <cfset theFileContent = theFileContent &""& theSQL>
                </cfif>
            </cfloop>
        </cfif>
    </cfloop>
    <cfreturn theFileContent>
</cffunction>

<!---
 Export table data in script format (INSERT statements).
 Modified by Raymond
 v2 by Joseph Flanigan (joseph@switch-box.org)
 
 @param table 	 Table to export. (Required)
 @param dbsource 	 DSN. (Required)
 @param dbuser 	 Database username. (Optional)
 @param dbpassword 	 Database password. (Optional)
 @param commitAfter 	 Inserts commit statements after a certain number of rows. Defaults to 100. (Optional)
 @return Returns a string. 
 @author Asif Rashid (asifrasheed@rocketmail.com) 
 @version 2, April 18, 2006 
--->
<cffunction name="exportSQLTable" returnType="string" output="false">
        <cfargument name="table" type="string" required="true">
        <cfargument name="dbsource" type="string" required="true">
        <cfargument name="dbuser" type="string" required="false" default="">
        <cfargument name="dbpassword" type="string" required="false" default="">
        <cfargument name="commitAfter" default="100" type="numeric">

        <cfset var i = 1>
        <cfset var j = 1>
        <cfset var k = 0>
        <cfset var temp = "">
        <cfset var qryTemp = "">
        <cfset var tempCol = "">
        <cfset var str = "">
        <cfset var textstr = "">

        <!--- Getting table data --->
        <cfquery name="qryTemp" datasource="#arguments.dbsource#" username= "#arguments.dbuser#" password="#arguments.dbpassword#">
                select * from #arguments.table#
        </cfquery>

        <!--- Getting meta information of executed query --->
        <cfset tempCol = getMetaData(qryTemp)>
        <cfset k =      ArrayLen(tempCol) >

        <cfloop query="qryTemp">
                <cfset temp = "INSERT INTO " & arguments.table &" (">
                <cfloop index="j" from="1" to="#k#">
                        <cfset temp = temp & "[#tempCol[j].Name#]" >
                 <cfif j NEQ k >
                        <cfset temp = temp & "," >
                 </cfif>
                </cfloop>


                <cfset temp = temp & ") VALUES (">
                <cfloop index="j" from="1" to="#k#">
                        <cfif FindNoCase("char", tempCol[j].TypeName)
                              OR FindNoCase("date", tempCol[j].TypeName)
                                  OR FindNoCase("text", tempCol[j].TypeName)
                                  OR FindNoCase("unique", tempCol[j].TypeName)
                                  OR FindNoCase("xml", tempCol[j].TypeName)
                                   >
                                <cfset textstr = qryTemp[tempCol[j].Name][i] >
                                <cfif Find("'",textstr)>
                                  <cfset textstr = Replace(textstr,"'","'","ALL") >
                                </cfif>
                                <cfset temp = temp & "'" & textstr & "'" >
                        <cfelseif FindNoCase("image",tempCol[j].TypeName)>
                                 <cfset temp = temp & "'" >
                        <cfelse>
                                <cfset temp = temp & qryTemp[#tempCol[j].Name#][i] >
                        </cfif>
                  <cfif j NEQ k >
                        <cfset temp = temp  &  "," >
                 </cfif>

                </cfloop>
                <cfset temp = temp & ");">
                <cfset str = str & temp & chr(10)>
                <cfif i mod commitAfter EQ 0>
                        <cfset str = str & "commit;" & chr(10)>
                </cfif>
                <cfset i = i + 1>
        </cfloop>
        <cfreturn str>
</cffunction>

<cfscript>
/**
 * Takes a ColdFusion date object and returns a DB2 formatted timestamp.
 * 
 * @param dateObj 	 A data object. (Required)
 * @param emulateTick 	 A boolean. (Required)
 * @return Returns a string. 
 * @author Chris Wigginton (cwigginton@macromedia.com) 
 * @version 1, June 27, 2002 
 */
function getDB2TimeStamp(dateObj, emulateTick)
{
	var tick = "000000";
	// We can partially emulate milliseconds by 
	//grabbing the current tick and applying it to the date object
	if(emulateTick IS "Yes")
		tick = Right(GetTickCount(),3) & "000";
		
	return DateFormat(dateObj, "yyyy-mm-dd-") & TimeFormat(dateObj, "HH.mm.ss.") & tick; 
}
</cfscript>

<cfscript>
/**
 * Gets a list of DSNs.
 * 
 * @return Returns an array. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, November 15, 2002 
 */
function getDSNs() {
	var factory = createObject("java","coldfusion.server.ServiceFactory");
	return factory.getDataSourceService().getNames();
}
</cfscript>

<!---
 Normalizes the various possible returned keys in the cfquery result struct.
 
 @param resultStruct 	 Structure. (Required)
 @return Returns a value. 
 @author Todd Sharp (todd@cfsilence.com) 
 @version 1, October 14, 2008 
--->
<cffunction name="getGeneratedKey" hint="i normalize the key returned from cfquery" output="false">
	<cfargument name="resultStruct" hint="the result struct returned from cfquery" />
	<cfif structKeyExists(arguments.resultStruct, "IDENTITYCOL")>
		<cfreturn arguments.resultStruct.IDENTITYCOL />
	<cfelseif structKeyExists(arguments.resultStruct, "ROWID")>
		<cfreturn arguments.resultStruct.ROWID />
	<cfelseif structKeyExists(arguments.resultStruct, "SYB_IDENTITY")>
		<cfreturn arguments.resultStruct.SYB_IDENTITY />
	<cfelseif structKeyExists(arguments.resultStruct, "SERIAL_COL")>
		<cfreturn arguments.resultStruct.SERIAL_COL />	
	<cfelseif structKeyExists(arguments.resultStruct, "GENERATED_KEY")>
		<cfreturn arguments.resultStruct.GENERATED_KEY />
	<cfelse>
		<cfreturn />
	</cfif>
</cffunction>

<cfscript>
/**
 * Returns list of query columns in order as defined by SQL query.
 * 
 * @param theQuery 	 Query object to examine. (Required)
 * @return Returns a list. 
 * @author James Moberg (james@ssmedia.com) 
 * @version 1, January 11, 2011 
 */
function getQueryColumns(theQuery){
	if(isQuery(theQuery)) return arraytoList(theQuery.getMeta().getColumnLabels());
	else return '';
}
</cfscript>

<cfscript>
/**
 * Returns true if the call to it is within a CFTRANSACTION block
 * v0.1 by Bilal Soylu
 * v1.0 by Adam Cameron: simplifying logic &amp; converting to script
 * v1.1 by Adam Cameron: fixed bug causing potential false positives (as advised by Bilal)
 * 
 * @return Returns true if the call was within a CFTRANSACTION, otherwise false. 
 * @author Bilal Soylu (bilalsoylu@gmail.com) 
 * @version 1.1, September 24, 2012 
 */
function isInTransaction(){
	var result = createObject("java", "coldfusion.tagext.sql.TransactionTag").getCurrent();
	return structKeyExists(local, "result");
}
</cfscript>

<cfscript>
/**
 * Validates if item is orm entity or collection.
 * 
 * @param item 	 Value to check. (Required)
 * @return Returns a boolean. 
 * @author John Farrar (johnfarrar@sosensible.com) 
 * @version 1, May 30, 2010 
 */
function isORM(item) {
	var metaItem = {};
	try {
		if(isArray(arguments.item) && arrayLen(arguments.item)){
			metaItem = getMetadata(arguments.item[1]);
		} else {
			metaItem = getMetadata(arguments.item);
		}
		if(structKeyExists(metaItem,'persistent') && metaItem.persistent){
			return true;
		} else {
			return false;
		}
	} catch(any e) {
		return false;
	}
}
</cfscript>

<cfscript>
/**
 * Tests a string, one-dimensional array, or simple struct for possible SQL injection.
 * 
 * @param input 	 String to check. (Required)
 * @return Returns a boolean. 
 * @author Will Vautrain (vautrain@yahoo.com) 
 * @version 1, July 1, 2002 
 */
function IsSQLInject(input) {
	/*
	* The SQL-injection strings were used at the suggestion of Chris Anley [chris@ngssoftware.com]
	* in his paper "Advanced SQL Injection In SQL Server Applications" available for downloat at
	* http://www.ngssoftware.com/
	*/
	var listSQLInject = "select,insert,update,delete,drop,--,'";
	var arraySQLInject = ListToArray(listSQLInject);
	var i = 1;
	
	for(i=1; i lte arrayLen(arraySQLInject); i=i+1) {
		if(findNoCase(arraySQLInject[i], input)) return true;
	}
	
	return false;
}
</cfscript>

<!---
 Mimics MySQL limit's function.
 v2 mods by Raymond Camden and Steven Van Gemert
 
 @param inQry 	 Query to modify. (Required)
 @param arg1 	 Row to begin the limit. (Required)
 @param arg2 	 Number of rows to limit the result to. (Required)
 @return Returns a query. 
 @author Andy Jarrett (mail@andyjarrett.co.uk) 
 @version 2, February 13, 2009 
--->
<cffunction name="limit" returntype="query" description="WORKS LIKE MYSQL LIMIT(N,N)" output="false">
	<cfargument name="inQry" type="query" hint="I am the query" />
	<cfargument name="arg1" type="numeric" />
	<cfargument name="arg2" type="numeric" />
    
	<cfscript>
	var outQry = arguments.inQry;
	var a1 = arguments.arg1-1;
	
	if(arg1 GT 1){
	    outQry.RemoveRows(JavaCast( "int", 0 ), JavaCast( "int", a1 ));
	}
	
	outQry.RemoveRows(JavaCast( "int", arg2 ),JavaCast( "int", outQry.recordcount-arg2));
	
	return outQry;
	</cfscript>
</cffunction>

<cfscript>
/**
 * Convert Microsoft SQL Server Data Type to equivilent CFSQLType
 * Most useful when querying MS SQL Server sys tables to return data type from the table structure and converting to a CF data type for use within the &lt;cfqueryparam&gt; tag.
 * 
 * Example Usage
 * #MSSQL2CFSQLDT('nvarchar')#  returns  CF_SQL_VARCHAR
 * 
 * Author C. Jason Wilson (cjwilson@cf-developer.net) 
 * version 1, January 13, 2009
 * 
 * @param dataType 	 String of datatype to use (Required)
 * @return returns a string 
 * @author C. Jason Wilson (cjwilson@cf-developer.net) 
 * @version 0, May 9, 2009 
 */
function MSSQL2CFSQLDT (DataType) {
	var MSSQLType = 'int,bigint,smallint,tinyint,numeric,money,smallmoney,bit,decimal,float,real,datetime,smalldatetime,char,nchar,varchar,nvarchar,text,ntext';
	var CFSQLType = 'CF_SQL_INTEGER,CF_SQL_BIGINT,CF_SQL_SMALLINT,CF_SQL_TINYINT,CF_SQL_NUMERIC,CF_SQL_MONEY4,CF_SQL_MONEY,CF_SQL_BIT,CF_SQL_DECIMAL,CF_SQL_FLOAT,CF_SQL_REAL,CF_SQL_TIMESTAMP,CF_SQL_DATE,CF_SQL_CHAR,CF_SQL_CHAR,CF_SQL_VARCHAR,CF_SQL_VARCHAR,CF_SQL_LONGVARCHAR,CF_SQL_LONGVARCHAR';
	
	if(ListFind(MSSQLType,DataType)) {
		return ListGetAt(CFSQLType,ListFind(MSSQLType,DataType));
	} else { return 'NULL'; }
}
</cfscript>

<cfscript>
/**
 * Creates UUIDs safe for use in MSSQL UNIQUEIDENTIFIER fields.
 * 
 * @param format 	 UUID format to generate.  Options are String or Binary. (Optional)
 * @return Returns a string. 
 * @author Chip Temm (chip@anthrologik.net) 
 * @version 1, June 27, 2002 
 */
function MSSQL_createUUID(){
	var format = 'string';
	// uniqueidentifier wombat_createUUID([string FORMAT])
	//returns a UUID in the format specified.  
	//optional argument FORMAT defaults to string (MS-SQL uniqueidentifier safe)
	//accepts 'binary' or 'string'.  other values fail quietly to 'string'
	
	
	if(arraylen(Arguments)){
		if(arguments[1] eq 'binary' or arguments[1] eq 'string'){
			format = arguments[1];
		}
	}
	
	if(format eq 'string'){
		return Insert("-", CREATEuuid(), 23);
		/***   NOTE quoted usage is SQL statement:
		Insert into attribute (attributeID) values ('#wombat_createUUID()#')
		***/
	
	}else{//must be raw binary
		return '0x' & Replace(CREATEuuid(),'-','','All'); 
		/***   NOTE UN-quoted usage is SQL statement:
		Insert into attribute (attributeID) values (#wombat_createUUID('binary')#)
		Good for cases where the value maybe either NULL or a UUID
		(neither of which should be quoted)
		***/
	}
}
</cfscript>

<cfscript>
/**
 * Checks to see if the number is a valid SQL-92 integer.
 * Rewritten by RCamden. Code didn't work as submitted.
 * 
 * @param number 	 Number to check. (Required)
 * @return Returns a number. 
 * @author Michael Slatoff (michael@slatoff.com) 
 * @version 1, April 1, 2003 
 */
function MSSQLInt(number) {
	if (val(number) LT -2147483648 OR val(number) GT 2147483247) return 0;
	else return number;
}
</cfscript>

<cfscript>
/**
 * Converts a CF DateTime object into a MySQL timestamp.
 * 
 * @param dt 	 Date object. (Required)
 * @return Returns a string. 
 * @author Mark Andrachek (hallow@webmages.com) 
 * @version 1, June 27, 2002 
 */
function MySQLDT2TS(dt) {
	return Year(dt) & NumberFormat(Month(dt),'00') & NumberFormat(Day(dt),'00') & NumberFormat(Hour(dt),'00') & NumberFormat(Minute(dt),'00') & NumberFormat(Second(dt),'00');
}
</cfscript>

<cfscript>
/**
 * Converts a MySQL timestamp to a CF DateTime object.
 * 
 * @param timestamp 	 MySQL time stamp. (Required)
 * @return Returns a date/time object. 
 * @author Mark Andrachek (hallow@webmages.com) 
 * @version 1, June 27, 2002 
 */
function MySQLTS2DT(timestamp) {
	return CreateDateTime(Left(timestamp,4),Mid(timestamp,5,2),Mid(timestamp,7,2),Mid(timestamp,9,2),Mid(timestamp,11,2),Mid(timestamp,13,2));
}
</cfscript>

<cfscript>
/**
 * Useful in constructing SQL statements that must handle empty strings as NULLs.
 * Rewritten to use one UDF by RCamden
 * 
 * @param columnValue 	 The value to test.  (Required)
 * @param dataType 	 Allows you to specify 'alpha' or 'numeric'. If alpha, value is wrapped in single quotes. Default is alpha. (Optional)
 * @return Returns a string. 
 * @author Charles McElwee (cmcelwee@etechsolutions.com) 
 * @version 1, September 20, 2002 
 */
function NullColumn(columnValue) {
	var dataType = "alpha";
	
	if(arrayLen(arguments) gte 2) dataType = arguments[2];
	if(trim(columnValue) eq "") return "NULL";
 	else if(dataType is "alpha") return "'" & columnValue & "'";
	else return columnValue;
}
</cfscript>

<!---
 Change query order from horizontal to vertical to display in a HTML table
 
 @param theQuery 	 cfquery object to "rotate" (Required)
 @param tableCols 	 Number of columns to output (Optional)
 @return Returns a query. 
 @author Jose Alberto Guerra (cheveguerra@gmail.com) 
 @version 0, March 6, 2010 
--->
<cffunction name="qryOrderToTable" returntype="query" hint="Changes horizontal order to vertical in a query to display in a HTML table" output="no">
	<cfargument name="theQuery" type="query" required="yes">
	<cfargument name="tableCols" type="numeric" default="2">
	<cfset var change=ceiling(theQuery.recordCount/tableCols)>
	<cfset var column=0>
	<cfset var newQry=QueryNew("#theQuery.columnList#")>
	<cfset var temp = QueryAddRow(newQry, theQuery.recordCount)>
	<cfset var thisRow=0>
	<cfset var c=0>
	<cfset var newPos=0>
	<cfset var thisCol=0>

	<cfoutput query="theQuery">
		<cfset thisRow=currentRow>
		<cfloop index="c" from="1" to="#tableCols#">
			<cfif currentRow gt (change*c)><cfset column=c><cfset thisRow=currentRow-(change*c)></cfif>
		</cfloop>
		<cfset newPos=thisRow+column+((thisRow-1)*(tableCols-1))>
		<cfloop index="thisCol" list="#theQuery.columnList#">
			<cfset temp = QuerySetCell(newQry, thisCol, evaluate(thisCol), newPos)>
		</cfloop>
	</cfoutput>
	<cfreturn newQry>
</cffunction>

<!---
 Returns the SQL statement used to generate the specified query.
 
 @param queryname 	 Name of the query you wish to return the SQL statement for. (Required)
 @return Returns a string. 
 @author Ben Forta (ben@forta.com) 
 @version 1, October 15, 2002 
--->
<CFFUNCTION NAME="QueryGetSQL" RETURNTYPE="string">

	<!--- Query name is required --->
	<CFARGUMENT NAME="queryname" TYPE="string" REQUIRED="yes">

        <!--- Initialize variables --->
        <CFSET var cfdebugger="">
        <CFSET var events ="">
        
	<!--- Initialize result string --->
	<CFSET var result="">

	<!--- Requires debug mode --->
	<CFIF IsDebugMode()>

		<!--- Use debugging service --->
		<CFOBJECT ACTION="CREATE"
		          TYPE="JAVA"

CLASS="coldfusion.server.ServiceFactory"
				  NAME="factory">
		<CFSET cfdebugger=factory.getDebuggingService()>

		<!--- Load the debugging service's event table --->
		<CFSET events = cfdebugger.getDebugger().getData()>

		<!--- Get SQL statement (body) for specified query --->
		<CFQUERY DBTYPE="query" NAME="getquery" DEBUG="false">
		SELECT body
		FROM events
		WHERE type='SqlQuery' AND name='#queryname#'
		</CFQUERY>

		<!--- Save result --->
		<CFSET result=getquery.body>
	</CFIF>

	<!--- Return string --->
	<CFRETURN result>
</CFFUNCTION>

<cfscript>
/**
 * Removes ms sql freetext stop words from a sting.
 * 
 * @param TheList 	 List of items to check. (Required)
 * @param delims 	 List of delimiters. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Joe Graves (joe@stagingroom.com) 
 * @version 1, August 10, 2007 
 */
/**
 * Remove Stop words from list for SQL FreeText Search.
 * 
 * @function:  RemoveSQLStops
 * @param required: TheList
 * @param dilims optional: The delimiters add as the second argument
 * @return a string with stop words removed.
 * @syntax default: RemoveSQLStops("The,stuff,to,remove")
 * @syntax optional delimiter: RemoveSQLStops("The stuff to remove", " ")
 * @author Joe Graves StagingRoom.com (joe@stagingroom.com) 
 * @version 1, 12/08/2006 
 */
function removeSQLStops(TheList){
// list of stop words 
var TheStopList="a,about,1,after,2,all,also,3,an,4,and,5,another,6,any,7,are,8,as,9,at,0,be,$,because,been,before,being,between,both,but,by,came,can,come,could,did,do,each,for,from,get,got,has,had,he,have,her,here,him,himself,his,how,if,in,into,is,it,like,make,many,me,might,more,most,much,must,my,never,now,of,on,only,or,other,our,out,over,said,same,see,should,since,some,still,such,take,than,that,the,their,them,then,there,these,they,this,those,through,to,too,under,up,very,was,way,we,well,were,what,where,which,while,who,with,would,you,your";

var delims = ",";
var i=1;
var OriginalSize=0;
var results="";

//check for declared delimiter
if(arrayLen(arguments) gt 1) delims = arguments[2];

// get the size of the list
OriginalSize=listlen(TheList,delims);

// loop over the list and search for stop words
	for(; i lte OriginalSize; i=i+1){
	//if the word is not in the stop word list add it to the results
		if(ListFindNoCase(TheStopList, ListGetAt(TheList,i,delims),"," ) EQ 0) {
	// word a are added to new list (list is returned with the same delimiter passed in to the function) 
				results=ListAppend(results,(ListGetAt(TheList,i,delims)),delims);
			}
		}
		return results;
}
</cfscript>

<!---
 This function will return all child tables of a mySQL database as an array.
 
 @param Path 	 Path to where mysqlshow exists. (Required)
 @param Database 	 Database to inspect. (Required)
 @param Timeout 	 Time to wait for results. Defaults to 30. (Optional)
 @return Returns an array. 
 @author brandon wyckoff (bwyckoff2@cox.net) 
 @version 1, June 4, 2004 
--->
<cffunction name="showDatabaseTablesMySQL">
	<cfargument name="path" required="true">
	<cfargument name="database" required="true">
	<cfargument name="timeout" required="false" default="30">
	<cfscript>
		var a = "";
		var x = "";
		var y = 1;
		database=replace(database, '_', '\_', 'all');
	</cfscript>
	<cfexecute name="#arguments.path#\mysqlshow" arguments="#arguments.database#" timeout="#arguments.timeout#" variable="mySQLDB"></cfexecute>
	<cfscript>
		a=replaceList(mySQLDB,'+,-, ,','');
		a=trim(a);
		x=arrayNew(1);
	</cfscript>
	<cfloop list="#a#" index="i" delimiters="|">
		<cfscript>
			if (not compareNoCase(left(i, 9), "Database:")) {
					
			} else if (not compareNoCase(trim(replace(i, '|', '', 'all')),"Tables")) {
					x = arrayNew(1);
			} else if (compareNoCase(trim(i), "")) {
					x[y]=i;
					y=y+1;			
			}
		</cfscript>
	</cfloop>
	<cfreturn x>
</cffunction>

<cfscript>
/**
 * Smart boolean searching in SQL queries.
 * 
 * @param searchterm 	 Search string. (Required)
 * @param field 	 List of fields to search against. (Required)
 * @return Returns a string. 
 * @author Craig McDonald (craig@neuralmotion.com.au) 
 * @version 0, September 27, 2008 
 */
function smartSearch(searchterm, field) {
	//init fields
	var fieldcount = 0;
	var currentfield = "";
	var searchstring = "";
	var startBracketCount = 0;
	var endBracketCount = 0;
	var bracketPoint = 0;
	var searchtermflag = "";
	var counter = "";
	var numchars = "";
	var preboolterm = "";
	var searchportion = "";
	var temp = "";
	var thisSearchTerm = "";
	
	arguments.booloperator = "OR";
	
	if(ArrayLen(arguments) GTE 3)
		arguments.booloperator = arguments[3];
		
	//trim leading and trailing spaces from the search term
	arguments.searchterm = trim(arguments.searchterm);
		
	//Count number of brackets for safety - if there is an uneven number
	//remove them all. Otherwise, it is safe to leave them.
	bracketPoint = Find("(", arguments.searchterm);
	while(bracketPoint IS NOT 0) {
		startBracketCount = startBracketCount + 1;
		bracketPoint = Find("(", arguments.searchterm, bracketPoint+1);
	}	
		
	bracketPoint = Find(")", arguments.searchterm);
	while(bracketPoint IS NOT 0) {
		endBracketCount = endBracketCount + 1;
		bracketPoint = Find(")", arguments.searchterm, bracketPoint+1);
	}
		
	if(startBracketCount IS NOT endBracketCount) {
		//Remove the brackets from the searchterm
		arguments.searchterm = Replace(arguments.searchterm, "(", "", "ALL");
		arguments.searchterm = Replace(arguments.searchterm, ")", "", "ALL");
	}
	
	if(arguments.booloperator IS "EXACT") {
		for (fieldcount = 1; fieldcount LTE ListLen(arguments.field); fieldcount = fieldcount + 1) {
			if(fieldcount IS 1)
				searchstring = searchstring & "(";
			else
				searchstring = searchstring & " OR ";
			
			currentfield = ListGetAt(arguments.field, fieldcount);
			searchstring = searchstring & "(" & currentfield & " Like '%" & arguments.searchterm & "%')";
		}
		
		if (Len(searchstring) GT 0)
			searchstring = searchstring & ")";
	}
	else {
		//init vars
		searchtermflag = 1;
		counter = 1;
		numchars = 0;
		prevboolterm = '';
		
		// Loop until there are no keywords left in the searchterm
		while (counter LTE Len(arguments.searchterm)) {
			//If this is the last searchterm, set the portion to the rest of the string
			if(counter IS Len(arguments.searchterm))
				searchportion = Len(arguments.searchterm);
			else //otherwise find the next keyword
			{
				searchportion = Find(" ", Right(arguments.searchterm, Len(arguments.searchterm) - counter));
				//Check if there is a ( opening bracket at the start of the string and if there is a " directly following
				if(Find("(", Mid(arguments.searchterm, counter, searchportion)) IS 1 AND Find('"', Mid(arguments.searchterm, counter, searchportion)) IS 2)
				{
					//Remove the start quote from the beginning
					attributes.searchterm = RemoveChars(arguments.searchterm, counter + 1, 1);
					searchportion = searchportion - 1;

					//There is, so find the end quote.
					searchportion = Find('"', Mid(arguments.searchterm, counter, Len(arguments.searchterm))) - 1;
					
					//Remove the end quote from the position found
					arguments.searchterm = RemoveChars(arguments.searchterm, counter + searchportion, 1);

					//Check if the last character after the " quote is a ) closing bracket. 
					//If it is, extend the searchportion to include it.
					if(Mid(arguments.searchterm, counter + searchportion, 1) IS ")")
						searchportion = searchportion + 1;
				}
				
				//otherwise find if there's just a quote at the start of the keyword
				if(Find('"', Mid(arguments.searchterm, counter, searchportion)) IS 1)
				{
					//There is, so find the end quote.
					counter = counter + 1;
					temp = 1;
					searchportion = Find('"', Mid(arguments.searchterm, counter, Len(arguments.searchterm))) - 1;
					
					//Remove the end quote from the position found
					arguments.searchterm = RemoveChars(arguments.searchterm, counter + searchportion, 1);
									
					//Check if the last character after the " quote is a ) closing bracket. 
					//If it is, extend the searchportion to include it.
					if(Mid(arguments.searchterm, counter + searchportion, 1) IS ")")
						searchportion = searchportion + 1;					
				}
				
				//if there are no keywords left, set the portion to the rest of the string
				if(searchportion IS 0)
					searchportion = Len(arguments.searchterm);
			}
	
			// Check if this portion contains any boolean terms
			if ((Mid(arguments.searchterm, counter, searchportion) IS "OR" OR Mid(arguments.searchterm, counter, searchportion) IS "AND" OR Mid(arguments.searchterm, counter, searchportion) IS "NOT") AND counter IS NOT 1 AND searchportion IS NOT Len(arguments.searchterm)) {
				// Check if the current boolean term is just a NOT by itself (no AND or OR preceding it)
				if ((prevboolterm IS NOT "AND" AND prevboolterm IS NOT "OR") AND Mid(arguments.searchterm, counter, searchportion) IS "NOT") {
					// Append AND and the boolean term to the SQL string
					searchstring = searchstring & " AND " & Mid(arguments.searchterm, counter, searchportion) & " ";
				}
				else {
					// Append this boolean term to the SQL string
					searchstring = searchstring & " " & Mid(arguments.searchterm, counter, searchportion) & " ";
				}
				
				// Set the previous boolean term to the current boolean term
				prevboolterm = Mid(arguments.searchterm, counter, searchportion);
				
				// Set the search term set flag
				searchtermflag = 1;
			}
			else {
				// Loop through each of the fields to search on
				for (fieldcount = 1; fieldcount LTE ListLen(arguments.field); fieldcount = fieldcount + 1) {
					currentfield = ListGetAt(arguments.field, fieldcount);
				
					//if there were no boolean terms pre-existing, add some
					if(searchtermflag LTE 0)
					{
						//if there's more than one field to search on, OR the keyword
						if(fieldcount GT 1)
							searchstring = searchstring & " OR ";
						else //otherwise, AND the keyword (by default), or whatever the booloperator is set to
							searchstring = searchstring & " " & arguments.booloperator & " ";
					}
					
					//if this is the first field to search on, add an opening bracket
					if(fieldcount IS 1)
						searchstring = searchstring & "(";
					
					//Replace all ' single quotes with '' double quotes - safe parsing
					thisSearchTerm = Replace(Mid(arguments.searchterm, counter, searchportion), "'", "''", "ALL");
					
					//init loop vars
					startBrackets = "";
					endBrackets = "";
					
					//Find any brackets at the start of the searchterm
					bracketPoint = Find("(", thisSearchTerm);
					while(bracketPoint IS NOT 0)
					{
						startBrackets = startBrackets & "(";
						bracketPoint = Find("(", thisSearchTerm, bracketPoint+1);
					}

					//Find any brackets at the end of the searchterm					
					bracketPoint = Find(")", thisSearchTerm);
					while(bracketPoint IS NOT 0)
					{
						endBrackets = endBrackets & ")";
						bracketPoint = Find(")", thisSearchTerm, bracketPoint+1);
					}
					
					//Remove the brackets from the searchterm
					thisSearchTerm = Replace(thisSearchTerm, "(", "", "ALL");
					thisSearchTerm = Replace(thisSearchTerm, ")", "", "ALL");
					
					//append this keyword to the SQL string
					searchstring = searchstring & startBrackets & "(" & currentfield & " LIKE '%" & thisSearchTerm & "%')" & endBrackets;
					//set the end of searchterm flag
					searchtermflag = searchtermflag - 1;
					
					//clear the previous boolean term - should be reset for next word to be checked correctly
					//Re: NOT's without AND's
					prevboolterm = "";
				}	
			}
			
			// If there are no search terms left then close the bracket
			if (searchtermflag LTE 0)
				searchstring = searchstring & ")";
		
			// Move to the next search portion
			counter = counter + searchportion + 1;
		}
	}
	
	//Return the SQL string
	return searchstring;
}
</cfscript>

<!---
 Verifies a DSN is working.
 
 @param dsn 	 Name of a DSN you want to verify. (Required)
 @return Returns a Boolean. 
 @author Ben Forta (ben@forta.com) 
 @version 1, October 15, 2002 
--->
<CFFUNCTION NAME="VerifyDSN" RETURNTYPE="boolean">
   <CFARGUMENT NAME="dsn" TYPE="string" REQUIRED="yes">

   <!--- initialize variables --->
   <CFSET var dsService="">
   <!--- Try/catch block, throws errors if bad DSN --->
   <CFSET var result="true">


   <CFTRY>
      <!--- Get "factory" --->
      <CFOBJECT ACTION="CREATE"
                TYPE="JAVA"
                CLASS="coldfusion.server.ServiceFactory"
                NAME="factory">
      <!--- Get datasource service --->
      <CFSET dsService=factory.getDataSourceService()>
      <!--- Validate DSN --->
      <CFSET result=dsService.verifyDatasource(dsn)>

      <!--- If any error, return FALSE --->
	  <CFCATCH TYPE="any">
	     <CFSET result="false">
	  </CFCATCH>
   </CFTRY>

   <CFRETURN result>
</CFFUNCTION>








</cfcomponent>