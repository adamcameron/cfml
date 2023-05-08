<cfscript>
cfflush(interval=16)
application.numbers = [
	"one" = "tahi",
	"two" = "rua",
	"three" = "toru",
	"four" = "wha"
]

for (en in application.numbers) {
    writeOutput("keys @ top of loop: #application.numbers.keyList()#<br>")
    writeOutput("current key: #en#<br>")
    writeOutput("current value: #application.numbers[en]#<br>")
    sleep(2000)
    writeOutput("keys after sleep: #application.numbers.keyList()#<br>")
}
</cfscript>
