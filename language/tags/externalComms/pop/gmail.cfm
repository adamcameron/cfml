<cfset javaSystem = createObject("java", "java.lang.System")>
<cfset jProps = javaSystem.getProperties()>
<cfset jProps.setProperty("mail.pop3.socketFactory.class", "javax.net.ssl.SSLSocketFactory")>
<cfset jProps.setproperty("mail.pop3.port",995)>
<cfset jProps.setProperty("mail.pop3.socketFactory.port", 995)>

<cfpop
	port	= "995"
	password= "slap_chicken4"
	name	= "qMail"
	action	= "getHeaderOnly"
	server	= "pop.gmail.com"
	username="cameron.adam@gmail.com"
	maxrows="10"
>

<cfdump var="#qMail#">