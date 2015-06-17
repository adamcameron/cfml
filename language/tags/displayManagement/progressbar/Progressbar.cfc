component {
	/**
	@access remote
	@output false
	**/
	struct function getStatus(){
		var st = {};
		application.counter += 0.05;
		if (application.counter <= 1){
			st.status	= application.counter;
			st.message	= 'Running&hellip;'; 
		}else{
			st.status	= 1;
			st.message	= "Completed"; 
			application.counter = 0;
		}
		
		return st;
	}
}