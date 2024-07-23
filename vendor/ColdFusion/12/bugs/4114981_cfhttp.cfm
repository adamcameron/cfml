<cfscript>
setting requesttimeout=120;
for(i=1; i<=100; i++) {
	myStruct = {myNumber=variables.i};
	thread action="run" name="myThread#variables.i#" myStruct=variables.myStruct {
		var item="";
		//THREAD.result1 = serializeJson(ATTRIBUTES.myStruct);
		cfhttp(url="http://www.adobe.com/products/coldfusion-family.html", method="post", timeout=10) {
			//THREAD.result2 = serializeJson(ATTRIBUTES.myStruct);
			for(item in ATTRIBUTES.myStruct) {
				cfhttpparam(type="formfield", name=item, value=ATTRIBUTES.myStruct[item]);
			}
		}
	}
}
threadJoin();
for(item in cfthread) {
	//writeOutput(’Result1: ’ & cfthread[item].result1 & ’ | Result2: ’ & cfthread[item].result2 & ’’);
	if(cfthread[item].keyExists("error")) {
		writeDump(cfthread[item].error);
	}
}
</cfscript>