<cfscript>
x = 9223372036854775807;
writedump(x);
writedump(x.getClass().getName());

y = d.parseDouble("#x#");
writedump(y);

z = d.parseDouble("9223372036854775807");
writedump(z);
</cfscript>