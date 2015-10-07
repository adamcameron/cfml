<cfscript>
y = 1;
z = x = y + y;

o1 = {};
o1.z= x = y + y;

o2 ={
//z = x = y + y
};
writeDump(variables);
</cfscript>