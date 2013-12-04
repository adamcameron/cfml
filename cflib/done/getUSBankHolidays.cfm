<cffunction name="getUSBankHolidays" access="public" output="false" returntype="struct" hint="general bank holidays for US">
  <cfargument name="iYear" default="#Year(now())#" />

    <cfset var currentYear = arguments.iYear />

    <cfset var strResult =
      { NewYears      = createDate(currentYear,1,1),
        Independence  = createDate(currentYear,7,4),
        Veterans      = createDate(currentYear,11,11),
        Christmas     = createDate(currentYear,12,25)
      } />

    <cfif NOT (currentYear - 1) MOD 4>
      <cfset strResult.Inauguration = createDate(currentYear,1,20) />
    </cfif>

    <cfset strResult.MLKBirthday          = createDate(currentYear,1,GetNthOccOfDayInMonth(3,2,1,currentYear)) />
    <cfset strResult.WashingtonsBirthday  = createDate(currentYear,2,GetNthOccOfDayInMonth(3,2,2,currentYear)) />
    <cfset strResult.MemorialDay          = createDate(currentYear,5,(DaysInMonth(createDate(2012,5,1))) - (DayOfWeek(createDate(2012,5,DaysInMonth(createDate(2012,5,1)))) - 2)) />
    <cfset strResult.LaborDay             = createDate(currentYear,9,GetNthOccOfDayInMonth(1,2,9,currentYear)) />
    <cfset strResult.ColumbusDay          = createDate(currentYear,10,GetNthOccOfDayInMonth(2,2,10,currentYear)) />
    <cfset strResult.Thanksgiving         = createDate(currentYear,11,GetNthOccOfDayInMonth(4,6,11,currentYear)) />

    <cfreturn strResult />
</cffunction>