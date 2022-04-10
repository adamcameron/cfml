<cfscript>
	//make an empty query to prepopulate grid, only needed due to data mask
	propertiesQuery =  queryNew("bedrooms, bathrooms, price, footage, type, listedOn","integer,decimal,decimal,integer,varchar,date");
	
	//get all states
	getstate = request.statesGateway.getAll();
	
	//make a query of prices
	priceRange = queryNew("data,label");
		
	for (i = 75000; i LTE 400000; i = i + 25000){
		queryAddRow(priceRange);
		querySetCell(priceRange,'data',i);
		querySetCell(priceRange,'label',numberformat(i,"9,999,999"));	
	}
	for (i = 450000; i LTE 900000; i = i + 50000){
		queryAddRow(priceRange);
		querySetCell(priceRange,'data',i);
		querySetCell(priceRange,'label',numberformat(i,"9,999,999"));	
	}
	for (i = 1000000; i LTE 3000000; i = i + 250000){
		queryAddRow(priceRange);
		querySetCell(priceRange,'data',i);
		querySetCell(priceRange,'label',numberformat(i,"9,999,999"));
	}
	for (i = 3000000; i LTE 9000000; i = i + 1000000){
		queryAddRow(priceRange);
		querySetCell(priceRange,'data',i);
		querySetCell(priceRange,'label',numberformat(i,"9,999,999"));	
	}
	
	//make query with property types
	types = queryNew("label");
	queryAddRow(types,3);
	querySetCell(types,'label',"Condo/Townhouse",1);
	querySetCell(types,'label',"Single Family Home",2);
	querySetCell(types,'label',"Multi-Family Home",3);
	 
</cfscript>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Real Estate Management System</title>
<style >
	html, body{
		height:100%;
		margin:0;
	}
	body{
		background: #202020 url(assets/images/patternBg.gif);
	}
	#container{
		margin: auto;
		background: #195075 url(assets/images/background.gif) center center repeat-x;
		width: 990px;
		border: 1px solid #222;
		height: 100%;
	}
</style>
</head>
<body>
<table id="container"><tr><td>
<cfform name="RealEstateAdmin" format="flash" width="990" height="610" onload="formOnLoad()" style="themeColor:##56A1E1; marginRight:-12; background-color:##37749D;">
<cfformitem type="script">
public function formOnLoad():Void{

	RealEstateAdmin.myGlobalObjects = {};
	RealEstateAdmin.myGlobalObjects.isEditMode = false;
	<!--- set up remoting service --->
	setUpRemoting();
	
	<!--- set up styles --->
	setStyles();
}

public function setUpRemoting():Void{
	<cfoutput><!--- cfoutput to be able to set the gateway dynamically. It is recommended however to write the actual gateway instead --->
		var connection:mx.remoting.Connection = mx.remoting.NetServices.createGatewayConnection("http://#cgi.HTTP_HOST#/flashservices/gateway/");
		<!--- this should evaluate to 
		var componentPath = realestate.services.ListingService";
		componentPath variable is controlled in Application.cfc for more flexibilty on where the sample application has been saved
		 --->
		var componentPath:String = "#request.componentPath#.services.ListingService";
	</cfoutput>
		var responseHandler:Object  = {};
		
		<!--- put controls in the responseHandler's scope --->
		var listingGrid:mx.controls.DataGrid = listingGrid;
		
		<!--- handle search by default onResult function --->
		responseHandler.onResult = function( results: Object ):Void {

			listingGrid.dataProvider = results;
			_root.setMode('add');
			mx.managers.CursorManager.removeBusyCursor();
		}
		
		<!--- handle create response --->
		responseHandler.create_Result = function( results: Object ):Void {
		
				if (results.status){
					listingGrid.addItemAt(0,results.item);
					_root.setMode('add');
				}		
									
			mx.managers.CursorManager.removeBusyCursor();
				
			//show a message
			alert(results.message);
			
		}
		
		<!--- handle update response --->
		responseHandler.update_Result = function( results: Object ):Void {					
			var item:Object = results.item;
			var index:Number = _root.findItem(listingGrid,'mls_id',item.mls_id);
			if (results.status && index >= 0){
				listingGrid.replaceItemAt(index,item);
			}
				
			mx.managers.CursorManager.removeBusyCursor();
				
			<!--- show a message --->
			alert(results.message);	
		}
   		
		<!--- handle remove response --->
		responseHandler.remove_Result = function( results: Object ):Void {					
			
			if (results.status){
				listingGrid.removeItemAt(_root.findItem(listingGrid,'mls_id',results.item.mls_id));
				
				_root.setMode('add');
			}
			mx.managers.CursorManager.removeBusyCursor();
			
			<!--- show a message --->
			alert(results.message);	
		}
		
		<!--- default error handler --->
		responseHandler.onStatus  = function( stat: Object ):Void {
			<!--- if there is any error, show an alert --->
			alert("Error: " + stat.description);
			mx.managers.CursorManager.removeBusyCursor();
		}
		
		<!--- store service in global variable --->	
		RealEstateAdmin.myGlobalObjects.listingService = connection.getService(componentPath, responseHandler );

}

