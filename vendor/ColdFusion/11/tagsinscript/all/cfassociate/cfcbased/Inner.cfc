// Inner.cfc
component {

	public void function init(required component parent){
		this.parent = parent
	}

	public boolean function onStartTag(required struct attributes, required struct caller){
		return true
	}

	public boolean function onEndTag(required struct attributes, required struct caller, required string generatedContent){
		echo(generatedContent & "<br>")
		param this.parent.parent.dataFromInner = [];
		this.parent.parent.dataFromInner.append({
				dataForOuter = {
				from	= "inner",
				to		= "outer",
				id		= attributes.id
			}
		})

		param this.parent.dataFromInner = [];
		this.parent.dataFromInner.append({
				dataForMiddle = {
				from	= "inner",
				to		= "middle",
				id		= attributes.id
			}
		})

		return false
	}

}