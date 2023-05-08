<cfscript>
makeGreeting = function(greeting){
	return function(who){
		writeOutput(greeting & ", " & who & "<br />");
	};
};

sayHello = makeGreeting("Hello");
sayHi	= makeGreeting("Hi");

sayHello("Adam");
sayHi("Zachary");
</cfscript>