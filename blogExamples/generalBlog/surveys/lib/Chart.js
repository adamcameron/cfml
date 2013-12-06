Chart = function(target, design, data, libPath, zingChart){
	this.target		= target;
	this.design		= design;
	this.data		= data;
	this.libPath	= libPath;
	this.zingChart	= zingChart;
	
	return this;
};

Chart.prototype.render = function(){
	// combine design & data for render()
	var chartSettings = this.design.settings;
	chartSettings.graphset[0].series = this.data;

	this.zingChart.render(
		{
			id		: this.target,
			output	: "canvas",
			width	: this.design.dimensions.width,
			height	: this.design.dimensions.height,
			data	: chartSettings,
			liburl	: this.libPath + "/flash_scripts/zingchart.swf" // in case Flash Library is used
		}
	);
};