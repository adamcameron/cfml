<cfscript>
function getUngroupedRecords(required numeric rows) {
    createRows = (number) => repeatString(",", rows).listToArray(",", true)
    date = () => now().add("d", randRange(-365, 365))
    amount = () => randRange(1,10000) / 100

    fakedDbData = queryNew(
        "settlementDate,LongTermGainLoss,ShortTermGainLoss",
        "Date,Double,Double",
        createRows(rows).map((_) => [date(), amount(), amount()])
    )
    return fakedDbData
}
ungroupedRecords = getUngroupedRecords(20)
writeDump(ungroupedRecords)

writeOutput(htmlEditFormat(serialize(ungroupedRecords)))

groupedRecords = ungroupedRecords.reduce((grouped={}, row) => {
    y = row.settlementDate.year()
    m = row.settlementDate.month()
    key = "#y#-#m#"
    grouped[key] = grouped[key] ?: {stgl = 0, ltgl = 0}
    grouped[key].stgl = grouped[key].stgl + row.ShortTermGainLoss
    grouped[key].ltgl = grouped[key].ltgl + row.LongTermGainLoss

    return grouped
}).reduce(
    (records, key, values) => {
        records.addRow({
            month = key.listLast("-"),
            year = key.listFirst("-"),
            ltgl = values.ltgl,
            stgl = values.stgl
        })
        return records
    },
    queryNew("month,year,ltgl,stgl", "Integer,Integer,Double,Double")
).sort((r1, r2) => {
    yearDiff = r1.year - r2.year
    if (yearDiff != 0) {
        return yearDiff
    }
    return r1.month - r2.month
})

writeDump(groupedRecords)
writeOutput(htmlEditFormat(serialize(groupedRecords)))

</cfscript>
