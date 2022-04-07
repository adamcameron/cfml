<cfcomponent>
	<cfscript>
	public Number function init(number){
		variables.number= arguments.number;
		this.number		= variables.number;
		
		return this;
	}
	</cfscript>
</cfcomponent>