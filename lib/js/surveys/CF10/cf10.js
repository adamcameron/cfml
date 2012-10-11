$(document).ready(
	function(){
		pieChartDesign = new PieChartDesign();
		chartData	= new ChartData(pieChartDesign);
		
		path = "/lib/js/zingchart_trial";

		// hoist it up a bit as we've got a lot of options in this one
		
		PieChartDesignModified = function(){
			var pieChartDesign = new PieChartDesign();
			pieChartDesign.standard.settings.graphset[0].legend.margin = "260 5 5 380";
			
			this.standard = pieChartDesign.standard;
			
			return this;
		}
	
		new Chart("cf10ServersUk", new PieChartDesign().standard, chartData.questions.cf10ServersUk, path, zingchart).render();
		new Chart("cf10ServersUs", new PieChartDesign().standard, chartData.questions.cf10ServersUs, path, zingchart).render();
		new Chart("cf10ServersAll", new PieChartDesign().standard, chartData.questions.cf10ServersAll, path, zingchart).render();

		new Chart("versionsUk", new PieChartDesignModified().standard, chartData.questions.versionsUk, path, zingchart).render();
		new Chart("versionsUs", new PieChartDesignModified().standard, chartData.questions.versionsUs, path, zingchart).render();
		new Chart("versionsAll", new PieChartDesignModified().standard, chartData.questions.versionsAll, path, zingchart).render();
	
		new Chart("productionFarmSizeUk", new PieChartDesign().standard, chartData.questions.productionFarmSizeUk, path, zingchart).render();
		new Chart("productionFarmSizeUs", new PieChartDesign().standard, chartData.questions.productionFarmSizeUs, path, zingchart).render();
		new Chart("productionFarmSizeAll", new PieChartDesign().standard, chartData.questions.productionFarmSizeAll, path, zingchart).render();
	
		new Chart("cf10ProductionFarmSizeUk", new PieChartDesign().standard, chartData.questions.cf10ProductionFarmSizeUk, path, zingchart).render();
		new Chart("cf10ProductionFarmSizeUs", new PieChartDesign().standard, chartData.questions.cf10ProductionFarmSizeUs, path, zingchart).render();
		new Chart("cf10ProductionFarmSizeAll", new PieChartDesign().standard, chartData.questions.cf10ProductionFarmSizeAll, path, zingchart).render();
	}
);