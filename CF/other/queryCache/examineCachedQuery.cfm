<cfset oDataSourceService = createObject("java", "coldfusion.server.ServiceFactory").DataSourceService>
<cfset aCachedQueries = oDataSourceService.getCachedQueries()>

<cfoutput>
<cfloop index="iQuery" from="1" to="#arrayLen(aCachedQueries)#">
	<cfset oCachedQuery = aCachedQueries[iQuery]>
	<cfset oKey = oCachedQuery.getKey()>
	oKey.getDsname(): #oKey.getDsname()#<br/>
	oKey.getName(): #oKey.getName()#<br/>

	<cfset oParamList = oKey.getParamList()>
	<cfset aParams = oParamList.getAllParameters()>
	<cfloop index="iParam" from="1" to="#arrayLen(aParams)#">
		<cfset oParam = aParams[iParam]>
		[oKey] oParam.getObject(): #oParam.getObject()#<br/>
		[oKey] oParam.getScale(): #oParam.getScale()#<br/>
		[oKey] oParam.getSqltype(): #oParam.getSqltype()#<br/>
		[oKey] oParam.getSqltypeName(): #oParam.getSqltypeName()#<br/>
		[oKey] oParam.getStatement(): #oParam.getStatement()#<br/>
	</cfloop>
	oParamList.getWhere(): #oParamList.getWhere()#<br/>

	oKey.getPassword(): #oKey.getPassword()#<br/>
	oKey.getSql(): #oKey.getSql()#<br/>
	oKey.getUsername(): #oKey.getUsername()#<br/>
	oKey.toString(): #oKey.toString()#<br/>	

	<cfset oStats = oCachedQuery.getStats()>
			
	oStats.getDSN(): #oStats.getDSN()#<br/>
	oStats.getExecutionCount(): #oStats.getExecutionCount()#<br/>
	oStats.getExecutionTime(): #oStats.getExecutionTime()#<br/>
	oStats.getFunctionName(): #oStats.getFunctionName()#<br/>
	oStats.getHitCount(): #oStats.getHitCount()#<br/>
	oStats.getLastTimeExecuted(): #oStats.getLastTimeExecuted()#<br/>
	oStats.getLineNo(): #oStats.getLineNo()#<br/>
	oStats.getName(): #oStats.getName()#<br/>
	oStats.getSize(): #oStats.getSize()#<br/>
	oStats.getSql(): #oStats.getSql()#<br/>
	oStats.getStartedAt(): #oStats.getStartedAt()#<br/>
	oStats.getStartedAtMillis(): #oStats.getStartedAtMillis()#<br/>
	oStats.getTemplatePath(): #oStats.getTemplatePath()#<br/>
	oStats.getThreadName(): #oStats.getThreadName()#<br/>
	oStats.isCached(): #oStats.isCached()#<br/>
	oStats.isCompleted(): #oStats.isCompleted()#<br/>
	oStats.isStored(): #oStats.isStored()#<br/>

	oCachedQuery.getCreationTime(): #oCachedQuery.getCreationTime()#<br/>
	oCachedQuery.isInUse(): #oCachedQuery.isInUse()#<br/>

	<cfset aParams = oCachedQuery.getParameterList().getAllParameters()>
	<cfloop index="iParam" from="1" to="#arrayLen(aParams)#">
		<cfset oParam = aParams[iParam]>
		[oCachedQuery] oParam.getObject(): #oParam.getObject()#<br/>
		[oCachedQuery] oParam.getScale(): #oParam.getScale()#<br/>
		[oCachedQuery] oParam.getSqltype(): #oParam.getSqltype()#<br/>
		[oCachedQuery] oParam.getSqltypeName(): #oParam.getSqltypeName()#<br/>
		[oCachedQuery] oParam.getStatement(): #oParam.getStatement()#<br/>
	</cfloop>
	<cfdump var="#oCachedQuery.getResult()#" label="oDataSourceService.getCachedQueries()[#iQuery#].getResult()">
	<hr />
</cfloop>
</cfoutput>
<cfdump var="#oDataSourceService#" label="DataSourceService">
<cfdump var="#aCachedQueries#" label="oDataSourceService.getCachedQueries()">
<cfdump var="#oKey#" label="oDataSourceService.getCachedQueries()[i].getKey()">
<cfdump var="#oStats#" label="oDataSourceService.getCachedQueries()[i].getStats()">
<cfdump var="#oKey.getParamList()#" label="oDataSourceService.getCachedQueries()[n].getKey[m].getParamList()">
<cfdump var="#aParams#" label="oDataSourceService.getCachedQueries()[i].getAllParameters()">
