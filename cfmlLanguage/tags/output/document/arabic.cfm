<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<cfsavecontent variable="MyPage">

<head>
<title>PRINT TEST</title>
</head>

<body>
<table width="810" border="0">
  <tr>
    <td width="225" ><div align="center"><strong>ARABIC TEXT PRINT TEST</strong></div></td>
    <td width="225" ><div align="center"><strong><span dir="rtl">نظام بصمة الوجه في دولة</span></strong></div></td>
  </tr>
</table>
</body>
</html>
</cfsavecontent>

<cfif not(isdefined("url.DISPLAY"))>
		<cfdocument format="pdf" filename="c:\pdf\print_test_cf.pdf"  overwrite="yes">
		<cfoutput>#mypage#</cfoutput>
    	
        </cfdocument>
    <cfelse>
    
    <cfoutput>#mypage#</cfoutput>
    
</cfif>
