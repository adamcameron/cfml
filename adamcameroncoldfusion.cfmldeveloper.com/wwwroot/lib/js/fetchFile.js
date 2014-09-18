// fetchFile.js

$(document).ready(function(){
	$.getGithubFile("daccfml", "scratch", "32d9407d39126757ddb64c6462f1d87579f629d1",
		function(contents) {
			var converter = new Showdown.converter();

			$("#codeContainer").html(converter.makeHtml(contents));
		}
	)	
});