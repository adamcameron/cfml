<cfscript>
	public struct function getRuntimeProperties(){
		var stProps = {
			"AllowExtraAttributes"		= "",
			"CFCLimit"					= "",
			"CFFormScriptSrc"			= "",
			"CFThreadLimit"				= "",
			"CFCTypeCheck"				= "",
			"DisableServiceFactory"		= "",
			"EnablePerAppSettings"		= "",
			"FlashRemotingLimit"		= "",
			"GlobalScriptProtect"		= "",
			"HTTPStatusCodes"			= "",
			"JRunActiveHandlerThreads"	= "",
			"JRunMaxHandlerThreads"		= "",
			"MissingIncludeHandler"		= "",
			"PostSizeLimit"				= "",
			"RequestLimit"				= "",
			"RequestQueueTimeout"		= "",
			"RequestQueueTimeoutPage"	= "",
			"RequestThrottleThreshold"	= "",
			"RequestThrottleMemory"		= "",
			/*"ReportThreads"			= "",*/
			"SerialNumber"				= "",
			"SimultaneousThreads"		= "",
			"SiteWideErrorHandler"		= "",
			"TimeoutRequests"			= "",
			"TimeoutRequestTimeLimit"	= "",
			"WebServiceLimit"			= "",
			"Whitespace"				= "",
			"SecureJSON"				= "",
			"SecureJSONPrefix"			= "",
			"EnableInMemoryFileSystem"	= "",
			"InMemoryFileSystemLimit"	= "",
			"FileLockEnabled"			= "",
			"serverCFC"					= "",
			"AppCFCLookupOrder"			= "",
			"GoogleMapKey"				= ""
		};
		var sKey	= "";
		for (sKey in stProps){
			stProps[sKey] = application.oApiRuntime.getRuntimeProperty(sKey);
		}
		return stProps;
	}
	request.getRuntimeProperties = getRuntimeProperties;


	public void function setRuntimeProperties(){
		var sKey	= "";
		for (sKey in arguments){
			application.oApiRuntime.setRuntimeProperty(sKey, arguments[sKey]);
		}
	}
	request.setRuntimeProperties = setRuntimeProperties;


	public struct function getScopeProperties(){
		var stProps = {
			"clientStorage"				= "",
			"clientStore"				= "",
			"UUIDCFToken"				= "",
			"enableJ2EESessions"		= "",
			"enableSessionScope"		= "",
			"sessionScopeTimeout"		= "",
			"sessionScopeMaxTimeout"	= "",
			"enableApplicationScope"	= "",
			"applicationScopeTimeout"	= "",
			"applicationScopeMaxTimeout"= ""
		};
		var sKey	= "";
		for (sKey in stProps){
			stProps[sKey] = application.oApiRuntime.getScopeProperty(sKey);
		}
		return stProps;
	}
	request.getScopeProperties = getScopeProperties;


	public void function setScopeProperties(){
		var sKey = "";
		for (sKey in arguments){
			application.oApiRuntime.setScopeProperty(sKey, arguments[sKey]);
		}
	}
	request.setScopeProperties = setScopeProperties;


	public struct function getCacheProperties(){
		var stProps = {
			"ComponentCache"			= "",
			"TrustedCache"				= "",
			"InRequestTemplateCache"	= "",
			"TemplateCacheSize"			= "",
			"SaveClassFiles"			= "",
			"CacheRealPath"				= "",
			"MaxCachedQuery"			= ""
		};
		var sKey	= "";
		for (sKey in stProps){
			stProps[sKey] = application.oApiRuntime.getCacheProperty(sKey);
		}
		return stProps;
	}
	request.getCacheProperties = getCacheProperties;


	public void function setCacheProperties(){
		var sKey = "";
		for (sKey in arguments){
			application.oApiRuntime.setCacheProperty(sKey, arguments[sKey]);
		}
	}
	request.setCacheProperties = setCacheProperties;


	public struct function getMailProperties(){
		var stProps = {
			"enableSpool"				= "",
			"enableSSL"					= "",
			"enableTLS"					= "",
			"defaultMailCharset"		= "",
			"defaultPassword"			= "",
			"defaultPort"				= "",
			"defaultUsername"			= "",
			"maintainConnections"		= "",
			"maxDeliveryThreads"		= "",
			"spoolInterval"				= "",
			"spoolToMemory"				= "",
			"MaxMessagesInMemory"		= "",
			"Timeout"					= "",
			"enableSign"				= "",
			"defaultKeystore"			= "",
			"defaultKeystorePassword"	= "",
			"defaultKeyAlias"			= "",
			"defaultKeyPassword"		= ""
		};
		var sKey	= "";
		for (sKey in stProps){
			stProps[sKey] = application.oApiMail.getMailProperty(sKey);
		}
		return stProps;
	}
	request.getMailProperties = getMailProperties;


	public void function setMailProperties(){
		var sKey = "";
		for (sKey in arguments){
			application.oApiMail.setMailProperty(sKey, arguments[sKey]);
		}
	}
	request.setMailProperties = setMailProperties;


	public struct function getLogProperties(){
		var stProps = {
			"LogDirectory"			= "",
			"MaxFileSize"			= "",
			"MaxArchives"			= "",
			"LogScheduledTask"		= "",
			"LogCorbaCalls"			= "",
			"LogRequestTimeLimit"	= "",
			"logMailSeverity"		= "",
			"logMailSentMessages"	= ""
		};
		var sKey	= "";
		for (sKey in stProps){
			stProps[sKey] = application.oApiDebugging.getLogProperty(sKey);
		}
		return stProps;
	}
	request.getLogProperties = getLogProperties;


	public void function setLogProperties(){
		var sKey = "";
		for (sKey in arguments){
			application.oApiDebugging.setLogProperty(sKey, arguments[sKey]);
		}
	}
	request.setLogProperties = setLogProperties;


	public struct function getChartProperties(){
		var stProps = {
			"CacheSize"	= "",
			"CacheType"	= "",
			"CachePath"	= "",
			"Threads"	= ""
		};
		var sKey	= "";
		for (sKey in stProps){
			stProps[sKey] = application.oApiRuntime.getChartProperty(sKey);
		}
		return stProps;
	}
	request.getChartProperties = getChartProperties;


	public void function setChartProperties(){
		var sKey = "";
		for (sKey in arguments){
			application.oApiRuntime.setChartProperty(sKey, arguments[sKey]);
		}
	}
	request.setChartProperties = setChartProperties;


	public struct function getFlexProperties(){
		var stProps = {
			"EnableFlashRemoting"	= "",
			"EnableDataServices"	= "",
			"DataServiceIPList"		= "",
			"EnableRMISSL"			= "",
			"RMISSLKeystore"		= "",
			"RMISSLKeystorePassword"= "",
			"DataServiceID"			= ""
		};
		var sKey	= "";
		for (sKey in stProps){
			stProps[sKey] = application.oApiFlex.getProperty(sKey);
		}
		return stProps;
	}
	request.getFlexProperties = getFlexProperties;


	public void function setFlexProperties(){
		var sKey = "";
		for (sKey in arguments){
			application.oApiFlex.setProperty(sKey, arguments[sKey]);
		}
	}
	request.setFlexProperties = setFlexProperties;


	public struct function getDebugProperties(){
		var stProps = {
			"enableDebug"					= "",
			"enableRobustExceptions"		= "",
			"enableAJAXDebugging"			= "",
			"enablePerfMon"					= "",
			"enableCFStat"					= "",
			"debugTemplate"					= "",
			"templateExecutionTime"			= "",
			"templateHighlightMinimum"		= "",
			"templateModel"					= "",
			"templateHighlightMinimum"		= "",
			"showExecutionTime"				= "",
			"showGeneralInfo"				= "",
			"showDatabaseInfo"				= "",
			"showExceptionInfo"				= "",
			"showTrace"						= "",
			"showTimer"						= "",
			"showVariables"					= "",
			"showApplicationVariables"		= "",
			"showCGIVariables"				= "",
			"showClientVariables"			= "",
			"showCookieVariables"			= "",
			"showFlashFormCompileErrors"	= "",
			"showFormVariables"				= "",
			"showRequestVariables"			= "",
			"showSessionVariables"			= "",
			"showServerVariables"			= "",
			"showURLVariables"				= ""
		};
		var sKey	= "";
		for (sKey in stProps){
			stProps[sKey] = application.oApiDebugging.getDebugProperty(sKey);
		}
		return stProps;
	}
	request.getDebugProperties = getDebugProperties;


	public void function setDebugProperties(){
		var sKey = "";
		for (sKey in arguments){
			application.oApiDebugging.setDebugProperty(sKey, arguments[sKey]);
		}
	}
	request.setDebugProperties = setDebugProperties;

</cfscript>
