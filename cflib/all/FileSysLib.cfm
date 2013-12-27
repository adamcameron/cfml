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

<cfscript>
/**
 * Adds a &quot;FullPath&quot; column to provided directory query.
 * 
 * @param theQuery 	 The query returned from CFDIRECTORY (Required)
 * @param basePath 	 String containing the path to the directory used in the CFDIRECTORY call (Optional)
 * @return query 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, July 9, 2003 
 */
function addPathsToDirectoryQuery(theQuery, basePath) {
	var row = 0;
	var new_col_array = arrayNew(1);

	if (listFindNoCase(theQuery.columnList, "FullPath")) {
		for(row=1; row LTE theQuery.recordCount; row=row+1) {
			querySetCell(theQuery, "FullPath", basePath & theQuery.name[row], row);
		}
	} else {
		for(row=1; row LTE theQuery.recordCount; row=row+1) {
			new_col_array[row] = basePath & theQuery.name[row];
		}
		queryAddColumn(theQuery, "FullPath", new_col_array);
	}

	return theQuery;
}
</cfscript>

<cfscript>
/**
 * Returns the amount of space (in bytes) available to the ColdFusion server for a specified drive or network share. (Windows only)
 * 
 * @param drvPath 	 Drive letter (c, c:, c:\) or network share (\\computer\share). 
 * @return Returns a simple value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, July 19, 2001 
 */
function AvailableSpace(drvPath)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  Return drive.AvailableSpace;
}
</cfscript>

<cfscript>
/**
 * Pass in a value in bytes, and this function converts it to a human-readable format of bytes, KB, MB, or GB.
 * Updated from Nat Papovich's version.
 * 01/2002 - Optional Units added by Sierra Bufe (sierra@brighterfusion.com)
 * 
 * @param size 	 Size to convert. 
 * @param unit 	 Unit to return results in.  Valid options are bytes,KB,MB,GB. 
 * @return Returns a string. 
 * @author Paul Mone (paul@ninthlink.com) 
 * @version 2.1, January 7, 2002 
 */
function byteConvert(num) {
	var result = 0;
	var unit = "";
	
	// Set unit variables for convenience
	var bytes = 1;
	var kb = 1024;
	var mb = 1048576;
	var gb = 1073741824;

	// Check for non-numeric or negative num argument
	if (not isNumeric(num) OR num LT 0)
		return "Invalid size argument";
	
	// Check to see if unit was passed in, and if it is valid
	if ((ArrayLen(Arguments) GT 1)
		AND ("bytes,KB,MB,GB" contains Arguments[2]))
	{
		unit = Arguments[2];
	// If not, set unit depending on the size of num
	} else {
		  if      (num lt kb) {	unit ="bytes";
		} else if (num lt mb) {	unit ="KB";
		} else if (num lt gb) {	unit ="MB";
		} else                {	unit ="GB";
		}		
	}
	
	// Find the result by dividing num by the number represented by the unit
	result = num / Evaluate(unit);
	
	// Format the result
	if (result lt 10)
	{
		result = NumberFormat(Round(result * 100) / 100,"0.00");
	} else if (result lt 100) {
		result = NumberFormat(Round(result * 10) / 10,"90.0");
	} else {
		result = Round(result);
	}
	// Concatenate result and unit together for the return value
	return (result & " " & unit);
}
</cfscript>

<!---
 Scans a directory (or path) for files of a specified extension and then copies them to the path you specify.
 v2 by Raymond Camden. I just cleaned up the var statements.
 
 @param extensions 	 List of extensions to copy. (Required)
 @param destinationPath 	 Destination directory. (Required)
 @param sourcePath 	 Source directory. (Required)
 @return Returns nothing. 
 @author Steven Ross (steven.ross@zerium.com) 
 @version 2, April 7, 2006 
--->
<cffunction name="collectFiles" access="public" hint="recurses through a directory and collects the file types you want then outputs to another directory" returnType="void">
	<cfargument name="extensions" required="true" type="string" hint="The extensions you want to gather up csv (list) format ex:(asp,cfm,jsp) ">
	<cfargument name="destinationPath" required="true" type="string" hint="absolute path to storage directory">
	<cfargument name="sourcePath" required="true" type="string" hint="absolute path to source directory">
	<cfset var root = arguments.sourcePath/>
	<cfset var i = "">
	<cfset var absPath = "">
	<cfset var relativePath = "">
	<cfset var writeTo = "">
	<cfset var pathAndFile = "">
	
	<cfif not directoryExists(arguments.sourcePath)>
		<cfthrow message="Source Directory (#arguments.sourcePath#) not found" detail="You didn't pass in a valid source directory, check the path and try again.">
	</cfif>
	
	<cfloop list="#arguments.extensions#" index="i">
		
		<cfdirectory name="getFiles" directory="#root#" recurse="true" filter="*.#i#">
	
			<cfloop query="getFiles">
				
				<cfset absPath = getFiles.directory & "/" />
				
				<cfset relativePath = Replace(absPath, root, "", "all") />
				
				<cfset writeTo = ARGUMENTS.destinationPath & "/" & relativePath>
				
				<cfset pathAndFile = getFiles.directory & "/" & getFiles.name />
				
				<cfif not directoryExists(writeTo)>
					<cfdirectory action="create" directory="#writeTo#">
					<cffile action="copy" source="#pathAndFile#" destination="#writeTo#">
				<cfelse>
					<cffile action="copy" source="#pathAndFile#" destination="#writeTo#">
				</cfif>
				
			</cfloop>
			
	</cfloop>

</cffunction>

<cfscript>
/**
 * Creates a unique file name; used to prevent overwriting when moving or copying files from one location to another.
 * v2, bug found with dots in path, bug found by joseph
 * v3 - missing dot in extension, bug found by cheesecow
 * 
 * @param fullpath 	 Full path to file. (Required)
 * @return Returns a string. 
 * @author Marc Esher (marc.esher@cablespeed.com) 
 * @version 3, July 1, 2008 
 */
function createUniqueFileName(fullPath){
    var extension = "";
    var thePath = "";
    var newPath = arguments.fullPath;
    var counter = 0;
    
    if(listLen(arguments.fullPath,".") gte 2) extension = listLast(arguments.fullPath,".");
    thePath = listDeleteAt(arguments.fullPath,listLen(arguments.fullPath,"."),".");

    while(fileExists(newPath)){
        counter = counter+1;        
        newPath = thePath & "_" & counter & "." & extension;            
    }
    return newPath;    
}
</cfscript>

<!---
 Recursively delete a directory.
 
 @param directory 	 The directory to delete. (Required)
 @param recurse 	 Whether or not the UDF should recurse. Defaults to false. (Optional)
 @return Return a boolean. 
 @author Rick Root (rick@webworksllc.com) 
 @version 1, July 28, 2005 
