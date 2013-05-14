component extends="Parent" {

	numeric function f(required numeric x, required function callback){
		return callback(x);
	}

}