<!--- sets all the global styles --->
public function setStyles():Void {
	_global.styles.ComboBox.setStyle("color", 0x00253D);
	_global.styles.Label.setStyle("color", 0x222222);
	_global.styles.CheckBox.setStyle("color", 0x00253D);
	_global.styles.RadioButton.setStyle("color", 0x00253D);
	_global.styles.Form.setStyle("color", 0x222222);
	_global.styles.Button.setStyle("color", 0x222222);
	_global.styles.Button.setStyle("borderThickness", 1);
	_global.styles.Panel.setStyle("backgroundColor", 0xE5F0F9);
	_global.styles.Panel.setStyle("color", 0xffffff);
	_global.styles.Panel.setStyle("headerColors", [0x277DC6,0x50ABF7]);
}

<!--- helper function to select items in a dropdown --->
public function selectOption(select: mx.controls.ComboBox, optionToSelect:String):Void{
	
	//go through every record to find the right one
	for (var i:Number = 0; i< select.length; i++) {
		if (select.getItemAt([i]).data == optionToSelect){
			select.selectedIndex = i;
			break;
		}
	}
}

	
<!--- helper function to find an item in a datagrid --->
public function findItem(grid:mx.controls.DataGrid, columnToSearch:String, id:String):Number {

		for (var i = 0; i < grid.dataProvider.length; i++){
			if (grid.getItemAt(i)[columnToSearch] == id){
				return i;
			}
		}
		<!--- not found --->
		return -1;
	}

<!--- function that gets called when grid selection changes, used to bind other controls to grid values --->
public function listingGridChanged():Void {
	selectOption(edit_state, listingGrid.selectedItem.state);
	selectOption(edit_type, listingGrid.selectedItem.type);
	
	edit_status.selectedData = listingGrid.selectedItem.status;
	if(listingGrid.selectedItem == undefined) {
		setMode('add');
	}
	else {
		setMode('edit');
	}
	listingGrid.setFocus();
}		

<!--- function that makes necessary changes to show add/edit toggle --->
public function setMode(mode:String):Void{
	if (mode == 'add'){
		actionMessage.text = 'You are currently adding a property';
		RealEstateAdmin.myGlobalObjects.isEditMode = false;
		listingGrid.selectedIndex = undefined;
		editForm.setStyle("backgroundColor", 0xCDE4F6);
		actionMessage.setStyle("color", 0x235986);
		resetForm();
		edit_state.selectedIndex = 0;
	}
	else{
		actionMessage.text = 'You are currently editing a property';
		RealEstateAdmin.myGlobalObjects.isEditMode = true;
		editForm.setStyle("backgroundColor", 0xCCDCF2);
		actionMessage.setStyle("color", 0x19316E);
	}
}

