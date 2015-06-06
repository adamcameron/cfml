<cfajaximport tags="cfwindow">

<cfquery name="qPages" datasource="intranet">
	select		*
	from		(
		select		uuid, page_title
		from		pages p
		inner join	(
			select	page_uuid, container_uuid
			from	pages_containers_link
			where	order_id = 1
		) pcl
		on			p.uuid = pcl.page_uuid
		inner join	containers c
		on			pcl.container_uuid = c.uuid
		inner join	container_versions cv
		on			c.uuid = cv.container_uuid
		and			c.version_uuid	= cv.version_uuid
		order by	page_title
	)
	where		ROWNUM	<= 50
</cfquery>

<script type="text/javascript">
	function createPopover(){
		var oWinConfig = {
			x				: 100,
			y				: 100,
			height			: 300,
			width			: 300,
			modal			: true,
			closable		: true,
        	draggable		: false,
        	resizable		: true,
        	initshow		: false,
        	refreshOnShow	: true
    	};
    	ColdFusion.Window.create(
    		'winDetail',
    		'Page Detail',
            '',
            oWinConfig
		);
		return true;
	}

	function showPopOver(uuid){
		ColdFusion.navigate('detail.cfm?uuid='+uuid,'winDetail', mycallBack, myerrorHandler);
	}
</script>
<cfloop query="qPages">
	<cfoutput><a href="##" onclick="ColdFusion.Window.show('detailWindow')">#page_title#</a><br/></cfoutput>
</cfloop>

<cfwindow	x			= "100"
			y			= "100"
			width		= "300"
			height		= "300"
			name		= "detailWindow"
			title		= "Detail"
			initshow	= "false"
			draggable	= "false"
			resizable	= "false"
			modal		= "true"
			source		= "windowsource.cfm?text={myform:text2}"
/>