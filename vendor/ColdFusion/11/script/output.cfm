<cfscript>
	week = queryNew("id,en,other", "integer,varchar,varchar", [
		[1,"Monday","Rāhina"],
		[8,"Monday","Lundi"],
		[2,"Tuesday","Rātū"],
		[9,"Tuesday","Mardi"],
		[3,"Wednesday","Rāapa"],
		[10,"Wednesday","Mecredi"],
		[4,"Thursday","Rāpare"],
		[11,"Thursday","Jeudi"],
		[5,"Friday","Rāmere"],
		[12,"Friday","Vendredi"],
		[6,"Saturday","Rāhoroi"],
		[13,"Saturday","Samedi"],
		[7,"Sunday","Rātapu"],
		[14,"Sunday","Dimanche"]
	]);

	cfoutput(query="week", group="en"){
		writeOutput(en & "<br>");
		cfoutput(){
			writeOutput(other & "<br>");
		}
	}
</cfscript>