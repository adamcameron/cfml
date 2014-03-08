// TestCreateLocalisedDayOfWeekAsInteger.cfc
component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		include "createLocalisedDayOfWeekAsInteger.cfm";

		variables.defaultLocale = "en_nz";
		variables.alternateLocale = "fr_fr";
		variables.daysOfWeek[defaultLocale] = ["sunday","monday","tuesday","wednesday","thursday","friday","saturday"];
		variables.daysOfWeek[alternateLocale] = ["dimanche","lundi","mardi","mercredi","jeudi","vendredi","samedi"];
	}

	public void function test_baseLine(){
		createLocalisedDayOfWeekAsInteger(defaultLocale);
	}

	public void function test_functionRequiresLocale(){
		expectException("application");
		createLocalisedDayOfWeekAsInteger();
	}

	public void function test_functionRejectsInvalidLocale(){
		expectException("InvalidLocaleException");
		createLocalisedDayOfWeekAsInteger("MI"); // Maori
	}

	public void function test_returnsAFunction(){
		assert(isClosure(createLocalisedDayOfWeekAsInteger(defaultLocale)), "Returned value should be the result of a function expression");
	}

	public void function test_returnedFunctionRequiresDayArgument(){
		var f = createLocalisedDayOfWeekAsInteger(defaultLocale);
		expectException("application");
		f();
	}

	public void function test_returnedFunctionReturnsBoolean(){
		var f = createLocalisedDayOfWeekAsInteger(defaultLocale);
		var b = f(day="Monday");
		assert(isBoolean(b), "Value returned from returned function should be a boolean");
	}

	public void function test_validDayDefaultLocale(){
		var LSDayOfWeekAsInteger = createLocalisedDayOfWeekAsInteger(defaultLocale);
		for (var i=1; i <= arrayLen(daysOfWeek[defaultLocale]); i++){
			assertEquals(i, LSDayOfWeekAsInteger(daysOfWeek[defaultLocale][i]), "Unexpected value returned for #daysOfWeek[defaultLocale][i]#");
		}
	}

	public void function test_invalidDayDefaultLocale(){
		var LSDayOfWeekAsInteger = createLocalisedDayOfWeekAsInteger(defaultLocale);
		expectException("ArgumentOutOfRangeException");
		LSDayOfWeekAsInteger("lundi");
	}

	public void function test_validDayAlternateLocale(){
		var LSDayOfWeekAsInteger = createLocalisedDayOfWeekAsInteger(alternateLocale);
		for (var i=1; i <= arrayLen(daysOfWeek[alternateLocale]); i++){
			assertEquals(i, LSDayOfWeekAsInteger(daysOfWeek[alternateLocale][i]), "Unexpected value returned for #daysOfWeek[alternateLocale][i]#");
		}
	}

	public void function test_invalidDayAlternateLocale(){
		var LSDayOfWeekAsInteger = createLocalisedDayOfWeekAsInteger(alternateLocale);
		expectException("ArgumentOutOfRangeException");
		LSDayOfWeekAsInteger("SUNDAY");
	}

	public void function test_withIsoOffset(){
		var LSDayOfWeekAsInteger = createLocalisedDayOfWeekAsInteger(defaultLocale, true);
		for (var i=1; i <= arrayLen(daysOfWeek[defaultLocale]); i++){
			assertEquals(
				i-1 ? i-1 : 7,
				LSDayOfWeekAsInteger(daysOfWeek[defaultLocale][i]),
				"Unexpected value returned for #daysOfWeek[defaultLocale][i]#"
			);
		}
	}

}