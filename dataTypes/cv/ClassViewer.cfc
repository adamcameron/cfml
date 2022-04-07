/**
	ClassViewer.cfc
	@hint An almost pure CFML implementation of ClassViewer.class (see http://adamcameroncoldfusion.blogspot.co.uk/2012/08/classviewerjava.html).
	@description   
*/
component {

	// these are just for formatting the output	
	variables._NL		= createObject("java", "java.lang.System").getProperty("line.separator");
	variables._INDENT	= "    ";

	// Couldn't do it ALL with CFML, unfortunately.  Need these to inspect the classes/objects
	variables.class		= createObject("java", "java.lang.Class");
	variables.modifier	= createObject("java", "java.lang.reflect.Modifier");


	/**
		@hint Returns a string containing information on the specified Java class. The string returned is best output within PRE tags.
		@className A Java class name to return reflection data of.
	*/
	public String function viewClassByName(String className){
		return viewClass(variables.class.forName(arguments.className));
	}


	/**
		@hint Returns a string containing information on the specified object. The string returned is best output within PRE tags.
		@object A Java Object.
	*/
	public String function viewObject(any object){
		return viewClass(arguments.object.getClass());
	}


	/**
		@hint Returns a string containing information on the specified class. The string returned is best output within PRE tags.
		@class A Java Class object.
	*/
	public String function viewClass(any class){
		var parentClass	= arguments.class.getSuperclass();
		
		// do the basic class modifiers like ""public static class MyClass""
		var out			= variables.modifier.toString(arguments.class.getModifiers()) & " class " & arguments.class.getName() & variables._NL;
		var indent		= variables._INDENT;
		
		// now all the classes this one extends, in a slightly progessively indented fashion
		var	bExtends	= true;
		while (bExtends){
			try {
				var extends = parentClass.getName();
				out &= indent & "extends " & extends & variables._NL;
				parentClass = parentClass.getSuperclass();
				indent &= variables._INDENT;
			} catch (any e){
				bExtends = false;
			}
		}

		// and any interfaces it implements
		var interfaces = arguments.class.getInterfaces();
		if (arrayLen(interfaces) > 0) {
			out &= variables._INDENT & "implements ";
			for (var i=1; i <= arrayLen(interfaces); i++) {
				if (i != 1) {
					out &= ", ";
				}
				out &= interfaces[i].getName();
			}
			out &= variables._NL;
		}
		out &= "{" & variables._NL;

		// that's the end of the main class declaration, the rest is what's within the class itself, constructors, methods, public properties (all are well signposted below)


		out &= variables._INDENT & "/*** CONSTRUCTORS ***/" & variables._NL;
		var constructors = arguments.class.getConstructors();
		for (var c=1; c <= arrayLen(constructors); c++) {
			out &= variables._INDENT & inspectConstructor(constructors[c]) & variables._NL & variables._NL;
		}
		out &= variables._NL;


		out &= variables._INDENT & "/*** METHODS ***/" & variables._NL;
		methods = arguments.class.getMethods();
		for (var m=1; m <= arrayLen(methods); m++) {
			out &= variables._INDENT & inspectMethod(methods[m]) & variables._NL & variables._NL;
		}
		out &= variables._NL;


		out &= variables._INDENT & "/*** FIELDS ***/" & variables._NL;
		fields = arguments.class.getFields();
		for (var f=1; f <= arrayLen(fields); f++) {
			out &= variables._INDENT & variables.modifier.toString(fields[f].getModifiers()) & " " & fields[f].getType().getName() & " " & fields[f].getName() & variables._NL;
		}
		out &= variables._NL & "}";
		return out;
	}


	/**
		@method A Java Method object.
		@hint Returns a string containing information on the specified method
	*/
	private String function inspectMethod(any method) {
		var out = variables.modifier.toString(arguments.method.getModifiers()) & " " & arguments.method.getReturnType().getName() & " " &  arguments.method.getName() & "(";
		params = arguments.method.getParameterTypes();
		for (var p=1; p <= arrayLen(params); p++) {
			if (p != 1) {
				out &= ", ";
			}
			out &= params[p].getName();
		}
		out &= ")";
		var exceptions = arguments.method.getExceptionTypes();
		if (arrayLen(exceptions) > 0) {
			out &= variables._NL;
			out &= variables._INDENT & "throws ";
			for (var e=1; e <= arrayLen(exceptions); e++) {
				if (e != 1) {
					out &= ", ";
				}
				out &= exceptions[e].getName();
			}
		}
		return out;
	}


	/**
		@constructor A Java Constructor object.
		@hint Returns a string containing information on the specified constructor
	*/
	private String function inspectConstructor(any constructor){
		var out = variables.modifier.toString(constructor.getModifiers()) & " " &  constructor.getName() & "(";

		var params = constructor.getParameterTypes();
		for (var p=1; p <= arrayLen(params); p++) {
			if (p != 1) {
				out &= ", ";
			}
			out &= params[p].getName();
		}
		out &= ")";
		return out;
	}


}