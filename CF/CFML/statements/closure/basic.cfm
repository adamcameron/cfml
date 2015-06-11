<cfscript>
o = new BasicClosure();
 
countDownFromOne = o.countDownFrom(1);
countDownFromTwo = o.countDownFrom(2);
 
writeOutput("countDownFromOne(): " & countDownFromOne() & "<br />"); //>1
writeOutput("countDownFromTwo(): " & countDownFromTwo() & "<br />"); //>2
writeOutput("countDownFromOne(): " & countDownFromOne() & "<br />"); //>0
writeOutput("countDownFromTwo(): " & countDownFromTwo() & "<br />"); //>1
writeOutput("countDownFromTwo(): " & countDownFromTwo() & "<br />"); //>0
</cfscript>