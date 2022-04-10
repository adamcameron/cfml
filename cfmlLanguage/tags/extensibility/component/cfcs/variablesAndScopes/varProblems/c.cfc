<cfcomponent>
	<cfscript>
		function f1(){
			for (i=1; i <= 10; i++){
				writeOutput("f1(): #i#<br />");
				f2();
			}
		}

		function f2(){
			for (i=1; i <= 10; i++){
				writeOutput("&nbsp;&nbsp;&nbsp;&nbsp;f2(): #i#<br />");
			}
		}
	</cfscript>
</cfcomponent>