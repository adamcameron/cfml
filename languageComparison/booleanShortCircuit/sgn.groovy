operands = [-1,0,1];

operands.each {a->
	operands.each{b->
		println("${a} || ${b} = ${a || b}");
	};
};
