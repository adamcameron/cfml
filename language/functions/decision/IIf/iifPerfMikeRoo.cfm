<h1>One of many demos on the performance effects of IIf(). <br />
 Average the trace information and run a few times as well.
 </h1>

 <CFLOOP from="1" to="20"  index="iTrialNum">
     <CFOUTPUT><h2><u>Trial #iTrialNum#:</u></h2></CFOUTPUT>

     <h3>Long series, no IIF, stand by...</h3>
     <CFFLUSH>

     <CFTRACE  inline="yes">
         <CFSCRIPT>
             iSum    = 0;
             iLimit  = 200 * iTrialNum;

             for (iDigit=1;  iDigit LTE iLimit;  iDigit=iDigit+1)
             {
                 if (NOT iDigit MOD 200)
                     WriteOutput (". ");
                 else
                     WriteOutput ("");


                 if (iDigit MOD 200)
                     iSum    = iSum + iDigit;
                 else
                     iSum    = iSum + 0;
             }
         </CFSCRIPT>
     </CFTRACE>


     <CFOUTPUT>
         <h3>Final sum = #iSum#</h3>
     </CFOUTPUT>


     <h3>Long series, with IIF, stand by...</h3>
     <CFFLUSH>

     <CFTRACE  inline="yes">
         <CFSCRIPT>
             iSum    = 0;
             iLimit  = 200 * iTrialNum;

             for (iDigit=1;  iDigit LTE iLimit;  iDigit=iDigit+1)
             {
                 WriteOutput (IIf (NOT iDigit MOD 200, DE (". "),   DE ("")));
                 iSum    = iSum + IIf (iDigit MOD 200, DE (iDigit), DE (0));
             }
         </CFSCRIPT>
     </CFTRACE>


     <CFOUTPUT>
         <h3>Final sum = #iSum#</h3>
     </CFOUTPUT>
 </CFLOOP>

