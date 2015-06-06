<cfprocessingdirective pageencoding="utf-8">
<cffunction name="createCalendar" output="false" returntype="string">
    <!---
     * Produces a calendar for a given month and year.
     * 
     * @param curMonth      The month to display. 
     * @param curYear      The year to display. 
     * @return Returns a string. 
     *
     * original logic by William Steiner (2002)
     * improved by Randy H. Drisgill (2006)
     * converted to cfml + minor improvements by Eric Hynds (2008)
     *
     * optimized for CF8; if you need it to work on previous versions replace all instances of:
     *         <cfset outString &=
     * with:
     *        <cfset outString = outString &
     *
     --->

    <cfargument name="curMonth" required="yes" type="numeric">
    <cfargument name="curYear" required="yes" type="numeric">
    
    <cfset var filename = "#cgi.script_name#">
    <cfset var outString = "">
    <cfset var firstDay = CreateDate(curYear, curMonth, 1)>
    <cfset var firstDayDigit = DayOfWeek(FirstDay)>
    <cfset var thisDay = 1>
    <cfset var h = 1>
    
    <cfsavecontent variable="outString">
    <cfoutput>
    <table border="0" cellpadding="5" cellspacing="3" id="calendar">
    <tr>
        <td colspan="7" id="change_form_container">
            <form action="#filename#" method="get">
                <select name="thisMonth">
                    <cfloop from="1" to="12" index="x"><option value="#x#"<cfif arguments.curMonth eq x> selected="selected"</cfif>>#monthasstring(x)#</option></cfloop>
                </select>        
                <select name="thisYear">
                    <cfloop from="#curYear - 4#" to="#curYear + 4#" index="h">
                        <cfoutput>
                            <option value="#h#"<cfif h eq curYear> selected="selected"</cfif>>#h#</option>
                        </cfoutput>
                    </cfloop>                   
                </select>
                <input type="submit" name="change" value="Change" />
            </form>        
        </td>
    </tr>
    <tr>
        <td class="header"><a class="navmonth" href="#filename#?thisMonth=#month(dateadd("M",-1,firstDay))#&thisYear=#year(dateadd("Y",-1,firstDay))#">« Prev</a></td>
        <td class="header" colspan="5">#DateFormat(firstDay, "mmmm yyyy")#</td>
        <td class="header"><a class="navmonth" href="#filename#?thisMonth=#month(dateadd("M",1,firstDay))#&thisYear=#year(dateadd("M",1,firstDay))#">Next »</a></td>
    </tr>
    <tr>
        <td class="subheader">Sunday</td>
        <td class="subheader">Monday</td>
        <td class="subheader">Tuesday</td>
        <td class="subheader">Wednesday</td>
        <td class="subheader">Thursday</td>
        <td class="subheader">Friday</td>
        <td class="subheader">Saturday</td>
    </tr>    
    </cfoutput>
    </cfsavecontent>
    
    <!--- if it isn't sunday, then we need to if space over to start on the corrent day of week --->
    <cfif firstDayDigit neq 1>
        <cfloop from="1" to="#DayOfWeek(FirstDay)-1#" index="h">
            <cfset outString &= "<td> </td>">
        </cfloop>
    </cfif>
    
    <!--- loop thru all the dates in this month --->
    <cfloop from="1" to="#DaysInMonth(firstDay)#" index="thisDay">
    
        <!--- is it Sunday? if so start new row. --->
        <cfif DayOfWeek(CreateDate(curYear, curMonth, thisDay)) eq 1><cfset outString &= "<tr>"></cfif>
        
        <!--- insert a day --->
        <cfset outString &= "<td align='left' valign='top' class='day-all ">
        
        <!--- is it today? append correct classes to above td --->
        <cfif (CreateDate(curYear, curMonth, thisDay) eq CreateDate(year(now()),month(now()),day(now())))>
            <cfset outString &= "day-current'>">
        <cfelse>
            <cfset outString &= "day-notcurrent'>">
        </cfif>
        <cfset outString &= "<div class='day-digit'>#thisDay#</div>">
        
        <!--- begin insert data for this day --->
        <cfset outString &= "calendar data here">
        <!--- end insert data for this day --->
        
        <!--- close out this day --->
        <cfset outString &= "</td>">
        
        <!--- is it the last day of the month?  if so, fill row with blanks. --->
        <cfif (thisDay eq DaysInMonth(firstDay))>
            <cfloop from="1" to="#(7-DayOfWeek(CreateDate(curYear, curMonth, thisDay)))#" index="h">
                <cfset outString &= "<td> </td>">
            </cfloop>
        </cfif>

        <cfif DayOfWeek(CreateDate(curYear, curMonth, thisDay)) eq 7>
            <cfset outString &= "</tr>">
        </cfif>
    </cfloop>
    
    <cfset outString &= "</table>">
    <cfreturn outString />
</cffunction>

<cfparam name="URL.thisMonth" default="#month(now())#">
<cfparam name="URL.thisYear" default="#year(now())#">
<cfoutput>#createCalendar(URL.thisMonth, URL.thisYear)#</cfoutput>