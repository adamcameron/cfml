<!---
	Custom tag to display tweets
	Attributes :
		parent - Id of parent div 
--->
<cfclient>
	
	<cfif thisTag.executionMode eq "start">
		<cfset display_tweets()>
	</cfif>
	
	<cffunction name="display_tweets" >
		<cfset window.tweet_util.setBearerToken("----------------You Twitter app bearer token goes here--------------")>
		
		<cfset window.tweet_util.search_tweets("cfsummit2013", on_tweets_received)>
		
		<cfset var parent_div = $("##"+attributes.parent)>
		
		<cfset $(parent_div).html("")>

		<cfsavecontent variable="tmphtml" >
			<div id="tweets_div"></div>
		</cfsavecontent>
		<cfset $(parent_div).append(tmphtml)>
		
		<cfsavecontent variable="tmphtml" >
			<p class="tweet-progress" style="margin-top:30px">
				<div class="progress progress-striped active" id="progid">
					<div class="progress-bar"  role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
					</div>
				</div>
			</p>			
		</cfsavecontent>
						
		<cfset $(tmphtml).appendTo(parent_div).css("margin-top",getAppHeaderHeight()+10)>
	</cffunction>
	
	<cffunction name="on_tweets_received" >
		<cfargument name="tweets" >

		<cfset var parent_div = $("##tweets_div:visible")>

		<cfif parent_div.length eq 0>
			<cfreturn >
		</cfif>

		<cfset $(parent_div).html("")>
		
		<cfset count = tweets.statuses.length>
		
		<cfif tweets.statuses.length eq 0>
			<cfset $(parent_div).html('<span class="label label-warning tag">No tweets found</span>')>
			<cfreturn >
		</cfif>
		
		<cfsavecontent variable="tmphtml" >
			<ul class='nav nav-list' id="tweets_list">			
		</cfsavecontent>
		<cfset var table_obj = $(tmphtml).appendTo(parent_div)>
		<cfset setTopDivMargin("tweets_list")>
		
		<cfloop array="#tweets.statuses#" index="tweet">
			<cfset var user = tweet.user>
			<cfset var created = new Date(tweet.created_at)>
			
			<cfoutput >
				<cfsavecontent variable="tmphtml" >
					<li>
						<div class="schedule-item">
								<img class="tweet-img" src='#user.profile_image_url#'
									onclick="openInBrowser('http://twitter.com/#user.screen_name#');return false"></img>
							<p class="tweet-tag">
							#user.name#<span class="twitter-handle"> @#user.screen_name#</span></p>
							<p class="tweet-text">
								<span onclick="openInBrowser('http://twitter.com/#user.screen_name#/status/#tweet.id_str#');return false">
									#tweet.text#
								</span>
							</p>
							<p class="tweet-time">
								#eval("created.toLocaleDateString()")#  &nbsp;&nbsp;&nbsp; #eval("created.toLocaleTimeString()")#
						    </p>
					    </div>
					</li>    
				</cfsavecontent>
			</cfoutput>
			<cfset $(table_obj).append(tmphtml)>
			
		</cfloop>
		<cfset  $(table_obj).append('</ul>')>	
		<cfset $('##progid').css('display', 'none')>
	</cffunction>
	
	<cffunction name="openInBrowser" >
		<cfargument name="url" >
		<cfset window.open(encodeURI(url),"_system")>
	</cffunction>
	
</cfclient>

