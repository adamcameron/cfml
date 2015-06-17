# getSubseriesTest.py

import json

from tests import getTests

#from daveWhite import subSeries as getSubseries
#from daveWhiteUpdated import getSubseries as getSubseries
from getSubseries import getSubseries

tests = getTests()


for test in tests:
	result = getSubseries(test['series'], test['threshold'])
	print(test['message'])
	if result == test['expected']:
		print("expected OK")
	else:
		print("*** expected MISMATCH. Expected: " + json.dumps(test['expected']) + "; result: " + json.dumps(result))

	if 'test' in test:
		if test['test'](result, test['threshold']):
			print("test OK")
		else:
			print("*** test FAILED")
	print("\n================================\n\n")

