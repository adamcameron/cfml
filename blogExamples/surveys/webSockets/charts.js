window.onload = function() {
	pieChartDesignForData	= new PieChartDesign();
	chartData	= new ChartData(pieChartDesignForData);
	
	new Chart("q1", new PieChartDesign().longAnswers, chartData.questions.q1, "../zingchart_trial", zingchart).render();

};