series = [100, 300, 100, 50, 50, 50, 50, 50, 500, 200, 100]
threshold = 500

def subSeries(series,threshold):
	currentTotal = 0
	counter = 0
	tempSeries = []
	longestSeries = []
	while len(series) > 1:
		currentTotal += series[counter]
		if currentTotal > threshold:
			if len(tempSeries) > len(longestSeries):
				longestSeries = tempSeries
			series.pop(0)
			tempSeries = []
			counter = 0
			currentTotal = 0
		else:
			tempSeries.append(series[counter])
			counter += 1
		if counter >= len(series):
			break
	return longestSeries

result = subSeries(series,threshold)
print(result)