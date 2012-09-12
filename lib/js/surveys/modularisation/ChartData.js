ChartData = function(chartDesign){
	this.questions = {
		q5 : [
			{"values" : [13], text:"This is a critical feature for ColdFusion", "background-color":chartDesign.seriesColours[3]},
			{"values" : [30], text:"This would be a useful feature for ColdFusion","background-color":chartDesign.seriesColours[4]},
			{"values" : [8], text:"It's a good feature, but there are better things for Adobe to spend its resources on than this","background-color":chartDesign.seriesColours[5]},
			{"values" : [3], text:"I'm not interested in this feature at all","background-color":chartDesign.seriesColours[6]}
		],
		q6 : [
			{"values" : [34], text:"A free version of ColdFusion is essential for it\nto remain relevant in its sector of the industry.", "background-color":chartDesign.seriesColours[7]},
			{"values" : [18], text:"It would be helpful, but not the most important thing\n Adobe could do to protect ColdFusion's place in the industry.", "background-color":chartDesign.seriesColours[8]},
			{"values" : [2], text:"I do not expect to get software of the quality of ColdFusion for free.", "background-color":chartDesign.seriesColours[9]}
		]
	};
	return this;
};