<cfscript>
  
	Items = [];
 
	outer:for(i=1;i<10;i++){
 
		Stuff = ":";
		inner:for(x=1;x<3;x++){
			if(i IS 5){
				continue outer;
			}
			if(i IS 8){
				break outer;
			}
			Stuff &= x;
		}
		Items.append(i & Stuff);
	}
	dump(Items);
</cfscript>