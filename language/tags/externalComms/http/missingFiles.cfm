<cfhttp URL="http://65.61.124.134/SXM/121_Alonna--James/vcard.wav" method="get" result="stFile1">
<cfhttp URL="http://65.61.124.134/SXM/121_Alonna--James/vcard.wmv" method="get" result="stFile2">
<cfhttp URL="http://www.imdb.com/nonsense_file.dat" method="get" result="stFile3">

<cfdump var="#stFile1#" label="stFile1">
<cfdump var="#stFile2#" label="stFile2">
<cfdump var="#stFile3#" label="stFile3">