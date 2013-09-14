component extends="CfmlReferencePage" {

	variables.pageName = "WSc3ff6d0ea77859461172e0811cbec17576-7ffd.html";

	public any function getTags(){
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