--->
<cffunction name="deleteDirectory" returntype="boolean" output="false">
	<cfargument name="directory" type="string" required="yes" >
	<cfargument name="recurse" type="boolean" required="no" default="false">
	
	<cfset var myDirectory = "">
	<cfset var count = 0>

	<cfif right(arguments.directory, 1) is not "/">
		<cfset arguments.directory = arguments.directory & "/">
	</cfif>
	
	<cfdirectory action="list" directory="#arguments.directory#" name="myDirectory">

	<cfloop query="myDirectory">
		<cfif myDirectory.name is not "." AND myDirectory.name is not "..">
			<cfset count = count + 1><cfdump var="#myDirectory#">
			<cfswitch expression="#myDirectory.type#">
			
				<cfcase value="dir">
					<!--- If recurse is on, move down to next level --->
					<cfif arguments.recurse>
						<cfset deleteDirectory(
							arguments.directory & myDirectory.name,
							arguments.recurse )>
					</cfif>
				</cfcase>
				
				<cfcase value="file">
					<!--- delete file --->
					<cfif arguments.recurse>
						<cffile action="delete" file="#arguments.directory##myDirectory.name#">
					</cfif>
				</cfcase>			
			</cfswitch>
		</cfif>
	</cfloop>
	<cfif count is 0 or arguments.recurse>
		<cfdirectory action="delete" directory="#arguments.directory#">
	</cfif>
	<cfreturn true>
</cffunction>

<!---
 Delete empty folder from given path.
 
 @param path 	 Path to delete (if empty). (Required)
 @return Returns a boolean. 
 @author Pritesh (pritesh@thecfguy.com) 
 @version 1, May 30, 2011 
--->
<cffunction name="deleteEmptyFolder" access="public" output="false" returntype="boolean">
	<cfargument name="path" required="true" type="string" />
	<cfset var qList="">
	<cfset var qDir = "">
	<cfset var qFiles = "">
	<cfset var isEmpty = 1>
	<!--- List Directory --->
	<cfdirectory action="list" directory="#arguments.path#" recurse="no" name="qList">
	<!--- get sub directory list --->
	<cfquery name="qDir" dbtype="query">
		select * from qList where type='Dir'
	</cfquery>
	<!--- Call recursive function to check directory empty or not --->
	<cfloop query="qDir">
		<!--- If sub directory not empty mark current directory as not empty. --->
		<cfif not deleteEmptyFolder(qDir.directory & "\" & qDir.name)>
			<cfset isEmpty=0>
		</cfif>
	</cfloop>

	<!--- Check for file exists in current directory --->
	<cfquery name="qFiles" dbtype="query">
		select * from qList where type='File'
	</cfquery>
	<!--- If file exists mark as not empty --->
	<cfif qFiles.recordCount gt 0>
		<cfset isEmpty = 0>
	</cfif>

	<!--- If current directory empty then delete it --->
	<cfif isEmpty>
		<cfdirectory action="delete" recurse="false" directory="#arguments.path#">
	</cfif>
	<!--- Return empty status for current directory --->
	<cfreturn isEmpty>
</cffunction>

<!---
 Copies a directory.
 v1.0 by Joe Rinehart
 v2.0 mod by [author not noted]
 v3.1 mod by Anthony Petruzzi
 v3.2 mod by Adam Cameron under guidance of Justin Z (removing NAMECONFLICT argument which was never supported in file-copy operations)
 
 @param source 	 Source directory. (Required)
 @param destination 	 Destination directory. (Required)
 @param ignore 	 List of folders, files to ignore. Defaults to nothing. (Optional)
 @return Returns nothing. 
 @author Joe Rinehart (joe.rinehart@gmail.com) 
 @version 3.2, March 21, 2013 
--->
<cffunction name="directoryCopy" output="false" returntype="void">
	<cfargument name="source" required="true" type="string">
	<cfargument name="destination" required="true" type="string">
	<cfargument name="ignore" required="false" type="string" default="">

	<cfset var contents = "">
	
	<cfif not(directoryExists(arguments.destination))>
		<cfdirectory action="create" directory="#arguments.destination#">
	</cfif>
	
	<cfdirectory action="list" directory="#arguments.source#" name="contents">

	<cfif len(arguments.ignore)>
		<cfquery dbtype="query" name="contents">
		select * from contents where name not in(#ListQualify(arguments.ignore, "'")#)
		</cfquery>
	</cfif>
	
	<cfloop query="contents">
		<cfif contents.type eq "file">
			<cffile action="copy" source="#arguments.source#/#name#" destination="#arguments.destination#/#name#">
		<cfelseif contents.type eq "dir">
			<cfset directoryCopy(arguments.source & "/" & name, arguments.destination & "/" & name)>
		</cfif>
	</cfloop>
</cffunction>

<cfscript>
/**
 * Returns True if the specified drive exists on the ColdFusion server. (Windows only)
 * 
 * @param drive 	 A drive letter or a complete path. 
 * @return Returns a Boolean value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, July 19, 2001 
 */
function DriveExists(drive)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  if (fso.DriveExists(drive)){
    Return True;
  }
  else {
    Return False;
  }
}
</cfscript>

<cfscript>
/**
 * Returns the drive letter of a physical drive or a network share. (Windows only)
 * 
 * @param drvPath 	 drive letter (c, c:, c:\) or network share (\\computer\share). 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, July 19, 2001 
 */
function DriveLetter(drvPath)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  Return drive.DriveLetter;
}
</cfscript>

<cfscript>
/**
 * Returns the path for the specified drive. (Windows only)
 * 
 * @param drvPath 	 Drive letter (c, c:, c:\) or network share (\\computer\share). 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 19, 2001 
 */
function DrivePath(drvPath)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  Return drive.Path;
}
</cfscript>

<cfscript>
/**
 * Returns the drive type for a specified drive. (Windows only)
 * 
 * @param drvPath 	 drive letter (c, c:, c:\) or network share (\\computer\share). 
 * @return Returns a simple value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 19, 2001 
 */
function DriveType(drvPath)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  //evaluate the drive type
  switch(drive.DriveType){
    case 0: 
    {
      Return "Unknown";
      break;
    }
    case 1: 
    {
      Return "Removable";
      break;
    }    
    case 2: 
    {
      Return "Fixed";
      break;
    }
    case 3: 
    {
      Return "Network";
      break;
    }
    case 4: 
    {
      Return "CD-ROM";
      break;
    }
    case 5: 
    {
      Return "RAM Disk";
      break;
    }
  }
}
</cfscript>

