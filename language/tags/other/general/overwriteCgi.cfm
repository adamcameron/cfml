<cfdump var="#cgi#" label="cgi">
<cfscript>
	st = structNew();
	st.server_name = "popo";
	st.server_port = "8080";
	st.https = "yup";
	cgi = st;
</cfscript>

<cfdump var="#cgi#" label="cgi">