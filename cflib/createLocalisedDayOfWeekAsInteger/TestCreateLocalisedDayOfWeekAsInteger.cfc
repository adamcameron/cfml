// TestCreateLocalisedDayOfWeekAsInteger.cfc
component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		include "createLocalisedDayOfWeekAsInteger.cfm";

		variables.defaultLocale = "en_nz";
		variables.alternateLocale = "fr_fr";
		variables.daysOfWeek[defaultLocale] = ["sunday","monday","tuesday","wednesday","thursday","friday","saturday"];
		variables.daysOfWeek[alternateLocale] = ["dimanche","lundi","mardi","mercredi","jeudi","vendredi","samedi"];
	}

	public void function baseLine(){
		createLocalisedDayOfWeekAsInteger(defaultLocale);
	}

	/**
	* @mxunit:expectedException application
	*/ 
	public void function functionRequiresLocale(){
		createLocalisedDayOfWeekAsInteger();
	}

	/**
	* @mxunit:expectedException InvalidLocaleException
	*/ 
	public void function functionRejectsInvalidLocale(){
		createLocalisedDayOfWeekAsInteger("MI"); // Maori
	}

	public void function returnsAFunction(){
		assert(isClosure(createLocalisedDayOfWeekAsInteger(defaultLocale)), "Returned value should be the result of a function expression");
	}

	/**
	* @mxunit:expectedException application
	*/ 
	public void function returnedFunctionRequiresDayArgument(){
		var f = createLocalisedDayOfWeekAsInteger(defaultLocale);
		f();
	}

	public void function returnedFunctionReturnsBoolean(){
		var f = createLocalisedDayOfWeekAsInteger(defaultLocale);
		var b = f(day="Monday");
		assert(isBoolean(b), "Value returned from returned function should be a boolean");
	}

	public void function validDayDefaultLocale(){
		var LSDayOfWeekAsInteger = createLocalisedDayOfWeekAsInteger(defaultLocale);
		for (var i=1; i <= arrayLen(daysOfWeek[defaultLocale]); i++){
			assertEquals(i, LSDayOfWeekAsInteger(daysOfWeek[defaultLocale][i]), "Unexpected value returned for #daysOfWeek[defaultLocale][i]#");
		}
	}

	/**
	* @mxunit:expectedException ArgumentOutOfRangeException
	*/ 
	public void function invalidDayDefaultLocale(){
		var LSDayOfWeekAsInteger = createLocalisedDayOfWeekAsInteger(defaultLocale);
		LSDayOfWeekAsInteger("lundi");
	}

	public void function validDayAlternateLocale(){
		var LSDayOfWeekAsInteger = createLocalisedDayOfWeekAsInteger(alternateLocale);
		for (var i=1; i <= arrayLen(daysOfWeek[alternateLocale]); i++){
			assertEquals(i, LSDayOfWeekAsInteger(daysOfWeek[alternateLocale][i]), "Unexpected value returned for #daysOfWeek[alternateLocale][i]#");
		}
	}

	/**
	* @mxunit:expectedException ArgumentOutOfRangeException
	*/ 
	public void function invalidDayAlternateLocale(){
		var LSDayOfWeekAsInteger = createLocalisedDayOfWeekAsInteger(alternateLocale);
		LSDayOfWeekAsInteger("SUNDAY");
	}

	public void function withIsoOffset(){
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