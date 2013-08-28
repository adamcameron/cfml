app.modules.test.Display = function(containerId){
	var _this = this;
	this.containerId		= containerId;
	this.$displayContainer	= $("#" + this.containerId);

	this.$displayContainer.on({
		stateChange	: this.stateChangeHandler
	});

	$.delegate(
		this.$displayContainer,
		"stageChangeDelegate",
		this.stateChangeHandler
	);

	return this;
}

app.modules.test.Controls.prototype.getId = function(){
	return this.containerId;
}

app.modules.test.Controls.prototype.getContainer = function(){
	return this.$displayContainer;
}

app.modules.test.Controls.prototype.stateChangeHandler = function(e, data){
	console.log("stateChangeHandler");
	console.log(data);
}