<cfscript>
/**
 * Checks if a file can be read.
 * 
 * @param filename 	 The file to check. (Optional)
 * @return Returns a boolean. 
 * @author Jesse Houwing (j.houwing@student.utwente.nl) 
 * @version 1, November 14, 2002 
 */
function FileCanRead(filename){
	var daFile = createObject("java", "java.io.File");
	daFile.init(JavaCast("string", filename));
	return daFile.canRead();
}
</cfscript>

<cfscript>
/**
 * Checks to see if a file can be written to.
 * 
 * @param filename 	 The name of the file. (Required)
 * @return Returns a boolean. 
 * @author Jesse Houwing (j.houwing@student.utwente.nl) 
 * @version 1, November 14, 2002 
 */
function FileCanWrite(filename){
	var daFile = createObject("java", "java.io.File");
	daFile.init(JavaCast("string", filename));
	return daFile.canWrite();
}
</cfscript>

<cfscript>
/**
 * Create a new file.
 * 
 * @param filename 	 Filename to create. (Required)
 * @param force 	 Force creation (will nuke existing file). Defaults to false. (Optional)
 * @return Returns nothing. 
 * @author Jesse Houwing (j.houwing@student.utwente.nl) 
 * @version 1, February 20, 2003 
 */
function FileCreate(filename){
	var force = false;
	var daFile = createObject('java', 'java.io.File');
	
	if(arraylen(arguments) gte 2) force = arguments[2];
	daFile.init(JavaCast('string', filename));
	if(force) daFile.delete();
	daFile.createNewFile();
}
</cfscript>

<cfscript>
/**
 * Returns the date/time a file was created. (Windows only)
 * 
 * @param file 	 Absolute or relative path to the specified file. 
 * @return Returns a date/time object. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 24, 2001 
 */
function FileDateCreated(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var theFile = fso.Getfile(path);
  Return theFile.DateCreated;
}
</cfscript>

<cfscript>
/**
 * Returns the date/time a file was last accessed. (Windows only)
 * 
 * @param path 	 Absolute or relative path to the specified file. 
 * @return Returns a date/time object. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 24, 2001 
 */
function FileDateLastAccessed(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var theFile = fso.GetFile(path);
  Return theFile.DateLastAccessed;
}
</cfscript>

<cfscript>
/**
 * Returns the date/time a file was last modified. (Windows only)
 * 
 * @param path 	 Absolute or relative path to the specified folder. 
 * @return Returns a date/time object. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 24, 2001 
 */
function FileDateLastModified(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var theFile = fso.GetFile(path);
  Return theFile.DateLastModified;
}
</cfscript>

<cfscript>
/**
 * Returns if a file is hidden or not.
 * 
 * @param FIlename 	 Filename to use. (Required)
 * @return Returns a boolean.. 
 * @author Jesse Houwing (j.houwing@student.utwente.nl) 
 * @version 1, November 15, 2002 
 */
function FileIsHidden(filename){
	var _File =  createObject("java", "java.io.File");
	_File.init(JavaCast("string", filename));
	return _File.isHidden();
}
</cfscript>

<cfscript>
/**
 * Returns the date the file was last modified.
 * v2 fixes for DTS by Mark Woods (mwoods@online.ie)
 * 
 * @param filename 	 Name of the file. (Required)
 * @return Returns a date. 
 * @author Jesse Houwing (j.houwing@student.utwente.nl) 
 * @version 1, June 11, 2009 
 */
function FileLastModified(filename){
	var oFile = createObject("java","java.io.File");
	var oDate = createObject("java","java.util.Date");
	oFile.init(fileName);
	return oDate.init(oFile.lastModified());
}
</cfscript>

