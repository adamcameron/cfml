<CFSET str="here's a sentence which didn't pass the test">
<CFOUTPUT>
Given str=#str#<BR>
The CapFirstTitle version is #CapFirstTitle(str)#
</CFOUTPUT>

<cfscript>
/**
 * Returns a string with words capitalized for a title.
 * Modified by Ray Camden to include var statements.
 * Modified by James Moberg to use structs, added more words, and reset-to-all-caps list.
 * 
 * @param initText      String to be modified. (Required)
 * @return Returns a string. 
 * @author Ed Hodder (ed.hodder@bowne.com) 
 * @version 3, October 7, 2011 
 */
function capFirstTitle(initText){
       var j = 1; var m = 1;
       var doCap = true;
       var tempVar = "";
       /* Make each word in text an array variable */
       var Words = ListToArray(LCase(trim(initText)), " ");
       var excludeWords = structNew();
       var ResetToALLCAPS = structNew();
       /* Words to never capitalize */
       tempVar =  ListToArray("a,above,after,ain't,among,an,and,as,at,below,but,by,can't,don't,for,from,from,if,in,into,it's,nor,of,off,on,on,onto,or,over,since,the,to,under,until,up,with,won't");
       for(j=1; j LTE (ArrayLen(tempVar)); j = j+1){
               excludeWords[tempVar[j]] = 0;
       }
       /* Words to always capitalize */
       tempVar = ListToArray("II,III,IV,V,VI,VII,VIII,IX,X,XI,XII,XIII,XIV,XV,XVI,XVII,XVIII,XIX,XX,XXI");
       for(j=1; j LTE (ArrayLen(tempVar)); j = j+1){
               ResetToALLCAPS[tempVar[j]] = 0;
       }
       /* Check words against exclude list */
       for(j=1; j LTE (ArrayLen(Words)); j = j+1){
               doCap = true;
               /* Word must be less than four characters to be in the list of excluded words */
               if(LEN(Words[j]) LT 4){
                       if(structKeyExists(excludeWords,Words[j])){ doCap = false; }
               }
               /* Capitalize hyphenated words */
               if(ListLen(trim(Words[j]),"-") GT 1){
                       for(m=2; m LTE ListLen(Words[j], "-"); m=m+1){
                               tempVar = ListGetAt(Words[j], m, "-");
                               tempVar = UCase(Mid(tempVar,1, 1)) & Mid(tempVar,2, LEN(tempVar)-1);
                               Words[j] = ListSetAt(Words[j], m, tempVar, "-");
                       }
               }
               /* Automatically capitalize first and last words */
               if(j eq 1 or j eq ArrayLen(Words)){ doCap = true; }
               /* Capitalize qualifying words */
               if(doCap){ Words[j] = UCase(Mid(Words[j],1, 1)) & Mid(Words[j],2, LEN(Words[j])-1); }
               if (structKeyExists(ResetToALLCAPS, Words[j])) Words[j] = ucase(Words[j]);
       }
       return ArrayToList(Words, " ");
}
</cfscript>