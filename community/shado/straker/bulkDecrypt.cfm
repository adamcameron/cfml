<cfflush interval="50">
<cfparam name="form.pathToExe" default="C:\bin\cfdecrypt.exe">
<cfparam name="form.pathToRoot" default="#getDirectoryFromPath(getCurrentTemplatePath())#">

<style>
	/* for feedback() function */
	.messageOK {color:green;}
	.messageINFO {color:blue;}
	.messageERROR {color:red;}
	.messageWARNING{color:orange;}		
</style>
<cfoutput>
<div style="font-family:verdana;font-size:8pt;">
<form name="getPath" id="getPath" method="post" action="./bulkDecrypt.cfm">
	Path to CFDECRYPT.EXE: <input type="text" name="pathToExe" value="#form.pathToExe#" size="30" /><br />
	Base directory to start decryption from: <input type="text" name="pathToRoot" value="#form.pathToRoot#" size="30" /><br />
	<input type="submit" name="submitButton" value="Go &raquo;" />
</form>

<cfif CGI.REQUEST_METHOD eq "POST">
	<cfif not fileExists(form.pathToExe)>
		#feedback("[#form.pathToExe#] not found.  Cannot continue", "ERROR")#
		<cfabort>
	</cfif>
	<cfif not directoryExists(form.pathToRoot)>
		#feedback("[#form.pathToRoot#] not found.  Cannot continue", "ERROR")#
		<cfabort>
	</cfif>

	<cfset slash = createObject("java", "java.io.File").separator>
	#feedback("Processing [#form.pathToRoot#]", "INFO")#
	<cfdirectory action="list" directory="#form.pathToRoot#" filter="*.cf?" recurse="true" name="qFiles">
	<cfloop query="qFiles">
		<cfset sFullPath = directory & slash & name>
		#feedback("Processing #sFullPath#", "INFO")#
		<!--- check if file is encrypted --->
		<cffile action="read" file="#sFullPath#" variable="sFile">
		<cfif reFind("^Allaire Cold Fusion Template", sFile)>
			<cfset sTempFile = sFullPath & ".bulkDecryptTemp">
			#feedback("Decrypting file", "INFO")#
			<cfexecute name="#form.pathToExe#" arguments="#sFullPath# #sTempFile#" timeout="10" variable="sTemp" />
			<cfif fileExists(sTempFile)>
				#feedback("Deleting original file", "INFO")#
				<cffile action="delete" file="#sFullPath#">
				#feedback("Replacing with decrypted file", "INFO")#
				<cffile action="rename" source="#sTempFile#" destination="#name#">
				#feedback("Done", "WARNING")#
			<cfelse>
				#feedback("Decrypted data not found: skipping", "WARNING")#
				<br />
			</cfif>
		<cfelse>
			#feedback("File is not encrypted: skipping", "OK")#
		</cfif>
	</cfloop>
</cfif>
</cfoutput>
</div>



<cffunction name="feedback" output="false" access="public" returntype="string" hint="Returns a &lt;span&gt; with a colour-coded message in it<br />
	Assumes CSS classes <em>messageInfo</em>, <em>messageOK</em>, <em>messageWarning</em> and <em>messageError</em> have been defined.
.">
	<cfargument name="msg"		type="string"	required="no"	default=""		hint="Message.">
	<cfargument name="status"	type="string"	required="no"	default="INFO"	hint="One of INFO|OK|WARNING|ERROR.  Used to determine which class to use.">
	<cfargument name="padChar"	type="string"	required="no"	default=" "		hint="Padding string. Defaults to a space.  Padding arguments are used to force the size of the output message to meet flushing requirements (if any). It is recommended to use an unrenderable character for this value (it's <em>really</em> recommended you don't change this value).">
	<cfargument name="padSize"	type="numeric"	required="no"	default="50"	hint="Padding size.">
	
	<cfreturn '<span class="message#arguments.status#">#arguments.msg#</span>#repeatString(arguments.padChar, arguments.padSize)#<br />'>
</cffunction>