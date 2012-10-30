$(document).ready(
	function(){
		pieChartDesign = new PieChartDesign();
		chartData	= new ChartData(pieChartDesign);
		
		path = "/lib/js/zingchart_trial";

		PieChartDesignModified = function(){
			var pieChartDesign = new PieChartDesign();
			pieChartDesign.standard.settings.graphset[0].legend.margin = "180 5 5 380";
			
			this.standard = pieChartDesign.standard;
			
			return this;
		}

		new Chart("ide", new PieChartDesignModified().standard, chartData.questions.ide, path, zingchart).render();
	}
);