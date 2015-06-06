<cfscript>
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

<cfdump var="#getProfileSectionsUTF8(expandPath("./russianx.properties"))#">