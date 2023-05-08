// GetSubseriesTest.cfc

component extends="testbox.system.BaseSpec" {
	function beforeAll(){
		include "getSubseries.cfm"
	}
	function run(){
		describe("TDD tests", function(){
			it("returns an array", function(){
				result = getSubseries([], 0)

				expect(result).toBeArray()
			})
			it("should return elements if there are any within the threshold", function(){
				result = getSubseries([100], 100)

				expect(result).toBe([100])
			})
			it("returns a multi-element subseries", function(){
				threshold  = 500
				result = getSubseries([100,100], threshold)

				expect(result.len()).toBeGT(1)
			})
			it("total of elements should not be greater than threshold", function(){
				threshold  = 500
				result = getSubseries([100,100,100,100,100,100], threshold)

				expect(result.sum()).toBeLTE(threshold)
			})

			it("should return a subsequent larger subseries", function(){
				result = getSubseries([600,100,100,100,600,100,100,100,100,600], 500)

				expect(result).toBe([100,100,100,100])
			})

			it("should return a longer adjacent subseries", function(){
				result = getSubseries([600,100,100,100,600,200,100,100,100,100,100,600], 500)

				expect(result).toBe([100,100,100,100,100])
			})
		});

		describe("Edge-case tests", function(){
			it("works with an empty array", function(){
				result = getSubseries([], 0)

				expect(result).toBe([])
			})

			it("works when threshold is less than all items", function(){
				result = getSubseries([600,700,800,900], 500)

				expect(result).toBe([])
			})

			it("works when threshold is greater than all items", function(){
				result = getSubseries([600,700,800,900], 1000)

				expect(result).toBe([900])
			})

			it("works when threshold is greater than sum of all items", function(){
				series = [600,700,800,900]
				result = getSubseries(series, 5000)

				expect(result).toBe(series)
			})

			it("works when the subseries is equal to the threshold and is at the beginning of the series", function(){
				series = [100,100,100,100,100,100,600,150,150,150,150]
				result = getSubseries(series, 600)

				expect(result).toBe([100,100,100,100,100,100])
			})

			it("works when the subseries is equal to the threshold and at the end of the series", function(){
				series = [600,150,150,150,150,100,100,100,100,100,100]
				result = getSubseries(series, 600)

				expect(result).toBe([100,100,100,100,100,100])
			})
		});

		describe("Requirements tests", function(){
			it("works as per stated requirement", function(){
				result = getSubseries([100,300,100,50,50,50,50,50,500,200,100], 500)

				expect(result).toBe([100,50,50,50,50,50])
			})
			it("returns subseries with highest tally when there are two equal-length subseries (second subseries is higher)", function(){
				result = getSubseries([100,50,50,50,50,50,500,100,60,60,60,60,60,500], 500)

				expect(result).toBe([100,60,60,60,60,60])
			})
			it("returns subseries with highest tally when there are two equal-length subseries (first subseries is higher)", function(){
				result = getSubseries([100,60,60,60,60,60,500,100,50,50,50,50,50,500], 500)

				expect(result).toBe([100,60,60,60,60,60])
			})

		});
	}
	
}