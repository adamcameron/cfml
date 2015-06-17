<cfscript>
// conversion.cfm

boiling.celsius = 100
boiling.fahrenheit = Conversion::celsiusToFahrenheit(boiling.celsius)

dump(boiling)
</cfscript>