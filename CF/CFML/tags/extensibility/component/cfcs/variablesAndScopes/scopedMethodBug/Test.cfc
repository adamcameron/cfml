component {


	public struct function outwards(string initialString, string finalString){
		var st = structNew();

		// using direct access to function is fine
		try {
			st.direct = cat(initialString=arguments.initialString,  finalString=arguments.finalString);
		} catch (any e){
			st.direct = "[#e.message#][#e.detail#]";
		}

		// using scoped access to function breaks
		try {
			st.viaScopeNamed = variables.cat(initialString=arguments.initialString,  finalString=arguments.finalString);
		} catch (any e){
			st.viaScopeNamed = "[#e.message#][#e.detail#]";
		}

		// using scoped access to function breaks
		try {
			st.viaArgColl = variables.cat(argumentCollecton=arguments);
		} catch (any e){
			st.viaArgColl = "[#e.message#][#e.detail#]";
		}

		// referencing the scoped function via a non-scoped variable is fine
		try {
			fnTemp = variables.cat;
			st.viaTemp = fnTemp(initialString=arguments.initialString,  finalString=arguments.finalString);
		} catch (any e){
			st.viaTemp = "[#e.message#][#e.detail#]";
		}

		// using ordered args is fine (although I have heard reports of the args being passed in the incorrect order, I cannot replicate this
		try {
			st.viaScopeOrdered = variables.cat(arguments.initialString,  arguments.finalString);
		} catch (any e){
			st.viaScopeOrdered = "[#e.message#][#e.detail#]";
		}
		return st;
	}

	private string function cat(string initialString, string finalString){
		return "#arguments.initialString# #arguments.finalString#";
	}

}