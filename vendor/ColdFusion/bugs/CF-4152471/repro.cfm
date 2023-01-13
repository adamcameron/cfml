<cfscript>
    a = ["a", "b", "c"];
    s = {"a"=1, "b"=2, "c"=3};
    q = queryNew("col1", "varchar", [["a"], ["b"], ["c"]]);

    a.insertAt(2, "a2").each(function(e) {writeOutput(e);});//should return aa2bc
    s.insert("a2", 11).each(function(k,v) {writeOutput(k);});//should return aa2bc

    s.update("a", 11).each(function(k,v) {writeOutput(v);});//should return 1123

    a.resize(4).each(function(e,i) {writeOutput(i);});//should return 1234
    a.set(2, 4, 0).each(function(e) {writeOutput(e);});//should return a000
    a.swap(2, 3).each(function(e) {writeOutput(e);});//should return acb

    a.clear().append("d").each(function(e) {writeOutput(e);});//should return "d"
    s.clear().append({"d"=4}).each(function(k,v) {writeOutput(k);});//should return "d"

    q.addColumn("col2", []).each(function(r) {writeOutput(r.col1);});//should return abc
    q.addRow({col1="d"}).each(function(r) {writeOutput(r.col1);});//should return abcd
    q.setCell("col1", "b2", 2).each(function(r) {writeOutput(r.col1);});//should return ab2c
  </cfscript>
