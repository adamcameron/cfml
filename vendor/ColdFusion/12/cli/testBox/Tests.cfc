component extends=testbox.system.BaseSpec {

	function run(){
		describe("First set of tests", function(){
			it("This is the first test (which passes)", function(){
				expect(true).toBe(true);
			});
			it("This is the second test (which fails)", function(){
				expect(true).toBe(false);
			});
		});
		describe("Second set of tests", function(){
			it("This is the third test (which passes)", function(){
				expect(true).toBe(true);
			});
			it("This is the fourth test (which fails)", function(){
				expect(true).toBe(false);
			});
		});
	}
}