// TestSerialiser.cfc
component rest=true restPath="testserialiser" {



	remote struct function echoStruct(required struct data) httpmethod="post" restpath="echoStruct" consumes="application/JSON" produces="application/JSON" {
		throw serializeJson(arguments);
		data.uid = createUuid();
		return data;
	}
/*
	remote struct function echoStructViaUrl(required string data restargsource="query") httpmethod="get" restpath="echoStructViaUrl" consumes="application/JSON" produces="application/JSON" {
		throw serializeJson(arguments);
		data.uid = createUuid();
		return data;
	}
*/
}