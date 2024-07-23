<cfscript>

	/* we need to do a few things.
		1) see if the number of tonnes loaded is less than the total deliveries, in which case they can't do it.
		2) work out what the updated timeframe for the voyage will be: this is based on working out the load time and steam time to the first BP, and return steam time
		3) check to see if this timeframe works in with the rest of the schedule, if so update.  If not: reject
		
		Either way, we need the details of the whole voyage, so get it
	
	*/
	thisVoyage = oShipSchedule.getSchedule(ship_uuid=attributes.ship_uuid, scenario_uuid=attributes.scenario_uuid, voyage_uuid=attributes.voyage_uuid).value;
	
	// easiest to check the tonnes loaded first
	if (attributes.productTonnes lt arraySum(thisVoyage["deliveryTonnes"])){
		resultMsg = "Insufficient tonnes cargo to fulfill delivery requirements";
		resultCode = false;
	}else{
		// OK, we probably need to update some values in the voyage query.
		
		// update the first commencementDateTime and the productTonnes (they might be the same original values... doesn't matter)
		querySetCell(thisVoyage, "dateTimeCommence", attributes.dateTimeCommence, 1);
		querySetCell(thisVoyage, "productTonnes", attributes.productTonnes, 1);
		querySetCell(thisVoyage, "suppliedproduct_uuid", attributes.suppliedproduct_uuid, 1);
		querySetCell(thisVoyage, "active", structKeyExists(attributes, "active"), 1);
		
		// update the first datetimeComplete with how long it'll take to load
		hoursToLoad = ceiling(attributes.productTonnes / gbShip.loadingTonnesPerHour);
		loadCompletionTime = dateAdd("h", hoursToLoad, thisVoyage.dateTimeCommence[1]);
		querySetCell(thisVoyage, "datetimeComplete", loadCompletionTime, 1);
		
		// update the starting point (this is really unlikely, but they mentioned it, so)...
		querySetCell(thisVoyage, "branchplantorigin_uuid", attributes.branchplantorigin_uuid, 1);
		querySetCell(thisVoyage, "branchplantdestination_uuid", attributes.branchplantorigin_uuid, 1);	// the dest for loading is always the same as the the origin
		
		// so that's the starting point sorted.  We might need to alter everything else, if the new starting point and/or date are different
		if (thisVoyage.branchplantorigin_uuid[2] neq thisVoyage.branchplantdestination_uuid[1] or thisVoyage.dateTimeCommence[2] neq thisVoyage.datetimeComplete[1]){
			for (idxQ=2; idxQ LE thisVoyage.recordCount; idxQ=idxQ+1){
				// update the commencement BP and time (the BP only needs doing the first time round, but it's more code to cater for than than to not, so not bothering
				querySetCell(thisVoyage, "branchplantorigin_uuid", thisVoyage.branchplantdestination_uuid[idxQ-1], idxQ);
				querySetCell(thisVoyage, "dateTimeCommence", thisVoyage.datetimeComplete[idxQ-1], idxQ);
				querySetCell(thisVoyage, "suppliedproduct_uuid", thisVoyage.suppliedproduct_uuid[idxQ-1], idxQ);
				querySetCell(thisVoyage, "active", thisVoyage.active[idxQ-1], idxQ);
				
				// work out the loading/steaming/returning time from origin to dest
				theseShipVars = oShipVariable.getSpecificShipVariables(
									branchplantorigin_uuid		= thisVoyage.branchplantorigin_uuid[idxQ],
									branchplantdestination_uuid	= thisVoyage.branchplantdestination_uuid[idxQ],
									query						= shipVariables,
									direction					= thisVoyage.scheduleType[idxQ]
								);
				if (not theseShipVars.recordCount){
					resultMsg = "Missing ship variables have preventing processing continuing.\nMake sure 'Steaming Time' and 'Nautical Miles' data is present between all Branchplants involved in this voyage.";
					resultCode = false;
					break;
				}
				// different calc depending on which part of the journey it is
				switch (thisVoyage.scheduleType[idxQ]){
					case "voyage": {
						voyageLegDuration = ceiling(theseShipVars.nauticalmiles / theseShipVars.knotsloaded);
						voyageLegCompletionTime = dateAdd("h", voyageLegDuration, thisVoyage.dateTimeCommence[idxQ]);
						break;
					}
					case "unloading": {
						// note the idxQ because the deliveryTonnes are against the voyage, not the unloading
						voyageLegDuration = ceiling(thisVoyage.deliveryTonnes[idxQ] / theseShipVars.dischargeTonnesHour);
						voyageLegCompletionTime = dateAdd("h", voyageLegDuration, thisVoyage.dateTimeCommence[idxQ]);
						break;
					}
					case "return": {
						voyageLegDuration = ceiling(theseShipVars.nauticalmiles / theseShipVars.knotsunloaded);
						voyageLegCompletionTime = dateAdd("h", voyageLegDuration, thisVoyage.dateTimeCommence[idxQ]);
						break;
					}
				}
				querySetCell(thisVoyage, "datetimeComplete", voyageLegCompletionTime, idxQ);
			}	// finished processing the legs
		}	// end of the if() wot determines whether we've got to update the timeframes
		
			
		// check to see if this timeframe is OK
		if (thisVoyage.active[1]){
			shipSchedule = oShipSchedule.getSchedule(	ship_uuid			= thisVoyage.ship_uuid[1],
														startDateTime		= thisVoyage.dateTimeCommence[1],
														endDateTime			= thisVoyage.datetimeComplete[thisVoyage.recordCount],
														scenario_uuid		= thisVoyage.scenario_uuid[1],
														active				= thisVoyage.active[1],
														excludevoyage_uuid	= thisVoyage.voyage_uuid[1]
													).value;
		}else{
			shipSchedule = structBuild(recordCount=0);
		}

		if (not shipSchedule.recordCount){
			// OK, we're good to go, updating this voyage
			for (idxQ=1; idxQ LE thisVoyage.recordCount; idxQ=idxQ+1){
				// build a struct with all the correct data
				bpStartLabel	= oBranchplant.bpLabelFromUUID(thisVoyage.branchplantorigin_uuid[idxQ]);
				bpDestLabel		= oBranchplant.bpLabelFromUUID(thisVoyage.branchplantdestination_uuid[idxQ]);
				thisLabel		= "#shipName# #thisVoyage.scheduletype[idxQ]#: #dateFormat(thisVoyage.dateTimeCommence[idxQ], 'd/m/yy')#-#dateFormat(thisVoyage.datetimeComplete[idxQ], 'd/m/yy')# (#bpStartLabel#)";
				thisLeg = structBuild(	obj_uuid					= thisVoyage.obj_uuid[idxQ],
										label						= thisLabel,
										description					= thisLabel,
										datetimecommence			= thisVoyage.datetimecommence[idxQ],
										datetimecomplete			= thisVoyage.datetimecomplete[idxQ],
										branchplantorigin_uuid		= thisVoyage.branchplantorigin_uuid[idxQ],
										branchplantdestination_uuid	= thisVoyage.branchplantdestination_uuid[idxQ],
										product_uuid				= thisVoyage.product_uuid[idxQ],
										producttonnes				= thisVoyage.producttonnes[idxQ],
										deliverytonnes				= thisVoyage.deliverytonnes[idxQ],
										active						= thisVoyage.active[idxQ],
										lastupdatedby				= session.user_uuid,
										modified					= now(),
										suppliedproduct_uuid		= thisVoyage.suppliedproduct_uuid[idxQ],
										legsequence					= thisVoyage.legsequence[idxQ]
				);
				// update it
				oShipSchedule.update(object=thisLeg, scenario_uuid=thisVoyage.scenario_uuid[idxQ], obj_uuid=thisVoyage.obj_uuid[idxQ]);
			}
		
		}else{
			resultMsg = "Voyage not updated due to scheduling conflict";
			resultCode = false;
		}
		
		// if we got to here without setting a msg, then it worked OK.
		if (not structKeyExists(variables, "resultMsg")){
			// run the update
			resultMsg = "Voyage updated";
			resultCode = true;
		}
	}	// end of whether there are sufficient tonnes to deliver
	break;
</cfscript>
