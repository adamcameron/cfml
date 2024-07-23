<cfxml variable="x">
<metadata id="4C9B4D27-97CC-F041-13E6A838A478CBAB" name="News Articles types/categories">
	<attributes>
		<attribute controlhandler="uuid" hint="The ID of the topic" label="ID" lowercase="no" name="id" required="yes"/>
		<attribute controlhandler="text" hint="The topic name" label="Keyword" lowercase="no" name="baseName" required="yes"/>
		<attribute controlhandler="topic" hint="The ID of the parent topic" label="Parent Topic" lowercase="no" name="instanceOf" required="no"/>
		<attribute controlhandler="yesno" default="1" hint="If yes /1 then content can be  tagged to this topic" label="Is Selectable" lowercase="no" name="isSelectable" required="no"/>
	</attributes>
	<topic baseName="Categories" hint="" id="4C9B58CF-E6AD-68A0-CC83341746DE7822" instanceOf="4C9B4D27-97CC-F041-13E6A838A478CBAB" isSelectable="0">

		<topic baseName="Article Types" id="B359F5BC-B566-1E15-AC6AA45C45DF4CA3" instanceOf="4C9B58CF-E6AD-68A0-CC83341746DE7822" isSelectable="0">

			<topic baseName="News" id="4C9B6D9F-9B86-B03E-99D16115F9B440BB" instanceOf="B359F5BC-B566-1E15-AC6AA45C45DF4CA3" isSelectable="1">

			</topic>
			<topic baseName="Offers" id="4C9B96D2-0552-D29E-D50D2DB98F999895" instanceOf="B359F5BC-B566-1E15-AC6AA45C45DF4CA3" isSelectable="0">

				<topic baseName="Window Card Offers" id="4C9C6ED3-980D-00AF-A702E0C0325B4AE9" instanceOf="4C9B96D2-0552-D29E-D50D2DB98F999895" isSelectable="1"/>

				<topic baseName="Discount Messages" id="CCED7315-9170-7473-B4DA9C77F719DE37" instanceOf="4C9B96D2-0552-D29E-D50D2DB98F999895" isSelectable="1"/>
			</topic>
		</topic>
		<topic baseName="Poster Offers" id="4C9C3C49-EFD0-5D31-73F5D141EC5FC237" instanceOf="4C9B58CF-E6AD-68A0-CC83341746DE7822" isSelectable="1"/>
		<topic baseName="Audience" id="B35A995E-B5CE-6B79-9EA6E6F0C1D664A2" instanceOf="4C9B58CF-E6AD-68A0-CC83341746DE7822" isSelectable="0">
			<topic baseName="Business" id="B35AC522-C9A2-1951-DDC09306A7F0ADAF" instanceOf="B35A995E-B5CE-6B79-9EA6E6F0C1D664A2" isSelectable="1"/>
			<topic baseName="Leisure" id="B35AE6C3-D944-D626-571A42B49EBB1567" instanceOf="B35A995E-B5CE-6B79-9EA6E6F0C1D664A2" isSelectable="1"/>

		</topic>
	</topic>
</metadata>
</cfxml>

<cfset a = xmlSearch(x, "//topic/topic[contains('4C9C6ED3-980D-00AF-A702E0C0325B4AE9,4C9B6D9F-9B86-B03E-99D16115F9B440BB', @id)]/ancestor-or-self::*/@baseName")>
<cfdump var="#a#">