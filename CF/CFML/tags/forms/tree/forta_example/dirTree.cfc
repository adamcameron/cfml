<cfcomponent output="false">


	<cfset variables.separator = getPathSeparator()>


	<cffunction name="getPathSeparator" access="private" returntype="string" output="false" hint="Get system path separator character">
		<cfreturn createObject("java", "java.io.File").separator>
	</cffunction>


	<cffunction name="getDrives" access="private" returntype="query" output="false" hint="Get system drives (or roots)">
		<cfscript>
			var aDrives	= createObject("java", "java.io.File").listRoots();
			var i		= 0;
			var qResult	= queryNew("name");

			for (i=1; i <= arrayLen(aDrives); i++){
				queryAddRow(qResult);
				querySetCell(qResult, "name", aDrives[i].toString());
			}
			return qResult;
		</cfscript>
	</cffunction>


	<cffunction name="getDirEntries" access="remote" returnType="array" output="false" hint="Get directory entries for Ajax CFTREE">
		<cfargument name="path" type="string" required="false" default="">
		<cfargument name="value" type="string" required="false" default="">

		<cfscript>
			var qDir	= false;
			var stEntry	= structNew();
			var aResult	= arrayNew(1);
			var i		= 0;
			var aFiles	= arrayNew(1);

			if (not len(arguments.value)){	// Yes, top level, get drives

				qDir	= getDrives();
				for (i=1; i <= qDir.recordCount; i++){
					// Add each drive/root
					stEntry			= structNew();
					stEntry.value	= qDir["name"][i];
					stEntry.display	= qDir["name"][i];
					stEntry.img		= "fixed";
					arrayAppend(aResult, stEntry);
				}
			}else{	// Not top level, get dir list
				aFiles = createObject("java", "java.io.File").init(arguments.value).list();
				if (isDefined("aFiles")){
					for (i=1; i <= arrayLen(aFiles); i++){
						stEntry			= structNew();
						stEntry.value	= reReplace(arguments.value & variables.separator, "[\\/]+$", variables.separator, "ONE") & aFiles[i];
						stEntry.display	= aFiles[i];
						if (createObject("java", "java.io.File").init(arguments.value & variables.separator & aFiles[i]).isDirectory()){
							// A dir, use folder icon
							stEntry.img		= "folder";
							stEntry.imgopen	= "folder";
						}else{
							// A file, so no children
							stEntry.leafnode= TRUE;
							// Use document icon
							stEntry.img		= "document";
						}
						arrayAppend(aResult, stEntry);
					}
				}
			}

			return aResult;
		</cfscript>
	</cffunction>


</cfcomponent>