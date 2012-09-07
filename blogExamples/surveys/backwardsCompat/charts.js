window.onload = function() {
	chartDesign	= new ChartDesign();
	chartData	= new ChartData(chartDesign);
	
	new Chart("q1", new ChartDesign().standard, chartData.questions.q1, "../zingchart_trial", zingchart).render();
	new Chart("q2", new ChartDesign().longAnswers, chartData.questions.q2, "../zingchart_trial", zingchart).render();
	new Chart("q3", new ChartDesign().longAnswers, chartData.questions.q3, "../zingchart_trial", zingchart).render();
	new Chart("q4", new ChartDesign().longAnswers, chartData.questions.q4, "../zingchart_trial", zingchart).render();
	new Chart("q5", new ChartDesign().longAnswers, chartData.questions.q5, "../zingchart_trial", zingchart).render();
	new Chart("q6", new ChartDesign().longAnswers, chartData.questions.q6, "../zingchart_trial", zingchart).render();
	
	q7ChartDesign = new ChartDesign().longAnswers;
console.log(q7ChartDesign);	
	$.extend(
		true,
		q7ChartDesign,
		{
			settings	: {
				graphset	: [
					{
						legend: {
							margin: "360 5 5 5"
						}
					}
				]
			}
		}
	);
console.log(q7ChartDesign);	
	
	new Chart("q7", q7ChartDesign, chartData.questions.q7, "../zingchart_trial", zingchart).render();
	new Chart("q8", new ChartDesign().longAnswers, chartData.questions.q8, "../zingchart_trial", zingchart).render();

};