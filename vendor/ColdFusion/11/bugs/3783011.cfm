<cfset qrA = queryNew("")> 
<cfset queryAddColumn( qrA, "size", "varchar", [ "D", "A", "B", "C" ] )> 

<cfset qrB = queryNew("")> 
<cfset queryAddColumn( qrB, "size", "varchar", [ "A" ] )> 
<cfset queryAddColumn( qrB, "quantity", "integer", [ 0 ] )> 


<cfquery name="joinQr" dbtype="query"> 
select qrA.*, qrB.quantity 
from qrA, qrB 
where qrA.size = qrB.size 
</cfquery> 

<cfquery name="newQrA" dbtype="query"> 
select * 
from qrA 
</cfquery> 


<cfdump var="#qrA#" label="qrA"> 
<cfdump var="#qrB#" label="qrB"> 
<cfdump var="#joinQr#" label="joinQr"> 
<cfdump var="#newQrA#" label="newQrA"> 