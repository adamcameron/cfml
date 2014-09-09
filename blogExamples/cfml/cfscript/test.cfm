<cfscript>
numbers = queryExecute("
    SELECT    columns
    FROM    table
    WHERE    id BETWEEN :low AND :high
",{low=2,high=3}
);
writeDump(numbers);
</cfscript>