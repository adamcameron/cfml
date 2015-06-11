function initForm(form, engine, method){
	FORMNAME = form;	// GLOBAL VAR
	engineChangeHandler(engine);
	methodChangeHandler(method);
	return true;
}


function engineChangeHandler(engine){
	var oMatchSpan = document.getElementById("methodspan_Match");
	if (engine == "ColdFusion"){
		oMatchSpan.style.display = "";
	}else{	// Java & JavaScript don't differentiate between find & match
		oMatchSpan.style.display = "none";
		// and select FIND if need be
		if (getMethod() == "Match"){
			setMethod("Find");
		}
	}
	
	setOptions();
	callbackHandler("");	// blank out the previous result
	errorHandler("", "");		// ditto
	return true;
}

function methodChangeHandler(method){
	
	var oS = document.getElementById("replaceControl");

	if (method == "Replace"){
		oS.style.display = "";
	}else{
		oS.style.display = "none";
	}

	setOptions();
	
	callbackHandler("");	// blank out the previous result
	errorHandler("", "");		// ditto
	return true;
}


function getOptions(){
	var oForm	= document.getElementById(FORMNAME);
	var aOptions= new Array();
	for (var i=0; i < oForm.elements.length; i++){
		// sort out which options are set
		if (oForm.elements[i].type == "checkbox"  && oForm.elements[i].disabled == false && oForm.elements[i].checked){
			aOptions[aOptions.length] = oForm.elements[i].value;
		}
	}
	return aOptions;
}


function setOptions(){
	var sMethod = getMethod();
	var sEngine	= getEngine();
	var bI		= false;	// where FALSE will equate to the option being enabled (disabled=false)
	var bD		= false;
	var bM		= false;
	var bS		= false;
	var bU		= false;
	var bX		= false;
	var bG		= false;
	
	switch (sEngine){
		case "ColdFusion": {
			bD = true;
			bS = true;
			bU = true;
			if (sMethod == "Match"){
				bG = true;
			}	
			break;
		}
		
		case "JavaScript": {
			bD		= true;
			bS		= true;
			bU		= true;
			bX		= true;
			break;
		}
		
		case "Java":{
			// does all the options (except g, which we handle specially)
			break;
		}
	}
	
	// a bit ham-fisted.  Set 'em all
	setOption('i', bI);
	setOption('d', bD);
	setOption('m', bM);
	setOption('s', bS);
	setOption('u', bU);
	setOption('x', bX);
	setOption('g', bG);
}


function setOption(option, disabled){
	var oOption = document.getElementById("option_" + option);
	if (oOption != null){
		oOption.disabled = disabled;
	}
}


function getEngine(){
	var oForm	= document.getElementById(FORMNAME);
	var sEngine	= "";
	for (var i=0; i < oForm.elements.length; i++){
		if (oForm.elements[i].type == "radio"  && oForm.elements[i].name == "engine" && oForm.elements[i].disabled == false && oForm.elements[i].checked){
			sEngine = oForm.elements[i].value;
			break;
		}
	}
	return sEngine;
}


function getMethod(){
	var oForm	= document.getElementById(FORMNAME);
	var sMethod	= "";
	for (var i=0; i < oForm.elements.length; i++){
		if (oForm.elements[i].type == "radio"  && oForm.elements[i].name == "method" && oForm.elements[i].disabled == false && oForm.elements[i].checked){
			sMethod = oForm.elements[i].value;
			break;
		}
	}
	return sMethod;
}


function setMethod(method){
	var oForm	= document.getElementById(FORMNAME);

	for (var i=0; i < oForm.elements.length; i++){
		if (oForm.elements[i].type == "radio"  && oForm.elements[i].name == "method" && oForm.elements[i].value == method){
			oForm.elements[i].checked = true;
			break;
		}
	}
	
}


function processForm(){
	var oRegex		= document.getElementById("regex");
	var oTarget		= document.getElementById("target");
	var oReplace	= document.getElementById("replace");
	var aOptions	= getOptions();
	var sEngine		= getEngine();
	var sMethod		= getMethod();

	callbackHandler("");	// blank out the previous result
	errorHandler("", "");		// ditto

	switch (sEngine){
		case "ColdFusion": {
			var oRegexHandler = new ColdFusionRegexHandler();
			oRegexHandler.setCallbackHandler(callbackHandler);
			oRegexHandler.setErrorHandler(errorHandler);
			oRegexHandler.processRequest(oRegex.value, oTarget.value, oReplace.value, sMethod, aOptions);
			break;
		}
		case "Java": {
			var oRegexHandler = new JavaRegexHandler();
			oRegexHandler.setCallbackHandler(callbackHandler);
			oRegexHandler.setErrorHandler(errorHandler);
			oRegexHandler.processRequest(oRegex.value, oTarget.value, oReplace.value, sMethod, aOptions);
			break;
		}
		case "JavaScript": {
			var oRegexHandler = new JavaScriptRegex();
			var sResult = oRegexHandler.processRequest(oRegex.value, oTarget.value, oReplace.value, sMethod, aOptions);
			callbackHandler(sResult);
		}
	}
}


function callbackHandler(result){
	var oResultDiv = document.getElementById("resultTable");
	if (result.length > 0){
		oResultDiv.innerHTML = "Result:<br />" + result;
	}else{
		oResultDiv.innerHTML = result;
	}
	return true;
}


function errorHandler(httpCode, message){
	var oErrorDiv = document.getElementById("matchStatus");
	if (message.length > 0){
		oErrorDiv.innerHTML = '<span style="color:red;">Error: ' + message + '</span>';
	}else{
		oErrorDiv.innerHTML = message;
	}
	return false;
}
