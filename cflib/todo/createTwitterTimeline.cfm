<!--- http://www.cflib.org/udf/createTwitterTimeline
	createTwitterTimeline: Twitter Timeline Widget Wrapper
	Add any public Twitter timeline to your website. Enter timeline source and/or options and the HTML embed code is generated.
	Twitter Widget Management https://twitter.com/settings/widgets
	Twitter Timeline Widget Documentation: https://dev.twitter.com/docs/embedded-timelines

	@param WidgetID		Unique timeline widget ID (required)
	@param Width		Integer. Default: 520 [180-520] (optional)
	@param HREF			Twitter URL (in case javascript is not enabled) (optional)
	@param Chrome		Widget Layout: [noheader nofooter noborders noscrollbar transparent] (optional)
	@param AnchorText	Default: Tweets by/from Username/List (optional)
	@param ARIA			Default: polite. [polite/assertive] (least obtrusive vs primary content) (optional)
	@param Bordercolor	Valid HEX color. Default: E8E8E8 (optional)
	@param DoNotTrack 	Boolean. Default: True Enables tracking + allows Twitter tailored suggestions (optional)
	@param FavoritesScreenName	Favorites timeline screen name (optional)
	@param FavoritesUserID	Favorites timeline user ID (optional)
	@param Height		Integer. Default: 600 [min 200] (optional)
	@param Language		2 Letter ISO 639-1 Language Code (optional)
	@param Linkcolor	Valid HEX color. Default: 0000ff (optional)
	@param ListID		List ID (optional)
	@param ListOwnerID	List owner ID (optional)
	@param ListOwnerScreenName	List owner screen name (optional)
	@param ListSlug		Suggested User List (optional)
	@param Related		Comma-separated list of related user screen names (optional)
	@param ScreenName	Twitter Screen Name (optional)
	@param searchQuery	string or hashtag (overrides HREF) (optional)
	@param ShowReplies	Boolean. Default: false - Shows replies to posts (optional)
	@param Theme		Default: light. Customized theme [dark/light] (optional)
	@param Tweetlimit	Integer. Default: 20 [1-20] (optional)
	@param UserID		Twitter User ID (optional)

	@return returns a struct with generated HTML, JS and EmbedCode strings (HTML+JS)
	@author James Moberg (james@sunstarmedia.com)
	@version 1, June 14, 2013
	--->
