<script>
	function f(){
		try {
			return "try";
		}
		catch (e){
			return "catch";
		}
		finally {
			return "finally";	
		}
		return "bottom";
	}
	
	console.log(f());
</script>