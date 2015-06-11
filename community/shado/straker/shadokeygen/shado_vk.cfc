<cfcomponent displayname="Shado Verification" hint="Shado Verification">

	<cffunction name="CreateKey" access="remote" returntype="struct" hint="This is a private function to create a Shado Key" output="yes">
		<cfargument name="keyname"			type="string"	required="yes"	default="shadolicence" 					hint="The datasource to create the key from">
		<cfargument name="keyType"		type="string"	required="yes"											hint="The type of key to create">
		<cfargument name="keyExpiry" 	type="date" 	required="yes" 	default="#dateadd('yyyy',50,now())#"	hint="The expiry date of key to create defaults to 50 years in the future">

		<cfset var returnStruct = structnew()>
		<cfset var keypair 		= "">
		<cfset var encyptedKey 	= "">
		<cfset var fixedkey 	= "">
		<cfset var nonAlphaNum 	= structnew()>
		<cfset var idx 			= 1>
		<cfset var encKey		= 0>

		<cfscript>
			keypair		= reverse(arguments.keyname) & chr(7) & arguments.keytype & chr(6) & createodbcdatetime(arguments.keyExpiry) & chr(83);
			for(idx=1;idx lte len(arguments.keyname);idx=idx+1){
				encKey = encKey + asc(mid(arguments.keyname,idx,1));
			}
			encyptedKey	= encrypt(keypair,encKey);
			fixedkey	= duplicate(encyptedKey);
			nonAlphaNum = REFindNoCase("[^[:alnum:]]",encyptedKey,1,true);
			while(nonAlphaNum.pos[1] neq 0){

				fixedkey 	= replace(fixedkey,mid(encyptedKey,nonAlphaNum.pos[1],1),"#chr(6)##Asc(mid(encyptedKey,nonAlphaNum.pos[1],1))##chr(7)#");
				nonAlphaNum = REFindNoCase("[^[:alnum:]]",encyptedKey,nonAlphaNum.pos[1] + 1,true);
			}
			fixedkey 	= replace(fixedkey,chr(6),"(","ALL");
			fixedkey 	= replace(fixedkey,chr(7),")","ALL");
			fixedkey 	= "(#encKey#)" & fixedkey;

			// new
			fixedkey 	= fixedkey & "|" & encrypt("ShadoMX Enterprise Edition", fixedkey, "CFMX_COMPAT", "HEX");

			returnStruct.status	= true;
			returnStruct.value	= fixedkey;
			return returnStruct;
		</cfscript>
	</cffunction>

	<cffunction name="decipherKey" access="remote" returntype="struct" hint="This is a private function to validate a Shado Key" output="yes">
		<cfargument name="key"			type="string"	required="yes"	hint="The key to check against">
		<cfargument name="keyname"			type="string"	required="yes"	hint="The keyname to check against">

		<cfset var keystruct	= structnew()>
		<cfset var thisKey 		= "">
		<cfset var resultKey	= "">
		<cfset var keypair 		= "">
		<cfset var encyptedKey 	= "">
		<cfset var decyptedKey 	= "">
		<cfset var thischar 	= "">
		<cfset var encKey		= 0>
		<cfset var testKey		= "">
		<cfset var structfail	= false>
		<cfset var testnext		= true>


		<!--- here for backwards compatibility --->
		<cfset var portalkeys	= "">
		<cfset var keylist		= "">
		<cfset var advanceGraphsKeys = "81081769, 35025603, 57714089, 43753668, 46619729, 10269116, 84751996, 32731281, 75070981, 68663158, 72579863, 82345701, 2713360, 78129130, 92178325, 94615858, 53844683, 51442404, 83615161, 88361051, 78191460, 56846467, 28614611, 86738363, 98933653, 2297400, 46880127, 54677084, 87260662, 97487064, 22675152, 26990883, 23107209, 2300210, 9884339, 44814649, 80169936, 8336408, 88714086, 49847937, 37476379, 83571884, 69346568, 86690597, 36667713, 58149586, 12235506, 43328684, 89764959, 10667502, 80324581, 74569941, 27515591, 67185960, 81281063, 80938063, 13463322, 82493865, 49867365, 46213761, 75648475, 54962023, 94822375, 97457979, 78329842, 48568430, 94092080, 38968943, 62320965, 95406075, 43935616, 54209613, 72454738, 89178103, 50338097, 40295834, 48329880, 24848264, 45285601, 82157963, 20851198, 12746447, 48800489, 77979934, 19152713, 69029625, 2196736, 16979696, 27288650, 75467934, 6795258, 25023689, 67591898, 15063674, 87338161, 41965418, 17832981, 22017807, 92558730, 5964501">
		<cfinclude template="/shadomx/shado_central/containers/shado_ptks.cfm">
		<cfinclude template="/shadomx/shado_central/toolsutils/kal.cfm">

		<cfscript>
			keystruct.validKey 	= false;
			keystruct.status	= false;
			keystruct.keyname 	= "";
			keystruct.keyType 	= "";
			keystruct.key 		= arguments.key;
			keystruct.keyversion= "Redsky";
			keystruct.keyExpiry	= now();
			keystruct.error		= "Invalid Key Structure";

			if(find("(",arguments.key) lt find(")",arguments.key)){
				enckey = replace(left(arguments.key,find(")",key,1) - 1),"(","");
				if(isnumeric(enckey)){
					thisKey = replace(arguments.key,"(#enckey#)","","ONE");
					openbracketpos = find("(",thisKey,1);
					encyptedKey = duplicate(thisKey);
					while(openbracketpos neq 0){
		 				closedbracketpos = find(")",thisKey,openbracketpos);
						thischar = mid(thisKey,openbracketpos+1,closedbracketpos-openbracketpos-1);
						if(isnumeric(thischar)){
							encyptedKey = replace(encyptedKey,"(#thischar#)",chr(thischar),"ONE");
						}else{
							structfail = true;
							break;
						}
						openbracketpos = find("(",thisKey,openbracketpos + 1);
					}
					try{
						decyptedKey = decrypt(encyptedKey,enckey);
					}
					catch(Any e) {}

					if(right(decyptedKey,1) eq "S" and find(chr(7),decyptedKey) neq 0 and find(chr(6),decyptedKey) neq 0){
						if(arguments.keyname eq reverse(left(decyptedKey,find(chr(7),decyptedKey)-1))){
							keystruct.validKey 	= true;
							keystruct.status	= true;
							keystruct.keyname 		= reverse(left(decyptedKey,find(chr(7),decyptedKey)-1));
							keystruct.keyType 	= right(decyptedKey,len(decyptedKey)-find(chr(7),decyptedKey));
							keystruct.keyType 	= left(keystruct.keyType,len(keystruct.keyType)-1);
							keystruct.keyExpiry = right(keystruct.keyType,len(keystruct.keyType)-find(chr(6),keystruct.keyType));
							keystruct.keyType 	= left(keystruct.keyType,len(keystruct.keyType)-len(keystruct.keyExpiry)-1);

							structdelete(keystruct,"error");
							testnext = false;

							if(keystruct.keyExpiry lt now()){
								keystruct.validKey 	= false;
								keystruct.status	= false;
								keystruct.error		= "This key has expired";
								testnext = false;
							}
						}else{
							keystruct.error		= "Key Name does not match the decrypted key";
						}
					}
				}
			}

			// no joy so far lets try the old keys
			if(testnext){
				keystruct.keyversion= "MX";
				if(listfind(portalkeys,arguments.key)){
					keystruct.validKey 	= true;
					keystruct.status	= true;
					keystruct.keyname 	= arguments.keyname;
					keystruct.keyType 	= "PortalKey";
					keystruct.keyExpiry	= dateadd('yyyy',50,now());
					structdelete(keystruct,"error");
					testnext = false;
				}else{
					testnext = true;
				}
				if(testnext){
					if(listfind(keylist,arguments.key)){
						keystruct.validKey 	= true;
						keystruct.status	= true;
						keystruct.keyname 	= "n/a";
						keystruct.keyType 	= "ServerKey";
						keystruct.keyExpiry	= dateadd('yyyy',50,now());
						structdelete(keystruct,"error");
						testnext = false;
					}else{
						testnext = true;
					}
				}
				if(testnext){
					if(advanceGraphsKeys contains arguments.key){
						keystruct.validKey 	= true;
						keystruct.status	= true;
						keystruct.keyname 	= arguments.keyname;
						keystruct.keyType 	= "AdvancedGraphsKey";
						keystruct.keyExpiry	= dateadd('yyyy',50,now());
						structdelete(keystruct,"error");
						testnext = false;
					}else{
						testnext = true;
					}
				}
				if(testnext){
					testkey = "s0" & toBase64(UCase(arguments.keyname & "z"));
					if(arguments.key eq testkey){
						keystruct.validKey 	= true;
						keystruct.status	= true;
						keystruct.keyname 	= arguments.keyname;
						keystruct.keyType 	= "SiteKey";
						keystruct.keyExpiry	= dateadd('yyyy',50,now());
						structdelete(keystruct,"error");
					}else{
						keystruct.validKey 	= false;
						keystruct.status	= false;
						keystruct.keyname 	= arguments.keyname;
						keystruct.keyType 	= "Unknown";
						keystruct.error		= "Site Key Name does not match the decrypted key";
						keystruct.keyversion= "Unknown";
					}
				}
			}
			return keystruct;
		</cfscript>
	</cffunction>
</cfcomponent>

