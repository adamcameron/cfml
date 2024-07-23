<cfscript>
sta = {
  a=[1,2]
};
stb=sta;
writedump(sta);
writedump(stb);
sta.a[1]=7;
writedump(sta);
writedump(stb);
</cfscript>