<cfscript>
	stSharedInner = structNew();
	stSharedInner.first = "Adam";
	stSharedInner.last = "Cameron";
	
	stStructToDupe = structNew();
	stStructToDupe.person = stSharedInner;	// pointer to stSharedInner
	stStructToDupe.contact = stSharedInner;	// also a pointer to stSharedInner.  So point to same data.
	
	dupStruct = duplicate(stStructToDupe);
</cfscript>
Initial states:<br />
Both person and contact are the SAME structure:<br />
<cfdump var="#stStructToDupe#" label="stStructToDupe">
<br />
Duplicated structure:<br />
<cfdump var="#dupStruct#" label="dupStruct">

<cfscript>
	
	// now, change the person in stSharedInner
	stStructToDupe.contact.first = "Rhys";
	stStructToDupe.contact.last = "Williams";

	// same operation in the duped struct
	dupStruct.person.first = "Indy";
	dupStruct.person.last = "Nagpal";
</cfscript>

Updated states:<br />
Note how, because the person and contact are pointers to the same struct, then both have changed.  This is correct:<br />
<cfdump var="#stStructToDupe#" label="stStructToDupe">
<br />
However the person / contact substructs should still be pointing to same struct.  Just DIFFERENT struct than the one in stStructToDupe:<br />
<cfdump var="#dupStruct#" label="dupStruct">
<br />
