// Conversion.cfc
component {

	static public numeric function celsiusToFahrenheit(required numeric t) {
		return t / 5 * 9 + 32;
	}

}