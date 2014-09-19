// fetchFile.js

$(document).ready(function(){
	$.getGithubFile("daccfml", "cfscript", "4f2cbc659cdea638ddbbdb9dc8ae7d5f1293ee28",
		function(contents) {
			var converter = new Showdown.converter();

			$("#codeContainer").html(converter.makeHtml(contents));
		}
	)	
});