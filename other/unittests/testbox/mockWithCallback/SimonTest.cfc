component extends='testbox.system.BaseSpec' {
 
	function run(){
 
		describe('Testing precedence',function(){
  

 
			it('works fine',function(){
				// Would expect this to be run before the afterEach();
				expect('it').toBe('first');
				expect('it').toBe('second');
				expect('it').toBe('third');
			});
 


		});
	}
 
}