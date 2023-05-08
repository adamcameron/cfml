<cfxml variable="x">
<metadata guid="4C9B4D27-97CC-F041-13E6A838A478CBAB" name="News Articles types/categories">
	<attributes>
		<attribute controlhandler="uuid" hint="The ID of the topic" label="ID" lowercase="no" name="id" required="yes"/>
		<attribute controlhandler="text" hint="The topic name" label="Keyword" lowercase="no" name="baseName" required="yes"/>
		<attribute controlhandler="topic" hint="The ID of the parent topic" label="Parent Topic" lowercase="no" name="instanceOf" required="no"/>
		<attribute controlhandler="yesno" default="1" hint="If yes /1 then content can be  tagged to this topic" label="Is Selectable" lowercase="no" name="isSelectable" required="no"/>
	</attributes>
	<topic baseName="categories" hint="" guid="4C9B58CF-E6AD-68A0-CC83341746DE7822" instanceOf="4C9B4D27-97CC-F041-13E6A838A478CBAB" isSelectable="0">
		<topic baseName="News" guid="4C9B6D9F-9B86-B03E-99D16115F9B440BB" instanceOf="4C9B58CF-E6AD-68A0-CC83341746DE7822" isSelectable="1">
			<topic baseName="UK" guid="4C9BBD27-ADFC-7137-FB41BD0E4AB7D764" instanceOf="4C9B6D9F-9B86-B03E-99D16115F9B440BB" isSelectable="1"/>
			<topic baseName="Europe" guid="4C9C0A4D-0B3F-0136-33AAC1006DDAC66F" instanceOf="4C9B6D9F-9B86-B03E-99D16115F9B440BB" isSelectable="1"/>
			<topic baseName="World" guid="4C9C22A7-E06C-D47F-AAF0BC81541E9DF4" instanceOf="4C9B6D9F-9B86-B03E-99D16115F9B440BB" isSelectable="1"/>
		</topic>
		<topic baseName="Offers" guid="4C9B96D2-0552-D29E-D50D2DB98F999895" instanceOf="4C9B58CF-E6AD-68A0-CC83341746DE7822" isSelectable="1">
			<topic baseName="Offer 1" guid="4C9C3C49-EFD0-5D31-73F5D141EC5FC237" instanceOf="4C9B96D2-0552-D29E-D50D2DB98F999895" isSelectable="1"/>
			<topic baseName="Offer 2" guid="4C9C6ED3-980D-00AF-A702E0C0325B4AE9" instanceOf="4C9B96D2-0552-D29E-D50D2DB98F999895" isSelectable="1"/>
			<topic baseName="Offer 3" guid="4C9C8299-D764-1BA0-01456A66085AB9F5" instanceOf="4C9B96D2-0552-D29E-D50D2DB98F999895" isSelectable="1"/>
		</topic>
	</topic>
</metadata>
</cfxml>
<!--- 
<cfset a = xmlSearch(x, "//topic[@guid='4C9B6D9F-9B86-B03E-99D16115F9B440BB']")>
<cfdump var="#a#">
 --->
<cfset a = xmlSearch(x, "//topic[contains('4C9B6D9F-9B86-B03E-99D16115F9B440BB,4C9B96D2-0552-D29E-D50D2DB98F999895',@id)]")>
<cfdump var="#a#">