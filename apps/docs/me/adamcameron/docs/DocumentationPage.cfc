component extends="CfmlReferencePage" {	// this is basically an abstract class

	variables.optionType = "";

	public DocumentationPage function init(required string pageName){
		variables.pageName = arguments.pageName;
		super.init();
		return this;
	}

	public struct function getDocumentation(){
		return {
			pageName				= getPageName(),
			description				= getDescription(),
			category				= getCategory(),
			syntax					= getSyntax(),
			seeAlso					= getSeeAlso(),
			history					= getHistory(),
			"#variables.optionType#"= getOptions(),
			usage					= getUsage(),
			example					= getExample(),
			licence					= variables.adobeReferences.licence
		};	
	}

	public string function getPageName(){
		return  variables.docObject.select("h1").text();
	}

	public string function getDescription(){
		return getSectionText("Description");
	}

	public string function getCategory(){
		return getSectionText("Category");
	}

	public string function getSyntax(){
		return getSectionSiblingText("Syntax");
	}

	public string function getSeeAlso(){
		return getSectionSiblingText("See Also");
	}

	public string function getHistory(){
		return getSectionSiblingText("History");
	}

	public string function getUsage(){
		return getSectionSiblingText("Usage");
	}

	public string function getExample(){
		return getSectionSiblingText("Example");
	}

	public array function getOptions(){
		var optionsSection = variables.docObject.select('h4.sectiontitle:containsOwn(#variables.optionType#s)');
		if (!arrayLen(optionsSection)){
			return [];
		}
		var optionsDocumentation = [];
		for (var tagOption in optionsSection[1].parent().select("tbody tr")){
			arrayAppend(optionsDocumentation, getOptionDetails(tagOption));
		}
		return optionsDocumentation;
	}

	private struct function getOptionDetails(required tagOption){ 
		return {};	// needs to be implemented by subclass
	}

	private string function getSectionText(required string sectionTitle){
		var sectionText = variables.docObject.select('h4.sectiontitle:contains(#sectionTitle#)+p');
		if (arrayLen(sectionText)){
			return sectionText[1].text();
		}else{
			return "";
		}
	}

	private string function getSectionSiblingText(required string sectionTitle){
		var text = "";
		var section = variables.docObject.select('h4.sectiontitle:containsOwn(#sectionTitle#)');

		if (arrayLen(section)){
			for (elem in section[1].siblingElements()){
				text &= (elem.html() & "<br>");
			}
		}
		return text;
	}

}