(function(){
	var _cfsummit_utils = function()
	{
		//Use this function to get values from CF query object in JavaScript
		//Row number starts from 1
		this.get_query_column_value = function (queryObj, rowNum, colName)
		{
			var defaulValue = "";
			
			if (typeof queryObj.__QUERY__ == 'undefined')
				return defaulValue;
			
			rowNum--;
			if (rowNum >= queryObj.length)
				return defaulValue;
				
			var row = queryObj.DATA[rowNum];
			
			var index = queryObj.COLUMNS.indexOf(colName);
			
			if (index < 0)
				return defaulValue;
				
			
			return row[index];
		}
	
		//time is expected in 24 hrs format with hh:mm:ss
		this.format_time = function (time_str)
		{
			
			if (time_str == null)
				return "";
			var tmpArray = time_str.split(":");
			
			if (tmpArray.length < 2)
				return time_str;
			var hr = Number(tmpArray[0]);
			var mnt = tmpArray[1];
			var ampm = "AM";
			if (hr > 12)
			{
				hr -= 12;
				ampm = "PM";
			} else if (hr == 12)
				ampm = "PM";
			
			return hr + ":" + mnt + " " + ampm
		}
	
		this.add_animation = function (class_name)
		{
		}
	}
	
	window.cfsummit_utils = new _cfsummit_utils();
})();

