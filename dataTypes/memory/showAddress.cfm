<cfscript>
o = createObject("java", "me.adamcameron.miscellany.MemoryAddress");


writeOutput("<hr>Arrays<br>");

a1 = [];
a2 = [];

address1 = o.getAddress([a1]);
address2 = o.getAddress([a2]);
writeOutput("a1: " & address1 & "<br>");
writeOutput("a2: " & address2 & "<br>");
writeOutput(address1==address2?"same":"different");
writeOutput("<br>");


writeOutput("<hr>Structs<br>");

st1 = {};
st2 = {};

address1 = o.getAddress([st1]);
address2 = o.getAddress([st2]);
writeOutput("st1: " & address1 & "<br>");
writeOutput("st2: " & address2 & "<br>");
writeOutput(address1==address2?"same":"different");
writeOutput("<br>");



writeOutput("<hr>Dates<br>");
d1 = createDate(2015,10,9);
d2 = createDate(2015,10,8).add("d",1);

writeOutput("<br>Compared: " & dateCompare(d1, d2, "s") & "<br>");
address1 = o.getAddress([d1]);
address2 = o.getAddress([d2]);
writeOutput("d1: " & address1 & "<br>");
writeOutput("d2: " & address2 & "<br>");
writeOutput(address1==address2?"same":"different");
writeOutput("<br>");



writeOutput("<hr>Numerics<br>");
n1 = 2 * 6;
n2 = 4 * 3;

writeOutput("<br>CFML<br>");
address1 = o.getAddress([n1]);
address2 = o.getAddress([n2]);
writeOutput("n1: " & address1 & "<br>");
writeOutput("n2: " & address2 & "<br>");
writeOutput(address1==address2?"same":"different");
writeOutput("<br>");


writeOutput("<br>Java<br>");
address1 = o.getAddress([javaCast("double", n1)]);
address2 = o.getAddress([javaCast("double", n2)]);
writeOutput("n1: " & address1 & "<br>");
writeOutput("n2: " & address2 & "<br>");
writeOutput(address1==address2?"same":"different");
writeOutput("<br>");



writeOutput("<hr>Booleans<br>");
b1 = not not true;
b2 = not false;

writeOutput("<br>Values<br>");
writeOutput("b1: ");
writeOutput(b1);
writeOutput("<br>");
writeOutput("b2: ");
writeOutput(b2);
writeOutput("<br>");

writeOutput("<br>CFML<br>");
address1 = o.getAddress([b1]);
address2 = o.getAddress([b2]);
writeOutput("b1: " & address1 & "<br>");
writeOutput("b2: " & address2 & "<br>");
writeOutput(address1==address2?"same":"different");
writeOutput("<br>");

writeOutput("<br>Java<br>");
address1 = o.getAddress([javaCast("boolean", b1)]);
address2 = o.getAddress([javaCast("boolean", b2)]);
writeOutput("b1: " & address1 & "<br>");
writeOutput("b2: " & address2 & "<br>");
writeOutput(address1==address2?"same":"different");
writeOutput("<br>");

writeOutput("<hr>Strings<br>");

s1 = "abcd";
s2 = "ab" & "cd";

writeOutput("Compared: " & compare(s1, s2) & "<br>");

writeOutput("<br>CFML<br>");
address1 = o.getAddress([s1]);
address2 = o.getAddress([s2]);
writeOutput("s1: " & address1 & "<br>");
writeOutput("s2: " & address2 & "<br>");
writeOutput(address1==address2?"same":"different");
writeOutput("<br>");


writeOutput("<br>Java<br>");
address1 = o.getAddress([javaCast("string", s1)]);
address2 = o.getAddress([javaCast("string", s2)]);
writeOutput("s1: " & address1 & "<br>");
writeOutput("s2: " & address2 & "<br>");
writeOutput(address1==address2?"same":"different");
writeOutput("<br>");

</cfscript>