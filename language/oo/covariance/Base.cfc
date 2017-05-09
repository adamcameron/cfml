component Base {

	public function doThing(Base $obj) {
		writeOutput("Base: " & getMetadata(this).fullName & "<br>");
	}

}
