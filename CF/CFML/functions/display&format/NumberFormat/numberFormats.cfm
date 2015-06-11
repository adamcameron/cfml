<cfscript>
	n = 1.625 * 1;
	writeOutput("dollarFormat(#n#): #dollarFormat(n)#<br />");
	writeOutput("LSCurrencyFormat(#n#): #LSCurrencyFormat(n)#<br />");
	writeOutput("decimalFormat(#n#): #decimalFormat(n)#<br />");
	writeOutput("numberFormat(#n#, '0.99'): #numberFormat(n, '0.99')#<br />");
	writeOutput("<hr />");
	n = 1.635 * 1;
	writeOutput("dollarFormat(#n#): #dollarFormat(n)#<br />");
	writeOutput("LSCurrencyFormat(#n#): #LSCurrencyFormat(n)#<br />");
	writeOutput("decimalFormat(#n#): #decimalFormat(n)#<br />");
	writeOutput("numberFormat(#n#, '0.99'): #numberFormat(n, '0.99')#<br />");
	writeOutput("<hr />");
	writeOutput("dollarFormat(form.num1: #form.num1#): #dollarFormat(form.num1)#<br />");
	writeOutput("LSCurrencyFormat(form.num1: #form.num1#): #LSCurrencyFormat(form.num1)#<br />");
	writeOutput("decimalFormat(form.num1: #form.num1#): #decimalFormat(form.num1)#<br />");
	writeOutput("numberFormat(form.num1: #form.num1#, '0.99'): #numberFormat(form.num1, '0.99')#<br />");
	writeOutput("<hr />");
	writeOutput("dollarFormat(form.num2: #form.num2#): #dollarFormat(form.num2)#<br />");
	writeOutput("LSCurrencyFormat(form.num2: #form.num2#): #LSCurrencyFormat(form.num2)#<br />");
	writeOutput("decimalFormat(form.num2: #form.num2#): #decimalFormat(form.num2)#<br />");
	writeOutput("numberFormat(form.num2: #form.num2#, '0.99'): #numberFormat(form.num2, '0.99')#<br />");
	writeOutput("<hr />");
</cfscript>