<cfscript>
// anotherNumber.cfm
number1 = new AnotherNumber()
number2 = new AnotherNumber()

dump(var={
	number1 = number1.getNumber(),
	number2 = number2.getNumber()
}, label="Initial state")

number1.setNumber(42)

dump(var={
	number1 = number1.getNumber(),
	number2 = number2.getNumber()
}, label="After updating via number1")

dump(var={
	number1 = AnotherNumber::number,
}, label="Direct access")
</cfscript>