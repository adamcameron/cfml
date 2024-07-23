<cfsavecontent variable="sSource">
<script type="test/javascript">
 alert("foo");
</script>

other good stuff

<script type="test/javascript">
 alert("foo");
</script>

other good stuff

<script type="test/javascript">
 alert("foo");
</script>

other good stuff

</cfsavecontent>

<cfset sTarget = reReplace(sSource, "<script(.*?)<\/script>", "", "all")>

<cfdump var="#variables#">