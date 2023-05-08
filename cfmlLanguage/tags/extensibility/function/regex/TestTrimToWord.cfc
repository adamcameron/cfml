// TestCase.cfc
component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		include "trimToWord.cfm";
		variables.sample = "Lorem ipsum dolor sit";
	}

	function run(){
		describe("Tests for trimToWord()", function(){
			it("works when the trim point is smaller than the first word 'Lorem'", function(index){
				for (var i=1; i <= 5; i++){
					expect(
						trimToWord(sample, i)
					).toBe(left(sample, 5), "trimming @ #i#");
				}
			});
			it("works when the trim point is between the first and second words 'Lorem ipsum'", function(index){
				for (var i=6; i <= 10; i++){
					expect(
						trimToWord(sample, i)
					).toBe(left(sample, 5), "trimming @ #i#");
				}
			});
			it("works when the trim point is between the second and third words 'Lorem ipsum dolor'", function(index){
				for (var i=11; i <= 16; i++){
					expect(
						trimToWord(sample, i)
					).toBe(left(sample, 11), "trimming @ #i#");
				}
			});
			it("works when the trim point is between the third and fourth words 'Lorem ipsum dolor sit'", function(index){
				for (var i=17; i <= 20; i++){
					expect(
						trimToWord(sample, i)
					).toBe(left(sample, 17), "trimming @ #i#");
				}
			});
			it("works when the trim point is at the end of the string 'Lorem ipsum dolor sit'", function(index){
				expect(
					trimToWord(sample, 21)
				).toBe(sample);
			});
		});
	}
}