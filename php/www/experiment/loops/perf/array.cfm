<cfscript>
	
// array.cfm

rainbow = ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Poropango","Papura"];

for (i=arrayLen(rainbow)+1; --i;){
	echo("#rainbow[i]#<br>");
}
</cfscript>