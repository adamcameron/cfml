<CFSET IM=ImageRead("C:\temp\DSCN1570.JPG")>

<cfset ImageResize(IM,300,200,"highPerformance")>
<cfset ImageWrite(IM,"C:\temp\DSCN1570-2.JPG")>