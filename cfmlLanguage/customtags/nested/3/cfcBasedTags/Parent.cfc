// Parent.cfc
component {

	function init(hasEndTag, parent){
		this.parent = arguments.parent;
	}

	function onEndTag(attributes, caller, generatedContent){
		writeOutput(generatedContent);
		this.parent.parentattributesForGrandparent = attributes;
		writeDump(var=this.childAttributesForParent, label="Parent childAttributesForParent");
        return false;
    }

}