ChartData = function(chartDesign){
	this.questions = {
		cf10ServersUk : [
			{"values" : [2], text:"Production", "background-color":chartDesign.seriesColours[0]},
			{"values" : [3], text:"Pre-production", "background-color":chartDesign.seriesColours[3]},
			{"values" : [8], text:"Experimentation", "background-color":chartDesign.seriesColours[6]}
		],
		cf10ServersUs : [
			{"values" : [4], text:"Production", "background-color":chartDesign.seriesColours[0]},
			{"values" : [8], text:"Pre-production", "background-color":chartDesign.seriesColours[3]},
			{"values" : [9], text:"Experimentation", "background-color":chartDesign.seriesColours[6]}
		],
		cf10ServersAll : [
			{"values" : [9], text:"Production", "background-color":chartDesign.seriesColours[0]},
			{"values" : [17], text:"Pre-production", "background-color":chartDesign.seriesColours[3]},
			{"values" : [25], text:"Experimentation", "background-color":chartDesign.seriesColours[6]}
		],
		versionsUk : [
			{"values" : [11], text:"CF9", "background-color":chartDesign.seriesColours[0]},
			{"values" : [2], text:"CF8", "background-color":chartDesign.seriesColours[7]},
			{"values" : [2], text:"CFMX6-7", "background-color":chartDesign.seriesColours[2]},
			{"values" : [0], text:"CF5 or earlier", "background-color":chartDesign.seriesColours[3]},
			{"values" : [3], text:"Railo", "background-color":chartDesign.seriesColours[4]},
			{"values" : [1], text:"OpenBD", "background-color":chartDesign.seriesColours[5]}
		],
		versionsUs : [
			{"values" : [15], text:"CF9", "background-color":chartDesign.seriesColours[0]},
			{"values" : [4], text:"CF8", "background-color":chartDesign.seriesColours[7]},
			{"values" : [2], text:"CFMX6-7", "background-color":chartDesign.seriesColours[2]},
			{"values" : [0], text:"CF5 or earlier", "background-color":chartDesign.seriesColours[3]},
			{"values" : [0], text:"Railo", "background-color":chartDesign.seriesColours[4]},
			{"values" : [0], text:"OpenBD", "background-color":chartDesign.seriesColours[5]}
		],
		versionsAll : [
			{"values" : [35.5], text:"CF9", "background-color":chartDesign.seriesColours[0]},
			{"values" : [6], text:"CF8", "background-color":chartDesign.seriesColours[7]},
			{"values" : [2], text:"CFMX6-7", "background-color":chartDesign.seriesColours[2]},
			{"values" : [0], text:"CF5 or earlier", "background-color":chartDesign.seriesColours[3]},
			{"values" : [4.5], text:"Railo", "background-color":chartDesign.seriesColours[4]},
			{"values" : [1], text:"OpenBD", "background-color":chartDesign.seriesColours[5]}
		],
		productionFarmSizeUk : [
			{"values" : [6], text:"Single server", "background-color":chartDesign.seriesColours[6]},
			{"values" : [7], text:"2-5 servers", "background-color":chartDesign.seriesColours[1]},
			{"values" : [6], text:"6-10 servers", "background-color":chartDesign.seriesColours[8]},
			{"values" : [2], text:"11-20 servers", "background-color":chartDesign.seriesColours[9]},
			{"values" : [0], text:"20+ servers", "background-color":chartDesign.seriesColours[10]}
		],
		productionFarmSizeUs : [
			{"values" : [7], text:"Single server", "background-color":chartDesign.seriesColours[6]},
			{"values" : [10], text:"2-5 servers", "background-color":chartDesign.seriesColours[1]},
			{"values" : [3], text:"6-10 servers", "background-color":chartDesign.seriesColours[8]},
			{"values" : [1], text:"11-20 servers", "background-color":chartDesign.seriesColours[9]},
			{"values" : [1], text:"20+ servers", "background-color":chartDesign.seriesColours[10]}
		],
		productionFarmSizeAll : [
			{"values" : [14], text:"Single server", "background-color":chartDesign.seriesColours[6]},
			{"values" : [26], text:"2-5 servers", "background-color":chartDesign.seriesColours[1]},
			{"values" : [11], text:"6-10 servers", "background-color":chartDesign.seriesColours[8]},
			{"values" : [3], text:"11-20 servers", "background-color":chartDesign.seriesColours[9]},
			{"values" : [1], text:"20+ servers", "background-color":chartDesign.seriesColours[10]}
		],
		cf10ProductionFarmSizeUk : [
			{"values" : [2], text:"Single server", "background-color":chartDesign.seriesColours[11]},
			{"values" : [0], text:"2-5 servers", "background-color":chartDesign.seriesColours[2]},
			{"values" : [0], text:"6-10 servers", "background-color":chartDesign.seriesColours[5]}
		],
		cf10ProductionFarmSizeUs : [
			{"values" : [2], text:"Single server", "background-color":chartDesign.seriesColours[11]},
			{"values" : [1], text:"2-5 servers", "background-color":chartDesign.seriesColours[2]},
			{"values" : [1], text:"6-10 servers", "background-color":chartDesign.seriesColours[5]}
		],
		cf10ProductionFarmSizeAll : [
			{"values" : [4], text:"Single server", "background-color":chartDesign.seriesColours[11]},
			{"values" : [4], text:"2-5 servers", "background-color":chartDesign.seriesColours[2]},
			{"values" : [1], text:"6-10 servers", "background-color":chartDesign.seriesColours[5]}
		]
	};
	return this;
};