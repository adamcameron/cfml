<cfcomponent>
	<cfscript>
	public Object function init(value){
		variables.value	= arguments.value;
		this.value		= variables.value;
		
		return this;
	}
	</cfscript>
</cfcomponent>