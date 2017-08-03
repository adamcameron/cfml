component Sub extends="Base" {

	public function doThing(Base obj) {
		writeOutput("Sub: " & getMetadata(obj).fullName & "<br>");
	}

}
