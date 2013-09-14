component extends="CfmlReferencePage" {

	public TagPage function init(required string pageName){
		variables.pageName = arguments.pageName;
		return super.init();
	}

	public struct function getDocumentation(){
		return {
			tagName		= getTagName(),
			description	= getDescription(),
			category	= getCategory(),
			syntax		= getSyntax(),
			seeAlso		= getSeeAlso(),
			history		= getHistory(),
			attributes	= getAttributes(),
			usage		= getUsage(),
			example		= getExample()
		};	
	}

	public any function getTagName(){
		return  variables.docObject.select("h1").text();
	}

	public any function getDescription(){
		return getSectionText("Description");
	}

	public any function getCategory(){
		return getSectionText("Category");
	}

	public any function getSyntax(){
		return getSectionSiblingText("Syntax");
	}

	public any function getSeeAlso(){
		return getSectionSiblingText("See Also");
	}

	public any function getHistory(){
		return getSectionSiblingText("History");
	}

	public any function getAttributes(){
		var attributesSection = variables.docObject.select('h4.sectiontitle:containsOwn(Attributes)');
		if (!arrayLen(attributesSection)){
			return [];
		}
		var attributesDocumentation = [];
		for (var tagAttribute in attributesSection[1].parent().select("tbody tr")){
			arrayAppend(attributesDocumentation, getAttributeDetails(tagAttribute));
		}
		return attributesDocumentation;
	}

	private struct function getAttributeDetails(required tagAttribute){ 
		var attributeParts = tagAttribute.select("td");
		var attributeDetails = {
			attribute	= "",
			reqOrOpt	= "",
			"default"	= "",
			description	= ""
		};
		switch (min(arrayLen(attributeParts), 4)) {
			case 4 : attributeDetails.description	= attributeParts[4].text();
			case 3 : attributeDetails["default"]	= attributeParts[3].text();
			case 2 : attributeDetails.reqOrOpt		= attributeParts[2].text();
			case 1 : attributeDetails.attribute		= attributeParts[1].text();
		}
		return attributeDetails;
	}


	public any function getUsage(){
		return getSectionSiblingText("Usage");
	}


	public any function getExample(){
		return getSectionSiblingText("Example");
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