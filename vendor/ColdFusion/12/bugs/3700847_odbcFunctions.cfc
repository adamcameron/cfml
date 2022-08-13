// https://bugbase.adobe.com/index.cfm?event=bug&id=3700847
component extends=testbox.system.baseSpec {

	function run(){
		var getTestDateTime = function(){
			var expected = {
				year = 2011,
				month = 3,
				day = 24,
				hour = 9,
				minute = 2,
				second = 17
			};
			expected.dateTime = createDateTime(expected.year,expected.month,expected.day,expected.hour,expected.minute,expected.second);
			return expected;
		};
		var getDateTimeParts = function(dateTime){
			var parts = {
				year = dateTime.getYear(),
				month = dateTime.getMonth(),
				day = dateTime.getDate(),
				hour = dateTime.getHours(),
				minute = dateTime.getMinutes(),
				second = dateTime.getSeconds()
			};
			return parts;
		};
		var expected = getTestDateTime();

		describe("ODBCDate tests", function(){
			it("does not maintain the time part", function(){
				var date = createOdbcDate(expected.dateTime);
				var actual = getDateTimeParts(date);

				expect(actual.year + 1900).toBe(expected.year, "year is wrong");
				expect(actual.month + 1).toBe(expected.month, "month is wrong");
				expect(actual.day).toBe(expected.day, "day is wrong");
				expect(actual.hour).toBe(0, "hour is wrong");
				expect(actual.minute).toBe(0, "minute is wrong");
				expect(actual.second).toBe(0, "second is wrong");
			});
			it("Returns a date string", function(){
				var date = createOdbcDate(expected.dateTime);
				var dateAsString = date.toString();
				expect(dateAsString).toBe("{d '2011-03-24'}");
			});
		});
		describe("ODBCTime tests", function(){
			it("does not maintain the date part", function(){
				var date = createOdbcTime(expected.dateTime);
				var actual = getDateTimeParts(date);

				expect(actual.year).toBe(70, "year is wrong");
				expect(actual.month).toBe(1, "month is wrong");
				expect(actual.day).toBe(1, "day is wrong");
				expect(actual.hour).toBe(expected.hour, "hour is wrong");
				expect(actual.minute).toBe(expected.minute, "minute is wrong");
				expect(actual.second).toBe(expected.second, "second is wrong");
			});
			it("Returns a date string", function(){
				var date = createOdbcTime(expected.dateTime);
				var dateAsString = date.toString();
				expect(dateAsString).toBe("{t '09:02:17'}");
			});
		});
		describe("ODBCDateTime tests", function(){
			it("maintains both parts", function(){
				var date = createOdbcDateTime(expected.dateTime);
				var actual = getDateTimeParts(date);
				expect(actual.year + 1900).toBe(expected.year, "year is wrong");
				expect(actual.month + 1).toBe(expected.month, "month is wrong");
				expect(actual.day).toBe(expected.day, "day is wrong");
				expect(actual.hour).toBe(expected.hour, "hour is wrong");
				expect(actual.minute).toBe(expected.minute, "minute is wrong");
				expect(actual.second).toBe(expected.second, "second is wrong");
			});
			it("Returns a date string", function(){
				var date = createOdbcDateTime(expected.dateTime);
				var dateAsString = date.toString();
				expect(dateAsString).toBe("{ts '2011-03-24 09:02:17'}");
			});
		});
	}

}