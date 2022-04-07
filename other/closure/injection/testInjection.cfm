<cfscript>
// testInjection.cfm
o = new C("Set by constructor");

createInjector = function(){
	var functionToInject = function(){
		writeDump(var=variables, label="variables via functionToInject()");
		writeDump(var=this, label="this via functionToInject()");
		writeDump(var=getMetadata(this), label="metadata via functionToInject()");

	};
	return function(o){
		o.__getVariablesReference = function(){
			return structget("variables");
		};
		var objectVariables = o.__getVariablesReference();
		writeDump(var=objectVariables, label="objectVariables in returned function");
		objectVariables.injectedFunction = functionToInject;
	};
};

injector = createInjector();
injector(o);

o.dumpVariables();
writeOutput("<hr>");

writeDump(var=variables, label="Calling code variables");
writeOutput("<hr>");

injectedFunction();

o.wrapperForInjectedFunction();

</cfscript>