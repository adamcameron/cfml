<cfscript>
function LCaseStructKeys(str){
	var i = "";
	var tmp = {};
	for(i in str){
		if(IsStruct(str[i])){
			str[i] = LCaseStructKeys(str[i]);
		}
		tmp[LCase(i)] = Duplicate(str[i]);
	}
	return tmp;
}

REQUEST.tmp = {
	"ATEST" = "first test val",
	"anotherTest" = "second test val",
	"WeKeepTesting" = {
		"firstInnerStructKey" = "third test",
		"secondInnerSTRUCTKEY" = {
			"ANOTHERKEY" = "Fourth test Val"
		}
	}
};
st = LCaseStructKeys(REQUEST.tmp);
writeDump(REQUEST.tmp);
writeDump(st);
WriteOutput(SerializeJSON(st));
</cfscript>