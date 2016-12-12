var runnerUrl = "./codeRunner.cfm";
var codeElement = $("#code");
var resultElement = $("#result");

var successHandler = function(response){
	resultElement.html(response);
};

var submitHandler = function(e){
	var code = codeElement.val();
	$.post(
		runnerUrl,
		{code:code},
		successHandler
	);
};

var submitButton = $("#submitButton");
submitButton.on("click", submitHandler);
