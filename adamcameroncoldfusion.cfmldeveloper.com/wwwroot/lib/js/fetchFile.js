// fetchFile.js

$(document).ready(function(){
	$.getGithubFile("daccfml", "cfscript", "1c6e74c928527ae63ae02e7b203d2b23c16f4291",
		function(contents) {
			var converter = new Showdown.converter();

			$("#codeContainer").html(converter.makeHtml(contents));
		}
	)	
});