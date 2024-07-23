Testing performance difference between three scenarios:
* using individual arguments being passed to methods (/individualArgs)
* using structs to group arguments (/structs)
* using transient objects to group arguments (/transients)

The code in each of those directories should mirror the client's code, but using each of the three approaches. So the important thing is that the code *is* analogous between the three.

Testing is done by creating a number of test objects (currently 50) per request, and battering that with a number of threads (100) doing a number of iterations (100).

Testing seems to demonstrate there is an issue on CFMX7 (no surprise); but also an issue on CF9 (surprise). Not so much on CF10 & 11.

Railo is - unsurprisingly - the best performer.

CFML instances all run -Xmx512, -XX:MaxPermSize=192m, and Java 7u55 except the CFMX7.0 install which is still on 1.4 (which is all it is supported on)