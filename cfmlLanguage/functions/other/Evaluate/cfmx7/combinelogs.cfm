<cfflush interval="16">
<cfscript>
logDir = "C:\apps\adobe\ColdFusion\7\logs\";
//logDir = "C:\apps\adobe\ColdFusion\10\cfusion\logs\";
logs = directoryList(logDir,false,"array", "evaluatePerformance_*.log", "name asc");

entries = {};
for (logFile in logs){
	test		= reReplace(logFile, "^.*evaluatePerformance_([^_]+)_.*$", "\1", "one");
	variation	= reReplace(logFile, "^.*evaluatePerformance_(?:[^_]+)_([^_]+).*$", "\1", "one");
	param name="entries.#test#" default="#{}#";
	param name="entries.#test#.#variation#" default="#[]#";
	
	logFileHandler = fileOpen(logFile, "read");
	while (!fileIsEof(logFilehandler)){
		line = fileReadLine(logFileHandler);
		metric = reReplace(line, '^.*"(\d+)"$', "\1", "one");
		if (line != metric){
			arrayAppend(entries[test][variation], metric);
		}
	}
}

results = {};
for (test in entries){
	results[test] = {};
	variationHeadings = "";
	metricRows = {
		"min" = "",
		"max" = "",
		"mean" = "",
		"25%" = "",
		"median" = "",
		"75%" = ""
	};
	for (variation in entries[test]){
		variationHeadings &= "<th>#variation#</th>";
		results[test][variation] = {
			min		= arrayMin(entries[test][variation]),
			max		= arrayMax(entries[test][variation]),
			mean	= numberFormat(arrayAvg(entries[test][variation]), ".9"),
			"25%"	= getNthPercentile(entries[test][variation], 25),
			"75%"	= getNthPercentile(entries[test][variation], 75),
			median	= getNthPercentile(entries[test][variation], 50)
		};
		
		metricRows["min"] &= "<td>#results[test][variation].min#</td>";
		metricRows["max"] &= "<td>#results[test][variation].max#</td>";
		metricRows["mean"] &= "<td>#results[test][variation].mean#</td>";
		metricRows["25%"] &= "<td>#results[test][variation]["25%"]#</td>";
		metricRows["75%"] &= "<td>#results[test][variation]["75%"]#</td>";
		metricRows["median"] &= "<td>#results[test][variation].median#</td>";
		
	}
	savecontent variable="resultTable" {
		writeOutput("<h4>#test#</h4>");
		writeOutput('<table border="1">');
			writeOutput("<thead><tr><th>Stat\Test</th>#variationHeadings#</tr></thead>");
			writeOutput("<tbody>");
				writeOutput("<tr><td>Min</td>#metricRows["min"]#</tr>");
				writeOutput("<tr><td>25%</td>#metricRows["25%"]#</tr>");
				writeOutput("<tr><td>Median</td>#metricRows["median"]#</tr>");
				writeOutput("<tr><td>75%</td>#metricRows["75%"]#</tr>");
				writeOutput("<tr><td>Max</td>#metricRows["max"]#</tr>");
				writeOutput("<tr><td>Mean</td>#metricRows["mean"]#</tr>");
			writeOutput("</tbody>");
		writeOutput('</table>');
	}
	writeOutput(resultTable);
	writeOutput("<hr>");
}
writeDump(results);
	
	
public numeric function getNthPercentile(required array population, required numeric percentile){
	if (percentile < 0 || percentile > 100){
		throw(type="ArgumentOutOfRangeException", message="percentile argument value out of range", detail="The percentile argument must be in the range 1-100")
	}
	arraySort(population, "numeric");
	
	var populationSize = arrayLen(population);
	var nthPercentIndex = round((percentile/100) * populationSize + 0.5);
	
	return population[min(nthPercentIndex, populationSize)];
}	
</cfscript>