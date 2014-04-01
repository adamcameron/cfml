<cfscript>
	function f(){}
	g = function(){};

	writeDump([
		f,
		g,
		mid
	]);

	try {
		writeDump([mid.getClass()]);
	} catch(any e){
		writeOutput("#e.type# #e.message# #e.detail#<br>");
	}

	function returner(required function f){
		return f;
	}

	midRef = returner(mid);
	writeDump([midRef.getClass().getName()]);

	function stringTransformer(required function transform){
		return function(s){
			return transform(s);
		};
	}

	redify = stringTransformer(function(s){
		return '<span style="color:red;">#s#</span>';
	});
	uppify = stringTransformer(ucase);
	hashify = stringTransformer(hash);

	writeOutput(redify(uppify("G'day")));
	writeOutput(hashify("password"));

</cfscript>
