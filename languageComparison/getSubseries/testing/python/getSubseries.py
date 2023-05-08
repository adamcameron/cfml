# getSubseries.py

def getSubseries(series,threshold):
	import functools
	working = []
	def reduceCallback(reduction, current):
		working.append(current)
		while sum(working) > threshold:
			working.pop(0)

		workingIsBetterForLength= len(working) > len(reduction)
		workingIsBetterForTotal	= len(working) == len(reduction) and sum(working) > sum(reduction)

		return list(working) if workingIsBetterForLength or workingIsBetterForTotal else reduction

	return functools.reduce(reduceCallback, series, [])
