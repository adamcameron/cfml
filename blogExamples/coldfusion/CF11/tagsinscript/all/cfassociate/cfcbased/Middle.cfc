// Middle.cfc
component {

	public void function init(required component parent){
		this.parent = parent
	}

	public boolean function onStartTag(required struct attributes, required struct caller){
		return true
	}

	public boolean function onEndTag(required struct attributes, required struct caller, required string generatedContent){
		echo(generatedContent & "<br>")
		param this.parent.dataFromMiddle = [];
		this.parent.dataFromMiddle.append({
				dataForOuter = {
				from	= "middle",
				to		= "outer",
				id		= attributes.id
			}
		})
		dump(var=this.dataFromInner, label="(middle) dataFromInner")
		return false
	}

}