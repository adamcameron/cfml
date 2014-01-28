<cfset application.mailService.send(
	to		= "cameron.adam@gmail.com",
	subject	= "TEST #timeFormat(now(), 'HHMM')#",
	body	= "Hello World @ #timeFormat(now())#"
)>