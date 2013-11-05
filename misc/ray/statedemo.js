/* global window,Snap,$,document,console,CensusLib */
var census_key = "11d6aa32395182cc4585998fce95a1c8ddb46c2a";

// credit for state hash: https://gist.github.com/mshafrir/2646763
var states;

var snapOb;
var stateFragments = {};

$(document).ready(function() {
	
	$.get("states.json", function(res) {
		states = res;
		
		snapOb = Snap("100%", 600);
		Snap.load("Blank_US.svg", function(f) {

			for(var s in states) {
				stateFragments[s] = f.select("#"+s);
			}

			snapOb.append(f);

			start();

		});

	}, "json");
	
});

function start() {
	//initialize census API key
	CensusLib.setAPI(census_key);

	//First draft
	console.log("Ready to roll");	
	
	CensusLib.getMedianAge(function(data) {
		console.log('back from census');
		//First - figure out min/max values
		var range = CensusLib.getRangeFromData(data);
		var lowerBound = Math.floor(range.min/10)*10;
		var upperBound = Math.ceil(range.max/10)*10;
		//To Do: Handle tooltips for data
		//Begin rendering
		var diff = upperBound-lowerBound;
		console.log('wtf');
		//console.dir(stateFragments);
		for(var state in stateFragments) {
			//some states (territories) not there
			console.log("STATE "+state);
			if(stateFragments[state]) {
				//console.log("Doing "+state);
				var value = findValueInData(data, state);
				//color is from white to black with white == lowerBound, black == upperBound
				var perc = Math.round(((value-lowerBound)/diff)*100);
				//console.log(state+' val='+value+' lb='+lowerBound+' hb='+upperBound+' m='+(value-lowerBound)+' diff='+diff+'    PER='+(perc/10));
				
				stateFragments[state].animate({"fill":"000000","fill-opacity":perc/100},500);
			} else {
				console.log("Skipping "+state);	
			}
		}
		console.log('done');
	});
	
}

//Examines the array and given AL finds Alabama
function findValueInData(a,label) {
	for(var i=0, len=a.length; i<len; i++) {
		if(states[label] == a[i].NAME) return a[i].value;
	}
}