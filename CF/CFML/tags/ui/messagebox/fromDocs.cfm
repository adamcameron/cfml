<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
  <html xmlns="http://www.w3.org/1999/xhtml">  
  <head>  
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
  <title>Untitled Document</title>  
    
  <script  type="text/javascript">  
      //Function to to show result of a message box.  
  var showResult1 = function(btn,message){  
  alert("You entered: "+message);  
  }  
  //Function to show results of other message boxes.  
  var showResult2 = function(btn){  
  alert("You clicked button: "+btn);  
  }  
    
  //The button onClick handler displays the message boxes.  
  function showMB(mbox)  {  
  ColdFusion.MessageBox.show(mbox);  
  }  
  </script>  
  </head>  
    
  <body>  
  <cfform>  
  <p>Click a button display the corresponding message box.</p>  
  <cfinput name="Prompt" type="button" value="Prompt"  
  onclick="showMB('mymessagebox01')">  
  <cfinput name="Prompt" type="button" value="Prompt"  
  onclick="showMB('mymessagebox02')">  
  <cfinput name="Prompt" type="button" value="Prompt"  
  onclick="showMB('mymessagebox03')">  
  </cfform>  
    
  <!--- Code to define the message boxes. --->                      
  <cfmessagebox name="mymessagebox01" type="prompt"   
  message="Write a short description about yourself"   
  labelOK="This is OK" labelCANCEL="Cancel this"   
         callbackhandler="showResult1" multiline="true"/>  
    
  <cfmessagebox name="mymessagebox02" type="confirm"   
  message="Is it OK to save the planet?"   
  labelNO="Dont Save" labelYES="Sure"   
  callbackhandler="showResult2"/>  
    
  <cfmessagebox name="mymessagebox03" type="alert"   
  message="You have been ALERTED!"   
  callbackhandler="showResult2" />  
    
  </body>  
  </html>