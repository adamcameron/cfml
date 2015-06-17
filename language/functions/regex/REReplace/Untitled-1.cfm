<cfscript>
	regex = "(^([^<]*)(ont)([^<]*))|(([^<]*)(ont)([^<]*)$)";
	s = 'Some font text here <font color="red">I''m building a new front here where the frontier used to be</font> some more text which <td class="content">talks about fonts and stuff.';
	st = REFind(regex, s, 1, true);
	s2 = REReplace(s, regex, "\2poo!\4", "ALL");
	for (i=1; i le arrayLen(st.pos); i=i+1){
		writeOutput(htmlEditFormat("[#i#][#st.pos[i]#][#st.len[i]#]"));
		if (st.len[i] gt 0){
			writeOutput(htmlEditFormat("[#mid(s, st.pos[i], st.len[i])#]"));
		}else{
			writeOutput("[-]");
		}
		writeOutput("<br />");
	}
	writeOutput(htmlEditFormat(s2));
</cfscript>
<cfdump var="#st#">