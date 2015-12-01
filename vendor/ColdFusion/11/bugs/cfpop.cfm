<cfpop
	action="getHeaderOnly"
	server="pop.gmail.com"
	port="587"
	secure="true"
	username="cameron.adam"
	password="URL.password"
	timeout="60"
	name="mail"
	maxRows="100"
	startRow="5"
>
<cfdump var="#mail#">