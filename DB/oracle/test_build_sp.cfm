<cfquery datasource="demoshado">
	delete from tbl_objtree
</cfquery>

<cfstoredproc datasource="demoshado" procedure="proc_objtree_build" result="qNew">
</cfstoredproc>

<cfdump var="#qNew#" label="qNew">
