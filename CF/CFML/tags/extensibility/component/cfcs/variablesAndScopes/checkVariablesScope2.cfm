<cfapplication name="shado" clientmanagement="yes" sessionmanagement="yes" setclientcookies="yes" setdomaincookies="no">
<cfflush interval="20">
Running...<br />
<cfscript>
	request.aInstanceNames = arrayNew(1);
	function getVariables (){
		var aVariableNames	= structKeyArray(variables);
		var iVariableNames	= 0;
		var stReturn		= structNew();

		for (iVariableNames=1; iVariableNames le arrayLen(aVariableNames); iVariableNames=iVariableNames+1){
			if (aVariableNames[iVariableNames] neq "this" and not isCustomFunction(variables[aVariableNames[iVariableNames]])){
				stReturn[aVariableNames[iVariableNames]] = variables[aVariableNames[iVariableNames]];
			}
		}
		return duplicate(stReturn);
	}
	
	function traverseCache(sKeyPath){
		var o			= evaluate(arguments.sKeyPath);
		var aKeys		= false;
		var iKeys		= 0;
		if (structKeyExists(getMetaData(o), "type") and getMetaData(o).type eq "component"){
			arrayAppend(request.aInstanceNames, arguments.sKeyPath);
		}else{	// or an object, in which case we just process it
			aKeys = structKeyArray(o);
			// loop over each key
			for (iKeys=1; iKeys le arrayLen(aKeys); iKeys=iKeys+1){
				traverseCache(sKeyPath="#arguments.sKeyPath#.#aKeys[iKeys]#");	// if it's a struct, recurse
			}
		}		
	}
	
	// get all the component caches
	aCC = structFindKey(application, "componentCache", "ALL");

	for (iCC=1; iCC le arrayLen(aCC); iCC=iCC+1){
		sKeyname = "application#aCC[iCC].path#";
		traverseCache(sKeyPath=sKeyname);
	}
</cfscript>

<cfset sDirName = getDirectoryFromPath(getCurrentTemplatePath()) & "variablesDump/">
<cfif not directoryExists(sDirName)>
	<cfdirectory directory="#sDirName#" action="create">
</cfif>

<cfloop index="iInstanceNames" from="1" to="#arrayLen(request.aInstanceNames)#">
	<cfset o = evaluate(request.aInstanceNames[iInstanceNames])>
	<cfset o.getVariables = getVariables>
	
	<cfset st = structNew()>
	<cfset st.componentname = request.aInstanceNames[iInstanceNames]>
	<cfset st.variables = o.getVariables()>

	<cfsavecontent variable="variablesData">
		<cfdump var="#st#" label="#request.aInstanceNames[iInstanceNames]#">
	</cfsavecontent>
	<cfset sFileName = "#sDirName##replace(request.aInstanceNames[iInstanceNames], '.', '_', 'all')#.html">
	<cfoutput>Writing [#sFileName#]...</cfoutput>
	<cffile action="write" addnewline="yes" file="#sFileName#" output="#variablesData#">
	<cfoutput>Written<br /></cfoutput>
</cfloop>

<cfoutput>Complete<br /></cfoutput>