<cfscript>

    start = getTickCount()
    f1 = runAsync(() => {
        sleep(1000)
        return "in f1"
    }).then((value) => {
        sleep(1000)
        return "#value# in first then"
    }).then((value) => {
        sleep(1000)
        return "#value# in second then"
    })
    f1Loaded = getTickCount()

    f2 = runAsync(() => {
        sleep(1000)
        return "in f2"
    }).then((value) => {
        sleep(1000)
        return "#value# in first then"
    }).then((value) => {
        sleep(1000)
        return "#value# in second then"
    })
    f2Loaded = getTickCount()

    r1 = f1.get()
    f1Ended = getTickCount()

    r2 = f2.get()
    f2Ended = getTickCount()

    writeDump([
        r1 = r1,
        r2 = r2,
        f1Loaded = f1Loaded - start,
        f2Loaded = f2Loaded - start,
        f1Ended = f1Ended - start,
        f2Ended = f2Ended - start,
        all = f2Ended - start
    ])
</cfscript>
