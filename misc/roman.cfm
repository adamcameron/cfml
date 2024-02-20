<cfscript>

function decimalToRoman(decimal) {
    var stopValues = [
        1000 = "M",
        900 = "CM",
        500 = "D",
        400 = "CD",
        100 = "C",
        90 = "XC",
        50 = "L",
        40 = "XL",
        10 = "X",
        9 = "IX",
        5 = "V",
        4 = "IV",
        1 = "I"
    ]
    var roman = ""
    while (decimal > 0) {
        for (stopValue in stopValues) {
            if (decimal < stopValue) {
                continue;
            }
            roman &= stopValues[stopValue]
            decimal -= stopValue
            break;
        }
    }
    
    return roman
}

testValues = [
    0,
    1,
    3,
    4,
    5,
    9,
    10,
    11,
    999,
    1000,
    1001,
    3999,
    4001
]

testValues.each((testValue) => {
    writeDump({"#testValue#" = decimalToRoman(testValue)})
})

</cfscript>