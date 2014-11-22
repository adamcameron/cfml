# tests.py

def getTests():
	return [{
		'series':[100,300,100,50,50,50,50,50,500,200,100],
		'threshold':500,
		'expected':[100,50,50,50,50,50],
		'message':"Should return an array",
		'test': lambda subseries, threshold: sum(subseries) < threshold
	},{
		'series':[600,100,100,100,600],
		'threshold':500,
		'expected':[100,100,100],
		'message':"A multi-element series should have been found",
		'test': lambda subseries, threshold: len(subseries) > 1
	},{
		'series':[600,100,100,100,600,100,100,100,100,600],
		'threshold':500,
		'expected':[100,100,100,100],
		'message':"A subsequent larger multi-element series should have been found"
	},{
		'series':[600,100,100,100,600,200,100,100,100,100,100,600],
		'threshold':500,
		'expected':[100,100,100,100,100],
		'message':"A longer adjacent subseries should be found"
	},{
		'series':[],
		'threshold':500,
		'expected':[],
		'message':"Should work with an empty series"
	},{
		'series':[600,700,800,900],
		'threshold':500,
		'expected':[],
		'message':"Should work when threshold is lower than all items"
	},{
		'series':[50,60,70,80,90],
		'threshold':100,
		'expected':[90],
		'message':"Should work when threshold is higher than every item"
	},{
		'series':[50,60,70,80,90],
		'threshold':400,
		'expected':[50,60,70,80,90],
		'message':"Should work when threshold is higher than total of all items"
	},{
		'series':[100,100,100,100,100,100,600,150,150,150,150],
		'threshold':600,
		'expected':[100,100,100,100,100,100],
		'message':"Should work when the subseries is equal to the threshold and is at the beginning of the series"
	},{
		'series':[600,150,150,150,150,100,100,100,100,100,100],
		'threshold':600,
		'expected':[100,100,100,100,100,100],
		'message':"works when the subseries is equal to the threshold and at the end of the series"
	},{
		'series':[100,200,300,400],
		'threshold':100,
		'expected':[100],
		'message':"Should work when the subseries is the first element"
	},{
		'series':[400,300,200,100],
		'threshold':100,
		'expected':[100],
		'message':"Should work when the subseries is the last element"
	},{
		'series':[100,300,100,50,50,50,50,50,500,200,100],
		'threshold':500,
		'expected':[100,50,50,50,50,50],
		'message':"Should work as per quiz requirements"
	},{
		'series':[100,50,50,50,50,50,500,100,60,60,60,60,60,500],
		'threshold':500,
		'expected':[100,60,60,60,60,60],
		'message':"Should return subseries with highest tally when more than one have the same length (last series is higher)"	
	},{
		'series':[100,60,60,60,60,60,500,100,50,50,50,50,50,500],
		'threshold':500,
		'expected':[100,60,60,60,60,60],
		'message':"Should return subseries with highest tally when more than one have the same length (first series is higher)"
	}]
