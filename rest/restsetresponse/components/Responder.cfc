component rest=true restPath="responder"  {


	remote array function returnsJson() httpmethod="get" restpath="returnsJson" produces="application/json" {
		return ["tahi", "rua", "toru", "wha"];
	}


	remote string function raisesExceptionViaStruct() httpmethod="get" restpath="raisesExceptionViaStruct" produces="application/json" {
		throw(errorcode=400, type="RestException", message="An exception occurred in raisesExceptionViaStruct()");
	}


	remote string function raisesExceptionViaString() httpmethod="get" restpath="raisesExceptionViaString" produces="application/json" {
		throw(errorcode=400, type="RestException", message="An exception occurred in raisesExceptionViaString()");
	}


	remote void function raisesExceptionViaVoid() httpmethod="get" restpath="raisesExceptionViaVoid" produces="application/json" {
		throw(errorcode=400, type="RestException", message="An exception occurred in raisesExceptionViaVoid()");
	}


	remote void function returnsViaRestSetResponseUsingVoid() httpmethod="get" restpath="returnsViaRestSetResponseUsingVoid" produces="application/json" {
		restSetResponse({
			status	= "202",
			content	= "Content set by returnsViaRestSetResponse()",
			headers	= {
				date	= dateTimeFormat(now(), "full"),
				from	= "notMyAddress@example.com",
				warning	= "Just testing!!"
			}
		});
	}


	remote string function returnsViaRestSetResponseUsingString() httpmethod="get" restpath="returnsViaRestSetResponseUsingString" produces="application/json" {
		restSetResponse({
			status	= "202",
			content	= "Content set by returnsViaRestSetResponse()",
			headers	= {
				date	= dateTimeFormat(now(), "full"),
				from	= "notMyAddress@example.com",
				warning	= "Just testing!!"
			}
		});
	}


	remote void function methodThatPossiblyRaisesException(required boolean throwException restargsource="path") httpmethod="get" restpath="methodThatPossiblyRaisesException/{throwException}" produces="application/json" {
		if (throwException){
			throw(errorcode=400, type="RestException", message="An exception occurred in methodThatPossiblyRaisesException()");
		} else {
			restSetResponse({
				status	= "202",
				content	= "Content set by returnsViaRestSetResponse()",
				headers	= {
					date	= dateTimeFormat(now(), "full"),
					from	= "notMyAddress@example.com",
					warning	= "Just testing!!"
				}
			});
		}
	}


	remote void function methodThatPossiblyRaisesExceptionWorkAround(required boolean throwException restargsource="path") httpmethod="get" restpath="methodThatPossiblyRaisesExceptionWorkAround/{throwException}" produces="application/json" {
		var response = {
			headers	= {
				date	= dateTimeFormat(now(), "full"),
				from	= "notMyAddress@example.com"
			}
		};
		if (throwException){
			response.status			= "400";
			response.content		= serializeJson({type="RestException", message="An exception occurred in methodThatPossiblyRaisesException()"});
			response.headers.warning= "It errored";
		} else {
			response.status 		= "202";
			response.content		= "It was OK";
			response.headers.warning= "No warning";
		}
		restSetResponse(response);
	}




}