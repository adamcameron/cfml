<cffunction name="code128Encode" returntype="string" output="No">
	<cfargument name="string" required="no" type="string" default="">

		<cfset arguments.string = trim(arguments.string)>
		<cfif REFind('^[0-9]+$',arguments.string)>
			<!--- *********************************************************** --->
			<!--- code128b : numbers only                                     --->
			<!--- *********************************************************** --->
			<cfset local.startChr 	= 205>
			<cfset local.endChr 	= 206>
			<cfif len(arguments.string) mod 2>
				<cfset arguments.string = "0#arguments.string#">
			</cfif>
			
			<cfset local.stringTotal	= local.startChr - 100>
			<cfset local.count			= 1>

			<cfset local.encoded		= "">
			<cfloop from="2" to="#len(arguments.string)#" step="2" index="i">
				<cfset local.letter	= (( asc(mid(arguments.string,i-1,1)) -48)*10) + ( asc(mid(arguments.string,i,1)) -48)>
				<cfif val(local.letter)>
					<cfif local.letter lt 95>
						<cfset local.encoded	= "#local.encoded##chr(local.letter + 32)#">
					<cfelse>
						<cfset local.encoded	= "#local.encoded##chr(local.letter + 100)#">
					</cfif>				
				<cfelse>
					<cfset local.encoded	= "#local.encoded##chr(194)#">
				</cfif>
				<cfset local.stringTotal	= local.stringTotal + (local.letter * local.count)>
				<cfset local.count			= local.count + 1>
			</cfloop>

			<cfset local.chkChrVal = int(local.stringTotal mod 103)>
			<cfif val(local.chkChrVal)>
				<cfif local.chkChrVal lt 95>
					<cfset local.chkChr = local.chkChrVal + 32>
				<cfelse>
					<cfset local.chkChr = local.chkChrVal + 100>
				</cfif>
			<cfelse>
				<cfset local.chkChr = 194>
			</cfif>
			<cfset arguments.string = "#chr(local.startChr)##local.encoded##chr(local.chkChr)##chr(local.endChr)# ">
			<cfreturn JSStringFormat(arguments.string)>

		<cfelse>
			<!--- *********************************************************** --->
			<!--- code128a and code128c                                       --->
			<!--- *********************************************************** --->
			<cfif REFind('[a-z]',arguments.string)>
				<!--- code128b : number and capital and simple letters        --->
				<cfset local.startChr 	= 204>
				<cfset local.endChr 	= 206>		
			<cfelse>
				<!--- code128a :  number and capital letters and anything else --->
				<cfset local.startChr 	= 203>
				<cfset local.endChr 	= 206>
			</cfif>
			
			<cfset local.stringTotal	= local.startChr - 100>
			
			<cfloop from="1" to="#len(arguments.string)#" index="i">
				<cfset local.letter	= asc(mid(arguments.string,i,1))>
				<cfif local.letter lt 135 >
					<cfset local.letter =  local.letter - 32>
				<cfelseif local.letter gt 134 >
					<cfset local.letter =  local.letter - 100>
				</cfif>
				<cfset local.letter			= local.letter * i>
				<cfset local.stringTotal	= local.stringTotal + local.letter>
			</cfloop>
			 
			<cfset local.chkChrVal = int(local.stringTotal mod 103)>
		 
			<cfif val(local.chkChrVal)>
				<cfif local.chkChrVal lt 95>
					<cfset local.chkChr = local.chkChrVal + 32>
				<cfelse>
					<cfset local.chkChr = local.chkChrVal + 100>
				</cfif>
			<cfelse>
				<cfset local.chkChr = 194>
			</cfif>
			
			<cfset arguments.string = replace(arguments.string,' ',chr(194),'all')>
			<cfset arguments.string = "#chr(local.startChr)##arguments.string##chr(local.chkChr)##chr(local.endChr)# ">
			<cfreturn JSStringFormat(arguments.string)>
		</cfif>
</cffunction>

<cfparam name="URL.string" default="">
<cfcontent reset="true">
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title></title>
</head>
<body>
<cfoutput>
	[#URL.string#]: [#code128Encode(URL.string)#]<br />
</cfoutput>
</body>
</html>
