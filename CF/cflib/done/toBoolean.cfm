<cfscript>
public boolean function toBooleanx(any arg='') output=false {
	try {
		return YesNoFormat(arguments.arg) ? true : false;
	} catch(any e) {
		return false;
	};
}

public boolean function toBoolean(any arg='') {
	return isBoolean(arg) && arg ? true : false;
}

	
test = {a=[[],[]],b='1,2,3'};
writeOutput(toBoolean(test));; // returns false

test = 'php is great';
toBoolean(test); // returns false

test = 'cfml is awesome' == 'cfml is awesome';
toBoolean(test); // returns true
</cfscript>

<cfoutput>
<cfset test = {a=[[],[]],b='1,2,3'}>
toBoolean(struct): #toBoolean(test)#<br />
<cfset test = 'php is great'>
toBoolean('php is great'): #toBoolean(test)#<br />
<cfset test = 'cfml is awesome' eq 'cfml is awesome'>
toBoolean('cfml is awesome' == 'cfml is awesome'): #toBoolean(test)#<br />
toBoolean(): #toBoolean()#<br />

<hr />
<cfset test = {a=[[],[]],b='1,2,3'}>
toBoolean2(struct): #toBoolean2(test)#<br />
<cfset test = 'php is great'>
toBoolean2('php is great'): #toBoolean2(test)#<br />
<cfset test = 'cfml is awesome' eq 'cfml is awesome'>
toBoolean2('cfml is awesome' == 'cfml is awesome'): #toBoolean2(test)#<br />
toBoolean2(): #toBoolean2()#<br />

</cfoutput>