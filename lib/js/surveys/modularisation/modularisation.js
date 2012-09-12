$(document).ready(
	function(){
		$("#q1").tablesorter({sortList:[[1,1]]});
		$("#q2").tablesorter({sortList:[[1,1]]});
		$("#q3").tablesorter({sortList:[[1,1]]});
		$("#q4").tablesorter({sortList:[[1,1]]});

		pieChartDesign = new PieChartDesign();
		chartData	= new ChartData(pieChartDesign);
		
		path = "/lib/js/zingchart_trial";
		
		new Chart("q5", new PieChartDesign().longAnswers, chartData.questions.q5, path, zingchart).render();
		new Chart("q6", new PieChartDesign().longAnswers, chartData.questions.q6, path, zingchart).render();
	}
);