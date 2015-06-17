<cfscript>
// accessibility.cfm
echo("Publicly accessible: #Accessibility::accessible#<br>")

try {
	echo("Not publicly accessible: #Accessibility::inaccessible#<br>")
}catch (any e){
	echo("#e.message# #e.detail#<br>")
}
echo("Accessible via method: #Accessibility::getInaccessible()#<br>")
</cfscript>