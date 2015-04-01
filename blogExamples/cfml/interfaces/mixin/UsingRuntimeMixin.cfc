// UsingRuntimeMixin.cfc

component implements="I" {

	function init(required string mixinFile){
		include mixinFile;
	}
}