<!--- get rid of all of the data in the table --->
<cfquery name="cleanup">
	delete from foo
</cfquery>
 
<!--- add 1 row to the table --->
<cftransaction>
	<cfset f = entityNew('foo') />
	<cfset entitySave( f ) />
</cftransaction>
 
<!--- show that the data can be loaded by orm --->
<cfdump var="#entityLoad( 'foo' )#" label="entityLoad" />
 
<!--- show that an HQL query with a space works --->
<cfdump var="#ormExecuteQuery( 'from foo' )#" label="with space" />
 
<!--- show that an HQL query with a tab immediately following the "from" keyword fails (an exception will be thrown) --->
<h2>It's going to error here, and that's the point: it's broken!</h2>
<cfdump var="#ormExecuteQuery( 'from	foo' )#" label="with tab" />