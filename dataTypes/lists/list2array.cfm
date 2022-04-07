<cfdump var="#listToArray('')#"><br />
<cfdump var="#toBinary('')#"><br />
<cfdump var="#asc('')#"><br />
<cfdump var="#left('',10)#"><br />
<cfdump var="#val('')#"><br />
<cfdump var="#REFind('','')#"><br />
<!--- <cfdump var="#REReplace('test string','','foo')#"><br /> --->

<script type="text/javascript">
s1 = "";
alert(s1.split(",").length);
s2 = "test string";
alert(s2.replace("", "foo"));

</script>