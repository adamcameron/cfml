<script type="text/javascript"> 
       function msgHandler(msgobj){ 
           var txt = document.getElementById("myDiv"); 
           var message = ColdFusion.JSON.encode(msgobj); 
           txt.innerHTML += message + "<br >" + "<br>"; 
       } 
       function invokecfcfn(){ 
              var fname= document.getElementById("fnname").value; 
              if (fname == "f2") { 
                     alert("f2 selected"); 
                     mysocket.invoke("mycfc", "f2", ["echo"]); 
              } 
              else 
                     mysocket.invoke("mycfc", fname); 

       } 
</script> 
<cfwebsocket name="mysocket" onmessage="msgHandler"/> 
<form> 
       <select id="fnname"> 
              <option>f1</option> 
              <option>f2</option> 
              <option>f3</option> 
       </select> 

       <input id="invokefn" name="invokefn" value="Invoke CFC function " type="button"  onclick="invokecfcfn();"> 
       <div id="myDiv"> 
       </div> 
</form>