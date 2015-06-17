<cfset aName="huskyrescue">

<cfset cf = "<cf">

<cfsavecontent variable="fileApp">
<cfoutput>
#cf#application name="#aName#" setclientcookies="yes" sessionmanagement="yes" loginstorage="Session"  applicationtimeout="#createtimespan(1,0,0,0)#" sessiontimeout="#createtimespan(0,2,0,0)#">
#cf#set Request.MyDSN = "MyDSN">
</cfoutput>
</cfsavecontent>

<cfdump var="#variables#">