<!---
 Makes all files in a directory lower case.
 
 @param directory 	 Directory to begin renaming files in. (Required)
 @param recurseDirectory 	 If true, UDF will recurse into subdirectories. Defaults to false. (Optional)
 @param excludeList 	 List of files to ignore. Defaults to nothing. (Optional)
 @return Returns nothing. 
 @author Nathan Dintenfass (nathan@changemedia.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="fileNamesLowerCase" output="no" returnType="void">
	<!--- the directory to lower case the files in --->
	<cfargument name="directory" required="yes" type="string">
	<!--- shall we recurse down the directory tree?  By default, no. --->
	<cfargument name="recurseDirectories" required="no" default="FALSE" type="boolean">
	<!--- list of files to exclude --->
	<cfargument name="excludeList" required="no" type="string" default="">
	<!--- a variable to hold the directoryList --->
	<cfset var directoryList = "">
	<!--- by default, use a Windows style slash --->
	<cfset var slash = "\">
	<!--- make sure this directory exists --->
	<cfif NOT directoryExists(arguments.directory)>
		<cfthrow message="Directory does not exist" detail="The directory path #arguments.directory# does not exist">
	</cfif>
	<!--- if this not windows, use a *nix style slash --->
	<cfif server.os.name DOES NOT CONTAIN "Windows">
		<cfset slash = "/">
	</cfif>
	<!--- now make sure the directory path ends in a slash --->
	<cfif right(arguments.directory,1) IS NOT slash>
		<cfset arguments.directory = arguments.directory & slash>
	</cfif>
	<!--- read the contents of this directory --->
	<cfdirectory action="list" directory="#arguments.directory#" name="directoryList">
	<!--- loop through the contents of this directory, making it lower case --->
	<cfloop query="directoryList">
		<!--- if this is a file, rename it to whatever it is, lower-cased --->
		<cfif NOT compare(type,"File") AND NOT listFindNoCase(arguments.excludeList,name)>
			<cffile action="rename" source="#arguments.directory##name#" destination="#arguments.directory##lcase(name)#">
		<!--- if this a directory, and we are recursing, call this function again --->
		<cfelseif NOT compare(type,"Dir") AND arguments.recurseDirectories>
			<cfset fileNamesLowerCase(arguments.directory & name,1,arguments.excludeList)>
		</cfif>
	</cfloop>
</cffunction>

<cfscript>
/**
 * Reads a file.
 * 
 * @param file 	 The filename to read. 
 * @param from 	 The line number specifying where to begin reading. 
 * @param to 	 The line number specifying where to stop reading. 
 * @param NL 	 Character to use for newlines. Defaults to Chr(13)Chr(10) 
 * @return Returns a string. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, December 3, 2001 
 */
function FileRead(filename) {
	var fileStr = "";
	var fileReaderClass = createObject("java", "java.io.FileReader");
	var fileReader = fileReaderClass.init(filename);
	var lineNumberReaderClass = createObject("java","java.io.LineNumberReader");
	var lineReader = lineNumberReaderClass.init(fileReader);
	var notDone = true;
	var lastLine = 0;
	var thisLine = 0;
	var NL = Chr(13) & Chr(10);
	var from = 0;
	var to = 0;
	var line = "";
	
	//optional FROM
	if(arrayLen(arguments) gt 1) from = arguments[2];
	//optional TO
	if(arrayLen(arguments) gt 2) to = arguments[3];
	//optional NL
	if(arrayLen(arguments) gt 3) NL = arguments[4];
	
	if(not fileExists(filename)) return "";
	
	while(notDone) {
		line = lineReader.readLine();
		thisLine = lineReader.getLineNumber();
		if( (from is 0 OR thisLine gte from) AND (to is 0 OR thisLine lte to)) fileStr = fileStr & line & NL;
		if(thisLine is lastLine) notDone = false;
		lastLine = thisLine;
	}
	
	return fileStr;
}
</cfscript>

<cfscript>
/**
 * Reads a text file, and returns content as a string.
 * 
 * @param sPath 	 Path to file. (Required)
 * @return Returns a string. 
 * @author Jeff Mathiot (brucewillisisnotdead@hotmail.com) 
 * @version 1, October 10, 2002 
 */
function ReadFileCom(sPath){
	var fileContent="";
	var oFSO=CreateObject("COM", "Scripting.FileSystemObject");
	var oFile=oFSO.OpenTextFile(sPath, 1, 0, 0);

	fileContent=oFile.ReadAll();
	oFile.Close();

	return fileContent;
}
</cfscript>

<cfscript>
/**
 * Makes a file ReadOnly.
 * 
 * @param filename 	 Filename to use. (Required)
 * @return Returns nothing. 
 * @author Jesse Houwing (j.houwing@student.utwente.nl) 
 * @version 1, November 15, 2002 
 */
function FileSetReadOnly(filename){
	var _File =  createObject("java", "java.io.File");
	_File.init(JavaCast("string", filename));
	_File.setReadOnly();
}
</cfscript>

<cfscript>
/**
 * This function will return the length of a file or a directory.
 * Version 2 by Nathan Dintenfass
 * Version 3 by Nat Papovich
 * 
 * @param filename 	 The filename or directory path. (Required)
 * @return Returns a number. 
 * @author Jesse Houwing (j.houwing@student.utwente.nl) 
 * @version 3, July 11, 2006 
 */
function fileSize(pathToFile) {
	var fileInstance = createObject("java","java.io.File").init(toString(arguments.pathToFile));
	var fileList = "";
	var ii = 0;
	var totalSize = 0;

	//if this is a simple file, just return it's length
	if(fileInstance.isFile()){
	    return fileInstance.length();
	}
	else if(fileInstance.isDirectory()) {
		fileList = fileInstance.listFiles();
		for(ii = 1; ii LTE arrayLen(fileList); ii = ii + 1){
		    totalSize = totalSize + fileSize(fileList[ii]);
		}
		return totalSize; 
	}
	else
		return 0;
}
</cfscript>

<cfscript>
/**
 * Returns the size (in bytes) of the specified file. (Windows only)
 * 
 * @param path 	 Absolute or relative path to the specified file. (Required)
 * @return Returns a simple value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, February 20, 2003 
 */
function FileSizeCom(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var theFile = fso.GetFile(path);
  Return theFile.Size;
}
</cfscript>

<cfscript>
/**
 * Returns the file system in use on the specified drive. (Windows only)
 * 
 * @param drvPath 	 Drive letter (c, c:, c:\) or network share (\\computer\share). 
 * @return Returns a simple value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 19, 2001 
 */
function FileSystem(drvPath)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  Return drive.FileSystem;
}
</cfscript>

<cfscript>
/**
 * Returns a string corresponding to the type of file specified. (Windows only)
 * 
 * @param path 	 Absolute or relative path to the specified file. 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 24, 2001 
 */
function FileType(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var theFile = fso.GetFile(path);
  Return theFile.Type;
}
</cfscript>

<cfscript>
/**
 * Will take a number returned from a File.Filesize, calculate the number in terms of Bytes/Kilobytes/Megabytes and return the result.
 * v2 by Haikal Saadh
 * v3 by Michael Smith, cleaned up and added Gigabytes
 * 
 * @param number 	 Size in bytes of the file. (Required)
 * @return Returns a string. 
 * @author Kyle Morgan (admin@kylemorgan.com) 
 * @version 3, February 3, 2009 
 */
function fncFileSize(size) {
	if (size lt 1024) return "#size# b";
	if (size lt 1024^2) return "#round(size / 1024)# Kb";
	if (size lt 1024^3) return "#decimalFormat(size/1024^2)# Mb";
	return "#decimalFormat(size/1024^3)# Gb";
}
</cfscript>

<cfscript>
/**
 * Will replace chars in a string to be used to create a folder with valid equivalent replacements
 * 
 * @param folder 	 Name of folder. (Required)
 * @return Returns a string. 
 * @author Mike Gillespie (mike@striking.com) 
 * @version 1, May 9, 2003 
 */
function foldercheck(folder) {
   var bad_chars="�,/,\,*,&,%,$,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�";
   var good_chars="A,-,-,-,-,-,-,A,A,A,A,A,A,C,D,E,E,E,E,I,I,I,I,N,O,O,O,O,O,U,U,U,U,Y,a,a,a,a,a,a,a,c,e,e,e,o,e,i,i,i,i,n,o,o,o,o,o,u,u,u,u,y,y,i";
   var scrubbed="";

   if(folder eq "") return "";
   return replace(replace(ReplaceList(trim(folder), bad_chars, good_chars)," ","_","all"),"'","","all");
}
</cfscript>

<cfscript>
/**
 * Returns the date/time a folder (directory) was created. (Windows only)
 * 
 * @param path 	 Absolute or relative path to the specified folder. 
 * @return Returns a date/time object. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 20, 2001 
 */
function FolderDateCreated(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var folder = fso.GetFolder(path);
  Return folder.DateCreated;
}
</cfscript>

<cfscript>
/**
 * Returns the date/time a folder (directory) was last accessed. (Windows only)
 * 
 * @param path 	 Absolute or relative path to the specified folder. 
 * @return Returns a date/time object. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 20, 2001 
 */
function FolderDateLastAccessed(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var folder = fso.GetFolder(path);
  Return folder.DateLastAccessed;
}
</cfscript>

<cfscript>
/**
 * Returns the date/time a folder (directory) was last modified. (Windows only)
 * 
 * @param path 	 Absolute or relative path to the specified folder. 
 * @return Returns a date/time object. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, December 20, 2001 
 */
function FolderDateLastModified(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var folder = fso.GetFolder(path);
  Return folder.DateLastModified;
}
</cfscript>

