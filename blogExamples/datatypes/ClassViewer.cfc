component {


	variables._NL		= createObject("java", "java.lang.System").getProperty("line.separator");
	variables._INDENT	= "  ";
	variables.class		= createObject("java", "java.lang.Class");
	variables.modifier	= createObject("java", "java.lang.reflect.Modifier");


	public String function viewClassByName(String className){
		return viewClass(variables.class.forName(arguments.className));
	}


	public String function viewObject(any object){
		return viewClass(arguments.object.getClass());
	}


	public String function viewClass(any class){
		var parentClass	= arguments.class.getSuperclass();
		var out			=  '<span class="cvClassInfo">' & variables.modifier.toString(arguments.class.getModifiers()) & " class " & arguments.class.getName() & variables._NL;
		var indent		= variables._INDENT;
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


		out &= '<span class="cvComments">/*** CONSTRUCTORS ***/</span>' & variables._NL;
		var constructors = arguments.class.getConstructors();
		for (var c=1; c <= arrayLen(constructors); c++) {
			out &= " " & viewConstructor(constructors[c]) & variables._NL & variables._NL;
		}
		out &= variables._NL;


		out &= '<span class="cvComments">/*** METHODS ***/</span>' & variables._NL;
		methods = arguments.class.getMethods();
		for (var m=1; m <= arrayLen(methods); m++) {
			out &= " " & viewMethod(methods[m]) & variables._NL & variables._NL;
		}
		out &= variables._NL;


		out &= '<span class="cvComments">/*** FIELDS ***/</span>' & variables._NL;
		fields = arguments.class.getFields();
		for (var f=1; f <= arrayLen(fields); f++) {
			out &= " " & variables.modifier.toString(fields[f].getModifiers()) & " " & fields[f].getType().getName() & fields[f].getName() & variables._NL;
		}
		out &= variables._NL & "}</span>";
		return out;
	}


	public String function viewMethod(any m) {
		var out = '<span class="cvModifiers">' & variables.modifier.toString(m.getModifiers()) & " " & m.getReturnType().getName() & '</span> <span class="cvMethodName">' &  m.getName() & '</span><span class="cvMethodArgs">(</span>';

		out &= viewParameters(m);

		var exc = m.getExceptionTypes();
		if (arrayLen(exc) > 0) {
			out &= variables._NL;
			out &= '<span class="cvModifiers">';
			out &= variables._INDENT & "throws ";
			for (var e=1; e <= arrayLen(exc); e++) {
				if (e != 1) {
					out &= ", ";
				}
				out &= exc[e].getName();
			}
			out &= '</span>';
		}
		return out;
	}


	public String function viewConstructor(any constructor){
		var out = '<span class="cvModifiers">' & variables.modifier.toString(constructor.getModifiers()) & '</span> <span class="cvMethodName">' &  constructor.getName() & '</span><span class="cvMethodArgs">(</span>';

		out &= viewParameters(constructor);

		return out;
	}

	private String function viewParameters(required any object){
		var out = '<span class="cvMethodArgs">';
		var params = object.getParameterTypes();
		for (var p=1; p <= arrayLen(params); p++) {
			if (p != 1) {
				out &= ", ";
			}
			out &= params[p].getName();
		}
		out &= ')</span>';
		return out;
	}

}