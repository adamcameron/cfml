<cfform action="./sameNamedSubmits.cfm" method="post" name="frm1" id="frm1">
   <cfinput type="submit" name="cfmlSubmit" value="One" />
   <cfinput type="submit" name="cfmlSubmit" value="Two" />
   <cfinput type="submit" name="cfmlSubmit" value="Three" />
</cfform>
<hr />
<form action="./sameNamedSubmits.cfm" method="post" name="frm2" id="frm2">
   <input type="submit" name="htmlSubmit" value="One" />
   <input type="submit" name="htmlSubmit" value="Two" />
   <input type="submit" name="htmlSubmit" value="Three" />
</form>
<hr />

<cfdump var="#form#" label="form">