$(document).ready(function() {

	var name = document.URL.split("?")[1].replace("name=", "");
	
	$.getJSON("./data.cfm?name=" + name, function(res) {

		var statusStats = {};

		var data = res.QUERY;
		var cols = {};
		for(var i=0;i<data.COLUMNS.length;i++) {
			cols[data.COLUMNS[i]] = i;
		}
		for(var i=0; i<data.DATA.length; i++) {
			var status = data.DATA[i][cols["AD_S_STATUS"]];
			if(statusStats[status]) {
				statusStats[status]++;
			} else {
				statusStats[status]=1;	
			}
		}
		var data = [];
		for(key in statusStats) {
			data.push([key, statusStats[key]]);
		}

		$('#container').highcharts({
				chart: {
					plotBackgroundColor: null,
					plotBorderWidth: null,
					plotShadow: false
				},
				title: {
					text:  "Bugs raised by " + decodeURIComponent(name) + " - By Status"
				},
				tooltip: {
					pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
				},
				plotOptions: {
					pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						dataLabels: {
							enabled: true,
							color: '#000000',
							connectorColor: '#000000',
							format: '<b>{point.name}</b>: {point.percentage:.1f} %'
						}
					}
				},
				series: [{
					type: 'pie',
					name: 'Bug Status',
					data: data
				}]
			});
			$("#bugCount").text("Total number of bugs raised: " + res.QUERY.DATA.length);	
	});
});