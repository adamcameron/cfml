component {

	function test(){
		try {                                                                        
			x = this;                                                                    
		} catch ( any e ) {                                                          
			writeOutput("no this scope? " & e.message & nl);                              
		}                                                                            
		try {                                                                        
			x = variables;                                                                
		} catch ( any e ) {                                                          
			writeOutput("no variables scope? " & e.message & nl);                        
		}                                                                            
		try {                                                                        
			x = local;                                                                    
		} catch ( any e ) {                                                          
			writeOutput("no local scope? " & e.message & nl);                            
		}  		
	}
	
}