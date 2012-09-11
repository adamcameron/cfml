window.onload = function() {
	PieChartDesign	= new PieChartDesign();
	chartData	= new ChartData(PieChartDesign);
	
	new Chart("q1", new PieChartDesign().standard, chartData.questions.q1, "../zingchart_trial", zingchart).render();
	new Chart("q2", new PieChartDesign().adjustForSeries(7).longAnswers, chartData.questions.q2, "../zingchart_trial", zingchart).render();
	new Chart("q3", new PieChartDesign().longAnswers, chartData.questions.q3, "../zingchart_trial", zingchart).render();
	new Chart("q4", new PieChartDesign().longAnswers, chartData.questions.q4, "../zingchart_trial", zingchart).render();
	new Chart("q5", new PieChartDesign().longAnswers, chartData.questions.q5, "../zingchart_trial", zingchart).render();
	new Chart("q6", new PieChartDesign().longAnswers, chartData.questions.q6, "../zingchart_trial", zingchart).render();
	
	new Chart("q7", new PieChartDesign().adjustForSeries(7).longAnswers, chartData.questions.q7, "../zingchart_trial", zingchart).render();
	new Chart("q8", new PieChartDesign().longAnswers, chartData.questions.q8, "../zingchart_trial", zingchart).render();

};