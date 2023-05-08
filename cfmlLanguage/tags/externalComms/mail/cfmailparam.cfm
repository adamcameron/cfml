<cfmail from="cameron.adam@gmail.com" to="cameron.adam@gmail.com" subject="original">
	Original.
	<cfmailparam file="C:\temp\Spreadsheet Remediation White Paper for SOX 404.pdf">
</cfmail>
<cfmail from="cameron.adam@gmail.com" to="cameron.adam@gmail.com" subject="Withi disposition">
	With disposition.
	<cfmailparam file="C:\temp\Spreadsheet Remediation White Paper for SOX 404.pdf" disposition="attachment">
</cfmail>
<cfmail from="cameron.adam@gmail.com" to="cameron.adam@gmail.com" subject="with mime">
	With mime.
	<cfmailparam file="C:\temp\Spreadsheet Remediation White Paper for SOX 404.pdf" type="application/pdf">
</cfmail>
<cfmail from="cameron.adam@gmail.com" to="cameron.adam@gmail.com" subject="as mimeattach" mimeattach="C:\temp\Spreadsheet Remediation White Paper for SOX 404.pdf">
	With mime attach.
</cfmail>