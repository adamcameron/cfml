var CensusLib = function() {
	var apikey;
	
	function getBaseURL() {
		return "http://api.census.gov/data/2010/acs5?key="+apikey;
	}
	function setAPIKey(key) {
		apikey = key;
	}
	
	//Data translator:
	//I do a few things to the result set.
	function translate(d,valuekey) {
		var result = [];
		var i,len;
		//the 'header' is the first row
		var header = [];
		for(i=0; i<d[0].length; i++) {
			header.push(d[0][i]);
		}
		for(i=1,len=d.length; i<len; i++) {
			var item = {};
			for(var j=0;j<header.length;j++) {
				if(header[j] === valuekey) {
					item.value = Number(d[i][j]);
				} else {
					item[header[j]] = d[i][j];
				}
			}
			result.push(item);
		}
		return result;
	}
	
	function getMedianAge(cb) {
		var url = getBaseURL() + "&get=B01002_001E,NAME&for=state:*";
		$.get(url, {}, function(res,code) {
			var data = translate(res,"B01002_001E");
			cb(data);
		}, "JSON");
		
	}
	
	//Utility function that returns min/max based on census data
	function getRangeFromData(d) {
		var result = {min:Number.POSITIVE_INFINITY, max:Number.NEGATIVE_INFINITY};
		for(var i=0, len=d.length; i<len; i++) {
			if(d[i].value > result.max) result.max = d[i].value;
			if(d[i].value < result.min) result.min = d[i].value;
		}
		return result;
	}
	
	return {
		setAPI:setAPIKey,
		getMedianAge:getMedianAge,
		getRangeFromData:getRangeFromData
	};
	
}();