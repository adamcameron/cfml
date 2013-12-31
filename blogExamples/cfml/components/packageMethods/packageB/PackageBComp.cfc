// packageBComp.cfc
component {

	public function packageBPublicMethod(){
		writeOutput("packageB.#getFunctionCalledName()#() called<br>");
	} 

	package function packageBPackageMethod(){
		writeOutput("packageB.#getFunctionCalledName()#() called<br>");
	} 

}