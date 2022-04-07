# General scratch code repo

Installation:

```
# start from your `cfml` directory.

$ pwd
/mnt/c/src/containers/cfml/


$ cd docker


$ # ./rebuildContainers.sh [lucee admin password] [DB root password] [DB user password]
$ # EG:


$ ./rebuildContainers.sh 12345 123 1234


# [let it run to completion]
# ⠿ Network cfml_backend       Created          0.0s
# ⠿ Volume "cfml_mariaDbData"  Created          0.0s
# ⠿ Container cfml-lucee-1     Started          2.0s
# ⠿ Container cfml-mariadb-1   Started          1.9s


$ docker exec --interactive --tty cfml-lucee-1 /bin/bash


/var/www# box install


# [let it run to completion]
#  √ | Installing ALL dependencies
#    | √ | Installing package [forgebox:testbox@^4.2.1+400]
#    |   | √ | Installing package [forgebox:cbstreams@^1.5.0]
#    |   | √ | Installing package [forgebox:mockdatacfc@^3.3.0+22]


/var/www# box testbox run


# [let it run to completion]
# =================================================================================
# Final Stats
# =================================================================================
#  
# [Passed: 40] [Failed: 0] [Errors: 0] [Skipped: 0] [Bundles/Suites/Specs: 2/2/2]
#  
# TestBox:        v4.5.0+5
# Duration:       133 ms
# CFML Engine:    Lucee 5.3.8.206
# Labels:         None

At time of writing (2022-04-07) all tests were passing.
