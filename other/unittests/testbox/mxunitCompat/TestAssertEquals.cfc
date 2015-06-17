// TestAssertEquals.cfc
component extends="mxunit.framework.TestCase" {

	function beforeTests(){
		variables.shallow = {four="wha", three="toru", two="rua", one="tahi"};
	}
	
	function testAssertEqualsWithEmptyStructs(){
		var test = {};
		var empty = {};
		assertEquals(empty, test);
	}
	
	function testAssertEquals_shallow_via_literal(){
		var test = {one="tahi", two="rua", three="toru", four="wha"};
		assertEquals(shallow, test);
	}
	
	function testAssertEquals_shallow_via_structnew(){
		var test = structNew();
		test.one = "tahi";
		test.two = "rua";
		test.three = "toru";
		test.four = "wha";
		assertEquals(shallow, test);
	}
	
	function testAssertEquals_shallow_via_json(){
		var test = deserializeJson('{"one":"tahi","two":"rua","three":"toru","four":"wha"}');
		assertEquals(shallow, test);
	}
	
	function testAssertEquals_shallow_via_function(){
		var test = returnShallowStruct();
		assertEquals(shallow, test);
	}
	
	function testAssertEquals_domsStruct_compared_to_self(){
		var test = returnDomsStruct();
		assertEquals(returnDomsStruct(), test);
	}

	function testFoo() test=true {
		writeDump(var=getMetadata(testFoo));
		abort;
	}

	private function returnShallowStruct(){
		return {one="tahi", two="rua", three="toru", four="wha"};
	}

	private function returnDomsStruct(){
		return {
			tabs = [{
				  title       = ""
				, description = ""
				, id          = ""
				, fieldsets   = [{
					  title       = ""
					, description = ""
					, id          = ""
					, fields      = [ {
						  name         = "obj_label"
						, type         = "string"
						, dbtype       = "varchar"
						, maxLength    = "50"
						, required     = "false"
						, control      = "overridenControl"
						, generator    = "none"
						, relatedto    = "none"
						, relationship = "none"
						, binding      = "security_user.obj_label"
						, rules        = []
					} ]
				}]
			}]
		};
	}
	
}