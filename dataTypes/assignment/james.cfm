<cfscript>
public void function test() {
   var s = {
      "name" = "James"
   };
      
   refTest(s);
            
   writeDump(var:s, abort:true);
}
   
private void function refTest(struct t) {
   t = {};      
}

test();	
</cfscript>