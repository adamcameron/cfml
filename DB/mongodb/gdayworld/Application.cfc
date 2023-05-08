component {

	function onApplicationStart(){
		application.mongoConnection = MongoDBCOnnect("northwind", "localhost", 27017)
	}

}