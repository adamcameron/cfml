app.modules.test.Controls = function(controlsContainerId, displayContainerId){
	var _this = this;
	this.controlsContainerId	= controlsContainerId;
	this.$controlsContainer		= $("#" + this.controlsContainerId);
	this.$checkboxes			= $("input[type='checkbox']", this.$controlsContainer);

	this.displayContainerId		= displayContainerId;
	this.$displayContainer		= $("#" + this.displayContainerId);
	this.$checkboxes.each(
		function(k,v){
			$(v).change(
				function(e){
					var data = {
						id		: e.target.id,
						state	: e.target.checked,
						value	: e.target.value,
						e		: e
					}
					_this.$displayContainer.trigger("stateChangeDelegate", data);
				}
			);
		}
	);

	return this;
}

app.modules.test.Controls.prototype.getId = function(){
	return this.controlsContainerId;
}

app.modules.test.Controls.prototype.getContainer = function(){
	return this.$controlsContainer;
}

app.modules.test.Controls.prototype.getCheckboxes = function(){
	return this.$checkboxes;
}
