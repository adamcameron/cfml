<cfset NoCfoutput="YesCfoutput">Before:#NoCfoutput#<br>
<CFSETTING ENABLECFOUTPUTONLY="yes">
**** BEGIN INSIDE ENABLECFOUTPUTONLY="yes" ****<br>
Variable NoCfoutput is #NoCfoutput#<br>
**** END INSIDE ENABLECFOUTPUTONLY="yes" ****<br>
<CFSETTING ENABLECFOUTPUTONLY="no">After:#NoCfoutput#<br>