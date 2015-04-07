// Conversion.cfc
component {

	public numeric function celsiusToFahrenheit(required numeric t) {
		return t / 5 * 9 + 32;
	}

}