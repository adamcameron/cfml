<cfcomponent> 

       <cffunction name="f1" > 
              <cfreturn "Message returned from f1"> 
       </cffunction> 

       <cffunction name="f2" returntype="string" > 
              <cfargument name="arg1" type="string" required="true"  > 
              <cfset msg= "Message from wsssendmessage of f2 which you called with arg " & arg1> 
              <cfset wssendMessage(msg)> 
              <cfreturn "Message returned from f2"> 
       </cffunction> 

       <cffunction name="f3" > 
              <cfthread action="run" name="t1" > 
                     <cfloop index="i" from="1" to="10"> 
                           <cfset sleep(5000)> 
                           <cfset wssendMessage("Message #i# from wsssendmessage of f3 #now()#")> 
                     </cfloop> 
              </cfthread> 
              <cfreturn "Thread initiated in f3"> 
       </cffunction> 
</cfcomponent>