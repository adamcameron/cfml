<!--- TestC_tags.cfc --->
<cfcomponent extends="mxunit.framework.TestCase">
	
</cfcomponent>
	
	<cffunction name="setup" access="public" returntype="void">
		<cfobject type="component" component="C" name="oTestC">
		<cfinvoke component="#oTestC#" method="init">
		variables.oTestC = new C();
		variables.oTestC.getVariables = getVariables;
	</cffunction>

	public void function testSetMyProperty(){
		var valueToSet = "TEST_setMyProperty";
		variables.oTestC.setMyProperty(valueToSet);

		var valueActuallySet = variables.oTestC.getVariables().myProperty;

		assertEquals(
			valueToSet,
			valueActuallySet,
			"setMyProperty() set myProperty incorrectly"
		);
	}

	private struct function getVariables(){
		return variables;
	}

</cfcomponent>