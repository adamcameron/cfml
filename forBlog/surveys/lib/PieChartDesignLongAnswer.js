ChartDesignLongAnswer = function(){
	
	this.settings = new PieChartDesign();
	$.extend(
		true,
		this.settings,
		{
			settings	: {
				graphset	: [
					{
						plotarea	: {
							margin	: "0 150 100 50"
						},
						legend		: {
							margin	: "380 5 5 5",
							width	: 550
							
						}
						
					}
				]
			},
			dimensions	: {
				height	: 500
			}			
		}
	);
	
	return this;
};