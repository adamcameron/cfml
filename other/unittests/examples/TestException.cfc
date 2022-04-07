<!--- TestException.cfc--->
<cfcomponent extends="mxunit.framework.TestCase">
	

	<cffunction name="tagBasedMetadata" returntype="void" access="public" output="false" mxunit:expectedexception="TestException">
		<cfthrow type="TestException">
	</cffunction>

	<cfscript>
		/**
		* @mxunit:expectedexception TestException
		*/ 
		public void function scriptBasedAnnotation(){
			throw(type="TestException");
		}

		public void function viaAssertion(){
			expectException("TestException");
			throw(type="TestException");
		}
	</cfscript>

</cfcomponent>