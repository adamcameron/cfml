<cfscript>
	double = createObject("java", "java.lang.Double").init(0.0006);
	float = createObject("java", "java.lang.Float").init(0.0006);
	writeDump([{double=double},{float=float}]);

</cfscript>