// Promise.cfc

component {

	function init(executor){
		executor(resolve);
	}

	function then(onFulfilled){
		variables.resolveHandler = onFulfilled;
	}

	private function resolve(value){
		var resolution = resolveHandler(value);
	}

}