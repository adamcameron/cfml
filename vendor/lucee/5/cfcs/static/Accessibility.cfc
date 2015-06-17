// Accessibility.cfc
component {

	static {
		accessible = 17
		private inaccessible = 19
	
		function getInaccessible(){
			return Accessibility::inaccessible
		}
	}

}