component {

	remote string function getStatus(){
		var t1 = false;
		thread action="run" name="t1" {
			sleep(5000);
			var load = randRange(1,100);
			if (load <= 25){
				var status = "NOMINAL";
			} else if (load <= 90){
				var status = "ACCEPTABLE";
			} else{
				var status = "CRITICAL";
			}
			writeOutput(status);
			wsSendMessage("Server load is #status# at #now()#");
		}
		return "Server status polling initiated";
	}

}