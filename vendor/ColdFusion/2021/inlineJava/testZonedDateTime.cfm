<cfscript>
testZonedDateTime = java {

    import java.time.format.DateTimeFormatter;
    import java.time.ZonedDateTime;
    import java.time.ZoneId;

    public class TestZonedDateTime {

        public String getControlDateTimeAsString() { // 2022-06-01 00:00:00
            return getFormatedZonedDateTime(2022);
        }

        public String getDaylightSavingSwitchoverDateTimeAsString() { // 2008-06-01 00:00:00
            return getFormatedZonedDateTime(2008);
        }

        private String getFormatedZonedDateTime(int year) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("uuuu-MM-dd HH:mm:ss");

            ZonedDateTime dlsChangeOverTime = ZonedDateTime.of(year, 6, 1, 0, 0, 0, 0, ZoneId.of("Asia/Karachi"));

            return formatter.format(dlsChangeOverTime);
        }
    }
}

writeOutput(testZonedDateTime.getControlDateTimeAsString() & "<br>") // 2022-06-01 00:00:00 NB: hour is **0**
writeOutput(testZonedDateTime.getDaylightSavingSwitchoverDateTimeAsString() & "<br>") // 2008-06-01 01:00:00 NB: hour is **1**
</cfscript>
