<cfflush interval="16">

<cfset dsn = "mysql_scratch">

<cfloop index="i" from="101" to="1000">
	<cfoutput>Creating customer #i#&hellip;</cfoutput>
	<cfquery datasource="#dsn#">
		insert into tbl_customer (
			cst_name
		)values(
			<cfqueryparam cfsqltype="cf_sql_varchar" value="customer_#i#">
		)
	</cfquery>
	created<br />
</cfloop>
<cfloop index="i" from="501" to="2000">
	<cfoutput>Creating product #i#&hellip;</cfoutput>
	<cfset fPrice = randRange(100, 1000) / 100>
	<cfquery datasource="#dsn#">
		insert into tbl_product (
			prd_name,
			prd_price
		)values(
			<cfqueryparam cfsqltype="cf_sql_varchar" value="product_#i#">,
			<cfqueryparam cfsqltype="cf_sql_double" value="#fPrice#">
		)
	</cfquery>
	created<br />
</cfloop>

<cfloop index="i" from="101" to="1000">
	<cfset iOrders = randRange(0, 100)>
	<cfoutput>Creating #iOrders# orders for customer #i#&hellip;</cfoutput>
	<cfloop index="j" from="1" to="#iOrders#">
		<cfset iYear = randRange(2000,2010)>
		<cfset iMonth = randRange(1,12)>
		<cfset iDay = randRange(1, daysInMonth(createDate(iYear, iMonth, 1)))>
		<cfset dOrder = createDate(iYear, iMonth, iDay)>
		<cfquery datasource="#dsn#">
			insert into tbl_order (
				cst_id,
				ord_date
			)values(
				<cfqueryparam cfsqltype="cf_sql_integer" value="#i#">,
				<cfqueryparam cfsqltype="cf_sql_timestamp" value="#dOrder#">
			)
		</cfquery>
		created<br />
	</cfloop>
</cfloop>


<cfquery name="qOrders" datasource="#dsn#">
	select max(ord_id) as max_ord_id
	from tbl_order
</cfquery>
<cfset iOrders = qOrders.max_ord_id[1]>
<cfoutput>Creating order lines for #iOrders# orders&hellip;</cfoutput>

<cfquery name="qProducts" datasource="#dsn#">
	select		prd_id, prd_price
	from		tbl_product
	order by	prd_id
</cfquery>

<cfloop index="i" from="1" to="#iOrders#">
	<cfset iOrderLines = randRange(0, 20)>
	<cfoutput>Creating #iOrderLines# orders for order #i#&hellip;</cfoutput>

	<cfloop index="j" from="1" to="#iOrderLines#">
		<cfset iProduct = randRange(1, qProducts.recordCount)>
		<cfset iQuantity = randRange(1, 10)>
		<cfset fCost = qProducts.prd_price[iProduct] * (1 + (randRange(0,10) / 10))>
		<cfquery datasource="#dsn#">
			insert into tbl_order_line (
				ord_id,
				prd_id,
				oln_quantity,
				oln_cost
			)values(
				<cfqueryparam cfsqltype="cf_sql_integer" value="#i#">,
				<cfqueryparam cfsqltype="cf_sql_integer" value="#iProduct#">,
				<cfqueryparam cfsqltype="cf_sql_integer" value="#iQuantity#">,
				<cfqueryparam cfsqltype="cf_sql_double" value="#fCost#">
			)
		</cfquery>
		created<br />
	</cfloop>
</cfloop>