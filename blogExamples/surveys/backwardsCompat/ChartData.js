ChartData = function(chartDesign){
	this.questions = {
		q1 : [
			{"values" : [70], text:"Yes", "background-color":chartDesign.seriesColours[0]},
			{"values" : [1], text:"No","background-color":chartDesign.seriesColours[1]}
		],
		q2 : [
			{"values" : [26], text:"CF5 or earlier to CFMX6.x", "background-color":chartDesign.seriesColours[2]},
			{"values" : [20], text:"CF5 or earlier to CFMX7.x or later", "background-color":chartDesign.seriesColours[3]},
			{"values" : [33], text:"CFMX6.x to CFMX7.x", "background-color":chartDesign.seriesColours[4]},
			{"values" : [19], text:"CFMX6.x to CF8.x or later in a single upgrade", "background-color":chartDesign.seriesColours[5]},
			{"values" : [58], text:"CFMX7.x (or later) to the next version up (eg: 7->8 or 8->9, but not 7->10)", "background-color":chartDesign.seriesColours[6]},
			{"values" : [28], text:"CFMX7.x (or later) across more than one version in a single upgrade (eg: 7->9, 8->10, but not 8->9)", "background-color":chartDesign.seriesColours[7]},
			{"values" : [2], text:"ColdFusion to Railo","background-color":chartDesign.seriesColours[8]}
		],
		q3 : [
			{"values" : [11], text:"I like to be on the latest version", "background-color":chartDesign.seriesColours[9]},
			{"values" : [2], text:"To ensure I am running a \"still supported\" version of ColdFusion", "background-color":chartDesign.seriesColours[10]},
			{"values" : [57], text:"To take advantage of new features & bugfixes", "background-color":chartDesign.seriesColours[11]},
			{"values" : [1], text:"I do not tend to upgrade ColdFusion if my current version runs my applications OK", "background-color":chartDesign.seriesColours[12]}
		],
		q4 : [
			{"values" : [5], text:"No rework needed at all", "background-color":chartDesign.seriesColours[13]},
			{"values" : [50], text:"A small amount of rework needed", "background-color":chartDesign.seriesColours[0]},
			{"values" : [16], text:"A reasonable but acceptable amount of rework needed", "background-color":chartDesign.seriesColours[1]},
			{"values" : [0], text:"An unacceptable amount of rework needed (whatever that amount might be)", "background-color":chartDesign.seriesColours[2]}
		],
		q5 : [
			{"values" : [17], text:"function(object, args) (eg: arrayAppend(myArray, newElement))", "background-color":chartDesign.seriesColours[3]},
			{"values" : [54], text:"object.method(args) (eg: myArray.append(newElement))","background-color":chartDesign.seriesColours[4]}
		],
		q6 : [
			{"values" : [3], text:"It is removed", "background-color":chartDesign.seriesColours[5]},
			{"values" : [65], text:"It is simply stated that it is no longer the preferred way of doing something,\nbut otherwise will continue to be operational, but at some stage in the future it might be removed", "background-color":chartDesign.seriesColours[6]},
			{"values" : [3], text:"Currently present, but will be removed within the next 1-2 releases", "background-color":chartDesign.seriesColours[7]}
		],
		q7 : [
			{"values" : [9], text:"General ambivalence", "background-color":chartDesign.seriesColours[8]},
			{"values" : [6], text:"I actively would not want this to happen", "background-color":chartDesign.seriesColours[9]},
			{"values" : [4], text:"There are better things to be spending time on in the context of CFML than \"modernising\" it", "background-color":chartDesign.seriesColours[10]},
			{"values" : [11], text:"Modernising the language is a good idea, but this is not what I'd target", "background-color":chartDesign.seriesColours[11]},
			{"values" : [28], text:"It's a good idea", "background-color":chartDesign.seriesColours[12]},
			{"values" : [13], text:"It's a great idea", "background-color":chartDesign.seriesColours[13]}
		],
		q8 : [
			{"values" : [7], text:"The policy is correct", "background-color":chartDesign.seriesColours[0]},
			{"values" : [26], text:"The policy is reasonable, but perhaps not as important as Adobe seem to consider it", "background-color":chartDesign.seriesColours[1]},
			{"values" : [36], text:"The policy has caused stagnation in the language", "background-color":chartDesign.seriesColours[2]},
			{"values" : [2], text:"No opinion, or neutral", "background-color":chartDesign.seriesColours[3]}
		],
	};
	return this;
};