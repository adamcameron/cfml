window.onload = function() {
	var PieChartDesignForData = new PieChartDesign();
	var chartData	= new ChartData(PieChartDesignForData);

	var designForChart = PieChartDesign().standard;
	// tweaks from the standard
	designForChart.dimensions = {
		width	: 700,
		height	: 600
	};
	designForChart.settings.graphset[0].legend.margin = "470 5 5 150";
	
	
	var path = "../../lib/js/zingchart_trial";
	
	new Chart("q1", designForChart, chartData.questions.q1, path, zingchart).render();
};