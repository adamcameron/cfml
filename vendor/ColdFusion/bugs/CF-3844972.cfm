<cfscript>
    writeDump( { foo:'bar' }.append( { bum:'baz' } ) );
    writeDump( [ 'a', 'b' ].append( [ 'c', 'd' ], true ) );
    writeDump( "a,b".listAppend("c"));
    //writeDump( 2.val());

    i = 2;
    //writeDump(i.val())
    //x = {"one" = "tahi"}["one"]
</cfscript>
