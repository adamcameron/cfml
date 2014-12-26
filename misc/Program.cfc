<cfcomponent>

     <cffunction access="public" name="doOperation"> 

             <cfset checkValue(-14)>

     </cffunction> 


     <cffunction access="private" name="checkValue">
           <cfargument name="notNeg" required="yes" type="numeric">
                <cfif arguments.notNeg LT 0 >

                     <cfthrow message="Negative Numbers not allowed"> 

                </cfif>
     </cffunction> 

 </cfcomponent>