 <CFSCRIPT>
     aA_Items    = ArrayNew (1);
     aB_Items    = ArrayNew (1);

     ArrayAppend (aA_Items, "Subjectivism");
     ArrayAppend (aB_Items, "subjectivism");

     ArrayAppend (aA_Items, "Objectivism");
     ArrayAppend (aB_Items, "Objectivism");

     ArrayAppend (aA_Items, "1a");
     ArrayAppend (aB_Items, "01:00");

     ArrayAppend (aA_Items, "1P");
     ArrayAppend (aB_Items, "2P");

     ArrayAppend (aA_Items, "1P");
     ArrayAppend (aB_Items, "2A");

     ArrayAppend (aA_Items, "7a");
     ArrayAppend (aB_Items, "7A");

     ArrayAppend (aA_Items, "0");
     ArrayAppend (aB_Items, "0.0");

     ArrayAppend (aA_Items, JavaCast ("int", 86));
     ArrayAppend (aB_Items, JavaCast ("float", 86.0));

     //-- Other gotchas exist too.  Can you guess what they are?
 </CFSCRIPT>

 <table cellspacing=0  border=1  cellpadding=8>
     <tr>
         <th>A</th>
         <th>B</th>
         <th>EQ</th>
         <th>IS</th>
         <th>Compare()</th>
         <th>CompareNoCase()</th>
         <th>GT</th>
     </tr>
     <CFLOOP  index="iPairNum"  from="1"  to="#ArrayLen (aA_Items)#">
         <tr>
             <CFOUTPUT>
                 <td>#aA_Items[iPairNum]#</td>
                 <td>#aB_Items[iPairNum]#</td>
                 <td><CFIF  aA_Items[iPairNum]  EQ
aB_Items[iPairNum]>yes<CFELSE>no</CFIF>  </td>
                 <td><CFIF  aA_Items[iPairNum]  IS
aB_Items[iPairNum]>yes<CFELSE>no</CFIF>  </td>
                 <td>#Compare (aA_Items[iPairNum],  aB_Items[iPairNum])#
             </td>
                 <td>#CompareNoCase (aA_Items[iPairNum],  aB_Items[iPairNum])#
             </td>
                 <td><CFIF  aA_Items[iPairNum]  GT
aB_Items[iPairNum]>yes<CFELSE>no</CFIF>  </td>
             </CFOUTPUT>
         </tr>
     </CFLOOP>
 </table>