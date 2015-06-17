<cfscript>
	oMail				= createObject("coldfusion", "mail");	// or "java", "adobe.coldfusion.Mail", or something
	oMail.setTo			= "you@yours.com";
	oMail.setFrom		= "me@mine.com";
	oMail.setSubject	= "Hello World";
	oMail.addParam(name="Importance", value="High");
	oMail.addParam(file="c:\work\readme.txt", type="text/plain");
	oMail.addPart(type="text", wraptext="74", content="This is the text part");
	oMail.addPart(type="HTML", content="This is the <em>HTML</em> part");
	oMail.send();

	aParams = [{name="Importance", value="High"}, {file="c:\work\readme.txt", type="text/plain"}];
	aParts	= [{type="text", wraptext="74", content="This is the text part"}, type="HTML", content="This is the <em>HTML</em> part"];
	cfMail(to="you@yours.com", from="me@mine.com", subject="Hello World", params=aParams, parts=aParts);
</cfscript>