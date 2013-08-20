component {

	public void function onError(){
		writeDump(arguments);
		abort;
	}
}