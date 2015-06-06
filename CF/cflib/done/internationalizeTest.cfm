<cfoutput>#udf_translate(name="key1", Filename = expandPath("./russian.properties"))#</cfoutput>


<cfscript>
function udf_Translate(Name, Filename) {
infile = FileOpen(Filename, "read", "UTF-8");
i = 0;
flag = 0;
while (! FileIsEOF(infile)) {
i++;
x = FileReadLine(infile);
Org = trim(listFirst(x,"="));
Lang = trim(listRest(x,"="));
MyArray.array[i][1] = Org;
MyArray.array[i][2] = Lang;
if (MyArray.array[i][1] == Name)
{
WriteOutput(MyArray.array[i][2]);
flag = 1;
}
}
if (flag == 0)    WriteOutput(Name);
FileClose(infile);
MyArray = StructNew();
MyArray.array = ArrayNew(2);
}
</cfscript>