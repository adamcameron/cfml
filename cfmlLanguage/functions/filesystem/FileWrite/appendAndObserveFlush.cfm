<cfscript>
fh = fileOpen("/var/tmp/appendToMe.txt", "append")

testLine = repeatString("X", 1024) & chr(10)

for (i=1; i <= 20; i++) {
	fileWrite(fh, "#i#: #testLine#")
	//fh.getResource().getOutputStream().flush()
	sleep(2000)
}
</cfscript>
