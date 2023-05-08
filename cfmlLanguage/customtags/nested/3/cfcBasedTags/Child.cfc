// Child.cfc
component {

	function init(hasEndTag, parent){
		this.parent = arguments.parent;
	}

	function onEndTag(attributes, caller, generatedContent){
		writeOutput(generatedContent);
		this.parent.childattributesForParent = attributes;
		this.parent.parent.childattributesForGrandparent = attributes;
		return false;
	}

}