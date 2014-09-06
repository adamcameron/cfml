<cfscript>
 numbers = queryNew("id,en,mi", "integer,varchar,varchar", [
 [1,"one", "tahi"],
  [1,"two", "rua"],
  [3,"three", "toru"],
  [4,"four", "wha"]
  ]); 
  evens = queryExecute("SELECT * FROM numbers WHERE id IN (:evens)",{evens="2,4"}, {dbtype="query", numbers=numbers});
  
  writedump(evens);
  </cfscript>