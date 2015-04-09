// A.cfc

component {

	public this.publicVar = "the outside world can see this"
	private this.privateVar = "the outside world cannot see this"
	package this.packageVar = "other components in this package can see this"

}