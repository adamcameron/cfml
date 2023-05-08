<cfscript>
    function seed() {
        var q = QueryNew("rank,code,team,points,previous_points,rank_change",
            "integer,varchar,varchar,integer,integer,integer",
            [
                [1,"USA","USA",2101,2123,0],
                [2,"GER","Germany",2072,2057,0],
                [3,"ENG","England",2049,2021,1],
                [4,"FRA","France",2043,2046,-1],
                [5,"CAN","Canada",2006,2006,0],
                [6,"AUS","Australia",2003,1999,0],
                [7,"JPN","Japan",1991,1984,1],
                [8,"NED","Netherlands",1967,1987,-1],
                [9,"SWE","Sweden",1962,1976,0],
                [10,"BRA","Brazil",1944,1964,0]
            ]);
        return q;
    }

    writeoutput("use query filter to get last 5 rows");
    q = seed();
    filtered = q.filter(function(el, i) {
        return i >= 5; // SHOULD RETURN LAST 5
    });

    // uh-oh! filtered query object is empty
    writeDump(var=filtered, label="Should be last 5 rows");
    // uh-oh! Original query object is now empty
    writeDump(var=q, label="Should be original query");
</cfscript>
