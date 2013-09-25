Content before<br>
<cfset msg = "Content within"> 
<cf_withoutput callback="#toUpper#">
	#msg#<br>
</cf_withoutput>
Content after<br>

<cfscript>
	function toUpper(string){
		return ucase(string);
	}

</cfscript>