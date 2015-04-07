<cfscript>
// conversion.cfm
conversion = new Conversion();

boiling.celsius = 100
boiling.fahrenheit = conversion.celsiusToFahrenheit(boiling.celsius)

dump(boiling)
</cfscript>