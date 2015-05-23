component rest="true" restPath="MyHandler2" output="false" {
 
 
 
       remote any function GetHandler(required boolean booleanVal restargsource="path") restpath="MyTest/{booleanVal}"  httpmethod="GET" produces="application/json" {
 
            return arguments.booleanVal;  //booleanVal will be no because yes was passed in not true
 
 
 
       }
 
      
 
}