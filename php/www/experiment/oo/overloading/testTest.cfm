<cfscript>
// testTest.cfm

test = new Test();

test.dumpScore("Initial state");

score = test.getScore();
writeOutput("Score is: #score#<br>");
test.dumpScore("After get()");

test.setScore(44);
writeOutput("Score is: #test.getScore()#<br>");
test.dumpScore("After set()");
</cfscript>