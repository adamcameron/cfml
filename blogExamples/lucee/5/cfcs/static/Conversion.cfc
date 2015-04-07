// Conversion.cfc
component {

	public static function celsiusToFahrenheit(required numeric t) {
		return t / 5 * 9 + 32;
	}

}