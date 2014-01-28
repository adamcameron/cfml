ChartDesign = function(){
	
	this.seriesColours = [
		"#B4A500",
		"#421E52",
		"#4C5A7F",
		"#741740",
		"#B89F33",
		"#E56000",
		"#95001F",
		"#43A200",
		"#CA0000",
		"#4A6744",
		"#9A78C5",
		"#A9DB00",
		"#FFCE0A",
		"#B4C0CB"
	];

	this.dimensions	= {
		height	: 400,
		width	: 600
	};


	this.standard = {
		seriesColours : this.seriesColours,
		dimensions : this.dimensions,
		settings : {
			"graphset": [{
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
			}]
		}
	};

	this.longAnswers	= {};
	$.extend(true, this.longAnswers, this.standard);

	$.extend(
		true,
		this.longAnswers,
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