window.onload = function() {
	chartDesign = new ChartDesign();
	chartData	= new ChartData(chartDesign);
	
	new Chart("q1", new ChartDesign(), chartData.questions.q1, "../zingchart_trial", zingchart).render();
	new Chart("q2", new ChartDesign(), chartData.questions.q2, "../zingchart_trial", zingchart).render();
	new Chart("q3", new ChartDesign(), chartData.questions.q3, "../zingchart_trial", zingchart).render();
	new Chart("q4", new ChartDesign(), chartData.questions.q4, "../zingchart_trial", zingchart).render();
	new Chart("q5", new ChartDesign(), chartData.questions.q5, "../zingchart_trial", zingchart).render();
	new Chart("q6", new ChartDesign(), chartData.questions.q6, "../zingchart_trial", zingchart).render();
	new Chart("q7", new ChartDesign(), chartData.questions.q7, "../zingchart_trial", zingchart).render();
	
	var q8Design = new ChartDesign();
	q8Design.settings.graphset[0].plotarea.margin  = "0 150 100 50";
	var q8legend = q8Design.settings.graphset[0].legend;
	q8legend.margin = "350 5 5 5";
	q8legend.width = 550;
	q8Design.dimensions.height = 500;

	new Chart("q8", q8Design, chartData.questions.q8, "../zingchart_trial", zingchart).render();
	new Chart("q9", new ChartDesign(), chartData.questions.q9, "../zingchart_trial", zingchart).render();

};