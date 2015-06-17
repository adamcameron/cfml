component {

	public void function topFunction(){
		writeOutput("topFunction()<br />");
		createObject("component", "Adjacent").adjacentPackageFunction();
		createObject("component", "subdir.Inner").innerPackageFunction();
	}

}