<cfsavecontent variable="s">
<DeliveryReport><message id="1023012301" sentdate="" donedate="2005/7/19 22:0:0" status="NOT_SENT" /></DeliveryReport>
</cfsavecontent>
<!--- <cfset x = xmlParse(s)> --->
<cfset x = s>
<cfoutput>
#x.DeliveryReport.message.id#<br>
#x.DeliveryReport.status#<br>
</cfoutput>