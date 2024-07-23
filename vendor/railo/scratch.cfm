<cfscript>
start = getTickCount()
["tahi","rua","toru","wha"].each(function(v,i){
	echo("#i#:#v#<br>")
})
echo("execution time: #getTickCount()-start#ms")
</cfscript>