<cfscript>
/**
 * Returns True if the specified folder (directory) exists on the ColdFusion server. (Windows only)
 * 
 * @param folder 	 Complete path (absolute or relative) to the folder whose existence you want to test.  
 * @return Returns a Boolean value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, July 19, 2001 
 */
function FolderExists(folder)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  if (fso.FolderExists(folder)){
    Return True;
  }
  else {
    Return False;
  }
}
</cfscript>

<cfscript>
/**
 * Returns the amount of space (in bytes) of all files and subfolders contained in the specified folder. (Windows only)
 * 
 * @param path 	 Absolute or relative path to the specified folder. 
 * @return Returns a simple value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 23, 2001 
 */
function FolderSize(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var folder = fso.Getfolder(path);
  Return folder.Size;
}
</cfscript>

<cfscript>
/**
 * Returns a string corresponding to the type of folder specified. (Windows only)
 * 
 * @param path 	 Absolute or relative path to the specified folder. 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, July 24, 2001 
 */
function FolderType(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var folder = fso.Getfolder(path);
  Return folder.Type;
}
</cfscript>

<cfscript>
/**
 * Returns the amount of free space (in bytes) available to the ColdFusion server for a specified drive or network share. (Windows only)
 * 
 * @param drvPath 	 Drive letter (c, c:, c:\) or network share (\\computer\share). 
 * @return Returns a simple value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, July 19, 2001 
 */
function FreeSpace(drvPath)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  Return drive.FreeSpace;
}
</cfscript>

<cfscript>
/**
 * Returns extension defined by all characters following last period.
 * v2 by Ray Camden
 * 
 * @param name 	 File name to use. (Required)
 * @return Returns a string. 
 * @author Alexander Sicular (as867@columbia.edu) 
 * @version 2, May 9, 2003 
 */
function getExtension(name) {  
    if(find(".",name)) return listLast(name,".");
    else return "";
}
</cfscript>

<cfscript>
/**
 * Returns the number of files in a directory. (Windows only)
 * 
 * @param dir 	 Directory. (Required)
 * @return Returns a number. 
 * @author Bob Remeika (bobr@autobytel.com) 
 * @version 1, May 13, 2003 
 */
function GetFileCount(dir) {
	var fsobj = "";
	var foldr = "";
	var b = "";
	
	if (DirectoryExists(dir)) {
		fsobj = CreateObject("COM", "Scripting.FileSystemObject");
		foldr = fsobj.GetFolder(dir);
		b = foldr.Files;	// CF 5 does not support nested dot notation.
		return b.Count;
	} else {
		return -1;
	}
}
</cfscript>

<!---
 Returns the mime type of the specified file.
 
 @param filePath 	 The file to examine, (Required)
 @return Returns a string. 
 @author Ben Rogers (ben@c4.net) 
 @version 1, July 19, 2005 
--->
<cffunction name="getFileMimeType" returntype="string" output="no">
	
	<cfargument name="filePath" type="string" required="yes">
	
	<cfreturn getPageContext().getServletContext().getMimeType(arguments.filePath)>
	
</cffunction>

<cfscript>
/**
 * Retrieves the url for the current directory in full or relative format.
 * 
 * @param pathType 	 Format to return the path in.  Valid values are 'full' and 'relative'.  Returns the text string 'invalid paramter' if the parameter is not 'full' or 'relative'. Default value for the parameter is 'relative'.   
 * @return Returns a string. 
 * @author Spike (spike@spike.org.uk) 
 * @version 1, October 9, 2001 
 */
function GetHTTPDir() {
        var format = "";
	if (arraylen(arguments)) {
	 format = arguments[1];
		if (format EQ 'full') {
			return "http://#cgi.server_name##listDeleteAt(cgi.script_name,listlen(cgi.script_name,'/'),'/')#/";
		}
		else if (format EQ 'relative') {
			return "#listDeleteAt(cgi.script_name,listlen(cgi.script_name,'/'),'/')#/";
		}
		else {
			return 'invalid argument';
		}
	}
	else {
		return "#listDeleteAt(cgi.script_name,listlen(cgi.script_name,'/'),'/')#/";
	}
}
</cfscript>

<cfscript>
/**
 * Returns a relative path from the current template to an absolute file path.
 * v2 fix by Tony Monast
 * v2.1 fix by Tony Monast to deal with situations in which the specified path was the same as the current path, resulting in an error
 * 
 * @param abspath 	 Absolute path. (Required)
 * @return Returns a string. 
 * @author Isaac Dealey (info@turnkey.to) 
 * @version 2, August 30, 2012 
 */
function getRelative(abspath) {
        var currentPath = ListToArray(GetDirectoryFromPath(GetBaseTemplatePath()),"\/");
        var filePath = ListToArray(abspath,"\/");
        var relativePath = ArrayNew(1);
        var pathStart = 0;
        var i = 0;

        /* Define the starting path (path in common) */
        for (i = 1; i LTE ArrayLen(currentPath); i = i + 1) {

                if (currentPath[i] NEQ filePath[i]) {
                        pathStart = i;
                        break;
                }
        }

        if (pathStart GT 0) {
                /* Build the prefix for the relative path (../../etc.) */
                for (i = ArrayLen(currentPath) - pathStart ; i GTE 0 ; i = i - 1) {
                        ArrayAppend(relativePath,"..");
                }

                /* Build the relative path */
                for (i = pathStart; i LTE ArrayLen(filePath) ; i = i + 1) {
                        ArrayAppend(relativePath,filePath[i]);
                }
        }

        /* Same level */
        else
                ArrayAppend(relativePath,filePath[ArrayLen(filePath)]);

        /* Return the relative path */
        return ArrayToList(relativePath,"/");
}
</cfscript>

<cfscript>
/**
 * Returns the volume name for the specified drive. (Windows only)
 * 
 * @param drvPath 	 Drive letter (c, c:, c:\) or network share (\\computer\share). 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 19, 2001 
 */
function GetVolumeName(drvPath)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  Return drive.VolumeName;
}
</cfscript>

<cfscript>
/**
 * Checks for a valid file extension.
 * 
 * @param path 	 The file path. 
 * @param extlist 	 The list of valid extensions. 
 * @return Returns a boolean. 
 * @author Gyrus (gyrus23@hotmail.com) 
 * @version 1, December 19, 2001 
 */
function IsExtValid(path,extlist) {
	// Find the last dot
	var DotPos = Find(".", Reverse(path));
	// Grab the extension
	var ext = Right(path, 3);
        return (not ((DotPos NEQ 4) OR (NOT ListFindNoCase(extlist, ext))));
}
</cfscript>

<cfscript>
/**
 * Returns True if the specified drive is ready. (Windows only)
 * 
 * @param drvPath 	 Drive letter (c, c:, c:\) or network share (\\computer\share). 
 * @return Returns a Boolean value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, July 19, 2001 
 */
