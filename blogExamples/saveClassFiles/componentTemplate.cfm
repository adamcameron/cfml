<cfoutput>
<#cf#component output="false">


	<#cf#function name="init" returntype="#componentReturnType#" access="public" output="false" hint="Initialises and returns the object">
		<#cf#argument name="configFile" type="string" required="true" hint="Config file name">

		<#cf#set var jsonConfig = "">

		<#cf#file action="read" file="##expandPath('./')####arguments.configFile##" variable="rawConfig">

		<#cf#set variables.config = deserializeJson(jsonConfig)>

		<#cf#return this>
	</#cf#function>

	#functions#

</#cf#component>
</cfoutput>