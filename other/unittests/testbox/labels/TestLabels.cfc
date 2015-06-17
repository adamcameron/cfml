component extends="testbox.system.BaseSpec" {
 
	function run(labels=""){
 		writeDump(var=arguments, label="run()'s args");
		describe(
			title	= "with labels",
			body	= function(){
				writeDump(var=arguments, label="describe()'s body args");

				it(
					title	= "is fine",
					body	= function(){
						writeDump(var=arguments, label="it()'s body args");
					},
					labels	= "itLabel1,itLabel2",
					skip	= function(){
						writeDump(var=arguments, label="it()'s skip args");
						return false;
					}
				);

			},
			labels	= "describeLabel1,describeLabel2",
			skip	= function(){
				writeDump(var=arguments, label="describe()'s' skip() args");
				return false;
			}
		);
	}
}