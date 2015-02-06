<!---
	Custom tag to display survey page
	Attributes :
		parent - Id of parent div 
--->
<cfclient>
	<cfif thisTag.executionMode eq "start">
		<cfset displaySurvey()>
	</cfif>
	
	<cffunction name="displaySurvey" >
		<cfset var parent_div = $("##"+attributes.parent)>
		
		<cfif isDefined("localStorage.surveyEmail") eq false or localStorage.surveyEmail eq null>
			<cfset localStorage.surveyEmail = "">
		</cfif>
		
		<cfsavecontent variable="tmphtml" >
			<div id="survey_parent_div">
			</div>
		</cfsavecontent>
		
		<cfset variables.surveyParentDiv = $(tmphtml).appendTo(parent_div)>	
		
		<cfset setTopDivMargin("survey_parent_div")>
		
		<cfset variables.selectedSessionForSurvey = "">
		
		<cfset displaySessionSelection()>
		
		<cfset displaySurveyForm()>
	</cffunction>
	
	<cffunction name="displaySessionSelection" >
		<cfsavecontent variable="tmphtml" >
			<div id="session_sel_div">
				Select Session <br>
				<table>
					<tr>
						<td>
							Day
						</td>
						<td>
							<select id="survey_day_sel" size="1">
								<option value="1" selected>Day1</option>
								<option value="2">Day2</option>
							</select>
						</td>
					</tr>	
					<tr>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>
							Session
						</td>
						<td>
							<select id="survey_session_sel" size="1" style="width:100%">
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<br>
							<input type="submit" class="btn btn-default" value="Next" id="survey_session_sel_btn">
						</td>
					</tr>
				</table>
			</div>
		</cfsavecontent>
		<cfset variables.surveyParentDiv.append(tmphtml)>
		
		<cfset $("##survey_session_sel_btn").click(onSurveySessionSelected)>
		<cfset fillSessionSelectBox()>
		
		<cfset $("##survey_day_sel").change(fillSessionSelectBox)>
	</cffunction>
	
	<cffunction name="onSurveySessionSelected" >
		<cfset var selectedSession = $("##survey_session_sel option:selected")>
		<cfif selectedSession.length eq 0>
			<cfset alert("No session selected")>
			<cfreturn >
		</cfif>
		
		<cfset variables.selectedSessionForSurvey = selectedSession.data("session")>

		<cfset $("##session_sel_div").hide()>
		<cfset $("##survey_session").html(variables.selectedSessionForSurvey.name)>
		<cfset $("##survey_div").show()>
	</cffunction>
	
	<cffunction name="fillSessionSelectBox" >
		
		<cfset selectedDay = $("##survey_day_sel").val()>
		<cfset $("##survey_session_sel option").remove()>
		
		<cfoutput >
			<cfloop array="#window.sessions#" index="session" >
				<cfif session.day neq selectedDay or 
					(session.session_type neq "Session" and session.session_type neq "Keynote")>
					<cfcontinue>
				</cfif>
				<cfsavecontent variable="tmphtml" >
					<option value="#session.id#">#session.name#</option>
				</cfsavecontent>
				<cfset var optionElm = $(tmphtml).appendTo("##survey_session_sel")>
				<cfset optionElm.data("session",session)> 
			</cfloop>
		</cfoutput>
	</cffunction>
	
	<cffunction name="displaySurveyForm" >
		<cfsavecontent variable="tmphtml" >
			<div id="survey_div">
				Session : <span id="survey_session"></span>
				<p></p>
				<cfoutput >
				<table width="100%">
					<tr>
						<td>
							<span class="session-survey-label">Email</span>
						</td>
						<td>
							<input type="email" id="Email" value="#localStorage.surveyEmail#"/>
						</td>
					</tr>
				</table>
				</cfoutput>
				<br>
				Comments<br>
				<textarea id="Comments" rows="4" style="width:100%"></textarea><p><p>
				<br>
				Overall session evaluation
				<div id="SessEvaluation" class="survey_starts"></div><br>
				
				Information presented
				<div id="InfoPresented" class="survey_starts"></div><br>
				
				Session material well organized
				<div id="WellOrganized" class="survey_starts"></div><br>
				
				Session content matched title and description
				<div id="MatchTitle" class="survey_starts"></div><br>
				
				Session was at the educational level I needed
				<div id="EduLevel" class="survey_starts"></div><br>
				
				<label>
					<input type="checkbox" value="option1" id="Recommend" >
					I would recommend this session to my peers
				</label><br><br>
				
				<label>
					<input type="checkbox" value="option1" id="Expectation">
					This session met my expectations
				</label><br><br>
				
				Presenter knowledge of subject presented
				<div id="KnowEvaluation" class="survey_starts"></div><br>
				
				Speaker Presentation Skills
				<div id="PresSkills" class="survey_starts"></div><br>
				<input type="submit" name="submit" value="Submit" id="submit"
				       class="btn btn-default submit-survey-button"/>
			</div>
		</cfsavecontent>
		
		<cfset variables.surveyParentDiv.append(tmphtml)>
		<cfset $("##survey_div").hide()>
		
		<cfset initSurvey()>
	</cffunction>
	
	<cffunction name="initSurvey" >
		<cfscript>
			variables.sessEvaluation = 0;
			variables.infoPresented = 0;
			variables.wellOrganized = 0;
			variables.matchTitle = 0;
			variables.recommend = false;
			variables.expectation = false;
			variables.sessionId = 0;
			variables.eduLevel = 0;
			variables.knowEvaluation = 0;
			variables.presSkills = 0;			
			
			$('##SessEvaluation').raty();
			$('##InfoPresented').raty();
			$('##WellOrganized').raty();
			$('##MatchTitle').raty();
			$('##EduLevel').raty();
			$('##KnowEvaluation').raty();
			$('##PresSkills').raty();
			
			$("##submit").click(onSurveySubmit);	
			
			
			$("##SessEvaluation > img").click(function(){
				variables.sessEvaluation = $(this).attr("alt");
			});
			
			$("##InfoPresented > img").click(function(){
				variables.infoPresented = $(this).attr("alt");
			});
			
			$("##WellOrganized > img").click(function(){
				variables.wellOrganized = $(this).attr("alt");
			});
			
			$("##MatchTitle > img").click(function(){
				variables.matchTitle = $(this).attr("alt");
			});
			
			$("##EduLevel > img").click(function(){
				variables.eduLevel = $(this).attr("alt");
			});
			
			$("##KnowEvaluation > img").click(function(){
				variables.knowEvaluation = $(this).attr("alt");
			});
			
			$("##PresSkills > img").click(function(){
				variables.presSkills = $(this).attr("alt");
			});	
			
		</cfscript>
	</cffunction>
	
	<cffunction name="onSurveySubmit" >
		<cfscript>
			if (variables.selectedSessionForSurvey == "")
			{
				alert("No session selected for submitting survey");
				return;
			}	
					
			var surveyResult = {};
			surveyResult.email =  $("##Email").val();
			
			if (surveyResult.email.trim() == "")
			{
				alert("Email is a required field");
				return;
			}
			
			localStorage.surveyEmail = surveyResult.email;
			surveyResult.sessionId = variables.selectedSessionForSurvey.id;
			surveyResult.sessEvaluation = variables.sessEvaluation;
			surveyResult.infoPresented = variables.infoPresented;
			surveyResult.wellOrganized = variables.wellOrganized;
			surveyResult.matchTitle = variables.matchTitle;
			surveyResult.eduLevel = variables.eduLevel;
			
			if($("##Recommend:checked").length > 0)
				surveyResult.recommend = true;
			else
				surveyResult.recommend = false;
			
			if($("##Expectation:checked").length > 0)
				surveyResult.expectation = true;
			else
				surveyResult.expectation = false;
			
			surveyResult.knowEvaluation = variables.knowEvaluation;
			surveyResult.presSkills = variables.presSkills;
			surveyResult.comments = $("##Comments").val();
			
			var surveyCFC = new cfcs.SurveyManager();
			surveyCFC.setCallbackHandler(onSurveyResponse);
		
			surveyCFC.onSurveySubmit(surveyResult); 
		</cfscript>
	</cffunction>
	
	<cffunction name="onSurveyResponse" >
		<cfargument name="response">
		
		<cfset surveyDiv = $("##survey_parent_div:visible")>
		<cfif surveyDiv.length gt 0>
			<cfset alert(response.result.message)>
		</cfif>
	</cffunction>
	
</cfclient>
