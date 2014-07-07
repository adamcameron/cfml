//TestFirstXDayOfMonth.cfc
component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		include "udfs/firstXDayOfMonth.cfm";

		variables.firstDayOfMonthIs = {
			1	= createDate(2014,6,1),	
			2	= createDate(2014,9,1),	
			3	= createDate(2014,4,1),	
			4	= createDate(2014,10,1),	
			5	= createDate(2014,5,1),	
			6	= createDate(2014,8,1),	
			7	= createDate(2014,2,1)	
		};
	}

	function run(){
		describe("Tests for firstXDayOfMonth()", function(){
			describe("edge cases", function(){
				it("works in a general case wherein the requested DOW is after the DOW of the first of the month", function(){
					var testDate = firstDayOfMonthIs[2];
					expect(
						firstXDayOfMonth(4, month(testDate), year(testDate))
					).toBe(dateAdd("d", 4-2, testDate));
				});
				it("works in a general case wherein the requested DOW is before the DOW of the first of the month", function(){
					var testDate = firstDayOfMonthIs[6];
					expect(
						firstXDayOfMonth(4, month(testDate), year(testDate))
					).toBe(dateAdd("d", 7-(6-4), testDate));
				});
			});
			describe("edge cases", function(){
				it("works with the same DOW as the first of the month", function(){
					var testDate = firstDayOfMonthIs[3];
					expect(
						firstXDayOfMonth(3, month(testDate), year(testDate))
					).toBe(testDate);
				});
				it("works with a DOW immediately before the first of the month's one", function(){
					var testDate = firstDayOfMonthIs[4];
					expect(
						firstXDayOfMonth(3, month(testDate), year(testDate))
					).toBe(dateAdd("d", 7-(4-3), testDate));
				});
				it("works with a DOW immediately after the first of the month", function(){
					var testDate = firstDayOfMonthIs[5];
					expect(
						firstXDayOfMonth(6, month(testDate), year(testDate))
					).toBe(dateAdd("d", 6-5, testDate));
				});
				it("works with 1 as request DOW and 7 as the 1st's DOW", function(){
					var testDate = firstDayOfMonthIs[7];
					expect(
						firstXDayOfMonth(1, month(testDate), year(testDate))
					).toBe(dateAdd("d", 7-(7-1), testDate));
				});
				it("works with 7 as request DOW and 1 as the 1st's DOW", function(){
					var testDate = firstDayOfMonthIs[1];
					expect(
						firstXDayOfMonth(7, month(testDate), year(testDate))
					).toBe(dateAdd("d", 7-1, testDate));
				});
			});
			describe("invalid cases", function(){
				it("errors if passed 0 as the requested DOW", function(){
					expect(function(){
						firstXDayOfMonth(0, 1, 1);
					}).toThrow("InvalidDayOfWeekException");
				});
				it("errors if passed 8 as the requested DOW", function(){
					expect(function(){
						firstXDayOfMonth(8, 1, 1);
					}).toThrow("InvalidDayOfWeekException");
				});
			});
		});
	}

}