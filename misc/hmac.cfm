<cfset sellerId = "10134347">

<cfset emailAddress = "test@gmail.com">
<cfset utcDate = DateConvert( "Local2UTC", now() )>
<cfset signDate = DateFormat(utcDate,"YYYY-MM-DD") & "T" & TimeFormat(utcDate,"HH:MM:SS") & "Z">
<cfset signKey = sellerId & ":" & emailAddress & ":" & signDate>

<cfset secretKey = "aJv6jqMN4FHYHKw4dfdsfsdf+K8dvsYQ61wsVYgRzgNXbE=">

<cfset signature = hmac(signKey,secretKey,"HMACSHA256")>

<cfdump var="#signature#">
