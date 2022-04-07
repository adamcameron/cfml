// Application.cfc

component {

	public function onRequest(){
		include arguments[1];
	}

	public function onRequestEnd(){
		var buffer = getPageContext().getOut().getString();
		getPageContext().getOut().clear();
		render(buffer);
	}



	private void function render(required string content){
		writeOutput(content);
	}

}