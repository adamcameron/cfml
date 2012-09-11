window.onload = function() {
	PieChartDesignForData = new PieChartDesign();
	chartData	= new ChartData(PieChartDesignForData);
	
	path = "../../lib/js/zingchart_trial";
	
	new Chart("q1", new PieChartDesign().standard, chartData.questions.q1, path, zingchart).render();
	new Chart("q2", new PieChartDesign().standard, chartData.questions.q2, path, zingchart).render();
	new Chart("q3", new PieChartDesign().standard, chartData.questions.q3, path, zingchart).render();
	new Chart("q4", new PieChartDesign().standard, chartData.questions.q4, path, zingchart).render();
	new Chart("q5", new PieChartDesign().standard, chartData.questions.q5, path, zingchart).render();
	new Chart("q6", new PieChartDesign().standard, chartData.questions.q6, path, zingchart).render();
	new Chart("q7", new PieChartDesign().standard, chartData.questions.q7, path, zingchart).render();
	new Chart("q8", new PieChartDesign().longAnswers, chartData.questions.q8, path, zingchart).render();
	new Chart("q9", new PieChartDesign().standard, chartData.questions.q9, path, zingchart).render();

};