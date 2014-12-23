// SubseriesSpec.js

describe("Subseries", function(){
	var subseries;

	beforeEach(function() {
		subseries = new Subseries();
	});	

	describe("TDD tests", function(){

		it("returns an array", function(){
			var result = subseries.getSubseries([], 0);

			expect(result).toEqual([]);
		});

		it("should return elements if there are any within the threshold", function(){
			var result = subseries.getSubseries([100], 100);

			expect(result).toEqual([100]);
		});

		it("returns a multi-element subseries", function(){
			var threshold = 500;
			var result = subseries.getSubseries([100,100], threshold);

			expect(result.length).toBeGreaterThan(1);
		});

		it("total of elements should not be greater than threshold", function(){
			var threshold = 500;
			var result = subseries.getSubseries([100,100,100,100,100,100], threshold);
			expect(subseries.sum(result)).not.toBeGreaterThan(threshold); // ie: !> => <=
		});

		it("should return a subsequent larger subseries", function(){
			var result = subseries.getSubseries([600,100,100,100,600,100,100,100,100,600], 500);

			expect(result).toEqual([100,100,100,100]);
		});

		it("should return a longer adjacent subseries", function(){
			var result = subseries.getSubseries([600,100,100,100,600,200,100,100,100,100,100,600], 500);

			expect(result).toEqual([100,100,100,100,100]);
		});
	});

	describe("Edge-case tests", function(){
		it("works with an empty array", function(){
			var result = subseries.getSubseries([], 0);

			expect(result).toEqual([]);
		});

		it("works when threshold is less than all items", function(){
			var result = subseries.getSubseries([600,700,800,900], 500);

			expect(result).toEqual([]);
		});

		it("works when threshold is greater than all items", function(){
			var result = subseries.getSubseries([600,700,800,900], 1000);

			expect(result).toEqual([900]);
		});

		it("works when threshold is greater than sum of all items", function(){
			var series = [600,700,800,900];
			var result = subseries.getSubseries(series, 5000);

			expect(result).toEqual(series);
		});

		it("works when the subseries is equal to the threshold and is at the beginning of the series", function(){
			var series = [100,100,100,100,100,100,600,150,150,150,150];
			var result = subseries.getSubseries(series, 600);

			expect(result).toEqual([100,100,100,100,100,100]);
		});

		it("works when the subseries is equal to the threshold and at the end of the series", function(){
			var series = [600,150,150,150,150,100,100,100,100,100,100];
			var result = subseries.getSubseries(series, 600);

			expect(result).toEqual([100,100,100,100,100,100]);
		});
	});

	describe("Requirements tests", function(){
		it("works as per stated requirement", function(){
			var result = subseries.getSubseries([100,300,100,50,50,50,50,50,500,200,100], 500);

			expect(result).toEqual([100,50,50,50,50,50]);
		});
		it("returns subseries with highest tally when there are two equal-length subseries (second subseries is higher)", function(){
			var result = subseries.getSubseries([100,50,50,50,50,50,500,100,60,60,60,60,60,500], 500);

			expect(result).toEqual([100,60,60,60,60,60]);
		});
		it("returns subseries with highest tally when there are two equal-length subseries (first subseries is higher)", function(){
			var result = subseries.getSubseries([100,60,60,60,60,60,500,100,50,50,50,50,50,500], 500);

			expect(result).toEqual([100,60,60,60,60,60]);
		});

	});

});