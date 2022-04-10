<cfset sThisUrl = "./test.cfm">

<cfmenu	bgcolor				= "##666666"
	    font				= "Verdana"
    	fontColor			= "##333333"
    	fontSize			= "10"
		name				= "myMenu"
		selectedFontColor	= "##FFFFFF"
		selectedItemColor	= "#000000#"
		type				= "horizontal"
>
	<cfloop index="sAnimal" list="Ocelot,Pangolin,Mongoose,Wombat,Aardvark">
		<cfset sSubmenuName = "subMenu#sAnimal#">
		<cfmenuitem	display	= "#sAnimal#"
					href	= "#sThisUrl#?submenu=#sSubmenuName#"
					name	= "#sSubmenuName#"
		>
			<cfloop index="sColour" list="Violet,Indigo,Blue,Green,Yellow,Orange,Red">
				<cfset sSubmenuName = "subMenu#sAnimal##sColour#">
				<cfmenuitem	display	= "#sColour#"
							href	= "#sThisUrl#?submenu=#sSubmenuName#"
							name	= "#sSubmenuName#"
				>
					<cfloop index="sPerson" list="Adam,Belinda,Charlie,Donna,Eric,Frances">
						<cfset sSubmenuName = "subMenu#sAnimal##sColour##sPerson#">
						<cfmenuitem	display	= "#sPerson#"
									href	= "#sThisUrl#?submenu=#sSubmenuName#"
									name	= "#sSubmenuName#"
						/>
					</cfloop>
				</cfmenuitem>
			</cfloop>
		</cfmenuitem>
	</cfloop>
</cfmenu>

<cfdump var="#URL#" label="URL">
<cfdump var="#form#" label="form">