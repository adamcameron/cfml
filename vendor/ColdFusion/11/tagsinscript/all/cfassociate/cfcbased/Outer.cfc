// Outer.cfc
component {

	public boolean function onStartTag(required struct attributes, required struct caller){
		return true
	}

	public boolean function onEndTag(required struct attributes, required struct caller, required string generatedContent){
		echo(generatedContent & "<br>")
		dump(var=this.dataFromMiddle, label="(outer) dataFromMiddle")
		dump(var=this.dataFromInner, label="(outer) dataFromInner")
		return false
	}

}