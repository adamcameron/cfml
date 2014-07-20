<cfscript>
// case.cfm
include "../udfs/case.cfm"

digit = URL.number mod 10;

result = case()
	.when(function(){
		return "0,4,5,6,7,8,9".listFind(digit) && true
	}).then(function(){
		return URL.number & "th"
	})

	.when(function(){
		 return digit == 1
	}).then(function(){
		return URL.number & "st"
	})

	.when(function(){
		 return digit == 2
	}).then(function(){
		return URL.number & "nd"
	})

	.else(function(){
		return URL.number & "rd"
}).end()

writeOutput("#URL.number#: #result#")
</cfscript>