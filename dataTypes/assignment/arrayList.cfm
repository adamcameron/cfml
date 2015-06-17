<cfscript>
a1 = ["Tahi", "TWO", "Toru", "Wha"];
a1 = createObject("java", "java.util.ArrayList").init(a1);
a2 = a1;

a1[2] = "Rua";

writeDump(variables);
</cfscript>