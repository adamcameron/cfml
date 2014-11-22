# reduce.py

import functools

numbers = [1,2,3,4]

def sumList(carry, value):
	return carry + value


sum = functools.reduce(sumList, numbers, 0)

print(sum)

product = functools.reduce(lambda carry, value: carry * value, numbers, 1)
print(product)