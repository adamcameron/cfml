// packageAComp.cfc
component {

	public function packageAPublicMethod(){
		writeOutput("packageA.#getFunctionCalledName()#() called<br>");
	} 

	package function packageAPackageMethod(){
		writeOutput("packageA.#getFunctionCalledName()#() called<br>");
	} 

}