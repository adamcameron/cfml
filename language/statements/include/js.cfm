<!--- js.cfm --->
<cfset message = "Haere mai, #URL.name#">
<script>
// function to greet in Maori
function greet(){
	alert("<cfoutput>#message#</cfoutput>");
}

greet();
</script>