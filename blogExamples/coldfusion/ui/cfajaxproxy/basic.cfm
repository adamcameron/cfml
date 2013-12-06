<!--- basic.cfm --->
<cfajaxproxy cfc="Numbers" jsclassname="NumbersProxy">
<script>
var numbersProxy = new NumbersProxy();

var numbers;

numbersProxy.setAsyncMode();
numbersProxy.setCallbackHandler(function(){
	numbers = numbersProxy.getAll();
	console.log("Got it");
	console.log(numbers);
});
</script>