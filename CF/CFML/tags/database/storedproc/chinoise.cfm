<cfprocessingdirective pageencoding="utf-8">
<cfstoredproc procedure="usp_testTextInput" datasource="scratch">
	<cfprocparam
		type="in"
		value="百科全书"   <!--- want to pass in mandarin characters --->
		cfsqltype="CF_SQL_NVARCHAR"
		maxlength="50"
	>
</cfstoredProc>
