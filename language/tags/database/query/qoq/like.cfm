 <cfscript>
   qOriginal = queryNew("Name", "VarChar");
   newRow = queryAddRow(qOriginal, 7);

   querySetCell(qOriginal, "Name", "file_46.txt", 1);
   querySetCell(qOriginal, "Name", "other_file_6.txt", 2);
   querySetCell(qOriginal, "Name", "file_47.txt", 3);
   querySetCell(qOriginal, "Name", "other_file_46.txt", 4);
   querySetCell(qOriginal, "Name", "file_16.txt", 5);
   querySetCell(qOriginal, "Name", "file_6.txt", 6);
   querySetCell(qOriginal, "Name", "file_5.txt", 7);


 </cfscript>
 <cfdump var="#qOriginal#"/>


 <cfquery dbtype="query" name="qNewNames">
   SELECT Name
   FROM qOriginal
   WHERE Name LIKE '%[_]6%'
 </cfquery>
 <cfdump var="#qNewNames#">