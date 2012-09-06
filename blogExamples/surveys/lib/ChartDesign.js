ChartDesign = function(){
	this.settings = {
		"graphset" : [
			{
				"type": "pie",
				"background-color": "#ffffff",
				"legend": {
					"layout": "vertical",
					"margin": "270 5 5 380",
					"width": "75px",
					"shadow": false,
					"background-color": "#ffffff",
					"border-width": "0px",
					"item": {
						"border-width": "0px"
					}
				},
				"tooltip": {
					"visible": true,
					"border-width": "0px"
				},
				"plotarea": {
					margin: "0 200 0 0"
				},
				"plot": {
					"background-color": "#ffffff",
					"alpha": 1,
					"border-width": "1px",
					"offset": 2,
					"tooltip-text": "%v",
					"detach": true,
					"value-box": {
						"font-color": "#000000",
						"text": "%npv%",
						"placement": "out",
						"connected": false,
						"offset-r": "-20px"
					}
				}
			}
		]
	};
	
	this.seriesColours = [
		"#8a56e2",
		"#cf56e2",
		"#e256ae",
		"#e25668",
		"#e28956",
		"#e2cf56",
		"#aee256",
		"#68e256",
		"#56e289",
		"#56e2cf",
		"#56aee2",
		"#5668e2"
	];

	this.dimensions	= {
		height	: 400,
		width	: 600
	};
	
	return this;
};