<cffunction name="createTwitterTimeline" access="public" returntype="struct" output="false">
	<cfargument name="WidgetID" default="" type="string" required="true" hint="configure a unique timeline widget ID at https://twitter.com/settings/widgets" />
	<cfargument name="Width" type="numeric" default="0" hint="Default: 520 [180-520]" />
	<cfargument name="HREF" type="string" default="" hint="Twitter URL (in case javascript is not enabled)" />
	<cfargument name="Chrome" type="string" default="" hint="Widget Layout: [noheader nofooter noborders noscrollbar transparent]" />
	<!--- More Customization --->
	<cfargument name="AnchorText" type="string" default="" hint="Default: Tweets by/from Username/List" />
	<cfargument name="ARIA" type="string" hint="Default: polite. [polite/assertive] (least obtrusive vs primary content)" />
	<cfargument name="Bordercolor" type="string" default="" hint="Default: E8E8E8  [Valid HEX color]" />
	<cfargument name="DoNotTrack" type="boolean" default="true" hint="Default: True Enables tracking + allows Twitter tailored suggestions" />
	<cfargument name="FavoritesScreenName" type="string" default="" hint="Favorites timeline screen name" />
	<cfargument name="FavoritesUserID" type="string" default="" hint="Favorites timeline user ID" />
	<cfargument name="Height" type="numeric" default="0" hint="Default: 600 [min 200]" />
	<cfargument name="Language" type="string" default="" hint="2 Letter ISO 639-1 Language Code" />
	<cfargument name="Linkcolor" type="string" default="" hint="Default: 0000ff [Valid HEX color]" />
	<cfargument name="ListID" type="string" default="" hint="List ID" />
	<cfargument name="ListOwnerID" type="string" default="" hint="List owner ID" />
	<cfargument name="ListOwnerScreenName" type="string" default="" hint="List owner screen name" />
	<cfargument name="ListSlug" type="string" default="" hint="Suggested User List" />
	<cfargument name="Related" type="string" default="" hint="Comma-separated list of related user screen names" />
	<cfargument name="ScreenName" type="string" default="" hint="Twitter Screen Name" />
	<cfargument name="searchQuery" type="string" default="" hint="Query string or hashtag (overrides HREF)" />
	<cfargument name="ShowReplies" type="boolean" default="false" hint="Default: false - Shows replies to posts" />
	<cfargument name="Theme" type="string" default="" hint="Default: light. Customized theme [dark/light]" />
	<cfargument name="Tweetlimit" type="numeric" default="0" hint="Default: 20 [1-20]" />
	<cfargument name="UserID" type="string" default="" hint="Twitter User ID" />
	<CFSET VAR local = structNew() />
	<CFSET local.TwitterTimeline = StructNew() />
	<CFSET local.tempCode = "" />
	<CFSET local.AnchorTextDefault = "" />
	<CFSET local.ColorRegex = "^(##([\dA-F]{3}|[\dA-F]{6})|([\dA-F]{3}|[\dA-F]{6}))$" />
	<CFSET local.Params = ArrayNew(1) />

	<!--- Trim values --->
	<CFLOOP COLLECTION="#arguments#" ITEM="thisAttribute"><CFSET arguments[thisAttribute] = trim(arguments[thisAttribute]) /></CFLOOP>

	<!--- Build data parameters --->
	<CFSET ArrayAppend(local.Params, 'data-widget-id="#arguments.WidgetID#"') />
	<CFIF VAL(arguments.Width) GTE 180 AND VAL(arguments.Width) LTE 520>
		<CFSET ArrayAppend(local.Params, 'width="#VAL(arguments.Width)#"') />
	</CFIF>
	<CFIF LEN(arguments.searchQuery)>
		<CFSET arguments.HREF = "https://twitter.com/search?q=#URLEncodedFormat(arguments.searchQuery)#" />
		<CFIF NOT LEN(arguments.AnchorText)>
			<CFSET arguments.AnchorText = arguments.searchQuery />
		</CFIF>
	<CFELSEIF isvalid("URL", trim(arguments.HREF)) AND NOT LEN(arguments.AnchorText)>
		<CFSET arguments.AnchorText = Replacenocase(arguments.HREF, "https://twitter.com/","@") />
		<CFSET arguments.AnchorText = Replacenocase(arguments.AnchorText, "http://twitter.com/","@") />
		<CFSET arguments.AnchorText = "Tweets by/from " & arguments.AnchorText />
	</CFIF>
	<CFIF isvalid("URL", arguments.HREF)>
		<CFSET ArrayAppend(local.Params, 'href="#arguments.HREF#"') />
	<CFELSE>
		<CFSET ArrayAppend(local.Params, 'href="##"') />
	</CFIF>
	<CFIF LEN(arguments.Chrome)>
		<CFSET ArrayAppend(local.Params, 'data-chrome="#Replace(arguments.Chrome,","," ","all")#"') />
	</CFIF>
	<CFIF ListFindNocase("polite,assertive", arguments.ARIA)>
		<CFSET ArrayAppend(local.Params, 'data-aria-polite="#lcase(arguments.ARIA)#"') />
	</CFIF>
	<CFSET arguments.Bordercolor = replace(arguments.Bordercolor, "##", "")>
	<CFIF ArrayLen(REMatchNoCase(local.ColorRegex, arguments.Bordercolor)) GT 0>
		<CFSET ArrayAppend(local.Params, 'data-border-color="###arguments.Bordercolor#"') />
	</CFIF>
	<CFIF YesNoFormat(arguments.DoNotTrack)>
		<CFSET ArrayAppend(local.Params, 'data-dnt="true"') />
	</CFIF>
	<CFIF LEN(arguments.FavoritesScreenName)>
		<CFSET ArrayAppend(local.Params, 'data-favorites-screen-name="#arguments.FavoritesScreenName#"') />
	</CFIF>
	<CFIF LEN(arguments.FavoritesUserID)>
		<CFSET ArrayAppend(local.Params, 'data-favorites-user-id="#arguments.FavoritesUserID#"') />
	</CFIF>
	<CFIF VAL(arguments.Height) GTE 200>
		<CFSET ArrayAppend(local.Params, 'height="#VAL(arguments.Height)#"') />
	</CFIF>
	<CFIF Listfindnocase("aa,ab,af,am,an,ar,as,ay,az,ba,be,bg,bh,bi,bn,bo,br,ca,co,cs,cy,da,de,dz,el,en,eo,es,et,eu,fa,fi,fj,fo,fr,fy,ga,gd,gl,gn,gu,gv,ha,he,hi,hr,ht,hu,hy,ia,id,ie,ii,ik,in,io,is,it,iu,iw,ja,ji,jv,ka,kk,kl,km,kn,ko,ks,ku,ky,la,li,ln,lo,lt,lv,mg,mi,mk,ml,mn,mo,mr,ms,mt,my,na,ne,nl,no,oc,om,or,pa,pl,ps,pt,qu,rm,rn,ro,ru,rw,sa,sd,sg,sh,si,sk,sl,sm,sn,so,sq,sr,ss,st,su,sv,sw,ta,te,tg,th,ti,tk,tl,tn,to,tr,ts,tt,tw,ug,uk,ur,uz,vi,vo,wa,wo,xh,yi,yo,zh,zh,zu", arguments.Language)>
		<CFSET ArrayAppend(local.Params, 'data-lang="#lcase(arguments.Language)#"') />
	</CFIF>
	<CFSET arguments.Linkcolor = replace(arguments.Linkcolor, "##", "")>
	<CFIF ArrayLen(REMatchNoCase(local.ColorRegex, arguments.Linkcolor)) GT 0>
		<CFSET ArrayAppend(local.Params, 'data-link-color="###arguments.Linkcolor#"') />
	</CFIF>
	<CFIF LEN(arguments.ListID)>
		<CFSET ArrayAppend(local.Params, 'data-list-id="#arguments.ListID#"') />
	</CFIF>
	<CFIF LEN(arguments.ListOwnerID)>
		<CFSET ArrayAppend(local.Params, 'data-list-owner-id="#arguments.ListOwnerID#"') />
	</CFIF>
	<CFIF LEN(arguments.ListOwnerScreenName)>
		<CFSET ArrayAppend(local.Params, 'data-list-owner-screen-name="#arguments.ListOwnerScreenName#"') />
	</CFIF>
	<CFIF LEN(arguments.ListSlug)>
		<CFSET ArrayAppend(local.Params, 'data-list-slug="#arguments.ListSlug#"') />
	</CFIF>
	<CFIF LEN(arguments.Related)>
		<CFSET ArrayAppend(local.Params, 'data-data-related="#arguments.Related#"') />
	</CFIF>
	<CFIF LEN(arguments.ScreenName)>
		<CFSET ArrayAppend(local.Params, 'data-screen-name="#arguments.ScreenName#"') />
	</CFIF>
	<CFIF YesNoFormat(arguments.ShowReplies)>
		<CFSET ArrayAppend(local.Params, 'data-show-replies="true"') />
	</CFIF>
	<CFIF Listfindnocase("light,dark", arguments.Theme)>
		<CFSET ArrayAppend(local.Params, 'data-theme="#lcase(arguments.Theme)#"') />
	</CFIF>
	<CFIF VAL(arguments.Tweetlimit) GTE 1 AND VAL(arguments.Tweetlimit) LTE 20>
		<CFSET ArrayAppend(local.Params, 'data-tweet-limit="#VAL(arguments.Tweetlimit)#"') />
	</CFIF>
	<CFIF LEN(arguments.UserID)>
		<CFSET ArrayAppend(local.Params, 'data-user-id="#arguments.UserID#"') />
	</CFIF>

	<!--- Generate HTML --->
	<CFSAVECONTENT VARIABLE="local.tempCode"><CFOUTPUT>
		<a class="twitter-timeline" #ArrayToList(local.Params, " ")#>#arguments.AnchorText#</a>
	</CFOUTPUT></CFSAVECONTENT>
	<CFSET local.TwitterTimeline['HTML'] = trim(local.tempCode)>
	<CFSAVECONTENT VARIABLE="local.tempCode"><CFOUTPUT>
		<script type="text/javascript">!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
	</CFOUTPUT></CFSAVECONTENT>
	<CFSET local.TwitterTimeline['JS'] = trim(local.tempCode)>
	<CFSET local.TwitterTimeline['EmbedCode'] = local.TwitterTimeline['HTML'] & local.TwitterTimeline['JS']>

	<cfreturn local.TwitterTimeline />

</cffunction>


<!---Simple Usage w/Twitter Widget ID Only:
<CFSET TwitterTimeline = createTwitterTimeline("345680512444149760")>
<script>
<CFOUTPUT>#TwitterTimeline.EmbedCode#</CFOUTPUT>
</script>--->

CF8 Options (or use CF9/10 argumentCollection):
<cfset TwitterTimeline = createTwitterTimeline(WidgetID="297094693718720512", linkcolor="cc0000", width="250", height="1000", chrome="transparent,noscrollbar,nofooter,noheader", bordercolor="B8B79F")>
<CFOUTPUT>#TwitterTimeline.HTML#</CFOUTPUT>
<!--- Add this JS to HEAD or footer --->
<CFOUTPUT>#TwitterTimeline.JS#</CFOUTPUT>