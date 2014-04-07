// TestCreateSerialiser.cfc
component extends="testbox.system.testing.BaseSpec" {

	function run(){
		include "udfs/createSerialiser.cfm"

		describe("Tests for createSerialiser()", function(){
			beforeEach(function(){
				serialiser = createSerialiser()
			})
			describe("Tests for returned serialise() function", function(){
				it("is returned", function(){
					expect(
						serialiser.keyExists("serialise")
					).toBeTrue()
				})
				it("is is a function", function(){
					expect(
						isClosure(serialiser.serialise)
					).toBeTrue()
				})
			})
			describe("Tests for returned deserialise() function", function(){
				it("is returned", function(){
					expect(
						serialiser.keyExists("deserialise")
					).toBeTrue()
				})
				it("is is a function", function(){
					expect(
						isClosure(serialiser.deserialise)
					).toBeTrue("fail")
				})
				it("rejects non-JSON correctly", function(){
					expect(function(){
						include "udfs/createSerialiser.cfm"
						serialiser = createSerialiser()
						serialiser.deserialise("NOT_JSON")						
					}).tothrow("InvalidJsonException")
				})
				it("deals with malformed struct correctly", function(){
					expect(function(){
						include "udfs/createSerialiser.cfm"
						serialiser = createSerialiser()
						serialiser.deserialise(serializeJson({}))						
					}).tothrow("InvalidJsonException")
				})
				it("deals with missing component key", function(){
					expect(function(){
						include "udfs/createSerialiser.cfm"
						serialiser = createSerialiser()
						serialiser.deserialise(serializeJson({object=""}))					
					}).tothrow("InvalidJsonException")
				})
				it("deals with missing object key", function(){
					expect(function(){
						include "udfs/createSerialiser.cfm"
						serialiser = createSerialiser()
						serialiser.deserialise(serializeJson({component=""}))					
					}).tothrow("InvalidJsonException")
				})
			})

		})
	}

}