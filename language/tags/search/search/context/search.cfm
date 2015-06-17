<cfparam name="URL.engine">
<cfparam name="URL.criteria">
<cfsearch collection="primateTest#URL.engine#" contextpassages="1" criteria="#URL.criteria#" name="qSearch" status="stSearch">
<cfdump var="#variables#">