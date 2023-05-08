<script>
	rainbow = ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];
	rainbow.forEach(
		function(){
			console.log(arguments);
		}
	);

	rainbow.forEach(
		function(v,i,a){
			a[i] = v.toUpperCase();
		}
	);
	console.log(rainbow);
</script>
<cfscript>
	rainbow = ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];

	arrayeach(
		rainbow,
		function(){
			writeDump(arguments);
		}
	);

	arrayeach(
		rainbow,
		function(v){
			param i=0;
			rainbow[++i] = ucase(v);
		}
	);
	writeDump(rainbow);
</cfscript>