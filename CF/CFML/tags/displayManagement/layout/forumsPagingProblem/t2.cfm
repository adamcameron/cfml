<cfset f="Where Emp_id in (1,5,3,7,2,4,6,8)">
<cfset t="WHERE (lastName like ('A%') or lastName like 'C%' or lastName like 'X%' or lastName like 'P%' or lastName like 'R%' or lastName like 'B%') AND firstname <> ' '">
<cfset f="WHERE (lastName like ('A%') or lastName like 'C%' or lastName like 'X%' or lastName like 'P%' or lastName like 'R%' or lastName like 'B%') AND firstname <> ' '">

<cfquery name="qEmployee" datasource="cfdocexamples">
SELECT Emp_ID, FirstName, LastName, Email, Department 
FROM Employees
#PreserveSingleQuotes(f)#

 

</cfquery>
<table border="1" cellpadding="5" cellspacing="0" bordercolor="Orange">
    <tr>
        <td colspan="5">
                    <CFPARAM name="URL.currentrow" default="1">
                    <cfset fitler="Where left(sales,1) like 'A'">
                    <cfset qmaxrows = 3>
                    <cfset next = URL.currentrow + qmaxrows>
                    <cfset prev = URL.currentrow - qmaxrows>
                    <cfset qtotal = qEmployee.recordcount>
                    <cfset thispagemax = (qmaxrows + url.currentrow) - 1>
                    <cfoutput>
                        Showing #URL.currentrow# -
                        <cfif thispagemax GT qtotal>
                            #qtotal#
                        <cfelse>
                            #thispagemax#
                        </cfif> of #qtotal# records.<br />
                    <cfif url.currentrow gt 1>
                    <a href="javascript:ColdFusion.navigate('#cgi.SCRIPT_NAME#?1=1&currentrow=#prev#', 't1')" >Previous</a>
                    <cfelse>Previous</cfif>
                     |
                    <cfif thispagemax lt qtotal>
                    <a href="javascript:ColdFusion.navigate('#cgi.SCRIPT_NAME#?currentrow=#next#&f=#jsStringFormat(f)#','t1')">Next &gt;&gt;</a>
                    <cfelse>Next</cfif>
                    </cfoutput>
       
        </td>
    </tr>
        <tr valign="top" style="color:Snow; background-color:OrangeRed; font-weight:bold">
            <td>
                Employee ID
            </td>
            <td>
                First Name
            </td>
            <td>
                Last Name
            </td>
            <td>
                Email
            </td>
            <td>
                Department
            </td>
        </tr>
        <cfoutput>
        <cfloop query="qEmployee"  startrow="#URL.currentrow#" endrow="#thispagemax#">
            <tr valign="top" style="color:OrangeRed;">
                <td>
                   #qEmployee.Emp_ID#
                </td>
                <td>
                   #qEmployee.FirstName#
                </td>
                <td>
                   #qEmployee.LastName#
                </td>
                <td>
                   #qEmployee.Email#
                </td>
                <td>
                   #qEmployee.Department#
                </td>
            </tr>
        </cfloop>
        </cfoutput>
    </table>