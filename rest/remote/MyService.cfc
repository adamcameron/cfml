// MyService.cfc
component {

	public function getThing(id){
		return new Thing(id);
	}
}