<!--- :::::::::::::: Remoting calls ::::::::::::::::::::::::::::::: --->

<!--- editing / adding a listing --->
public function submitEdit():Void {
	var editArguments:Object = {};
	
	<!--- simple text inputs --->
	editArguments.mls_id = edit_mls_id.text;
	editArguments.address = edit_address.text;
	editArguments.city = edit_city.text;
	editArguments.zipcode = edit_zipcode.text;
	editArguments.price = edit_price.text;
	editArguments.stories = edit_stories.text;
	editArguments.bedrooms = edit_bedrooms.text;
	editArguments.bathrooms = edit_bathrooms.text;
	editArguments.footage = edit_footage.text;
	editArguments.yearBuilt = edit_yearBuilt.text;
	editArguments.listedOn = edit_listedOn.text;
	editArguments.remarks = edit_remarks.text;
	
	<!--- radio button --->
	editArguments.status = edit_status.selectedData;
	
	<!--- checkboxes --->
	editArguments.hasPool = edit_hasPool.selected;
	editArguments.hasWalkInClosets = edit_hasWalkInClosets.selected;
	editArguments.hasLaundry = edit_hasLaundry.selected;
	editArguments.hasFireplace = edit_hasFireplace.selected;
	
	<!--- dropdowns --->
	editArguments.state = edit_state.value;
	editArguments.type = edit_type.value;
	
	<!--- only make call if all required fields are supplied --->
	if( mx.validators.Validator.isStructureValid(this, 'RealEstateAdmin') ){
		<!--- show clock cursor --->
		mx.managers.CursorManager.setBusyCursor();
	
		if (RealEstateAdmin.myGlobalObjects.isEditMode) {
			<!--- call service --->
			RealEstateAdmin.myGlobalObjects.listingService.update(editArguments);
		}
		else {
			<!--- call service --->
			RealEstateAdmin.myGlobalObjects.listingService.create(editArguments);
		}
	}
}

<!--- removing a listing --->
public function submitRemove():Void {
	<!--- call service, sending the id --->
	RealEstateAdmin.myGlobalObjects.listingService.remove(edit_mls_id.text);
}

