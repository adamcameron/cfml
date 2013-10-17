component extends="mxunit.framework.TestCase" {

	private date function composeDateTime(date date=now(), numeric year, numeric month, numeric day, numeric hour, numeric minute, numeric second){
		param name="arguments.year" default=year(date);
		param name="arguments.month" default=month(date);
		param name="arguments.day" default=day(date);
		param name="arguments.hour" default=hour(date);
		param name="arguments.minute" default=minute(date);
		param name="arguments.second" default=second(date);

		return createDateTime(arguments.year, arguments.month, arguments.day, arguments.hour, arguments.minute, arguments.second);
	}

	public void function testDefaults(){
		var expected = now();
		var result = composeDateTime();

		assertEquals(year(expected), year(result));
		assertEquals(month(expected), month(result));
		assertEquals(day(expected), day(result));
		assertEquals(hour(expected), hour(result));
		assertEquals(minute(expected), minute(result));
		assertEquals(second(expected), second(result));
	}

	public void function testDate(){
		var expected = createDateTime(2011, 3, 24, 9, 30, 0);
		var result = composeDateTime(date=expected);

		assertEquals(expected, result);
	}

	public void function testYear(){
		var expected = year(dateAdd("yyyy", 1, now()));
		var result = composeDateTime(year=expected);

		assertEquals(expected, year(result));
	}

	public void function testMonth(){
		var expected =  month(dateAdd("m" , 1, now()));
		var result = composeDateTime(month=expected);

		assertEquals(expected, month(result));
	}

	public void function testDay(){
		var expected = day(dateAdd("d" , 1, now()));
		var result = composeDateTime(day=expected);

		assertEquals(expected, day(result));
	}

	public void function testHour(){
		var expected = hour(dateAdd("h" , 1, now()));
		var result = composeDateTime(hour=expected);

		assertEquals(expected, hour(result));
	}

	public void function testMinute(){
		var expected = minute(dateAdd("n" , 1, now()));
		var result = composeDateTime(minute=expected);

		assertEquals(expected, minute(result));
	}

	public void function testSecond(){
		var expected = second(dateAdd("n" , 1, now()));
		var result = composeDateTime(second=expected);

		assertEquals(expected, second(result));
	}

}