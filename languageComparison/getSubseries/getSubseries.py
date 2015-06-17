# getSubseries.py
import json
import functools


def getSubseries(series,threshold):
	working = []
	def reduceCallback(reduction, current):
		working.append(current)
		while sum(working) > threshold:
			working.pop(0)
		workingIsBetterForLength	= len(working) > len(reduction)
		workingIsBetterForTotal		= len(working) == len(reduction) and sum(working) > sum(reduction)

		return list(working) if workingIsBetterForLength or workingIsBetterForTotal else reduction
	return functools.reduce(reduceCallback, series, [])


series = [100,300,100,50,50,50,50,50,500,200,100]
threshold = 500

subseries = getSubseries(series, threshold)
print(json.dumps(subseries))