<!--- this function is called when search button is clicked --->
public function submitSearch():Void
{
	<!--- get all the search criteria items --->
	var searchArguments:Object = {};
	
	<!--- simple text input --->
	searchArguments.mls_id = search_mls_id.text;
	<!--- radio button --->
	searchArguments.status = search_status.selectedData;
	
	<!--- checkboxes --->
	searchArguments.hasPool = search_hasPool.selected;
	searchArguments.hasWalkInClosets = search_hasWalkInClosets.selected;
	searchArguments.hasLaundry = search_hasLaundry.selected;
	searchArguments.hasFireplace = search_hasFireplace.selected;
	
	<!--- dropdowns --->
	searchArguments.footage = search_footage.selectedItem.data;
	searchArguments.bedrooms = search_bedrooms.selectedItem.data;
	searchArguments.bathrooms = search_bathrooms.selectedItem.data;
	searchArguments.priceFrom = search_priceRangeFrom.selectedItem.data;
	searchArguments.priceTo = search_priceRangeTo.value;
	
	<!--- show clock cursor --->
	mx.managers.CursorManager.setBusyCursor();
	<!--- call service --->
	RealEstateAdmin.myGlobalObjects.listingService.search(searchArguments);
}
</cfformitem>
	<cfformgroup type="hbox" height="600">
		<cfformgroup type="vbox" width="220">
			<!--- logo --->
			<cfformgroup type="panel"  style="headerHeight: 0; cornerRadius: 0;">
				<cfformitem type="html" name="imageDisplay"  height="125" width="198"><p><img src='assets/images/realEstate.jpg' /></p></cfformitem>
			</cfformgroup> 
			
			<!--- search panel --->
			<cfformgroup type="panel" height="436"  style="indicatorGap:0; verticalGap:5; headerColors: ##AE0C0A, ##8C0A08;" label="Search">
				<cfformgroup type="vbox" style="verticalGap:-5;">
				<cfformitem type="text" style="fontWeight:bold;" >Price range:</cfformitem>
				<cfformgroup type="horizontal">
					<cfselect name="search_priceRangeFrom" query="priceRange" display="label" value="data" queryposition="below">
						<option value="0">No min.</option>
					</cfselect>
					<cfselect name="search_priceRangeTo" label="To:" query="priceRange" display="label" value="data" queryposition="below">
						<option value="0" selected>No max.</option>
					</cfselect>
				</cfformgroup>
				</cfformgroup>
				
				<cfformgroup type="horizontal" style="marginTop:-4; marginBottom:-4">
					<!--- Bedrooms options --->
					<cfformgroup type="vbox" style="verticalGap:-5">
						<cfformitem type="text" width="80" style="fontWeight:bold;">Bedrooms:</cfformitem>
						<cfselect name="search_bedrooms">
							<option value="0">Any</option>
							<option value="1">1 or more</option>
							<option value="2">2 or more</option>
							<option value="3">3 or more</option>
							<option value="4">4 or more</option>
							<option value="5">5 or more</option>
							<option value="6">6 or more</option>
						</cfselect>
					</cfformgroup>
					
					<cfformgroup type="vbox" style="verticalGap:-5">
						<!--- Bathrooms options --->
						<cfformitem type="text" width="80" style="fontWeight:bold;">Bathrooms:</cfformitem>
						<cfselect name="search_bathrooms">
							<option value="1">1 or more</option>
							<option value="1.5">1.5 or more</option>
							<option value="2">2 or more</option>
							<option value="2.5">2.5 or more</option>
							<option value="3">3 or more</option>
							<option value="3.5">3.5 or more</option>
							<option value="4">4 or more</option>
						</cfselect>
					</cfformgroup>
				</cfformgroup>
				
				<cfformgroup type="vbox" style="verticalGap:-5">
					<!--- Footage options --->
					<cfformitem type="text" style="fontWeight:bold;">Minimum Footage:</cfformitem>
					<cfselect name="search_footage">
						<option value="500">500</option>
						<option value="750">750</option>
						<option value="1000">1000</option>
						<option value="1250">1250</option>
						<option value="1500">1500</option>
						<option value="1750">1750</option>
						<option value="2000">2000</option>
						<option value="2250">2250</option>
						<option value="2500">2500</option>
						<option value="3000">3000</option>
						<option value="3500">3500</option>
						<option value="4000">4000</option>
					</cfselect>
				</cfformgroup>
				
				<cfformgroup type="vbox" style="verticalGap:-5">
					<cfformitem type="text" style="fontWeight:bold;">MLS Number:</cfformitem>
					<cfinput  name="search_mls_id" type="text" />
				</cfformgroup>
				
				<cfformgroup type="vbox" style="verticalGap:-5">
					<cfformitem type="text" style="fontWeight:bold;">Status:</cfformitem>
					<cfformgroup type="tile" height="50" style="horizontalGap:-25">
						<cfinput type="radio" name="search_status" value="active" checked="true" label="Active"/>
						<cfinput type="radio" name="search_status"  value="backUp" label="Back Up Offers"/>
						<cfinput type="radio" name="search_status"  value="sold" label="Sold"/>
						<cfinput type="radio" name="search_status"  value="recent" label="New Listing"/>
					</cfformgroup>
				</cfformgroup>
				
				<cfformgroup type="vbox" style="verticalGap:-5">
					<cfformitem type="text" style="fontWeight:bold;">Amenities:</cfformitem>
					<cfformgroup type="tile" height="50"  style="horizontalGap:-40">
						<cfinput type="checkbox" name="search_hasPool"  label="Pool"/>
						<cfinput type="checkbox" name="search_hasWalkInClosets"  label="Walk-In Closets"/>
						<cfinput type="checkbox" name="search_hasLaundry"  label="Laundry"/>
						<cfinput type="checkbox" name="search_hasFireplace"  label="Fireplace"/>
					</cfformgroup>
				</cfformgroup>
				
				<!--- Submit button, centered --->
				<cfformgroup type="horizontal" style="horizontalAlign:center">
				 	<cfinput type="button" name="submit"  value="Search" onclick="submitSearch()" />
				 </cfformgroup>
			</cfformgroup>
			
		</cfformgroup><!--- end vbox Search --->
		
		<cfformgroup type="vbox">
			<!--- search results panel --->
			<cfformgroup type="panel" height="206"  label="Properties">
				<cfgrid name="listingGrid"  query="propertiesQuery" rowheaders="false" onchange="listingGridChanged()">
					<cfgridcolumn name="type" header="Type" />
					<cfgridcolumn name="price" header="Price" type="numeric" dataalign="right" />
					<cfgridcolumn name="bedrooms" header="Bedrooms" type="numeric" dataalign="right"  />
					<cfgridcolumn name="bathrooms" header="Bathrooms" type="numeric" dataalign="right"  />
					<cfgridcolumn name="footage" header="Footage" type="numeric" dataalign="right"  />					
					<cfgridcolumn name="listedOn" mask="mm/dd/yyyy" display="No" />
				</cfgrid>
			</cfformgroup>
			
			<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
			<!--- add / edit form --->	
				<cfformgroup type="panel"  label="Add / Edit Properties" style="indicatorGap:0; verticalGap:3;  marginBottom:-16">
					<cfformgroup type="vbox" id="editForm" style="backgroundColor:##CDE4F6;">
					<cfformgroup type="hbox" height="110">
					
						<cfformgroup type="vbox" width="320" style="verticalGap:-5">
							<cfformitem type="text" style="fontWeight:bold;">ADDRESS:</cfformitem>
							<cfformgroup type="vbox">
								<cfinput type="text" name="edit_address" bind="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.address:''}" label="Street:" required="Yes" message="Address is required"/>
								<cfinput type="text" name="edit_city" bind="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.city:''}"  label="City:" required="Yes" message="City is required"/>
								<cfformgroup type="horizontal" label="State:">
									<cfselect name="edit_state" query="getstate" value="state_id" display="name" queryposition="below"  required="Yes" message="State is required"><option></option></cfselect>
									<cfinput type="text" name="edit_zipcode"  bind="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.zipcode:''}"  width="50" label="Zip:" required="Yes" message="Zip is required" validate="zipcode" />
								</cfformgroup>
							</cfformgroup>
						</cfformgroup>
						
						<!--- status radio buttons --->
							<cfformgroup type="vbox" style="verticalGap:-5">
								<cfformitem type="text" style="fontWeight:bold;">STATUS:</cfformitem>
								<cfformgroup type="tile" height="50" width="170" style="horizontalGap:-40">
									<cfinput type="radio" name="edit_status" value="active" checked="true" label="Active" />
									<cfinput type="radio" name="edit_status"  value="backUp" label="Back Up Offers"/>
									<cfinput type="radio" name="edit_status"  value="sold" label="Sold"/>
									<cfinput type="radio" name="edit_status"  value="recent" label="New Listing"/>
								</cfformgroup>
							</cfformgroup>
							
						<!--- amenitites checkboxes --->
							<cfformgroup type="vbox" style="verticalGap:-5">
								<cfformitem type="text" style="fontWeight:bold;">AMENITIES:</cfformitem>
								<cfformgroup type="tile" height="50" width="190" style="horizontalGap:-38">
									<cfinput type="checkbox" name="edit_hasPool" value="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.hasPool:false}"  label="Pool"/>
									<cfinput type="checkbox" name="edit_hasWalkInClosets" value="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.hasWalkInClosets:false}"  label="Walk-In Closets"/>
									<cfinput type="checkbox" name="edit_hasLaundry"  value="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.hasLaundry:false}" label="Laundry"/>
									<cfinput type="checkbox" name="edit_hasFireplace" value="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.hasFireplace:false}"  label="Fireplace"/>
								</cfformgroup>
							</cfformgroup>						
					</cfformgroup>
					
					<!--- all other inputs --->
					<cfformgroup type="hbox">
						<cfformgroup type="vbox" width="410" style="verticalGap:-5">
							<cfformitem type="text" style="fontWeight:bold;">LISTING INFORMATION:</cfformitem>
							<cfformgroup type="vbox">
							
								<cfformgroup type="horizontal"  label="Price:">
									<cfinput type="text" name="edit_price"  bind="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.price:''}" 
											width="170"  validate="numeric" message="Price is required" />
									<cfinput type="text" name="edit_mls_id" width="118" bind="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.mls_id:''}" 
											label="MLS##:" required="Yes" message="MLS## is required" />
								</cfformgroup>
								
								<cfformgroup type="horizontal"  label="Type:">
									<cfselect  name="edit_type"  width="170" query="types" display="label" />
									<cfinput type="text" name="edit_stories" bind="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.stories:1}" 
											width="110" validate="integer" message="Stories must be a number" label="Stories:" value="1" />
								</cfformgroup>
								<cfformgroup type="horizontal" label="Bedrooms:">
									<cfinput type="text" name="edit_bedrooms"  bind="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.bedrooms:''}"  
											width="30" required="Yes" message="Bedrooms are required" validate="integer" />
									<cfinput type="text" name="edit_bathrooms" bind="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.bathrooms:''}" 
											width="30" validate="numeric" label="Bathrooms:" required="Yes" message="Bathrooms are required" />
									<cfinput type="text" name="edit_footage" width="92"  bind="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.footage:''}" 
											label="Square Footage:" required="Yes" message="Footage is required" validate="integer" />
								</cfformgroup>
								
								<cfformgroup type="horizontal" label="Year Built:">
									<cfinput type="text" name="edit_yearBuilt"  bind="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.yearBuilt:'2005'}" 
											value="2005" width="90"  />
									<cfinput type="datefield"  name="edit_listedOn"  bind="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.listedOn:''}" 
											mask="mm/dd/yyyy" label="Date Listed:" />
								</cfformgroup>
							</cfformgroup>
						
						</cfformgroup>
						<cfformgroup type="vbox" style="verticalGap:-5">
							<cfformgroup type="vbox" style="verticalGap:-5">
								<cfformitem type="text" style="fontWeight:bold;">DESCRIPTION:</cfformitem>
								<cftextarea  name="edit_remarks" bind="{(listingGrid.selectedItem!=undefined)?listingGrid.selectedItem.remarks:''}" height="130"/>
							</cfformgroup>
						</cfformgroup>
						
						</cfformgroup><!--- End editForm --->
						
					</cfformgroup>
					
					<!--- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
					<!--- button bar --->
					<cfformgroup type="hbox">
						<cfformgroup type="horizontal" style="horizontalAlign:center;  marginTop:4;">
							<cfformitem type="text" id="actionMessage" style="fontWeight:bold; color:##235986;" width="210">You are currently adding a property</cfformitem>
							<cfinput type="button" name="editBtn" width="100"  value="{(listingGrid.selectedItem == undefined)?'Submit':'Apply Changes'}" onclick="submitEdit()" />
							<cfinput type="button" name="removeBtn"  value="Remove Property"  disabled="{(listingGrid.selectedItem == undefined) }" onclick="submitRemove()" />
							<cfinput type="button" name="addBtn"  value="Add new Property" onclick="setMode('add')"  disabled="{(listingGrid.selectedItem == undefined) }"/>
						</cfformgroup>
					</cfformgroup>
				</cfformgroup>
			
		</cfformgroup>
	</cfformgroup>
</cfform>
</td></tr></table>
</body>
</html>
