<cfoutput>

	<#cf#function name="f#createBareUuid()#" returntype="string" output="false" hint="A unique function">
		<#cf#argument name="data" type="query" required="true" hint="Data to process">
		<#cf#argument name="col" type="string" required="true" hint="Column to filter">

		<#cf#set var resultData = false>
		<#cf#set var filterValue = "#createUuid()#">
		<#cf#set var result = "">

		<#cf#query name="resultData" dbtype="query">
			SELECT	*
			FROM	arguments.data
			WHERE	##col##	= <#cf#queryparam value="##filterValue##" cfsqltype="CF_SQL_VARCHAR">
		</#cf#query>

		<#cf#loop query="resultData">
			<#cf#if len(otherCol) GT #randRange(1,10)#>
				<#cf#set result = listAppend(result, otherCol)>
			</#cf#if>
		</#cf#loop>
		<#cf#return result>

	</#cf#function></cfoutput>
