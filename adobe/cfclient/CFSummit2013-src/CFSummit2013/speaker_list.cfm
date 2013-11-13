<!---
	Custom tag to display speakers list
	Attributes : 
		parent - Id of parent div 
		speakers - Array of speaker VO (speaker_vo.cfc)	
		callback_func - Callback function name that should be called when user click on a speaker
--->
<cfclient>
	<cfif thisTag.executionMode eq "start">
	
		<cfif attributes.speakers neq "" and attributes.speakers.length gt 0>
			<cfset display_speakers()>
			<cfset setupAutoFilter()>
		</cfif>
	</cfif>

	<cffunction name="display_speakers">
	
		<cfset var parent_div = $("##" + attributes.parent)>
	
		<cfset var speakers = attributes.speakers>
		
		<cfset var speaker_div = $("<div id='speaker_div'></div>").appendTo(parent_div)>
		<cfset setTopDivMargin("speaker_div")>
		
		<cfsavecontent variable="tmphtml" >
			<div id="speaker_searchbox">	
	  			<input type="text" class="search-query auto-suggest-input" placeholder="Search" id="input" onkeyup="onFilterSpeakerList(this)" >  
		    </div>
		</cfsavecontent>
		<cfset $(speaker_div).append(tmphtml)>
		
		<cfsavecontent variable="tmphtml" >	
	        <ul class="nav nav-tabs nav-stacked custom-nav" id='speakers'> 
		    </ul> 
		</cfsavecontent>
		<cfset var ulElm = $(tmphtml).appendTo(speaker_div)>

		<cfoutput>
	    	<cfloop array="#speakers#" index="speaker">
	    		<cfset var liElm = $("<li></li>").appendTo(ulElm)>
	    		<cfsavecontent variable="tmphtml" >
		       		<a href="##">
		       			<img src="images/speakers/#speaker.speaker_image#"
		       				class="speaker-list-image">
		       			</img>
			       		#speaker.name#
			       		<span class="glyphicon glyphicon-chevron-right icon-chevron"></span>
		       		</a>
	    		</cfsavecontent>
	    		
		        <cfset var linkElm = $(tmphtml).appendTo(liElm)>
		        <cfset $(linkElm).data("speaker",speaker).click(on_speaker_clicked)>
		        <cfset $(linkElm).find("img").data("speaker",speaker).click(on_speaker_clicked)>
	        </cfloop>
	        
		</cfoutput>
		
		<cfset $("#main_div#").scrollTop(window.speaker_scroll_pos)>
		<cfset window.speaker_scroll_pos = 0>
		
	</cffunction>
	
	<cffunction name="on_speaker_clicked">
		<cfargument name="event"/>
		
		<cfset var speaker = $(event.target).data("speaker")>
		<cfif isDefined("speaker")>
			<cfset window.speaker_scroll_pos = $("#main_div#").scrollTop()>
			<cfset eval(attributes.callback_func + "(speaker)")>
		</cfif>
		<cfreturn false>
	</cffunction>
	
	<cfscript>
		//Following functions make more sense in JS script block.
		//But because of a bug in packaging application that has JS code
		//at the top of cfclient block in custom tag, I have moved this code
		//in a cfscript block. - Ram
		
		//for filtering speaker list	 		 	
		function setupAutoFilter(){
			lis = $("##speakers li");
			variables.speakerFilterList = $.makeArray(lis.map(function(k, v) {
			   		return $(v).text();
			}));
		}
		
		//Filter speaker list	
		function onFilterSpeakerList(e)
		{
			var userInput = e.value;
		  	lis.each(function(index, value) {
		  		//JS array is 0 based where as cf array is 1 based. So increment the index
		   	 	$(value).toggle(variables.speakerFilterList[index+1].toLowerCase().indexOf(userInput.toLowerCase()) >= 0);
			 });
		}
	</cfscript>
	
</cfclient>