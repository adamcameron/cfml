$(document).ready(function(){

	var doChartForVersion = function(version, element){
		$.getJSON(
			"/data/bugTriageData.js",
			function(data){
				var labels = [];
				var values = [];
				var min = 0;
				var max = 0;
				data[version].forEach(function(v){
					labels.push(v.date);
					values.push(v.count);
					if (v.count > max) {
						max = v.count;
					}
					if (min == 0 || v.count < min) {
						min = v.count;
					}
					console.log({count:v.count,min:min,max:max});
				});
				zingchart.render(configureChartParams({values:values,labels:labels}, {min:min,max:max}, element));	
			}
		);

	};
	var configureChartParams = function(data, thresholds, element){
		return {
			id		: element,
			height	: 400,
			width	: 600,
			data	: myChart = {
				type	: "bar",
				series	: [
					{
						"values"	: data.values
					}
				],
				"scale-x"   : {
                    values	: data.labels
                },
                "scale-y"	: {
                	"min-value"	: thresholds.min,
                	"max-value"	: thresholds.max
                }
			}
		};	
	}

	doChartForVersion("9.x", "cf9chart");
	doChartForVersion("10", "cf10chart");
	doChartForVersion("11", "cf11chart");

});