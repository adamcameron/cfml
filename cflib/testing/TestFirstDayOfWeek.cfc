// TestFirstDayOfWeek.cfc
component extends="testbox.system.testing.BaseSpec" {

	function beforeAll(){
		include "udfs/firstDayOfWeek.cfm";

		variables.testDate = now();
		variables.testFirstDayOfWeek = dateAdd("d", -(dayOfWeek(variables.testDate)-1), variables.testDate);
	}

	function run(){
		describe("Tests for firstDayOfWeek()", function(){

			var isRailo = function(){
				return structKeyExists(server, "railo");
			};

			it("returns most recent sunday for default date", function(){
				expect(
					dateCompare(variables.testFirstDayOfWeek, firstDayOfWeek(), "d")
				).toBe(0);
			});

			it("returns most recent sunday for current date as positional argument", function(){
				expect(
					dateCompare(variables.testFirstDayOfWeek, firstDayOfWeek(variables.testDate), "d")
				).toBe(0);
			});

			it("returns most recent sunday for current date as named argument", function(){
				expect(
					dateCompare(variables.testFirstDayOfWeek, firstDayOfWeek(date=variables.testDate), "d")
				).toBe(0);
			});

			it("returns same date if passed-in date is already first day of week", function(){
				expect(
					dateCompare(variables.testFirstDayOfWeek, firstDayOfWeek(date=variables.testFirstDayOfWeek), "d")
				).toBe(0);
			});

			it(
				title	= "gives typeful error if non-date is passed (CF)",
				body	= function(){
					expect(function(){
						firstDayOfWeek(date="NOT_A_DATE");
					}).toThrow(regex="The DATE argument passed to the firstDayOfWeek function is not of type date");
				},
				labels	= "",
				skip	= isRailo()
			);

			it(
				title	= "gives typeful error if non-date is passed (Railo)",
				body	= function(){
					expect(function(){
						firstDayOfWeek(date="NOT_A_DATE");
					}).toThrow(regex="first Argument \(date\) is of invalid type, can't cast String \[not_a_date] to a value of type \[date]");
				},
				labels	= "",
				skip	= !isRailo()
			);
		});
	}

}