<cfhttp method="get" url="http://localhost:8500/rest/components/responder/returnsJson/" result="response">
<cfdump var="#response#" label="returnsJson()">
<hr>
<cfhttp method="get" url="http://localhost:8500/rest/components/responder/raisesExceptionViaStruct/" result="response">
<cfdump var="#response#" label="raisesExceptionViaStruct()">
<hr>
<cfhttp method="get" url="http://localhost:8500/rest/components/responder/raisesExceptionViaString/" result="response">
<cfdump var="#response#" label="raisesExceptionViaString()">
<hr>
<cfhttp method="get" url="http://localhost:8500/rest/components/responder/raisesExceptionViaVoid/" result="response">
<cfdump var="#response#" label="raisesExceptionViaVoid()">
<hr>
<cfhttp method="get" url="http://localhost:8500/rest/components/responder/returnsViaRestSetResponseUsingVoid/" result="response">
<cfdump var="#response#" label="returnsViaRestSetResponseUsingVoid()">
<hr>
<cfhttp method="get" url="http://localhost:8500/rest/components/responder/returnsViaRestSetResponseUsingString/" result="response">
<cfdump var="#response#" label="returnsViaRestSetResponseUsingString()">
<hr>
<cfhttp method="get" url="http://localhost:8500/rest/components/responder/methodThatPossiblyRaisesException/false" result="response">
<cfdump var="#response#" label="methodThatPossiblyRaisesException(false)">
<hr>
<cfhttp method="get" url="http://localhost:8500/rest/components/responder/methodThatPossiblyRaisesException/true" result="response">
<cfdump var="#response#" label="methodThatPossiblyRaisesException(true)">
<hr>
<cfhttp method="get" url="http://localhost:8500/rest/components/responder/methodThatPossiblyRaisesExceptionWorkAround/false" result="response">
<cfdump var="#response#" label="methodThatPossiblyRaisesExceptionWorkAround(false)">
<hr>
<cfhttp method="get" url="http://localhost:8500/rest/components/responder/methodThatPossiblyRaisesExceptionWorkAround/true" result="response">
<cfdump var="#response#" label="methodThatPossiblyRaisesExceptionWorkAround(true)">
<hr>
