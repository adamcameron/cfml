<cfscript>
    telemetry = []
    telemetry.append("start @ #now()#")
    future1 = runAsync(() => {
        telemetry.append("yup 1.1 @ #now()#")
        sleep(1000)
        telemetry.append("yup 1.2 @ #now()#")
        sleep(1000)
        telemetry.append("yup 1.3 @ #now()#")
    })
    telemetry.append("middle @ #now()#")
    future2 = runAsync(() => {
        telemetry.append("yup 2.1 @ #now()#")
        sleep(1000)
        telemetry.append("yup 2.2 @ #now()#")
        sleep(1000)
        telemetry.append("yup 2.3 @ #now()#")
    })
    telemetry.append("end @ #now()#")

    telemetry.append("before get 1 @ #now()#")
    future1.get()
    telemetry.append("after get 1 @ #now()#")
    telemetry.append("before get 2 @ #now()#")
    future2.get()
    telemetry.append("after get 2 @ #now()#")

    writeDump(telemetry)
</cfscript>
