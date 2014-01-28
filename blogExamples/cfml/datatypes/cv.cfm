<style>
.cvClassInfo {
	font-style: italic;
	color: LightSlateGray;
}
.cvComments {
	font-style: italic;
	color: silver;
}
.cvModifiers {
	font-style: italic;
	color: purple;
}
.cvMethodName {
	color: black;
	font-style: normal;
	font-weight: bolder;
}
.cvMethodArgs {
	color: green;
}
</style>

<cfscript>
//cv.cfm
switch (URL.type){
	case "query":{
		o = queryNew("");
		break;
	}
	case "struct":{
		o = {};
		break;
	}
	case "datetime": {
		o = createDateTime(1,2,3,4,5,6);
		break;
	}
	case "date": {
		o = createDate(1,2,3);
		break;
	}
	case "odbcDate": {
		o = createOdbcDate(createDate(1,2,3));
		break;
	}
	case "odbcDateTime": {
		o = createOdbcDateTime(createDateTime(1,2,3,4,5,6));
		break;
	}
	case "integer": {
		o = int(1);
		break;
	}
	case "float": {
		o = pi();
		break;
	}
	case "xml": {
		o = xmlNew();
		break;
	}
	case "array": {
		o = [];
		break;
	}
	case "string": {
		o = "";
		break;
	}
	case "pagecontext": {
		o = getPageContext();
		break;
	}
	case "cfc": {
		o = new C();
		break;
	}
	case "variables": {
		o = variables;
		break;
	}
	case "request": {
		o = request;
		break;
	}
	case "application": {
		o = application;
		break;
	}
	case "session": {
		o = session;
		break;
	}
	case "arguments": {
		function f(){
			return arguments;
		}
		o = f(arg1="value");
		break;
	}
	case "spreadsheet": {
		o = spreadsheetNew();
		break;
	}
	default :{
		throw(type="InvalidParameterException");
	}
}

writeOutput('<pre>#new ClassViewer().viewObject(o)#</pre>');
</cfscript>