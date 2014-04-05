<cfscript>
  function f(){
  var st = {};
  var a = [];
  	writedump([arguments.getClass().getName(), st.getClass().getName(), a.getClass().getName()]);
  }
  
  f();

</cfscript>