function IsReady(drvPath)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  Return drive.IsReady;
}
</cfscript>

<cfscript>
/**
 * Returns True if the specified folder is the root folder. (Windows only)
 * 
 * @param path 	 Absolute or relative path to the specified folder. 
 * @return Returns a Boolean value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 23, 2001 
 */
function IsRootFolder(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var folder = fso.Getfolder(path);
  Return folder.IsRootFolder;
}
</cfscript>

<cfscript>
/**
 * Create all non exitant directories in a path.
 * 
 * @param p 	 The path to create. (Required)
 * @return Returns nothing. 
 * @author Jorge Iriso (jiriso@fitquestsl.com) 
 * @version 1, September 21, 2004 
 */
function makeDirs(p){
	createObject("java", "java.io.File").init(p).mkdirs();
}
</cfscript>

<cfscript>
/**
 * Creates a URI from an absolute path.
 * 
 * @param path 	 Path to translate. (Required)
 * @return Returns a URI. 
 * @author Samuel Neff (sam@blinex.com) 
 * @version 1, September 23, 2004 
 */
function makeUriFromPath(path) {
   var uri = path;
     
   // make all backslashes into slashes
   uri = replace(uri, "\", "/", "all");
   if (left(uri,1) is "/") {
      uri = right(uri, len(uri) - 1);
    }
     
   uri = "file:///" & uri;
    
   return uri;
}
</cfscript>

<cfscript>
/**
 * normalizes a file path to remove invalid slashes and extra dots.
 * 
 * @param filePath 	 The file path to format. (Required)
 * @return Returns a string. 
 * @author S. Isaac Dealey (info@turnkey.to) 
 * @version 0, September 9, 2008 
 */
function normalizeFilePath(filePath) {
return CreateObject("java","java.io.File").init(filePath).getCanonicalPath();
}
</cfscript>

<cfscript>
/**
 * Calculate the relative path from startFile to endFile.
 * when two
 * Ver 1.1 fixes a minor bug when multiple files are located inside the same directory and their names start with the same letter.
 * 
 * @param startFile 	 First file. (Required)
 * @param endFile 	 Second file. (Required)
 * @return Returns a string. 
 * @author Massimo Foti (massimo@massimocorner.com) 
 * @version 1.1, May 19, 2003 
 */
function relativeFilePath(startFile,endFile){
	//In case we have absolute local paths, turn backward to forward slashes
	var startpath = Replace(startFile,"\","/","ALL"); 
	var endPath = Replace(endFile,"\","/","ALL"); 
	//Declare variables
	var i = 1;
	var j = 1;
	var endStr = "";
	var commonStr = "";
	var retVal = "";
	var whatsLeft = "";
	var slashPos = "";
	var slashCount = 0;
	var dotDotSlash = "";
	//Be sure the paths aren't equal
	if(startpath NEQ endPath){
		//If the starting path is longer, the destination path is our starting point
		if(len(startpath) GT len(endPath)){
			endStr = len(endPath);
		}
		//Else the starting point is the start path
		else{
			endStr = len(startpath);
		}
		//Check if the two paths share a base path and store it into the commonStr variable
		for(i;i LT endStr; i=i+1){
			//Compare one character at time
			if(mid(startpath,i,1) EQ mid(endPath,i,1)){
				commonStr = commonStr & mid(startpath,i,1);
			}
			else{
				break;
			}
		}
		//We just need the base directory
		commonStr=REReplaceNoCase(commonStr,"[^/]*$","");
		//If there is a common base path, remove it
		if(len(commonStr) GT 0){
			whatsLeft = mid(startpath,len(commonStr)+1,len(startpath));
		}
		else{
			whatsLeft = startpath;
		}
		slashPos = find("/",startpath);
		//Count how many directories we have to climb
		while(slashPos NEQ 0){
			slashCount = slashCount + 1;
			slashPos = find("/",whatsLeft,slashPos+1);
		}
		//Append "../" for each directory we have to climb
		for(j;j LT slashCount; j=j+1){
			dotDotSlash = dotDotSlash & "../";
		}
		//Assemble the final path
		retVal = dotDotSlash & mid(endPath,len(commonStr)+1,len(endPath));
	}
	//Paths are the same
	else{
		retVal = "";
	}
	return retVal;
}
</cfscript>

<cfscript>
/**
 * Function returns filename without extension.
 * 
 * @param name 	 Filename. (Required)
 * @return Returns a string. 
 * @author Richard (acdhirr@trilobiet.nl) 
 * @version 1, July 18, 2006 
 */
function ripExt(name) {
	return reReplace(arguments.name,"\.[^.]*$","");
}
</cfscript>

<cfscript>
/**
 * Returns the serial number for the specified drive. (Windows only)
 * 
 * @param drvPath 	 Drive letter (c, c:, c:\) or network share (\\computer\share). 
 * @return Returns a simple value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 19, 2001 
 */
function SerialNumber(drvPath)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  Return drive.SerialNumber;
}
</cfscript>

<cfscript>
/**
 * Function to set or clear a Windows file attribute (ReadOnly, Hidden, etc) for the specified file.
 * Uses COM. This is a Windows only funciton. Requires CFOBJECT be enabled in the CF Administrator.
 * 
 * @param sFilePath 	 Absolute or relative path to the specified file. 
 * @param sAttribute 	 Attribute you wish to set.  Options are: ReadOnly, Hidden, System, Archive. 
 * @param bOnOff 	 Boolean value indicating whether the attribute should be on (Yes) or off (No). 
 * @return Returns a Boolean value indicating whether the attribute was set. 
 * @author Nate Weiss (nate@nateweiss.com) 
 * @version 1, September 27, 2001 
 */
function SetFileAttribute(sFilePath, sAttribute, bOnOff) {
   var result = False;
   var fso = 0;
   var f = 0;
   var iListPosition = 0;
   var iFlagPosition = 0;
   
   if ( FileExists(sFilePath) ) {
     fso = CreateObject("COM", "Scripting.FileSystemObject");
     f = fso.GetFile(sFilePath);
     iListPosition = ListFindNoCase("ReadOnly,Hidden,System,Archive", sAttribute);
     
     if (iListPosition GT 0) {
       iFlagPosition = ListGetAt("0,1,2,5", iListPosition);
       f.attributes = BitMaskSet(f.attributes, IIF(bOnOff, 1, 0), iFlagPosition, 1);
       result = True;
     }
   }
  
   return result;
 }
</cfscript>

<cfscript>
/**
 * Updates the dateLastModified file attribute.
 * 
 * @param filename 	 Absolute filename. (Required)
 * @param newDate 	 Date/Time to assign. Defaults to current time. (Optional)
 * @return Returns a boolean. 
 * @author James Moberg (james@ssmedia.com) 
 * @version 1, June 14, 2011 
 */
function setFileDate(filename){
	var newDate = Now();
	if (ArrayLen(Arguments) GTE 2) { newDate = arguments[2]; }
	if (not isdate(newDate)) { return false; }
	else if (newDate LT '1/1/1970') { return false; }
	if (not fileExists(filename)) { return false; }
	newDate = DateDiff("s", DateConvert("utc2Local", "January 1 1970 00:00"), newDate) * 1000;
	return CreateObject("java","java.io.File").init(JavaCast("string",filename)).setLastModified(newDate);
}
</cfscript>

<cfscript>
/**
 * Convenience function to set/clear the ReadOnly attribute for the specified file.
 * Uses COM. This is a Windows only funciton. Requires CFOBJECT be enabled in the CF Administrator. This function depends on the SetFileAttribute() function in this library. See the SetFileAttribute() function for details.
 * 
 * @param sFilePath 	 Absolute or relative path to the specified file. 
 * @param bReadOnly 	 Boolean value indicating whether the attribute should be read only (Yes) or  (No). 
 * @return Returns a Boolean value indicating whether the attribute was set. 
 * @author Nate Weiss (nate@nateweiss.com) 
 * @version 1, September 27, 2001 
 */
function SetReadOnly(sFilePath, bReadOnly) {
   return setFileAttribute(sFilePath, "ReadOnly", bReadOnly);
 };
</cfscript>

<cfscript>
/**
 * Sets the volume name for the specified drive. (Windows only)
 * Sample code: 
 * <CFSET SetVolumeName("c", "System")>
 * 
 * @param drvPath 	 Drive letter (c, c:, c:\) or network share (\\computer\share). 
 * @param newName 	 New volume name for the drive. 
 * @return Returns True. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, August 2, 2001 
 */
function SetVolumeName(drvPath, newName)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  drive.VolumeName = newName;
  Return True;
}
</cfscript>

<cfscript>
/**
 * Returns the network share name for the specified drive. (Windows only)
 * 
 * @param drvPath 	 Drive letter (c, c:, c:\) or network share (\\computer\share). 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 19, 2001 
 */
function ShareName(drvPath)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  Return drive.ShareName;
}
</cfscript>

