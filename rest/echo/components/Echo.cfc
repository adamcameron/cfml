// Echo.cfc
component rest=true restPath="echo" {

remote string function oneCorrectArg(required string arg1 restargsource="path") httpmethod="get" restpath="oneCorrectArg/{arg1}" {
	return serializeJson(arguments);
}

remote string function noRestArgSource(required string arg1) httpmethod="get" restpath="noRestArgSource/{arg1}" {
	return serializeJson(arguments);
}

	remote string function mismatch(required string arg1 restargsource="path") httpmethod="get" restpath="mismatch/{wrongArg}" {
		return serializeJson(arguments);
	}

}