component extends="CfmlReferencePage" {

	variables.pageName = variables.adobeReferences.tagListPage;

	public array function getTags(){
		var tagObjects = variables.docObject.select("##inner_content_table tr>td:first-child>p>samp.codeph>a");
		var tags = [];
		for (var tagObject in tagObjects){
			arrayAppend(tags, {
				name = tagObject.text(),
				url = tagObject.attr("href")
			});
		}
		return tags;
	}

}