<cfscript>
/**
 * Returns the total size (in bytes) of a specified drive or network share. (Windows only)
 * 
 * @param drvPath 	 Drive letter (c, c:, c:\) or network share (\\computer\share). 
 * @return Returns a simple value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, August 20, 2001 
 */
function TotalSize(drvPath)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var drive = fso.GetDrive(drvPath);
  Return drive.TotalSize;
}
</cfscript>

<cfscript>
/**
 * Creates a unique filename from a passed prefix, file extension and current date/time.
 * Modified by RCamden, changed hh to HH, thanks to Nathan D. for idea.
 * 
 * @param prepend 	 Prefix for the filename. (Required)
 * @param ext 	 Extension to give the file. (Required)
 * @return Returns a string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 2, September 20, 2004 
 */
function uniquefilename(prepend,ext)
{
  Return "#prepend#_#dateformat(now(),"mmddyy")#_#timeformat(now(),"HHmmss")#.#ext#";
}
</cfscript>

<cfscript>
/**
 * Unzips a file to the specified directory.
 * 
 * @param zipFilePath 	 Path to the zip file (Required)
 * @param outputPath 	 Path where the unzipped file(s) should go (Required)
 * @return void 
 * @author Samuel Neff (sam@serndesign.com) 
 * @version 1, September 1, 2003 
 */
function unzipFile(zipFilePath, outputPath) {
	var zipFile = ""; // ZipFile
	var entries = ""; // Enumeration of ZipEntry
	var entry = ""; // ZipEntry
	var fil = ""; //File
	var inStream = "";
	var filOutStream = "";
	var bufOutStream = "";
	var nm = "";
	var pth = "";
	var lenPth = "";
	var buffer = "";
	var l = 0;
     
	zipFile = createObject("java", "java.util.zip.ZipFile");
	zipFile.init(zipFilePath);
	
	entries = zipFile.entries();
	
	while(entries.hasMoreElements()) {
		entry = entries.nextElement();
		if(NOT entry.isDirectory()) {
			nm = entry.getName(); 
			
			lenPth = len(nm) - len(getFileFromPath(nm));
			
			if (lenPth) {
			pth = outputPath & left(nm, lenPth);
		} else {
			pth = outputPath;
		}
		if (NOT directoryExists(pth)) {
			fil = createObject("java", "java.io.File");
			fil.init(pth);
			fil.mkdirs();
		}
		filOutStream = createObject(
			"java", 
			"java.io.FileOutputStream");
		
		filOutStream.init(outputPath & nm);
		
		bufOutStream = createObject(
			"java", 
			"java.io.BufferedOutputStream");
		
		bufOutStream.init(filOutStream);
		
		inStream = zipFile.getInputStream(entry);
		buffer = repeatString(" ",1024).getBytes(); 
		
		l = inStream.read(buffer);
		while(l GTE 0) {
			bufOutStream.write(buffer, 0, l);
			l = inStream.read(buffer);
		}
		inStream.close();
		bufOutStream.close();
		}
	}
	zipFile.close();
}
</cfscript>

<cfscript>
/**
 * Climbs up a given UNC Path a specified number of levels.
 * 
 * @param currDir 	 The directory to use as a starting point from which to climb. (Required)
 * @param upCt 	 Integer specifying the number of directory levels to move up. (Required)
 * @return Returns a string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, September 20, 2004 
 */
