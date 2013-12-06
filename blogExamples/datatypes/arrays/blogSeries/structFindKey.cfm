<cfscript>
numbers = {
    maori    = {
        one        = "tahi",
        two        = "rua",
        three    = "toru",
        four    = "wha"
    },
    japanese= {
        one        = "ichi",
        two        = "ni",
        three    = "san",
        four    = "shi"
    }
};
ones = structFindKey(numbers, "one", "all");
rua = structFindValue(numbers, "rua", "all");

writeDump(var=numbers, label="data");
writeDump(var=ones, label="Struct keys that are 'one'");
writeDump(var=rua, label="struct elements with a value of 'rua'");	
</cfscript>