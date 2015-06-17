<cfscript>
numbers = [1,2,3,4]
iterations = 0
numbers.each(function(v,i){
	iterations++  //unscoped
	echo("#iterations#<br>")
});
echo("<hr>")
  
iterations = 0
numbers.each(function(v,i){
	variables.iterations++  // now with scoping
	echo("#iterations#<br>")
});
</cfscript>  