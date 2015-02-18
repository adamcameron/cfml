// Grandparent.cfc
component {

	function onEndTag(attributes, caller, generatedContent){
		writeOutput(generatedContent);
		writeDump(var=this.parentAttributesForGrandparent, label="Grandparent parentAttributesForGrandparent");
		writeDump(var=this.childAttributesForGrandparent, label="Grandparent childAttributesForGrandparent");
        return false;
    }

}