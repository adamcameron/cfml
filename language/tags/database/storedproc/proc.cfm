<cfstoredproc procedure="MyProc">
    <cfprocparam dbvarname="myParam" value="#theValue#" type="in" null="#!isDefined("theValue")#" cfsqltype="varchar">
    <cfprocresult name="result">
</cfstoredproc>

<cfdump var="#result#">
