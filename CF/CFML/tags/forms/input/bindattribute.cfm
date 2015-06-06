<style>
	.red {
		background-color	: red;
	}
	.green {
		background-color	: green;
	}
	.blue {
		background-color	: blue;
	}
</style>

<script>
	function changeIt(){
		var oInp1 = document.getElementById("inp1");
		var oInp2 = document.getElementById("inp2");
		
		//oInp2.setAttribute("class", oInp1.value); 
		oInp2.className = oInp1.value;
	}
</script>
<cfform method="post" action="#CGI.script_name#" format="html">

Class: <cfinput type="text" name="inp1" value="" /><br />
Sample: <cfinput type="text" name="inp2" bind="{inp1}" bindattribute="className" class="green" />
Manually: <input type="button" name="btn1" value="Click Me" onclick="changeIt()" />
</cfform>