s=[].set(1,100,"").reduce((s,_,i)=>s&((fb={3="fizz",5="buzz"}.reduce((s,k,v)=>s&(i%k?'':v),"")).len()?fb:i),"");
writeOutput(s);