function upDirLevel(currDir,upCt){
	var i=1;
	var currDirTemp=Reverse(currDir);
	var s=0;
	for(i=1;i LTE upCt;i=i+1){
		s=findoneof("\/",currDirTemp,1);
		if(s EQ 1){
			currDirTemp=Right(currDirTemp,val(Len(currDirTemp)-s));
			s=find("\",currDirTemp,1);
			currDirTemp=Right(currDirTemp,val(Len(currDirTemp)-s));
		}else{
			currDirTemp=Right(currDirTemp,val(Len(currDirTemp)-s));
		}
	}
	currDirTemp="#reverse(replacenocase(currDirTemp,'/','\','ALL'))#\";
	return currDirTemp;
}
</cfscript>

<!---
 Automatically creates any missing directories before writing to the specified file.
 
 @param fileAndPath 	 Full pathname for the file to be created. (Required)
 @param fileOutput 	 Text to be saved to the file. (Required)
 @param fileAndPathMode 	 Mode to use when creating directories and the file. (Optional)
 @param fileAddNewLine 	 Boolean that determines if a newline should be entered at the end of the file. Defaults to false. (Optional)
 @param fileAttributes 	 Attributes to use for the new file. (Optional)
 @return Returns void. 
 @author Shawn Seley (shawnse@aol.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="WriteFileAndDirectories" output="false" returnType="void">
	<cfargument name="fileAndPath"      type="string"   required="true">
	<cfargument name="fileOutput"       type="string"   required="true">
	<cfargument name="fileAndPathMode"  type="string"   required="false"  default="">
	<cfargument name="fileAddNewLine"   type="boolean"  required="false"  default="yes">
	<cfargument name="fileAttributes"   type="string"   required="false"  default="">

	<cfset var path_array     = ListToArray(fileAndPath, "\")>
	<cfset var this_dir_path  = path_array[1]>   <!--- first item in fileAndPath is the drive path --->
	<cfset var file_name      = path_array[ArrayLen(path_array)]>   <!--- last item in fileAndPath is the file name --->
	<cfset var second_last    = ArrayLen(path_array)-1>

	<cfset var i = 0>

	<!--- lock these directories and files to prevent errors with concurrent threads --->
	<cflock timeout="30" throwontimeout="Yes" name="WriteFileAndDirectoriesLock" type="EXCLUSIVE">

		<!--- create any missing directories --->
		<cfloop index="i" from="2" to="#second_last#">
			<cfset this_dir_path = this_dir_path & "\" &  path_array[i]>
			<cfif not DirectoryExists(this_dir_path)>
				<cfif fileAndPathMode is "">
					<cfdirectory action="CREATE" directory="#this_dir_path#">
				<cfelse>
					<cfdirectory action="CREATE" directory="#this_dir_path#" mode="#fileAndPathMode#">
				</cfif>
			</cfif>
		</cfloop>

		<!--- write the file to the now confirmed/created directory path --->
		<cfif fileAndPathMode is "">
			<cffile action="WRITE" file="#fileAndPath#" output="#fileOutput#" addNewLine="#fileAddNewLine#" attributes="#fileAttributes#">
		<cfelse>
			<cffile action="WRITE" file="#fileAndPath#" output="#fileOutput#" mode="#fileAndPathMode#" addNewLine="#fileAddNewLine#" attributes="#fileAttributes#">
		</cfif>
	</cflock>

</cffunction>

<cfscript>
/**
 * Create a zip file of a directory or just a file.
 * 
 * @param zipPath 	 File name of the zip to create. (Required)
 * @param toZip 	 Folder or full path to file to add to zip. (Required)
 * @param relativeFrom 	 Some or all of the toZip path, from which the entries in the zip file will be relative (Optional)
 * @return Returns nothing. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1.1, January 19, 2004 
 */
function zipFileNew(zipPath,toZip){
	//make a fileOutputStream object to put the ZipOutputStream into
	var output = createObject("java","java.io.FileOutputStream").init(zipPath);
	//make a ZipOutputStream object to create the zip file
	var zipOutput = createObject("java","java.util.zip.ZipOutputStream").init(output);
	//make a byte array to use when creating the zip
	//yes, this is a bit of hack, but it works
	var byteArray = repeatString(" ",1024).getBytes();
	//we'll need to create an inputStream below for writing out to the zip file
	var input = "";
	//we'll be making zipEntries below, so make a variable to hold them
	var zipEntry = "";
	var zipEntryPath = "";
	//we'll use this while reading each file
	var len = 0;
	//a var for looping below
	var ii = 1;
	//a an array of the files we'll put into the zip
	var fileArray = arrayNew(1);
	//an array of directories we need to traverse to find files below whatever is passed in
	var directoriesToTraverse = arrayNew(1);
	//a var to use when looping the directories to hold the contents of each one
	var directoryContents = "";
	//make a fileObject we can use to traverse directories with
	var fileObject = createObject("java","java.io.File").init(toZip);
	//which part of the file path should be excluded in the zip?
	var relativeFrom = "";
	
	//if there is a 3rd argument, that is the relativeFrom value
	if(structCount(arguments) GT 2){
		relativeFrom = arguments[3];
	}
	
	//
	// first, we'll deal with traversing the directory tree below the path passed in, so we get all files under the directory
	// in reality, this should be a separate function that goes out and traverses a directory, but cflib.org does not allow for UDF's that rely on other UDF's!!
	//
	
	//if this is a directory, let's set it in the directories we need to traverse
	if(fileObject.isDirectory())
		arrayAppend(directoriesToTraverse,fileObject);
	//if it's not a directory, add it the array of files to zip
	else
		arrayAppend(fileArray,fileObject);	
	//now, loop through directories iteratively until there are none left
	while(arrayLen(directoriesToTraverse)){
		//grab the contents of the first directory we need to traverse
		directoryContents = directoriesToTraverse[1].listFiles();
		//loop through the contents of this directory
		for(ii = 1; ii LTE arrayLen(directoryContents); ii = ii + 1){			
			//if it's a directory, add it to those we need to traverse
			if(directoryContents[ii].isDirectory())
				arrayAppend(directoriesToTraverse,directoryContents[ii]);	
			//if it's not a directory, add it to the array of files we want to add
			else
				arrayAppend(fileArray,directoryContents[ii]);	
		}
		//now kill the first member of the directoriesToTraverse to clear out the one we just did
		arrayDeleteAt(directoriesToTraverse,1);
	} 
	
	//
	// And now, on to the zip file
	//
	
	//let's use the maximum compression
	zipOutput.setLevel(9);
	//loop over the array of files we are going to zip, adding each to the zipOutput
	for(ii = 1; ii LTE arrayLen(fileArray); ii = ii + 1){
		//make a fileInputStream object to read the file into
		input = createObject("java","java.io.FileInputStream").init(fileArray[ii].getPath());
		//make an entry for this file
		zipEntryPath = fileArray[ii].getPath();
		//if we are making the zip relative from a certain directory, exclude that from the zipEntryPath
		if(len(relativeFrom)){
			zipEntryPath = replace(zipEntryPath,relativeFrom,"");
		} 
		zipEntry = createObject("java","java.util.zip.ZipEntry").init(zipEntryPath);
		//put the entry into the zipOutput stream
		zipOutput.putNextEntry(zipEntry);
		// Transfer bytes from the file to the ZIP file
		len = input.read(byteArray);
		while (len GT 0) {
			zipOutput.write(byteArray, 0, len);
			len = input.read(byteArray);
		}
		//close out this entry
		zipOutput.closeEntry();
		input.close();
	}
	//close the zipOutput
	zipOutput.close();
	//return nothing
	return "";
}
</cfscript>






