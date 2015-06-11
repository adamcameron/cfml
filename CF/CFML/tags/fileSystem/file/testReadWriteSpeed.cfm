<cfflush interval="32">
<cfscript>

param name="URL.size" type="integer";
param name="URL.dest" type="regex" pattern="^(?i)(RAM|DISK)$";
param name="URL.max" type="integer" default=512*1024;	// 512MB

URL.size = URL.size * 1024;
URL.max = URL.max * 1024;


/**
* @hint creates a string of random A-Z chars.
*/
string function createData(string size){
	local.s = "";
	for (local.i=1; local.i <= size; local.i++){
		local.s &= chr(randRange(65,90));
	}
	return local.s;
}

/**
* @hint makes a random file name.  A possible enhancement here is to add some subdir depth too: flat file structure seeks are always slowed that hierarchical ones
*/ 
string function makeFilename(){
	local.s = "";
	for (local.i=1; local.i <= 8; local.i++){
		local.s &= chr(randRange(65,90));
	}
	return local.s & ".dat";
}


// prep
iStartTime = getTickCount();
if (URL.dest == "RAM"){
	sDest = "ram://files/";
}else{
	sDest = "C:\temp\files\";	
}
if (!directoryExists(sDest)){
	mkdir(dir=sDest);
}

// creates some data.  Not happy about using the same data each time, but doing this inside the loop adds a hell of a lot of overhead
// Not sure if a HDD controller is clever enough to see that the content is the same and use some caching?
sData = createData(URL.size);


// make a catalogue of files.  First we write these files, then we read from them
// We're doing this outside the loop because this too adds a bit of overhead we could do without
aFiles = arrayNew(1);
for (i=0; i <= URL.max; i+=URL.size){
	arrayAppend(aFiles, makeFilename());
}

iRunTime = getTickCount() - iStartTime;
writeOutput("Prep completed in #iRunTime#ms<br />#repeatString(' ', 128)#");


// write them
iStartTime = getTickCount();
for (i=1; i <= arrayLen(aFiles); i++){
	fileWrite(sDest & aFiles[i], sData);
}
iRunTime = getTickCount() - iStartTime;
writeOutput("Write completed in #iRunTime#ms<br />#repeatString(' ', 128)#");

// read them
iStartTime = getTickCount();
for (i=1; i <= arrayLen(aFiles); i++){
	fileRead(sDest & aFiles[i]);
}
iRunTime = getTickCount() - iStartTime;
writeOutput("Read completed in #iRunTime#ms<br />#repeatString(' ', 128)#");


// clean up
// scan them
iStartTime = getTickCount();
qFiles = dir(dir=sDest);
writeOutput("File count after write: [#qFiles.recordCount#]<br />#repeatString(' ', 128)#");
iRunTime = getTickCount() - iStartTime;
writeOutput("Scan completed in #iRunTime#ms<br />#repeatString(' ', 128)#");

// purge them
iStartTime = getTickCount();
rmdir(dir=sDest);
iRunTime = getTickCount() - iStartTime;
writeOutput("Purge completed in #iRunTime#ms<br />#repeatString(' ', 128)#");

qFiles = dir(dir=sDest);
writeOutput("File count after purge: [#qFiles.recordCount#]<br />#repeatString(' ', 128)#");
</cfscript>

<!--- quick DIR ops functions --->
<cffunction name="mkdir">
	<cfargument name="dir" required="true" type="string">
	<cfdirectory action="create" directory="#arguments.dir#">
</cffunction>
<cffunction name="rmdir">
	<cfargument name="dir" required="true" type="string">
	<cfdirectory action="delete" directory="#arguments.dir#" recurse="true">
</cffunction>
<cffunction name="dir">
	<cfargument name="dir" required="true" type="string">
	<cfdirectory action="list" directory="#arguments.dir#" name="local.qFiles">
	<cfreturn local.qFiles>
</cffunction>
