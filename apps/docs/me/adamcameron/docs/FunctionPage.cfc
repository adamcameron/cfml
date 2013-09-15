component extends="DocumentationPage" {

	variables.optionType = "Parameter";

	private struct function getOptionDetails(required tagOption){ 
		var optionParts = tagOption.select("td");
		var optionDetails = {
			"#variables.optionType#"		= "",
			description	= ""
		};
		switch (min(arrayLen(optionParts), 2)) {
			case 2 : optionDetails.description				= optionParts[2].text();
			case 1 : optionDetails["#variables.optionType#"]= optionParts[1].text();
		}
		return optionDetails;
	}

}