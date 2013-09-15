component extends="DocumentationPage" {

	variables.optionType = "Attribute";

	private struct function getOptionDetails(required tagOption){ 
		var optionParts = tagOption.select("td");
		var optionDetails = {
			"#variables.optionType#"= "",
			reqOrOpt				= "",
			"default"				= "",
			description				= ""
		};
		switch (min(arrayLen(optionParts), 4)) {
			case 4 : optionDetails.description				= optionParts[4].text();
			case 3 : optionDetails["default"]				= optionParts[3].text();
			case 2 : optionDetails.reqOrOpt					= optionParts[2].text();
			case 1 : optionDetails["#variables.optionType#"]= optionParts[1].text();
		}
		return optionDetails;
	}

}