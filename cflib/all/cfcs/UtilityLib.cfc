<cfcomponent>

<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<!---
 This function will either add or remove an IP address to the list of debugging ip addresses if you do not have an administrator access.
 
 @param ipAddress 	 IP Address (Required)
 @param action 	 Add or Remove. Defaults to Add. (Optional)
 @return Returns a list of IP addresses. 
 @author Qasim Rasheed (qasim_1976@yahoo.com) 
 @version 1, February 17, 2004 
--->
<cffunction name="addRemoveDebuggingIPAddress" output="false" returnType="string">
	<cfargument name="IPaddress" type="string" required="Yes" />
	<cfargument name="action" type="string" default="Add" />
	<cfscript>
		var factory = CreateObject("Java","coldfusion.server.ServiceFactory");
		var debuggingService  ="";
	</cfscript>
	<cflock name="factory_debuggingservice" type="exclusive" timeout="5">
		<cfset debuggingService = factory.getDebuggingService()>
		<cfswitch expression="#arguments.action#">
			<cfcase value="Add">
				<cfif not listcontainsnocase(debuggingService.iplist.ipList,arguments.IPaddress)>
					<cfset debuggingService.iplist.ipList = ListAppend(debuggingService.iplist.ipList,arguments.IPaddress)>
				</cfif>
			</cfcase>
			<cfcase value="Remove">
				<cfif listcontainsnocase(debuggingService.iplist.ipList,arguments.IPaddress)>
					<cfset debuggingService.iplist.ipList = ListDeleteAt(debuggingService.iplist.ipList,ListFindNoCase(debuggingService.iplist.ipList,arguments.IPaddress))>
				</cfif>
			</cfcase>
		</cfswitch>
		<cfreturn debuggingService.iplist.ipList />
	</cflock>
</cffunction>

<!---
 returns 'true' if the currentthread is a cfthread, rerturns false otherwise
 
 @return Returns a boolean. 
 @author Mark Mandel (mark@compoundtheory.com) 
 @version 1, April 11, 2008 
--->
<cffunction name="amInCFThread" hint="returns 'true' if the current thread if a cfthread, rerturns false otherwise" access="public" returntype="boolean" output="false">
	<cfscript>
		var Thread = createObject("java", "java.lang.Thread");

		if(Thread.currentThread().getThreadGroup().getName() eq "cfthread")
		{
			return true;
		}

		return false;
	</cfscript>
</cffunction>

<cfscript>
/**
 * Image function to return Height, Width and file size.
 * 
 * @param imgfile 	 Absolute path to image file. (Required)
 * @return Returns a struct. 
 * @author Bobby Hartsfield (bobby@acoderslife.com) 
 * @version 1, September 16, 2007 
 */
function bhimginfo(imgfile) {
	var jFileIn = createObject("java","java.io.File").init(imgfile);
	var ImageObject = createObject("java","javax.imageio.ImageIO").read(jFileIn);
	var ImageInfo = StructNew();
	
	var imageFile = CreateObject("java", "java.io.File").init(imgfile); 
	var sizeb = imageFile.length();
	var sizekb = numberformat(sizeb / 1024, "999999999.99");
	var sizemb = numberformat(sizekb / 1024, "99999999.99");
	var bhImageInfo = StructNew();

	bhImageInfo.ImgWidth = ImageObject.getWidth();
	bhImageInfo.ImgHeight = ImageObject.getHeight();
	bhImageInfo.SizeB = sizeb;
	bhImageInfo.SizeKB = sizekb;
	bhImageInfo.SizeMB = sizemb;
	
	return bhImageInfo;
}
</cfscript>

<cfscript>
/**
 * Detects 130+ browsers.
 * v2 by Daniel Harvey, adds Flock/Chrome and Safari fix.         
 * v5 fix by RCamden based on bug found by Jeff Mayer
 * 
 * @param UserAgent 	 User agent string to parse. Defaults to cgi.http_user_agent. (Optional)
 * @return Returns a string. 
 * @author John Bartlett (jbartlett@strangejourney.net) 
 * @version 5, October 10, 2011 
 */
function browserDetect() {

	// Default User Agent to the CGI browser string
	var UserAgent=CGI.HTTP_USER_AGENT;
	
	// Regex to parse out version numbers
	var VerNo="/?v?_? ?v?[\(?]?([A-Z0-9]*\.){0,9}[A-Z0-9\-.]*(?=[^A-Z0-9])";
	
	// List of browser names
	var BrowserList="";
	
	// Identified browser info
	var BrowserName="";
	var BrowserVer="";
	
	// Working variables
	var Browser="";
	var tmp="";
	var tmp2="";
	var x=0;
	
	
	// If a value was passed to the function, use it as the User Agent
	if (ArrayLen(Arguments) EQ 1) UserAgent=Arguments[1];
	
	// Allow regex to match on EOL and instring
	UserAgent=UserAgent & " ";
	
	// Browser List (Allows regex - see BlackBerry for example)
	BrowserList="1X|Amaya|Ubuntu APT-HTTP|AmigaVoyager|Android|Arachne|Amiga-AWeb|Arora|Bison|Bluefish|Browsex|Camino|Check&Get|Chimera|Chrome|Contiki|cURL|Democracy|" &
				"Dillo|DocZilla|edbrowse|ELinks|Emacs-W3|Epiphany|Galeon|Minefield|Firebird|Phoenix|Flock|IceApe|IceWeasel|IceCat|Gnuzilla|" &
				"Google|Google-Sitemaps|HTTPClient|HP Web PrintSmart|IBrowse|iCab|ICE Browser|Kazehakase|KKman|K-Meleon|Konqueror|Links|Lobo|Lynx|Mosaic|SeaMonkey|" &
				"muCommander|NetPositive|Navigator|NetSurf|OmniWeb|Acorn Browse|Oregano|Prism|retawq|Shiira Safari|Shiretoko|Sleipnir|Songbird|Strata|Sylera|" &
				"ThunderBrowse|W3CLineMode|WebCapture|WebTV|w3m|Wget|Xenu_Link_Sleuth|Oregano|xChaos_Arachne|WDG_Validator|W3C_Validator|" &
				"Jigsaw|PLAYSTATION 3|PlayStation Portable|IPD|" &
				"AvantGo|DoCoMo|UP.Browser|Vodafone|J-PHONE|PDXGW|ASTEL|EudoraWeb|Minimo|PLink|NetFront|Xiino|";
				// Mobile strings
				BrowserList=BrowserList & "iPhone|Vodafone|J-PHONE|DDIPocket|EudoraWeb|Minimo|PLink|Plucker|NetFront|PIE|Xiino|" &
				"Opera Mini|IEMobile|portalmmm|OpVer|MobileExplorer|Blazer|MobileExplorer|Opera Mobi|BlackBerry\d*[A-Za-z]?|" &
				"PPC|PalmOS|Smartphone|Netscape|Opera|Safari|Firefox|MSIE|HP iPAQ|LGE|MOT-[A-Z0-9\-]*|Nokia|";
	
				// No browser version given
				BrowserList=BrowserList & "AlphaServer|Charon|Fetch|Hv3|IIgs|Mothra|Netmath|OffByOne|pango-text|Avant Browser|midori|Smart Bro|Swiftfox";
	
				// Identify browser and version
	Browser=REMatchNoCase("(#BrowserList#)/?#VerNo#",UserAgent);
	
	if (ArrayLen(Browser) GT 0) {
	
		if (ArrayLen(Browser) GT 1) {
	
			// If multiple browsers detected, delete the common "spoofed" browsers
			if (Browser[1] EQ "MSIE 6.0" AND Browser[2] EQ "MSIE 7.0") ArrayDeleteAt(Browser,1);
			if (Browser[1] EQ "MSIE 7.0" AND Browser[2] EQ "MSIE 6.0") ArrayDeleteAt(Browser,2);
			tmp2=Browser[ArrayLen(Browser)];
	
			for (x=ArrayLen(Browser); x GTE 1; x=x-1) {
				tmp=Rematchnocase("[A-Za-z0-9.]*",Browser[x]);
				if (ListFindNoCase("Navigator,Netscape,Opera,Safari,Firefox,MSIE,PalmOS,PPC",tmp[1]) GT 0) ArrayDeleteAt(Browser,x);
			}
	
			if (ArrayLen(Browser) EQ 0) Browser[1]=tmp2;
		}
	
		// Seperate out browser name and version number
		tmp=Rematchnocase("[A-Za-z0-9. _\-&]*",Browser[1]);

		Browser=tmp[1];
	
		if (ArrayLen(tmp) EQ 2) BrowserVer=tmp[2];
	
		// Handle "Version" in browser string
		tmp=REMatchNoCase("Version/?#VerNo#",UserAgent);
		if (ArrayLen(tmp) EQ 1) {
			tmp=Rematchnocase("[A-Za-z0-9.]*",tmp[1]);
			//hack added by Camden to try better handle weird UAs
			if(arrayLen(tmp) eq 2) BrowserVer=tmp[2];
			else browserVer=tmp[1];
		}
	
		// Handle multiple BlackBerry browser strings
		if (Left(Browser,10) EQ "BlackBerry") Browser="BlackBerry";
	
		// Return result
		return Browser & " " & BrowserVer;
	
	}
	
	// Unable to identify browser
	return "Unknown";

}
</cfscript>

<cfscript>
/**
 * An easy way to cache the result of any UDF.
 * 
 * @param cacheKey 	 Unique key used for to store the cache. (Required)
 * @param duration 	 A timespan that determines the length of the cache. (Required)
 * @param callback 	 The UDF to run.  (Required)
 * @param forceRefresh 	 If true, forces a refresh. Defaults to false. (Optional)
 * @return Returns a string. 
 * @author Adam Tuttle (j.adam.tuttle@gmail.com) 
 * @version 0, June 11, 2009 
 */
function cacheCallback(cacheKey, duration, callback) {
	var data = "";
	//optional argument: forceRefresh
	if (arrayLen(arguments) eq 4){arguments.forceRefresh=arguments[4];}else{arguments.forceRefresh=false;}
	//clean cachekey of periods that will cause errors
	arguments.cacheKey = replace(arguments.cacheKey, ".", "_", "ALL");
	//ensure cache structure is setup
	if (not structKeyExists(application, "CCBCache")){application.CCBCache = StructNew();}
	if (not structKeyExists(application.CCBCache, arguments.cacheKey)){application.CCBCache[arguments.cacheKey] = StructNew();}
	if (not structKeyExists(application.CCBCache[arguments.cacheKey], "timeout")){application.CCBCache[arguments.cacheKey].timeout = dateAdd('yyyy',-10,now());}
	if (not structKeyExists(application.CCBCache[arguments.cacheKey], "data")){application.CCBCache[arguments.cacheKey].data = '';}
	//update cache if expired
	if (arguments.forceRefresh or dateCompare(now(), application.CCBCache[arguments.cacheKey].timeout) eq 1){
		data = arguments.callback();
		application.CCBCache[arguments.cacheKey].data = data;
		application.CCBCache[arguments.cacheKey].timeout = arguments.duration;
	}
	return application.CCBCache[arguments.cacheKey].data;
}
</cfscript>

<!---
 Calculates the Body Mass Index.
 
 @param weightlbs 	 Weight in pounds. (Required)
 @param heightinches 	 Height in inches. (Required)
 @return Returns a number. 
 @author Elyse Nielsen (Elyse@anticlue.net) 
 @version 1, April 14, 2005 
--->
<cffunction name="calculateBMI" returntype="numeric" hint="This function calculates an individuals Body Mass Index">
	<cfargument name="WeightLbs" type="numeric" required="yes" hint="The person's weight in pounds">
	<cfargument name="HeightInches" type="numeric" required="yes" hint="The person's height in inches">
	<cfset var HI2 = "">
	<cfset var WHI = "">
	<cfset var BMI = "">
	<cfset HI2 = HeightInches * HeightInches>
	<cfset WHI = WeightLbs / HI2>
	<cfset BMI = WHI * 703>
	<cfreturn decimalFormat(BMI)>
</cffunction>

<cfscript>
/**
 * Calculates correct UTM zone for a given latitude/longitude point.
 * 
 * @param lat 	 Latitude value. (Required)
 * @param lon 	 Longitude value. (Required)
 * @return Returns a number. 
 * @author Wayne Graham (wsgrah@wm.edu) 
 * @version 1, February 3, 2006 
 */
function calculateUTMZone(lat,lon){
	// make sure the longitude is between -180 and 179.9
	var lonTemp = (arguments.lon + 180) - int((arguments.lon + 180) / 360) * 360 - 180;
	var zoneNumber = int((lonTemp + 180)/6) + 1;
			
	// Special zones for Svalbard
	if(arguments.lat GTE 72 and arguments.lat GT 84) {
		if(lonTemp GTE 0 AND lonTemp LT 9) zoneNumber = 31;
		else if(lonTemp GTE 9 AND lonTemp LT 21) zoneNumber = 33;
		else if(lonTemp GTE 21 AND lonTemp LT 33) zoneNumber = 35;
		else if(lonTemp GTE 33 AND lonTemp LT 42) zoneNumber = 37;
	}			
	return zoneNumber;
}
</cfscript>

<!---
 Takes a url and 301 redirects to user to that url.
 
 @param urlString 	 URL to push the user to. (Required)
 @return Returns nothing. 
 @author Erik Vold (erikvvold@gmail.com) 
 @version 0, December 6, 2008 
--->
<cffunction name="cf301Redirect" access="public" returntype="void" output="false">
  <cfargument name="urlString" type="string" required="yes" />
  
  <!--- 301 redirect the user to the provided url --->
  <cfheader statuscode="301" statustext="Moved permanently" />
  <cfheader name="Location" value="#arguments.urlString#" />
</cffunction>

<!---
 Given the fully-qualified path of a CFC, it renders the cfcexplorer.getcfcashtml() output to html, flahspaper, or PDF for printing as reference.
 
 @param cfcType 	 The CFC type. (Required)
 @param outputType 	 Can be html, flashpaper, or pdf. Defaults to flashpaper. (Optional)
 @return Returns either a string or binary data. 
 @author Jared Rypka-Hauer (jared@web-relevant.com) 
 @version 1, August 30, 2005 
--->
<cffunction name="cfcToPrinter" access="public" output="false"  returntype="any">
    <cfargument name="cfcType" type="string" required="true" />
    <cfargument name="outputType" type="string" required="false" default="flashPaper" />
    <cfset var myCfc = structNew()>
    <cfset var myExplorer =  createObject("component","CFIDE.componentutils.cfcexplorer")>
    <cfset var cfcDocument = "">
    <cfset var cfceData = "">

    <cfset myCfc.name = arguments.cfcType>
    <cfset myCfc.path = "/" & replace(myCfc.name,".","/","all") & ".cfc">

    <!--- Trap CFCExplorer's output --->
    <cfsavecontent  variable="cfceData">
        <cfoutput>#myExplorer.getcfcinhtml(myCfc.name,myCfc.path)#</cfoutput>
    </cfsavecontent>

    <!--- Clean up the HTML a bit... there's a lotta crap in that output  stream... --->
    <cfset cfceData = reReplace(cfceData,"\t*?\n","","all")>
    <cfset cfceData = reReplace(cfceData,"\s{2,}",chr(10),"all")>

    <!--- Switch up the output stream based on outputType argument --->
    <cfswitch expression="#arguments.outputType#">
        <cfcase value="html">
            <!--- Return tidied HTML for cfoutputting --->
            <cfreturn cfceData />
        </cfcase>
        <cfcase value="flashpaper,pdf">
            <!--- Return !! object !! (use cfcontent to set the right mime  type!!) --->
            <cfdocument fontembed="true" name="cfcDocument"  format="#arguments.outputType#">
                <cfoutput>#cfceData#</cfoutput>
            </cfdocument>
            <cfreturn cfcDocument />
        </cfcase>
    <cfdefaultcase>
        <cfthrow message="Invalid data for argument outputType:  #arguments.outputType#"
            detail="Your choices for outputType are pdf, flashpaper, or html." />
    </cfdefaultcase>
    </cfswitch>
</cffunction>

<!---
 Reset MailSpool and access general mail settings.
 
 @param mailaction 	 One of: isspoolenable,getserver,resetspool (Required)
 @return Returns a string or boolean. 
 @author Jose Diaz (bleachedbug@gmail.com) 
 @version 1, April 9, 2007 
--->
<cffunction name="cfMailFactory" access="public" returntype="string" output=false>
	<cfargument name="mailaction" type="string" required="true"/>
	<cfset var mailItem = "">
	<cfset var factory = "">
	<cfset var mm_service = "">
	<cfset var mm_settings = "">
			
	<!--- Access CF Service Factory --->
	<cfobject action="create" type="java" class="coldfusion.server.ServiceFactory" name="factory"/>

	<!--- Begin Action Checks --->
	<cfswitch expression="#trim(arguments.mailaction)#">

		<cfcase value="isSpoolEnable">
			<cfset mailItem = factory.mailSpoolService.isSpoolEnable()>
		</cfcase>

		<cfcase value="resetSpool">
		
			<cflock name="serviceFactory" type="exclusive" timeout="10">
			<cfscript>
			ms_service = factory.mailspoolservice;
			ms_settings = ms_service.settings;
			</cfscript>
			</cflock>
			
			<cfset mailItem = "Reset Successfull">
		</cfcase>

 		<cfcase value="getServer">
	      <cfset mailItem = factory.mailSpoolService.getServer()>
	    </cfcase>

	    <cfdefaultcase>
	    	<cfthrow message="Invalid mail action passed. Must be resetSpool, getServer, or isSpoolEnable.">
	    </cfdefaultcase>

	 </cfswitch>

	<cfreturn mailItem />

</cffunction>

<cfscript>
/**
 * Function to duplicate the <cfparam> tag within CFSCRIPT.
 * Rewritten by RCamden
 * V2 mods by John Farrar
 * 
 * @param varname 	 The name of the variable. 
 * @param value 	 The default value. If not passed, use  
 * @return Returns the value of the variable parammed. 
 * @author Fred T. Sanders (fred@fredsanders.com) 
 * @version 2, November 13, 2001 
 */
function cfparam(varname) {
	var value = "";
	
	if(arrayLen(Arguments) gt 1) value = Arguments[2];
	if(not isDefined(varname)) setVariable(varname,value);
        return evaluate(varname);
}
</cfscript>

<!---
 Serve system checks for nagios or other monitoring solutions.
 
 @param sCheckType 	 Type to check. Values are jvmMem, reqTime, queu. Defaults to jvmMem. (Optional)
 @return Returns a struct. 
 @author Sigi (siegfried.heckl@siemens.com) 
 @version 1, October 10, 2011 
--->
<cffunction name="checkHealth" access="public" output="false" returntype="struct" hint="serve system checks for nagios or other monitoring solutions">
  <cfargument name="sCheckType" type="string" default="jvmMem" hint="(jvmMem|reqTime|queu)" />

  <cfscript>
    var sAdminPwd  = 'topsecret'; //password for your CF-Admin-Login
    var adminObj   = {}; //not defined here to avoid unnecessary overhead
    var runtimeObj = {}; //not defined here to avoid unnecessary overhead
    var strHeart   = {}; //not defined here to avoid unnecessary overhead
    var strReturn  = { typ = arguments.sCheckType, value = 0, health = 0 };

    switch(arguments.sCheckType) {
      case 'jvmMem': {
        try {
          runtimeObj      = CreateObject("java","java.lang.Runtime").getRuntime();
          strReturn.value = int((runtimeObj.totalMemory()/runtimeObj.maxMemory())*100);
          if(strReturn.value GT 70) { //percent memory userd, warning level
            strReturn.health = 1;
            if(strReturn.value GT 85) { //percent memory userd, critical level
              strReturn.health = 2;
            }
          }
        }
        catch(any err) {
          strReturn.health = 3;
        }
        break;
      }
      case 'reqTime': {
        try {
          adminObj = createObject("component","cfide.adminapi.administrator").login(sAdminPwd);
          strHeart = createObject("component","cfide.adminapi.servermonitoring").getHeartbeat();
          strReturn.value = strHeart.avgTime;
          if(strHeart.avgTime GT 2000) { //average request time, warning level
            strReturn.health = 1;
            if(strHeart.avgTime GT 8000){ //average request time, critical level
              strReturn.health = 2;
            }
          }
        }
        catch(any err) {
          strReturn.health = 3;
        }
        break;
      }
      case 'queu': {
        try {
          adminObj = createObject("component","cfide.adminapi.administrator").login(sAdminPwd);
          strHeart = createObject("component","cfide.adminapi.servermonitoring").getHeartbeat();
          strReturn.value = strHeart.reqQueued;
          if(strHeart.reqQueued GT 3) { //queued requests, warning level
            strReturn.health = 1;
            if(strHeart.reqQueued GT 6) {//queued requests, critical level
              strReturn.health = 2;
            }
          }
        }
        catch(any err) {
          strReturn.health = 3;
        }
        break;
      }
      default: {
        strReturn.health = 3;
        break;
      }
    }
    return strReturn;
  </cfscript>
</cffunction>

<cfscript>
/**
 * Returns a globally unique Content ID value.
 * 
 * @return Returns a string. 
 * @author John Bartlett (jbartlett@strangejourney.net) 
 * @version 1, July 13, 2005 
 */
function CID() {
  // Create a globally unique identifier
  return lCase(CreateUUID() & "@" & listFirst(cgi.server_name,"."));
}
</cfscript>

<cfscript>
/**
 * Attempts to deduce the visitor's locale.
 * 
 * @return Returns a string. 
 * @author Matthew Walker (matthew@cabbagetree.co.nz) 
 * @version 1, April 23, 2002 
 */
function ClientLocale() {
	var FirstLocale = SpanExcluding(CGI.HTTP_ACCEPT_LANGUAGE, ",;");
	var LanguageCode = ListFirst(FirstLocale, "-");
	var CountryCode = "";
	if ( ListLen(FirstLocale, "-") EQ 2 )
		CountryCode = ListGetAt(FirstLocale, 2, "-");
	switch(LanguageCode){
  			case "nl":
			switch(CountryCode){
  					case "be":
     					return "Dutch (Belgian)";
				default:
     					return "Dutch (Standard)";
			}		
		case "en":
			switch(CountryCode){
  					case "au":
     					return "English (Australian)";
				case "ca":
     					return "English (Canadian)";
				case "nz":
     					return "English (New Zealand)";
				case "gb":
     					return "English (UK)";
				case "us":
     					return "English (US)";
				default:
					return "English (UK)";
			}		
		case "fr":
			switch(CountryCode){
				case "be":
					return "French (Belgian)";
				case "ca":
					return "French (Canadian)";
				case "ch":
					return "French (Swiss)";
				default:
					return "French (Standard)";
			}
		case "de":
			switch(CountryCode){
				case "at":
					return "German (Austrian)";
				case "ch":
					return "German (Swiss)";
				default:
					return "German (Standard)";
			}		
		case "it":
			switch(CountryCode){
				case "ch":
					return "Italian (Swiss)";
				default:
					return "Italian (Standard)";
			}	
		case "nb":
			return "Norwegian (Bokmal)";	
		case "nn":
			return "Norwegian (Nynorsk)";
		case "pt":
			switch(CountryCode){
				case "br":
					return "Portuguese (Brazilian)";
				default:
					return "Portuguese (Standard)";
			}	
		case "es":
			switch(CountryCode){
				case "mx":
					return "Spanish (Mexican)";
				default:
					return "Spanish (Modern)";
			}		
	    default:
    			return GetLocale();
	}		
}
</cfscript>

<cfscript>
/**
 * Returns the closest web safe hexadecimal color for a given hexadecimal color.
 * 
 * @param hexInput 	  (Required)
 * @return Returns a string. 
 * @author Tony Brandner (tony@brandners.com) 
 * @version 1, July 15, 2013 
 */
function closestWebSafeColor(hexInput) {
  var cleanHexInput = replace(hexInput,'##','','ALL');
  var hexOutput = '';
  var i = 0;
  if (Len(ReReplace(cleanHexInput, "[0-9abcdefABCDEF]", "","ALL")) eq 0 and Len(cleanHexInput) eq 6) {
    for (i=1; i lte 5; i=i+2) {
      closestMatch = 51 * Round((InputBaseN(mid(cleanHexInput,i,2),16)/51));
      if (closestMatch eq 0) {
        hexOutput = hexOutput & '00';
	} 
      else {
        hexOutput = hexOutput & FormatBaseN(closestMatch,16);
      }
    }
    return hexOutput;
  } 
  else {
    return 'invalid';
  }
}
</cfscript>

<!---
 Call this function, passing in a collection name, to see if that named Verity colleciton exists.
 Version 1 by Pete Ruckelshaus, pruckelshaus@yahoo.com
 Raymond Camden modified version 2 a bit.
 
 @param collection 	 Name of collection (Required)
 @return Returns a boolean. 
 @author Dan G. Switzer, II (dswitzer@pengoworks.com) 
 @version 2, March 10, 2006 
--->
<cffunction name="collectionExists" returnType="boolean" output="false" hint="This returns a yes/no value that checks for the existence of a named collection.">
	<cfargument name="collection" type="string" required="yes">

	<!---// by default return true //--->
	<cfset var bExists = true />
	<cfset var searchItems = "">
	
	<!---// if you can't search the collection, then assume it doesn't exist //--->
	<cftry>
		<cfsearch
			name="searchItems"
			collection="#arguments.collection#"
			type="simple"
			criteria="#createUUID()#"
			/>
		<cfcatch type="any">
			<!---// if the message contains the string "does not exist", then the collection can't be found //--->
			<cfif cfcatch.message contains "does not exist">
				<cfset bExists = false />
			<cfelse>
				<cfrethrow>
			</cfif>
		</cfcatch>
	</cftry>

	<!---// returns true if search was successful and false if an error occurred //--->
	<cfreturn bExists />

</cffunction>

<!---
 Returns a hexadecimal color value an amount lighter or darker than the provided color.
 
 @param hexColor 	 starting hex color (Required)
 @param shade 	 amount hexColor should be incremented(+)/decremented(-) (Required)
 @return returns a string 
 @author Bob Gray (gray.bob98@gmail.com) 
 @version 0, March 3, 2010 
--->
<cffunction name="ColorShade" returntype="string">

<cfargument name="hexColor" type="string" required="yes">
<cfargument name="shade" type="numeric" required="yes">
    
<cfset var red = "">
<cfset var green = "">
<cfset var blue = "">
<cfset var s = ARGUMENTS.shade>
<cfset var incrementedColor = ""> 

<cfset red = Left(ARGUMENTS.hexColor, 2)>
<cfset green = Mid(ARGUMENTS.hexColor, 3, 2)>
<cfset blue = Right(ARGUMENTS.hexColor, 2)>
	
<cfset red = NumberFormat(InputBaseN(red, 16), 00)>
<cfset green = NumberFormat(InputBaseN(green, 16), 00)>
<cfset blue = NumberFormat(InputBaseN(blue, 16), 00)>	
	
<cfset red = IIF(s LT 0, red * (s + 100) / 100, red + (255 - red) * s / 100)>
<cfset green = IIF(s LT 0, green * (s + 100) / 100, green + (255 - green) * s / 100)>
<cfset blue = IIF(s LT 0, blue * (s + 100) / 100, blue + (255 - blue) * s / 100)>
    
<cfset red = UCase(FormatBaseN(red, 16))>
<cfset green = UCase(FormatBaseN(green, 16))>
<cfset blue = UCase(FormatBaseN(blue, 16))>
    
<cfset red = IIF(Len(red) LT 2, DE(0&red), DE(red))>
<cfset green = IIF(Len(green) LT 2, DE(0&green), DE(green))>
<cfset blue = IIF(Len(blue) LT 2, DE(0&blue), DE(blue))>
    
<cfset incrementedColor = UCase(red&green&blue)>
    
<cfreturn incrementedColor>
    
</cffunction>

<cfscript>
/**
 * Counts down to a date.
 * 
 * @param dateToApproach 	 Date to count down to. (Required)
 * @param returnMode 	 Either "text" or "struct." If text, returns a string, otherwise returns structure with keys for years, months, days, hours, and minutes. (Optional)
 * @return Returns a string or structure. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, October 11, 2002 
 */
function countdown(dateToApproach){
	//what mode should we return?  by default, return text
	var returnMode = "text";
	//parse the dateToApproach argument
	var dateToUse = parseDateTime(dateToApproach);
	//grab now(), so we don't have to do it over and over
	var rightNow = now();
	//a struct to hold the data for the countdown
	var countdownData = structNew();
	//a string used to return
	var returnString = "";
	//var to hold the sum to determine if it has passed
	var sum = "";
	//a var to tack on the beginning and end of string return
	var prefix = "";
	var suffix = "";
	//if there is a second argument, make that the returnMode
	if(arrayLen(arguments) GT 1)
		returnMode = arguments[2];
	//get the absolute difference in years, months, days, hours, minutes and seconds	
	countdownData.years = dateDiff("yyyy",rightNow,dateToUse);
	countdownData.months = dateDiff("m",rightNow,dateToUse);
	countdownData.days = dateDiff("d",rightNow,dateToUse);		
	countdownData.hours = dateDiff("h",rightNow,dateToUse);
	countdownData.minutes = dateDiff("n",rightNow,dateToUse);
	countdownData.seconds = dateDiff("s",rightNow,dateToUse) - (60*countdownData.minutes);
	//now go back through them in reverse order and delete off the appropriate units
	countdownData.minutes = countdownData.minutes - (60*countdownData.hours);
	countdownData.hours = countdownData.hours - (24*countDownData.days);
	countdownData.days = countdownData.days - dateDiff("d",dateAdd("m",-1*countDownData.months,dateToUse),dateToUse);
	countdownData.months = countdownData.months - (12*countdownData.years);		
	//if we're returning a struct, just do it
	if(returnMode is "struct")
		return countdownData;
	//otherwise, we'll output a string
	//first, gather the sum, to know if it's future or past
	sum = countDownData.years + countdownData.months + countdownData.days + countdownData.hours + countdownData.minutes + countdownData.seconds;
	//if the sum is 0, it's right now!
	if(NOT sum)
		return "Right Now!";
	//if the sum is negative, it's in the past, so multiply -1 for display purposes
	if(sum LT 0){
		countdownData.seconds = countdownData.seconds * -1;
		countdownData.minutes = countdownData.minutes * -1;
		countdownData.hours = countdownData.hours * -1;
		countdownData.days = countdownData.days * -1;
		countdownData.months = countdownData.months * -1;
		countdownData.years = countdownData.years * -1;
		prefix = "passed ";
		suffix = " ago";
	}
	//add the suffix
	returnString = returnString & prefix;		
	//build the return string  -- showing only the units that are non 0
	if(countDownData.years)
		returnString = returnString & countdownData.years & " years ";
	if(countdownData.months)
		returnString = returnString & countdownData.months & " months ";
	if(countdownData.days)
		returnString = returnString & countdownData.days & " days ";
	if(countdownData.hours)
		returnString = returnString & countdownData.hours & " hours ";
	if(countdownData.minutes)
		returnString = returnString & countdownData.minutes & " minutes ";
	if(countdownData.seconds)
		returnString = returnString & countdownData.seconds & " seconds";
	//add the suffix
	returnString = returnString & suffix;
	//return the string
	return returnString;
}
</cfscript>

<cfscript>
/**
 * I loop through a struct that contains keys set to boolean values and return count of how many keys evaluate true.
 * v0.1 by Alan McCollough
 * v1.0 by Adam Cameron.  VARing
 * 
 * @param strc 	 A struct to count positive booleans (Required)
 * @return Returns a numeric value that is the number of boolean TRUE values found in the struct 
 * @author Alan McCollough (amccollough@anthc.org) 
 * @version 1.0, September 16, 2012 
 */
function countTrueBoolKeysInStruct(strc){
	var x = 0;
	var i = 0;
	for(i in strc) {
		if (isBoolean(strc[i]) && strc[i]){
			x++;
		}
	};
	return x;
};
</cfscript>

<cfscript>
/**
 * Creates BlazeDS destination at runtime
 * 
 * @param destname 	 Destination name. (Required)
 * @param channelId 	 Channel ID. (Required)
 * @return Returns a destination object. 
 * @author Marko Simic (marko.simic@gmail.com) 
 * @version 1, March 20, 2010 
 */
function createDestination(destname, channelId){
	var local = structNew();
	
	local.brokerClass = createObject('java','flex.messaging.MessageBroker');
	local.broker = local.brokerClass.getMessageBroker( javacast('null','') );
	local.service = local.broker.getService('message-service');
	local.destinations = local.service.getDestinations();
	
	//check if destination already exists. If it does just return it
	if (structKeyExists(local.destinations,arguments.destname)){ //check if destination already exist
		return local.destinations[arguments.destname];	
	}
	
	// Creates a ServiceAdapter instance and sets its id, sets if destination  is manageable
	local.destination = local.service.createDestination(arguments.destname);
	local.destination.createAdapter('cfgateway');
	
	local.configMap = createObject('java','flex.messaging.config.ConfigMap').init();
	local.configMap.addProperty('gatewayid',application.CFEventGatewayId);
	
	local.ss = createObject("java","flex.messaging.config.ServerSettings");
	local.ss.setAllowSubtopics(true); 
	local.ss.setSubtopicSeparator('.');
	local.ss.setDurable(false);
	
	local.destination.setServerSettings(ss);
	
	local.adapter = local.destination.getAdapter();
	
	//Initializes the adapter with the properties.
	local.adapter.initialize('cfgateway',configMap);
			
	local.destination.addChannel(arguments.channelId);
	
	//Starts the destination if its associated Service is started and if the destination is not already running. 
	local.destination.start();
	
	return local.destination;
}
</cfscript>

<cfscript>
/**
 * Create channel and endpoint at runtime
 * 
 * @param channelId 	 Channel ID. (Required)
 * @return Returns nothing. 
 * @author Marko Simic (marko.simic@gmail.com) 
 * @version 1, March 20, 2010 
 */
function createEndpoint(channelId){
		var local = structNew();
	
		local.brokerClass = createObject('java','flex.messaging.MessageBroker');
		local.broker = local.brokerClass.getMessageBroker( javacast('null','') );
		local.channelSets = local.broker.getAllChannelSettings();
		local.chennIds = local.broker.getChannelIds();
	
		//check if channel/endpoint is already created
		if (arrayContains(local.chennIds,arguments.channelId)){
			return;
		}
	
		//Channel definiton properties
		local.channelSettings = createObject('java','flex.messaging.config.ChannelSettings').init(arguments.channelId);
		local.channelProperties = createObject('java','flex.messaging.config.ConfigMap').init();
		local.chPropSerialize = createObject('java','flex.messaging.config.ConfigMap').init();  
	
		local.channelSettings.setClientType("mx.messaging.channels.AMFChannel");
		local.channelSettings.setEndpointType("coldfusion.flash.messaging.CFAMFEndPoint");
		local.channelSettings.setUri("http://{server.name}:{server.port}{context.root}/flex2gateway/cfamflongpolling");
	
		local.channelProperties.addProperty("add-no-cache-headers","false"); 
		local.channelProperties.addProperty("polling-enabled","true");
		local.channelProperties.addProperty("polling-interval-seconds","0");
		local.channelProperties.addProperty("client-wait-interval-millis","1");
		local.channelProperties.addProperty("wait-interval-millis","60000");
		local.channelProperties.addProperty("max-waiting-poll-requests","200");
	
		local.chPropSerialize.addProperty("enable-small-messages","false");
		local.channelProperties.addProperty("serialization",local.chPropSerialize); 
	
		local.channelSettings.addProperties(local.channelProperties);
	
		//Creates an Endpoint instance, sets its id and url
		local.endpoint = local.broker.createEndpoint(
						arguments.channelId, 
						"http://{server.name}:{server.port}{context.root}/flex2gateway/cfamflongpolling",
						local.channelSettings.getEndpointType());
		// Initialize the endpoint with id and properties
		local.endpoint.initialize(arguments.channelId, local.channelSettings.getProperties());
		//Start the endpoint
		local.endpoint.start();
	
		local.channelSets[arguments.channelId] = local.channelSettings;
		local.broker.setChannelSettings(local.channelSets);
	}
</cfscript>

<cfscript>
/**
 * Allows one to use virtual paths to Java objects.
 * Returns a Java object for a given virtual path. 
 * This allows you to place your Java class files 
 * anywhere you want. Based on Stephen Milligan's blog entry at http://www.spike.org.uk/blog/index.cfm?data=20040603#EBB52433-D565-E33F-353D2664926C59B5
 * 
 * @param directory 	 Directory where the class can be found. (Required)
 * @return Returns a Java object. 
 * @author Wayne Graham (wsgrah@wm.edu) 
 * @version 1, October 19, 2004 
 */
function createJavaObject(directory){
	var URLObject = createObject("java", "java.net.URL");
	var ArrayClass = createObject("java","java.lang.reflect.Array");
	var loader = createObject("java","java.net.URLClassLoader");
	var URLArray = "";
	
	directory = replace(expandPath(directory), "\", "/", "all");		
	URLObject.init("file:" & directory);
	URLArray = createObject("java", "java.lang.reflect.Array").newInstance(URLObject.getClass(), 1);
		
	ArrayClass.set(URLArray,0,URLObject);
	return loader.init(URLArray);
}
</cfscript>

<cfscript>
/**
 * Used to create an Ordered Numeric List
 * v2 mods by Raymond Camden
 * 
 * @param st 	 Start number. (Required)
 * @param end 	 End number. (Required)
 * @param step 	 Step value. Defaults to 1. (Optional)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Mike Gillespie (mike@striking.com) 
 * @version 1, September 28, 2006 
 */
function createOrderedList(st,end) {
	var theList="";
	var delim=",";
	var step=1;

	// 3rd argument sets the step increment
	if(arraylen(arguments) gte 3) step=arguments[3];

	//4th argument sets the delim
	if(arraylen(arguments) eq 4) delim=arguments[4];

	if(st gte end) for(i = st;i gte end;i=i-step) theList=listappend(theList,i,delim);		
	else for(i = st;i lte end;i=i+step) theList=listappend(theList,i,delim);		

	return theList;
}
</cfscript>

<cfscript>
/**
 * CssPtScale increases the point size of text by one point for browsers other than Microsoft Internet Explorer.
 * 
 * @param size 	 Size to use. (Required)
 * @return Returns a number along with the string 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, December 23, 2002 
 */
function CssPtScale(size){
	if (http_user_agent DOES NOT CONTAIN "MSIE") return "#val(size+1)#pt";
	else return "#size#pt";
}
</cfscript>

<!---
 Return the calling template for a custom tag.
 
 @return Returns a string. 
 @author Matthew Walker (matthew@electricsheep.co.nz) 
 @version 1, May 9, 2003 
--->
<cffunction name="customTagContext">
	<cfset var parentTemplate = "">
	<cftry>
		<cfthrow>
		<cfcatch>
			<cfif arrayLen(cfcatch.tagcontext) gte 3>
				<cfset parentTemplate = cfcatch.tagcontext[3].template>
			</cfif>
		</cfcatch>
	</cftry>
	<cfreturn parentTemplate>
</cffunction>

<!---
 Outputs a load of variables for debugging purposes.
 
 @param scopes 	 Scopes to display. Must be one of: variables,form,url,request,cookie,session,client,application,server,cgi (Optional)
 @return Returns a string. 
 @author Eric C. Davis (cflib@10mar2001.com) 
 @version 1, April 30, 2003 
--->
<cffunction name="debugVars" output="true" returntype="string" access="public" hint="Output more extensive debugging information than just the CF debug info" displayname="DebugVars()">
   <cfargument name="scopes" required="false" default="variables,form,url,request,cookie,session,client,application,server,cgi" hint="Scopes to be dumped" type="string" displayname="Scopes" />
   <cfsavecontent variable="returnVar">
      <cfloop list="#arguments.scopes#" index="myScope" delimiters=",">
         <cftry>
            <cfdump label="#Trim(myScope)#" var="#Evaluate(Trim(myScope))#" />
            <cfcatch>
               <cfoutput>
                  #cfcatch.Message#
               </cfoutput>
            </cfcatch>
         </cftry>
      </cfloop>
   </cfsavecontent>
   <cfreturn returnVar />
</cffunction>

<cfscript>
/**
 * You provide me with a decimal number, and a string for a column name and I will return to you a query containing of the decimal values for each resulting non-zero value when your number is converted to binary.
 * 
 * @param decVal 	 Decimal value. (Required)
 * @param colName 	 Query column name to use. (Required)
 * @return Returns a query. 
 * @author Alan McCollough (amccollough@anmc.org) 
 * @version 1, November 3, 2005 
 */
function decBitwiseToQuery(decVal,colName) {
	// create an empty counter
	var i = "";
	// create an empty 'current value'
	var cur = "";
	// convert decimal val to binary
	var bVal = FormatBaseN(val(decVal), 2);
	// set our binary seed to 1, the first place in the binary system
	var b = 1;
	
	// create a query object
	var qry = queryNew(colName);
	
	// loop through the places in the binary number, going from right to left.
	// Note, this is a brute-force method, and I'm sure some smart person out there
	// could figure out how to do this with pure bitwise functions. Me, I'm not that person.
	for(i = len(bVal); ; i = i - 1) {
			// set cur to the decimal value of the current binary place value
			cur = val(b * mid( bVal , i , 1 ));
			
			// If the result is greater than zero, add the result as a row to the query
			if (cur gt 0) {
				queryAddRow(qry);
				querySetCell(qry,colName,cur);
			};
				
			// double the value of our binary seed, for the next place if necessary
			b = 2 * b;
			
			//exit loop when the last place is processed
			if (i eq 1) break;
		}
	
	// return the query object
	return qry;
}
</cfscript>

<cfscript>
/**
 * Converts decimal number to list of binary place values.
 * 
 * @param decVal 	 Decimal value. (Required)
 * @return Returns a string. 
 * @author Alan McCollough (amccollough@anmc.org) 
 * @version 1, November 3, 2005 
 */
function decToBinValList(decVal) {
	// create an empty counter
	var i = "";		
	// create an empty 'current value'
	var cur = "";
	// convert decimal val to binary
	var bVal = FormatBaseN(val(decVal), 2);
	// set our binary seed to 1, the first place in the binary system
	var b = 1;
	// create an empty list to hold the results
	var resultList = "";
	
	// loop through the places in the binary number, going from right to left.
	for(i = len(bVal); ; i = i - 1) {			
			cur = val(b * mid( bVal , i , 1 ));
			if (cur gt 0) resultList = listAppend(resultList,cur);

			// double the value of our binary seed
			b = 2 * b;
			//exit loop when the last bit is processed	
			if (i eq 1) break;
		}
	
	// return the list	
	return resultList;
}
</cfscript>

<cfscript>
/**
 * A function to hand of a job to a separate thread
 * v1.0 by Adam Cameron
 * v1.1 by Adam Cameron (added getThreadId(), made thread names unique, fixed logic error around onError())
 * 
 * @param job 	 The code to defer (Required)
 * @param onSuccess 	 Handler to run if job code completes without error (Optional)
 * @param onFailure 	 Handler to run if job code errors (Optional)
 * @param onError 	 Handler to run if defer() code errors (Optional)
 * @param onTerminate 	 Handler to run if terminate is called (Optional)
 * @return A struct containing functions getStatus(), getThreadId() and terminate() 
 * @author Adam Cameron (dac.cfml@gmail.com) 
 * @version 1.1, October 21, 2013 
 */
public struct function defer(required function job, function onSuccess, function onFailure, function onError, function onTerminate){
	var threadId = "deferredThread_#createUuid()#";

	local[threadId] = "";

	try {
		cfthread.status = "Running";
		thread name=threadId action="run" attributecollection=arguments {
			try {
				successData.result = job();
				cfthread.status = "Completed";
				if (structKeyExists(attributes, "onSuccess")){
					onSuccess(successData);
				}
			} catch (any e){
				cfthread.status = "Failed";
				if (structKeyExists(attributes, "onFailure")){
					onFailure(e);
				}else{
					rethrow;
				}
			}
		}
	} catch (any e){
		cfthread.status = "Errored";
		if (structKeyExists(arguments, "onError")){
			onError(e);
		}else{
			rethrow;
		}
	}
	return {
		getStatus = function(){
			return cfthread.status;
		},
		getThreadId = function(){
			return threadId;
		},
		terminate = function(){
			if (cfthread.status == "Running"){
				thread name=threadId action="terminate";
				cfthread.status = "Terminated";
				if (isDefined("onTerminate")){
					onTerminate();
				}
			}
		}
	};
}
</cfscript>

<!---
 Force recompiling of a page in the cfclasses cached folder.
 
 @param cachedFile 	 Filename, or partial filename. (Required)
 @return Returns a boolean. 
 @author Nathan Strutz (mrnate@hotmail.com) 
 @version 1, May 13, 2003 
--->
<cffunction name="DeleteCFCache" output="false" returntype="boolean">
	<cfargument name="cachedFile" required="Yes" type="string">
	
	<cfset var qryDir = "">

	<!--- cfcache puts url encoding on files, lowercases them and removes percent signs --->
	<cfset arguments.cachedFile = URLEncodedFormat(arguments.cachedFile)>
	<cfif reFindNoCase("%2[A-Z]",arguments.cachedFile)>
		<cfset arguments.cachedFile = Replace(REReplace(arguments.cachedFile,"%2[A-Z]{1,1}",LCase(Mid(arguments.cachedFile,REFind("%2[A-Z]{1,1}",arguments.cachedFile),3)),"ALL"),"%","","ALL")>
	</cfif>
	
	<cfdirectory action="LIST" directory="#server.coldfusion.rootdir#\wwwroot\WEB-INF\cfclasses\" name="qryDir">
	<cfquery name="qryDir" dbtype="query">
		SELECT name
		FROM qryDir
		WHERE name like '%#arguments.cachedFile#%'
	</cfquery>
	<cfif not qryDir.recordcount>
		<cfreturn false>
	</cfif>
	<cfloop query="qryDir">
		<cffile action="DELETE" file="#server.coldfusion.rootdir#\wwwroot\WEB-INF\cfclasses\#qryDir.name#">
	</cfloop>
	<cfreturn true>
</cffunction>

<cfscript>
/**
 * This function deletes all client variables for a user.
 * Version 2 mods by Tony Petruzzi
 * 
 * @param safeList 	 A list of client vars to NOT delete. 
 * @return Returns true. 
 * @author Bernd VanSkiver (bernd@shadowdesign.net) 
 * @version 2, January 29, 2002 
 */
function DeleteClientVariables() {
	var ClientVarList = GetClientVariablesList();
	var safeList = "";
	var i = 1;

	if(ArrayLen(Arguments) gte 1) safeList = Arguments[1];

	for(i=1; i lte listLen(ClientVarList); i=i+1) {
		if(NOT ListFindNoCase(safeList, ListGetAt(ClientVarList, i )))  DeleteClientVariable(ListGetAt(ClientVarList, i));
	}
	return true;
}
</cfscript>

<cfscript>
/**
 * Deletes the doctype out of the current page request.
 * 
 * @return Returns nothing. 
 * @author Nathan Strutz (mrnate@hotmail.com) 
 * @version 1, July 11, 2005 
 */
function deleteDoctype() {
	var str = getPageContext().getOut().getString();
	str = reReplace(str,"<!DOCTYPE[^>]*>","","ONE");
	getPageContext().popBody().clearBuffer();
	writeOutput(str);
}
</cfscript>

<cfscript>
/**
 * Removes specified fields from a form structure.
 * 
 * @param fieldList 	 List of fields to return. (Required)
 * @return Returns nothing. 
 * @author Tom Young (tom@thenewmediagroup.com) 
 * @version 1, June 12, 2003 
 */
function deleteFormFields(fieldList) {
	var listIndex = 1;
	var i = 1;
	fieldList = ListToArray(fieldList);
	for(i = 1; i lte ArrayLen(fieldList); i = i + 1) {
		StructDelete(form, fieldList[i]);
		listIndex = ListFindNoCase(form.fieldnames, fieldList[i]);
		form.fieldnames = ListDeleteAt(form.fieldnames, listIndex);
	}
}
</cfscript>

<cfscript>
/**
 * This UDF translates a dogs age to a humans age.
 * 
 * @param age 	 The age of the dog. 
 * @author David Fekke (david@fekke.com) 
 * @version 1, February 14, 2002 
 */
function DogYearsToHumanYears(DogAge) {
 return ((DogAge - 1)* 7) + 9;
}
</cfscript>

<cfscript>
/**
 * Returns estimated download time for a 56k modem given the file size.
 * 
 * @param fileSize 	 File size in bytes. (Required)
 * @return Returns a string. 
 * @author William Steiner (williams@hkusa.com) 
 * @version 1, November 1, 2002 
 */
function DownLoadTime56k(fileSize) {
	var totalSeconds = (fileSize * 10) / 57600;
	var tempstring = "";
	var tempstring2 = "";
	var hours = totalSeconds / 3600;
	var minutes = totalSeconds / 60;
	var seconds = totalSeconds MOD 60;
	var hourText = "";
	var minuteText = "";

	// if over 60 minutes...get just minutes left from hours
	if (minutes gte 60) minutes = minutes MOD 60;
	
	if (hours gte 1) {
		if (hours gt 2) hourText = " hours ";
		else hourText = " hour ";
		tempstring = Fix(hours) & hourText;
	}

	if (minutes gte 1) {
		if (minutes gt 2) minuteText = " minutes ";
		else minuteText = " minute ";
		tempstring = tempstring & Fix(minutes) & minuteText;
	}
	
	if (seconds gt 0) tempstring = tempstring & seconds & " seconds";

	return tempstring ;
}
</cfscript>

<cfscript>
/**
 * Dumps out variables/structs in simple text format.
 * Original version used evaluate, so I modified it to require a real var passed in. (ray@camdenfamily.com)
 * 
 * @param variable 	 Variable to dump. (Required)
 * @return Returns nothing, but outputs directly to screen. 
 * @author Doug Gibson (email@dgibson.net) 
 * @version 2, August 22, 2007 
 */
function dumpVarList(variable) { 
	
	// ASSIGN THE delim
	var delim="#Chr(13)##Chr(10)#";
	var var2dump=arguments.variable;
	var label = "";
	var newdump="";
	var keyName="";
	var loopcount=0;
	
	if(arrayLen(arguments) gte 2) delim=arguments[2];
	if(arrayLen(arguments) gte 3) label=arguments[3];
	
	// THE VARIABLE IS A SIMPLE VALUE, SO OUTPUT IT
	if(isSimpleValue(var2dump)) {
		if(label neq "") writeOutput(uCase(label) & " = " & variable & delim);
		else writeOutput(variable & delim);
	} else if(isArray(var2dump)){
		if(label neq "") writeOutput(uCase(label) & " = [Array]" & delim);
		else writeOutput("[Array]" & delim);
		for(loopcount=1; loopcount lte arrayLen(var2dump); loopCount=loopcount+1) {
	 		if(isSimpleValue(var2dump[loopcount])) writeOutput("[" & loopcount & "] = " & var2dump[loopcount] & delim);
			else DumpVarList(var2dump[loopcount],delim,label);
		}
	}
		// THE VARIABLE IS A STRUCT, SO LOOP OVER IT AND OUTPUT ITS KEY VALUES
	else if(isStruct(var2dump)) {
		if(label neq "") writeOutput(uCase(label) & " = [Struct]" & delim);
		else writeOutput("[Struct]" & delim);
		for(keyName in var2dump) {
			if(isSimpleValue(var2dump[keyName])) {
				if(label neq "") writeOutput(uCase(label) & "." & uCase(keyname) & " = " & var2dump[keyName] & delim);
				else writeOutput(uCase(keyname) & " = " & var2dump[keyName] & delim);
			}
			else dumpVarList(var2dump[keyName],delim,keyname);
		}
	}
		// THE VARIABLE EXISTS, BUT IS NOT A TYPE WE WISH TO DUMP OUT
	else {
		if(label neq "") writeOutput(uCase(label) & " = [Unsupported type]" & delim);
		else writeOutput("[Unsupported type]" & delim);
	}

	return;
}
</cfscript>

<!---
 This UDF will enable or disable debugging service with Admin access
 
 @param what 	 Either enable or disable.  (Required)
 @return Returns nothing. 
 @author Qasim Rasheed (qasim_1976@yahoo.com) 
 @version 1, April 14, 2005 
--->
<cffunction name="enableDisableDebugging" output="false" returntype="void" hint="I enable/disable debugging settings">
	<cfargument name="what" type="string" required="true" />	
	<cfset var db_service = createobject("java","coldfusion.server.ServiceFactory").getDebuggingService()>
	
	<cfif arguments.what eq "enable">
		<cfif not db_service.isEnabled()>
			<cfset db_service.setEnabled(true)>
		</cfif>
	<cfelseif arguments.what eq "disable">
		<cfif db_service.isEnabled()>
			<cfset db_service.setEnabled(false)>
		</cfif>
	</cfif>
</cffunction>

<!---
 This function will enable or disable whitespace management in ColdFusion Server without access to ColdFusion Administrator.
 
 @param action 	 Either disable or enable. Defaults to enable. (Optional)
 @return Returns a boolean. 
 @author Qasim Rasheed (qasim_1976@yahoo.com) 
 @version 1, February 14, 2004 
--->
<cffunction name="enableDisableWhiteSpaceManagement" output="false" returntype="boolean">
	<cfargument name="action" type="string" default="enable" />
	<cfscript>
		var factory = CreateObject("Java","coldfusion.server.ServiceFactory");
		var runtime = "";
		
	</cfscript>
	<cflock name="factory_runtimeservice" type="exclusive" timeout="5">
		<cfset runtime = factory.getRuntimeService()>
		<cfswitch expression="#arguments.action#">
			<cfcase value="enable">
				<cfif not runtime.WhiteSpace>
					<cfset runtime.setWhiteSpace("YES")>
				</cfif>
			</cfcase>
			<cfcase value="disable">
				<cfif runtime.WhiteSpace>
					<cfset runtime.setWhiteSpace("NO")>
				</cfif>
			</cfcase>
		</cfswitch>
	</cflock>
	<cfreturn runtime.WhiteSpace />
</cffunction>

<cfscript>
/**
 * Returns different colors if the number passed to it is even or odd.
 * Modified by RCamden
 * 
 * @param num 	 The number to check for even/oddness. 
 * @param evencolor 	 The color to use for even numbers. 
 * @param oddcolor 	 The color to use for odd numbers. 
 * @return Returns a string. 
 * @author Mark Andrachek (hallow@webmages.com) 
 * @version 1.1, November 27, 2001 
 */
function EvenOddColor(num,evencolor,oddcolor) {
    return Arguments[(num mod 2 )+ 2];
}
</cfscript>

<!---
 Converts an Excel Column Name to its numeric column position.
 
 @param columnNamePassIn 	 Column name (as string) to convert. (Required)
 @return Returns a number. 
 @author Nolan Erck (nolan.erck@gmail.com) 
 @version 1, August 22, 2011 
--->
function excelColumnNameToColumnNumber( columnNamePassedIn ) {
	var columnName = UCase( Trim( arguments.columnNamePassedIn ) ); // clean up our data a bit to make some ASCII math easier...
	var colLength  = Len( Trim( columnName ) );
	var cur_Char   = "";
	var index      = colLength;
	var columnNumber = 0;
	var expBase    = 26;
	var digitPlaceHolder = 0;
	var subTotal   = 0;

	while( index gt 0 )
	{
		cur_Char     = Mid( columnName, index, 1 );
		columnNumber = ( ( Asc( cur_Char ) - 64 ) * ( expBase ^ digitPlaceHolder ) );
		subTotal    += columnNumber;

		index--;		
		digitPlaceHolder++;
	}

	return subTotal;
}

<cfscript>
/**
 * Converts a numeric column position to its Excel Column Name
 * 
 * @param columnName 	 Numeric column number. (Required)
 * @return Returns a string. 
 * @author Adam Tuttle (adam@fusiongrokker.com) 
 * @version 1, May 3, 2010 
 */
function excelColumnNumtoColumnName(columnNumber){
	var dividend = fix(arguments.columnNumber); //make sure input is an integer
	var columnName = '';
	var modulo = 0;
	//if dividend <= 0, an empty string will be returned
	while (dividend gt 0){
		modulo = (dividend - 1) mod 26;
		columnName = "#chr(65 + modulo)##columnName#";
		dividend = fix((dividend - modulo) / 26);
	}
	return columnName;
}
</cfscript>

<cfscript>
/**
 * Creates a comma separated list of hex colors forming a gradient between the start color and the end color over a specified number of steps.
 * 
 * @param startcolor 	 RGB value of the initial color. (Required)
 * @param endcolor 	 RGV value of the end color. (Required)
 * @param steps 	 Number of steps for the gradient. (Required)
 * @return Returns a list. 
 * @author Adam Howitt (adamhowitt@yahoo.com) 
 * @version 1, May 22, 2003 
 */
function fadeList(startcolor,endcolor,steps) {
	var outlist=startcolor;
	var decr=0;
	var decg=0;
	var decb=0;
	var newr=0;
	var newg=0;
	var newb=0;
	var ix = 1;

	steps=steps-1;
	decr=(inputbasen(left(startcolor,2),16)-inputbasen(left(endcolor,2),16))/steps;
	decg=(inputbasen(mid(startcolor,3,2),16)-inputbasen(mid(endcolor,3,2),16))/steps;
	decb=(inputbasen(right(startcolor,2),16)-inputbasen(right(endcolor,2),16))/steps;
	for (ix=1;ix lte steps;ix=ix+1) {
		newr=formatbasen(int(inputbasen(left(startcolor,2),16)-(ix*decr)),16);
		if (len(newr) eq 1) {newr="0"&newr;}
		newg=formatbasen(int(inputbasen(mid(startcolor,3,2),16)-(ix*decg)),16);
		if (len(newg) eq 1) {newg="0"&newg;}
		newb=formatbasen(int(inputbasen(right(startcolor,2),16)-(ix*decb)),16);
		if (len(newb) eq 1) {newb="0"&newb;}
		outlist=outlist&","&newr&newg&newb;
	}
	return outlist & "," & endcolor;
}
</cfscript>

<!---
 Causes the current page request to &quot;sleep&quot; for the given duration, before continuing.
 
 @param timeToSleep 	 Number of miliseconds to sleep. (Required)
 @return Returns nothing. 
 @author Nolan Erck (nolan.erck@gmail.com) 
 @version 1, April 11, 2008 
--->
<cffunction name="fakesleep" access="public" returntype="void" output="false">
	<cfargument name="timeToSleep" type="numeric" required="true" hint="the number of miliseconds you wish to sleep for." />

	<cfset var bContinue 	= false />	
	<cfset var startTime 	= getTickCount() />
	<cfset var endTime 		= 0 />
	<cfset var elapsedTime  = 0 />

	<cfloop condition="NOT bContinue">
		<cfset endTime 		= getTickCount() />
		<cfset elapsedTime  = endTime - startTime />
		
		<cfif elapsedTime gte arguments.timeToSleep>
			<cfset bContinue = true />
		</cfif>
	</cfloop>
	
</cffunction>

<!---
 Converts an RSS 0.9+, ATOM or RDF feed into a query.
 
 @param path 	 URL of RSS feed. (Required)
 @return Returns a structure. 
 @author Joe Nicora (joe@seemecreate.com) 
 @version 1, April 9, 2007 
--->
<cffunction name="feedToQuery" returntype="struct" output="false">
	/**
	 * Converts an RSS 0.9+, ATOM or RDF feed into a query.
	 * 
	 * @param path 	 		RSS feed url or file path, must be valid RSS, ATOM or RDF. (Required)
	 * @return 				Returns a structure with meta data and a query. 
	 * @author 				Joe Nicora (joe@seemecreate.com) 
	 * @version 1, 			July 16, 2006 
	 */
	<cfargument name="path" type="string" required="yes" />
	
	<cfset var parsed = "" />
	<cfset var index = 0 />
	<cfset var rows = 0 />
	<cfset var thisArr = arrayNew(1) />
	<cfset var retStruct = structNew() />
	<cfset var XMLText = "" />
	<cfset var retQuery = queryNew("title,link,description") />
	
	<cfif path CONTAINS "://">
		<cfhttp url="#path#" resolveurl="no" />
		<cfset XMLText = cfhttp.fileContent />
	<cfelse>
		<cffile action="read" file="#path#" variable="XMLText">
	</cfif>
	
	<cfscript>
		nodeToReplace = mid(XMLText, 1, evaluate(find("?>", XMLText) + 1));
		XMLText = replaceNoCase(XMLText, nodeToReplace, "", "ALL");
		parsed = XMLParse(XMLText);
		
		if (find("<rdf:RDF", parsed))
		{
			if (isArray(XMLSearch(parsed, "/rdf:RDF/")))
			{
				if (isArray(XMLSearch(parsed, "/channel/")))
				{
					retStruct.channel = structNew();
					if (structKeyExists(parsed["rdf:RDF"]["channel"].XMLAttributes, "rdf:about")) retStruct.channel.about = parsed["rdf:RDF"]["channel"].XMLAttributes["rdf:about"];
					if (structKeyExists(parsed["rdf:RDF"]["channel"], "link")) retStruct.channel.link = parsed["rdf:RDF"]["channel"].link.XMLText;
					if (structKeyExists(parsed["rdf:RDF"]["channel"], "title")) retStruct.channel.title = parsed["rdf:RDF"]["channel"].title.XMLText;
					if (structKeyExists(parsed["rdf:RDF"]["channel"], "description")) retStruct.channel.description = parsed["rdf:RDF"]["channel"].description.XMLText;
					if (structKeyExists(parsed["rdf:RDF"]["channel"].XMLAttributes, "rdf:resource")) retStruct.channel.image = parsed["rdf:RDF"]["channel"].image.XMLAttributes["rdf:resource"];
					retStruct.channel.type = "RDF";
				}
				if (isArray(XMLSearch(parsed, "/item/")))
				{
					for (index = 1; index LTE arrayLen(parsed["rdf:RDF"].XMLChildren); index = index + 1)
					{
						if (parsed["rdf:RDF"].XMLChildren[index].XMLName IS "item")
						{
							rows = rows + 1;
							queryAddRow(retQuery, 1);
							if (structKeyExists(parsed["rdf:RDF"].XMLChildren[index], "title")) querySetCell(retQuery, "title", parsed["rdf:RDF"].XMLChildren[index].title.XMLText, rows);
							if (structKeyExists(parsed["rdf:RDF"].XMLChildren[index], "link")) querySetCell(retQuery, "link", parsed["rdf:RDF"].XMLChildren[index].link.XMLText, rows);
							if (structKeyExists(parsed["rdf:RDF"].XMLChildren[index], "description")) querySetCell(retQuery, "description", parsed["rdf:RDF"].XMLChildren[index].description.XMLText, rows);
						}
					}
				}
				retStruct.query = retQuery;
			}
		}
		if (find("<rss", parsed))
		{
			if (isArray(XMLSearch(parsed, "/rss/")))
			{
				if (isArray(XMLSearch(parsed, "/channel/")))
				{
					retStruct.channel = structNew();
					if (structKeyExists(parsed["rss"]["channel"], "title")) retStruct.channel.title = parsed["rss"]["channel"].title.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "link")) retStruct.channel.link = parsed["rss"]["channel"].link.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "description")) retStruct.channel.description = parsed["rss"]["channel"].description.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "language")) retStruct.channel.language = parsed["rss"]["channel"].language.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "pubDate")) retStruct.channel.pubDate = parsed["rss"]["channel"].pubDate.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "lastBuildDate")) retStruct.channel.lastBuildDate = parsed["rss"]["channel"].lastBuildDate.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "docs")) retStruct.channel.docs = parsed["rss"]["channel"].docs.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "generator")) retStruct.channel.generator = parsed["rss"]["channel"].generator.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "manageEditor")) retStruct.channel.managingEditor = parsed["rss"]["channel"].managingEditor.XMLText;
					if (structKeyExists(parsed["rss"]["channel"], "webMaster")) retStruct.channel.webMaster = parsed["rss"]["channel"].webMaster.XMLText;
					retStruct.channel.type = "RSS";
				}
				if (isArray(XMLSearch(parsed, "/rss/channel/item/")))
				{
					retQuery = queryNew("title,link,description,pubDate,guid");
					queryAddRow(retQuery, arrayLen(XMLSearch(parsed, "/rss/channel/item/")));
					for (index = 1; index LTE arrayLen(XMLSearch(parsed, "/rss/channel/item/")); index = index + 1)
					{
						thisArray = XMLSearch(parsed, "/rss/channel/item/");
						if (structKeyExists(thisArray[index], "title")) querySetCell(retQuery, "title", thisArray[index].title.XMLText, index);
						if (structKeyExists(thisArray[index], "link")) querySetCell(retQuery, "link", thisArray[index].link.XMLText, index);
						if (structKeyExists(thisArray[index], "description")) querySetCell(retQuery, "description", thisArray[index].description.XMLText, index);
						if (structKeyExists(thisArray[index], "pubDate")) querySetCell(retQuery, "pubDate", thisArray[index].pubDate.XMLText, index);
						if (structKeyExists(thisArray[index], "guid")) querySetCell(retQuery, "guid", thisArray[index].guid.XMLText, index);
					}
				}
				retStruct.query = retQuery;
			}
		}
		if (find("<feed", parsed))
		{		
			retStruct.channel = structNew();
			if (structKeyExists(parsed["feed"], "title")) retStruct.channel.title = parsed["feed"].title.XMLText;
			if (structKeyExists(parsed["feed"], "link")) retStruct.channel.link = parsed["feed"].link.XMLAttributes.href;
			if (structKeyExists(parsed["feed"], "tagLine")) retStruct.channel.tagLine = parsed["feed"].tagLine.XMLText;
			if (structKeyExists(parsed["feed"], "id")) retStruct.channel.id = parsed["feed"].id.XMLText;
			if (structKeyExists(parsed["feed"], "modified")) retStruct.channel.modified = parsed["feed"].modified.XMLText;
			if (structKeyExists(parsed["feed"], "generator")) retStruct.channel.generator = parsed["feed"].generator.XMLText;
			retStruct.channel.type = "ATOM";
			
			if (isArray(XMLSearch(parsed, "/feed/entry/")))
			{
				retQuery = queryNew("title,link,content,id,author,issued,modified,created");
				for (index = 1; index LTE arrayLen(parsed["feed"].XMLChildren); index = index + 1)
				{
					if (parsed["feed"].XMLChildren[index].XMLName IS "entry")
					{
						rows = rows + 1;
						queryAddRow(retQuery, 1);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "title")) querySetCell(retQuery, "title", parsed["feed"].XMLChildren[index].title.XMLText, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "link")) querySetCell(retQuery, "link", parsed["feed"].XMLChildren[index].link.XMLAttributes.href, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "content")) querySetCell(retQuery, "content", parsed["feed"].XMLChildren[index].content.XMLText, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "id")) querySetCell(retQuery, "id", parsed["feed"].XMLChildren[index].id.XMLText, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "author")) querySetCell(retQuery, "author", parsed["feed"].XMLChildren[index].author.name.XMLText, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "issued")) querySetCell(retQuery, "issued", parsed["feed"].XMLChildren[index].issued.XMLText, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "modified")) querySetCell(retQuery, "modified", parsed["feed"].XMLChildren[index].modified.XMLText, rows);
						if (structKeyExists(parsed["feed"].XMLChildren[index], "created")) querySetCell(retQuery, "created", parsed["feed"].XMLChildren[index].created.XMLText, rows);
					}
				}
			}	
			retStruct.query = retQuery;	
		}
	</cfscript>
	<cfreturn retStruct />
	
</cffunction>

<!---
 This function will remove any reserved characters from a filename string and replace any spaces with underscores.
 
 @param filename 	 Filename. (Required)
 @return Returns a string. 
 @author Jason Sheedy (jason@jmpj.net) 
 @version 1, January 19, 2006 
--->
<cffunction name="filterFilename" access="public" returntype="string" output="false" hint="I remove any special characters from a filename and replace any spaces with underscores.">
	<cfargument name="filename" type="string" required="true" />
	<cfset var filenameRE = "[" & "'" & '"' & "##" & "/\\%&`@~!,:;=<>\+\*\?\[\]\^\$\(\)\{\}\|]" />
	<cfset var newfilename = reReplace(arguments.filename,filenameRE,"","all") />
	<cfset newfilename = replace(newfilename," ","_","all") />
	
	<cfreturn newfilename /> 
</cffunction>

<cfscript>
/**
 * Returns a boolean 1/0 from anything, including empty strings.
 * 
 * @param bool 	 Value to check. (Required)
 * @return Returns a boolean. 
 * @author Alan McCollough (amccollough@anthc.org) 
 * @version 1, September 5, 2010 
 */
function forceBoolean(bool){
  if(isBoolean(bool) AND bool IS TRUE)
     return "1";
  else
     return "0";
}
</cfscript>

<cfscript>
/**
 * Force a value to whole quantity and restrict to a given min/max range.
 * 
 * @param argNum 	 The number to check. (Required)
 * @param argMin 	 The minimum value of the range. (Required)
 * @param argMax 	 The maximum value of the range. (Optional)
 * @return Returns a number. 
 * @author Shawn Fairweather (psalm_119_@hotmail.com) 
 * @version 1, September 27, 2004 
 */
function forceWholeQuantityRange(argNum, argMin){
	var qnty = argNum;

	if(IsNumeric(argNum)){
		qnty = int(argNum);
	} else {
		qnty = argMin;
	}

	if(argNum LT argMin){
		qnty = argMin;
	} else if((arrayLen(arguments) gt 2) and (argNum GT arguments[3])){
		qnty = arguments[3];						
	}
	return qnty;
}
</cfscript>

<!---
 Returns a form field as array, useful for when you have more than one form field with the same name.
 
 @param fieldName 	 Name of the Form or URL field (Required)
 @return Returns an array. 
 @author Ryan Stille (ryan@stillnet.org) 
 @version 2, February 19, 2013 
--->
<cffunction name="formFieldAsArray" returntype="array" output="false" hint="Returns a Form/URL variable as an array.">
	<cfargument name="fieldName" required="true" type="string" hint="Name of the Form or URL field" />
	
	<cfset var content = getHTTPRequestData().content />
	<cfset var returnArray = arrayNew(1) />
	
	<cfloop list="#content#" delimiters="&" index="local.parameter">
		<cfif listFirst(local.parameter,"=") EQ arguments.fieldName>
			<cfif ListLen(local.parameter,"=") EQ 2>
				<cfset arrayAppend(returnArray,URLDecode(listLast(local.parameter,"="))) />
			<cfelse>
				<cfset arrayAppend(returnArray,"") />
			</cfif>
		</cfif>
	</cfloop>
	
	<cfreturn returnArray />

</cffunction>

<cfscript>
/**
 * Converts the Form structure to hidden form fields.
 * 
 * @param excludeList 	 A list of keys not to copy from the Form scope. Defaults to, and always includes, FIELDNAMES. 
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, March 11, 2002 
 */
function formToHidden(){
	//a variable for iterating
	var key = "";
	//should we exlude any?  by default, no
	var excludeList = "FIELDNAMES";
	//a variable to return stuff
	var outVar = "";
	//if there is an argument, it is a list to exclude
	if(arrayLen(arguments))
		excludeList = excludeList & "," & arguments[1];
	//now loop through the form scope and make hidden fields
	for(key in form){
		if(NOT listFindNoCase(excludeList,key))
			outVar = outVar & "<input type=""hidden"" name=""" & key & """ value=""" & htmlEditFormat(form[key]) & """>";
	}
	return outVar;		
}
</cfscript>

<cfscript>
/**
 * Performs a serverside redirection.
 * 
 * @param theurl 	 The URL to redirect to. Must be relative. (Required)
 * @return Returns nothing. 
 * @author Thomas Bukowski (me@neodude.net) 
 * @version 1, October 20, 2003 
 */
function forward(theurl){
	getPageContext().forward(theurl);
}
</cfscript>

<cfscript>
/**
 * UDF that returns an SEO friendly string.
 * Fix for - in front by B
 * 
 * @param title 	 String to modify. (Required)
 * @return Returns a string. 
 * @author Nick Maloney (nmaloney@prolucid.com) 
 * @version 2, November 29, 2008 
 */
function friendlyUrl(title) {
	title = replaceNoCase(title,"&amp;","and","all"); //replace &amp;
	title = replaceNoCase(title,"&","and","all"); //replace &
	title = replaceNoCase(title,"'","","all"); //remove apostrophe
	title = reReplaceNoCase(trim(title),"[^a-zA-Z]","-","ALL");
	title = reReplaceNoCase(title,"[\-\-]+","-","all");
	//Remove trailing dashes
	if(right(title,1) eq "-") {
		title = left(title,len(title) - 1);
	}
	if(left(title,1) eq "-") {
		title = right(title,len(title) - 1);
	}	
	return lcase(title);
}
</cfscript>

<cfscript>
/**
 * Replace relative url's with a fully qualified URL
 * 
 * @param mytext 	 The string to search. 
 * @param relpage 	 The page to qualify. 
 * @param FQHost 	 The fully qualified host. 
 * @return Returns a string. 
 * @author Ryan Thompson-Jewell (thompsonjewell.ryan@mayo.edu) 
 * @version 1, November 2, 2001 
 */
function FullQualUrl(mytext,RelPage,FQHost) {
	var tmp=rereplacenocase(mytext,"(href\=){1}([""|'| ]*)(/)*(#RelPage#){1}","\1\2#FQHost#/#RelPage#","ALL");
	return tmp;
}
</cfscript>

<!---
 Generates a valid Site Map XML from either a list of URLs or a query of URLs.
 
 @param data 	 Either a list of URLs or a query. (Required)
 @param lastmod 	 Date to use for all URLs as their lastmod property. If not passed, the value will not be used in the XML unless a query is used and the column lastmod exists. (Optional)
 @param changefreq 	 Value to use for all URLs as their changefreq property. If not passed, the value will not be used in the XML unless a query is used and the column changefreq exists. (Optional)
 @param priority 	 Value to use for all URLs as their priority property. If not passed, the value will not be used in the XML unless a query is used and the column priority exists. (Optional)
 @return Returns a string. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, August 14, 2007 
--->
<cffunction name="generateSiteMap" output="false" returnType="string">
	<cfargument name="data" type="any" required="true">
	<cfargument name="lastmod" type="date" required="false">
	<cfargument name="changefreq" type="string" required="false">
	<cfargument name="priority" type="numeric" required="false">
	
	<cfset var header = "<?xml version=""1.0"" encoding=""UTF-8""?><urlset xmlns=""http://www.sitemaps.org/schemas/sitemap/0.9"">">
	<cfset var s = createObject('java','java.lang.StringBuffer').init(header)>
	<cfset var aurl = "">
	<cfset var item = "">
	<cfset var validChangeFreq = "always,hourly,daily,weekly,monthly,yearly,never">
	<cfset var newDate = "">
	<cfset var tz = getTimeZoneInfo().utcHourOffset>
	<cfset var btz = replaceList(tz, "+,-","")>
	
	<cfif structKeyExists(arguments, "changefreq") and not listFindNoCase(validChangeFreq, arguments.changefreq)>
		<cfthrow message="Invalid changefreq (#arguments.changefreq#) passed. Valid values are #validChangeFreq#">
	</cfif>

	<cfif structKeyExists(arguments, "priority") and (arguments.priority lt 0 or arguments.priority gt 1)>
		<cfthrow message="Invalid priority (#arguments.priority#) passed. Must be between 0.0 and 1.0">
	</cfif>
	
	<!--- reformat datetime as w3c datetime / http://www.w3.org/TR/NOTE-datetime --->
	<cfif structKeyExists(arguments, "lastmod")>			
		<cfset newDate = dateFormat(arguments.lastmod, "YYYY-MM-DD") & "T" & timeFormat(arguments.lastmod, "HH:mm")>
		<cfif tz gt 0>
			<cfset newDate = newDate & "-" & numberFormat(btz,"00") & ":00">
		<cfelse>
			<cfset newDate = newDate & "+" & numberFormat(btz,"00") & ":00">
		</cfif>		
	</cfif>
	
	<!--- Support either a query or list of URLs --->
	<cfif isSimpleValue(arguments.data)>
		<cfloop index="aurl" list="#arguments.data#">
			<cfsavecontent variable="item">
				<cfoutput>
				<url>
					<loc>#xmlFormat(aurl)#</loc>
					<cfif structKeyExists(arguments,"lastmod")>
					<lastmod>#newDate#</lastmod>
					</cfif>
					<cfif structKeyExists(arguments,"changefreq")>
					<changefreq>#arguments.changefreq#</changefreq>
					</cfif>
					<cfif structKeyExists(arguments,"priority")>
					<priority>#arguments.priority#</priority>
					</cfif>
				</url>
				</cfoutput>
			</cfsavecontent>
			<cfset item = trim(item)>
			<cfset s.append(item)>
		</cfloop>
	<!--- url, lastmod, changefreq, and priority were changed to have the arguments.data.whatever and I also added the array notation to each like so [arguments.data.currentrow] --->
	<cfelseif isQuery(arguments.data)>
		<cfloop query="arguments.data">
			<cfsavecontent variable="item">
				<cfoutput>
				<url>
					<loc>#xmlFormat(arguments.data.url[arguments.data.currentrow])#</loc>
					<cfif listFindNoCase(arguments.data.columnlist,"lastmod")>
						<cfset newDate = dateFormat(arguments.data.lastmod[arguments.data.currentrow], "YYYY-MM-DD") & "T" & timeFormat(arguments.data.lastmod[arguments.data.currentrow], "HH:mm")>
						<cfif tz gt 0>
							<cfset newDate = newDate & "-" & numberFormat(btz,"00") & ":00">
						<cfelse>
							<cfset newDate = newDate & "+" & numberFormat(btz,"00") & ":00">
						</cfif>		
						<lastmod>#newDate#</lastmod>
					</cfif>
					<cfif listFindNoCase(arguments.data.columnlist,"changefreq")>
					<changefreq>#arguments.data.changefreq[arguments.data.currentrow]#</changefreq>
					</cfif>
					<cfif listFindNoCase(arguments.data.columnlist,"priority")>
					<priority>#arguments.data.priority[arguments.data.currentrow]#</priority>
					</cfif>
				</url>
				</cfoutput>
			</cfsavecontent>
			<cfset item = trim(item)>
			<cfset s.append(item)>
		
		</cfloop>
	</cfif>	
	<cfset s.append("</urlset>")>

	<cfreturn s>
	
</cffunction>

<!---
 Serial Shipping Container Code (SSCC) ASN Generator.
 
 @param serialSequence 	 9 digit serial reference number (string) (Required)
 @param distributorId 	 6 digit id assigned by a vendor. (Required)
 @return Returns a string. 
 @author Kevin Pepperman (chornobyl@gmail.com) 
 @version 0, August 21, 2009 
--->
<!---
Serial Shipping Container Code (SSCC) ASN Generator
@author Kevin John Pepperman chornobyl@gmail.com
@version 0, Aug. 21, 2009 
@usage generateSsccAsn(serialSequence="000000001", distributorId="123456") returns 00001234560000000018
--->

<cffunction name="generateSsccAsn"
	hint="I take a 9 digit serial sequence, concat a vendor ID with a leading 0 
		 and find the Check Digit for the SSCC ID Number then return a complete 
		 20 digit ASN number for generating Barcodes">
	
	<cfargument name="serialSequence" required="yes"
	   hint="I am a 9 digit (000000001,000000002 etc...) Serial Reference 
			the number assigned by DSV to uniquely identify the logistic unit." />
	
	<cfargument name="distributorId" required="yes"
	   hint="I am the 6 digit Distributor Id assigned by Vendor." />	  
	
		<!--- The Check Digit for a Serial Shipping Container Code (SSCC) 
			  Number is figured using the standard modulo calculation.
			  Reference: http://barcodes.gs1us.org/dnn_bcec/TabId/85/Default.aspx  --->
		
		<!--- DTS prefix (Always 00). Not Part of the Check Digit Calculation, 
			  Concat to front of ASN after generating check digit --->
		<cfset var DTSPrefix = "00" />
		
		<!--- Extension digit, has no defined logic, and is available to the member company
			 to increase the capacity of the Serial Reference.
			 (Always 0). Part of the Check Digit Calculation --->
		<cfset var extensionDigit = "0" />
		
		<!--- Vendor Id  Distributor Id assigned by Vendor.
			  add the leading 0 to the vendor ID. Part of the Check Digit Calculation --->
		<cfset var vendorId = "0" & arguments.distributorId />
		
		<!--- create the 17 digit code to loop over for generating the check digit --->
		<cfset var ASNTemp = extensionDigit & vendorId & arguments.serialSequence />
		
		<cfset var ASN = "" />
		<cfset var i = "" />
		<cfset var oddSum = 0 />
		<cfset var evenSum = 0 />
		<cfset var oddTotal = 0 />
		<cfset var total = 0 />
		<cfset var checkDigit = 0 />
		
		<!--- make sure the ASNTemp is exactly 17 numbers (eg. 10614141192837465) --->
		<cfif len(ASNTemp) eq 17>
		
		<!--- Loop through the ODD chars and Add(+) the values of the numbers in Positions:
			  One, Three, Five, Seven, Nine, Eleven, Thirteen, Fifteen, and Seventeen:
			  eg. (1 + 6 + 4 + 4 + 1 + 2 + 3 + 4 + 5 = 30) --->
		<cfloop index="i" from="1" to="17" step="2">
		<!--- get the current ODD number and add it to the oddSum var  --->
		<cfset oddSum = oddSum + mid(ASNTemp,i,1) />
		</cfloop>
		
		<!--- Multiply the result of the ODD sum x 3:
		eg. (30 x 3 = 90). --->
		<cfset oddTotal = oddSum * 3 />
		
		<!--- Loop through the EVEN chars and Add the numbers 
			  in Positions Two, Four, Six, Eight, Ten, Twelve, Fourteen, and Sixteen:
			  eg. (0 + 1 + 1 + 1 + 9 + 8 + 7 + 6 = 33).
		--->
		<cfloop index="i" from="2" to="16" step="2">
		<!--- get the current EVEN number and add it to the evenSum  --->
		<cfset evenSum = evenSum + mid(ASNTemp,i,1) />
		</cfloop>
		
		<!--- Add the results of the OddTotal and evenSum value:
			  eg. (90 + 33 = 123). --->
		<cfset total = oddTotal + evenSum />
		
		<!--- Check Digit  a calculated one-digit number used to ensure data integrity as per UCC128 standards.
			  The Check Digit is the smallest number needed to round the result of (oddTotal + evenSum) up to a multiple of 10
			  Use Modulo 10 to calculate the result and subtract it from 10 to get the Check Digit--->
		<cfset checkDigit = 10 - (total MOD 10) />
		
		<!--- If the CheckDigit is 10 set it to 0 --->
		<cfif checkDigit is 10>
		<cfset checkDigit = 0 />
		</cfif>
		
		</cfif>
		
		<!--- concat the D2S prefix, extension digit, Vendor ID, Serial Sequence  and checkDigit --->
		<cfset ASN = DTSPrefix & extensionDigit & vendorId & arguments.serialSequence & checkDigit />
		
		<!--- Return the full 20 digit generated ASN code --->
		<cfreturn ASN />

</cffunction>

<cfscript>
/**
 * Given output from a cvs ls command, this UDF returns a list of files path-qualified for CVS.
 * 
 * @param cvsdir 	 List of files. (Required)
 * @param modulename 	 Second attribute. (Required)
 * @return Returns a string. 
 * @author Douglas Knudsen (doug@cubicleman.com) 
 * @version 1, October 14, 2008 
 */
function getAllFilesInModule(cvsdir, moduleName)	{
		var fileList = '';
		var curdir = arguments.moduleName;
		var myArray = ListToArray(arguments.cvsdir, chr(13));
		var myLength = ArrayLen(myArray);
		var temp = '';
		var i = 1;
		
		for( i = 1; i LTE myLength; i = i + 1)	{
			//WriteOutput(myArray[i] & '<br>');
			if(Find('Directory',myArray[i])) {
				curdir = Mid(myArray[i], Len('Directory ') + 1, Len(myArray[i])-Len('Directory '));
			}	else if(Trim(myArray[i]) NEQ '') {
				filelist = ListAppend(filelist, curdir & '/' & trim(myArray[i]) );
			}
			
		}
		return fileList;
	}
</cfscript>

<cfscript>
/**
 * Returns the numeric value of a letter's position in the alphabet, or the returns matching letter of a number in the alphabet.
 * 
 * @param charornum 	 Either a character or number. 
 * @return Returns either a character, number, or empty string on error. 
 * @author Seth Duffey (sduffey@ci.davis.ca.us) 
 * @version 1, January 7, 2002 
 */
function GetAlphabetPosition(charornum) {
  var a_numeric = asc("a");
  charornum = lCase(trim(charornum));

  if(isNumeric(charornum)) {
      if(charornum lte 0 OR charornum gte 27) return "";
      return chr(charornum+a_numeric-1);
  } else {
      if(len(charornum) gt 1) return "";
      if(REFind("[^a-z]",charornum)) return "";
      return asc(charornum) - a_numeric + 1;
  }
  return 1;
}
</cfscript>

<cfscript>
/**
 * returns the name of the cfapplication.
 * 
 * @return Returns a string. 
 * @author Steven Maglio (smaglio@graddiv.ucsb.edu) 
 * @version 1, September 16, 2005 
 */
function getApplicationName() {
	var name = "";
	var appScopeTracker = createObject("java", "coldfusion.runtime.ApplicationScopeTracker");
	var keys = appScopeTracker.getApplicationKeys();
	var app = 0;
	var appName = 0;
	
	while(keys.hasNext()) {
		appName = keys.next();
		app = appScopeTracker.getApplicationScope(appName);
		if(app.equals( application ) ) return app.getName();
	}
	return "";
}
</cfscript>

<cfscript>
/**
 * Returns a list of ancestor custom tags.
 * 
 * @return Returns a list. 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 1, February 20, 2003 
 */
function getBaseCustomTagList() {
   var x = 1;
   var customTags = "";
   var baseTags = listToArray( getBaseTagList() );
   
   for( x = 1; x LTE arrayLen( baseTags ); x = x + 1 )
   {
      if( left( baseTags[ x ], 3 ) IS "CF_" )
      {
         customTags = listAppend( customTags, baseTags[ x ] );
      }
   }
   
   return customTags;
}
</cfscript>

<cfscript>
/**
 * Returns the card type of a card number.
 * 
 * @param cardNumber 	 The credit card number. (Required)
 * @return Returns a string. 
 * @author Dave Cordes (dcordes@apoktechnology.com) 
 * @version 1, November 3, 2005 
 */
function getCardType(cardNumber) {
	var CardType = "Unknown";
	var CardLength = Len(cardNumber);
	
	if ((CardLength eq 15) and (((Left(cardNumber, 2) is "34")) or ((Left(cardNumber, 2) is "37")))) CardType = "American Express";
	if ((CardLength eq 14) and (((Left(cardNumber, 3) gte 300) and (Left(cardNumber, 3) lte 305)) or (Left(cardNumber, 2) is "36") or (Left(cardNumber, 2) is "38"))) CardType =  "Diner's Club";
	if ((CardLength eq 16) and (Left(cardNumber, 4) is "6011")) CardType =  "Discover Card";
	if ((CardLength eq 16) and (Left(cardNumber, 2) gte 51) and (Left(cardNumber, 2) lte 55)) CardType =  "MasterCard";
	if (((CardLength eq 13) or (CardLength eq 16)) and (Left(cardNumber, 1) is "4")) CardType =  "Visa";
	
	return CardType;
}
</cfscript>

<cfscript>
/**
 * Function returns a structure of client variable.
 * 
 * @return Returns a structure. 
 * @author Robert Segal (rsegal@figleaf.com) 
 * @version 1, January 30, 2003 
 */
function getclientvariables() {
 var lclientvarlist = getclientvariableslist();
 var stclientvar = structnew();
 var i = 1;
 for(i=1;i lte listlen(lclientvarlist);i=i+1)
 structinsert(stclientvar,"#listgetat(lclientvarlist,i)#",evaluate("client.#listgetat(lclientvarlist,i)#"));
 return stclientvar;
}
</cfscript>

<cfscript>
/**
 * Returns the filename of the current URL.
 * 
 * @return Returns a string. 
 * @author Jack Poe (jpoe@afit.edu) 
 * @version 1, August 26, 2006 
 */
function getCurrentPage() {
	var thisPage = spanExcluding(reverse(CGI.SCRIPT_NAME),'/');
	thisPage = reverse(thispage);
	return thisPage;
}
</cfscript>

<cfscript>
/**
 * This function returns the current directory of your current coldfusion template.
 * 
 * @return Returns a string. 
 * @author Timothy D Farrar (timothyfarrar@sosensible.com) 
 * @version 1, June 4, 2008 
 */
function getCurrentTemplateDirectory() {
	return getDirectoryFromPath(getCurrentTemplatepath());
}
</cfscript>

<!---
 Returns the current URL for the page.
 
 @return Returns a string. 
 @author Topper (topper@cftopper.com) 
 @version 1, September 5, 2008 
--->
<cffunction name="getCurrentURL" output="No" access="public" returnType="string">
	<cfset var theURL = getPageContext().getRequest().GetRequestUrl().toString()>
	<cfif len( CGI.query_string )><cfset theURL = theURL & "?" & CGI.query_string></cfif>
	<cfreturn theURL>
</cffunction>

<!---
 Get an array of the attributes used in the given custom tag file.
 
 @param filePath 	 Full path to the custom tag. (Required)
 @return Returns a struct. 
 @author Steve Bryant (steve@bryantwebconsulting.com) 
 @version 1, October 14, 2008 
--->
<cffunction name="getCustomTagAttributes" returntype="array" output="false">
	<cfargument name="FilePath" type="string" required="yes">
	
	<cfset var MyFile = "">
	<cfset var reDefault = "\bsetDefaultAtt\(\#chr(34)#[\w\d]*\#chr(34)#">
	<cfset var reDot = "\battributes\.[\w\d]*\b">
	<cfset var reBracket = "\battributes\[\#chr(34)#[\w\d]*\#chr(34)#\]">
	<cfset var aRawAttributes = ArrayNew(1)>
	<cfset var find = 0>
	<cfset var temp = "">
	<cfset var attlist = "">
	<cfset var i = 0>
	<cfset var aAttributes = 0>
	
	<cffile action="read" file="#arguments.FilePath#" variable="MyFile">
	
	<cfscript>
	//Find all attributes set by my own UDF
	find = ReFindNoCase(reDefault,MyFile,1,1);
	while ( find.pos[1] GT 0 ) {
		temp = Mid(MyFile,find.pos[1],find.len[1]);
		temp = ReplaceNoCase(temp,"setDefaultAtt(#chr(34)#","");
		temp = Left(temp,Len(temp)-1);
		ArrayAppend(aRawAttributes,temp);
		find = ReFindNoCase(reDefault,MyFile,find.pos[1]+find.len[1]+1,1);
	}
	
	//Find all attributes with dot syntax
	find = ReFindNoCase(reDot,MyFile,1,1);
	while ( find.pos[1] GT 0 ) {
		temp = Mid(MyFile,find.pos[1],find.len[1]);
		temp = ListRest(temp,".");
		ArrayAppend(aRawAttributes,temp);
		find = ReFindNoCase(reDot,MyFile,find.pos[1]+find.len[1]+1,1);
	}
	
	//Find all attributes with bracket syntax
	find = ReFindNoCase(reBracket,MyFile,1,1);
	while ( find.pos[1] GT 0 ) {
		temp = Mid(MyFile,find.pos[1],find.len[1]);
		temp = ReplaceNoCase(temp,"attributes[#chr(34)#","");
		temp = Left(temp,Len(temp)-2);
		ArrayAppend(aRawAttributes,temp);
		find = ReFindNoCase(reBracket,MyFile,find.pos[1]+find.len[1]+1,1);
	}
	
	//Loop through array and build list (to ensure no duplicate attributes)
	attlist = "";
	for (i=1; i LTE ArrayLen(aRawAttributes); i=i+1) {
		if ( NOT ListFindNoCase(attlist,aRawAttributes[i]) ) {
			attlist = ListAppend(attlist,aRawAttributes[i]);
		}
	}
	aAttributes = ListToArray(attlist);
	</cfscript>
	
	<cfreturn aAttributes>
</cffunction>

<!---
 Gets the configuration of an existing datasource.
 
 @param dsn 	 The name of the datasource. (Required)
 @return Returns a structure. 
 @author Martin Parry (martin.parry@beetrootstreet.com) 
 @version 1, January 6, 2004 
--->
<cffunction name="getdsn" returntype="struct" output="false">
	<cfargument name="dsn" type="string" required="yes">

	<!--- initialize variables --->
	<cfset var dsservice = "">

	<!--- get "factory" --->
	<cfobject action="create"
	         type="java"
	         class="coldfusion.server.ServiceFactory"
	         name="factory">

	<!--- get datasource service --->
	<cfset dsservice = factory.getdatasourceservice()>

	<cfif not structKeyExists(dsservice.datasources,dsn)>
		<cfthrow message="#dsn# is not a registered datasource.">
	</cfif>
	
	<!--- get dsn --->
	<cfreturn duplicate(dsservice.datasources[dsn])>

</cffunction>

<!---
 Returns environment information. (Windows only!)
 
 @param varName 	 Environment variable to return. (Optional)
 @return Returns either a structure or a string. 
 @author Ben Forta (ben@forta.com) 
 @version 1, March 11, 2003 
--->
<cffunction name="GetEnv" output="false" returnType="any">
	<cfargument name="varname" type="string" required="no">
	
	<!--- Define local variables --->
	<cfset var env=structNew()>
	<cfset var data="">
	<cfset var ename="">
	<cfset var evalue="">
	<cfset var i = 1>
	
	<!--- Get enviroment and save to variable --->
	<cfsavecontent variable="data">
		<cfexecute name="cmd /c set" timeout="1" />
	</cfsavecontent>

	<!--- Need to convert to structure, so loop through --->
	<cfloop index="i" list="#trim(data)#" delimiters="#chr(10)##chr(13)#">
		<!--- For each line, get name and value --->
		<cfset ename=trim(listfirst(i, "="))>
		<cfset evalue=trim(listrest(i, "="))>
		<!--- And add to structure --->
		<cfset env[ename] = evalue>
	</CFLOOP>

	<!--- And finally, build return value --->
	<cfif not isDefined("varname")>
		<!--- If no name, return list --->
		<cfreturn env>
	<cfelseif structKeyExists(env, varname)>
		<!--- If name provided, and present, get value --->
		<cfreturn env[varname]>
	</cfif>

</cffunction>

<!---
 Accepts a directory path &amp; a file filter.  Returns number of matching files.
 
 @param directory 	 directory path (Required)
 @param filter 	 filter (Required)
 @return Returns a number. 
 @author James Moberg (james@ssmedia.com) 
 @version 1, January 4, 2012 
--->
rsion 1, May 17, 2011
*/
<cffunction name="GetFileFilterCount" returntype="numeric" output="no">
	<cfargument name="directory" type="string" required="true" />
	<cfargument name="filter" type="string" required="true" />
	<cfset var theCount = 0 />
	<cfset var checkfiles = "">

	<cfif directoryExists(arguments.directory)>
		<cfdirectory action="LIST" directory="#arguments.directory#" name="CheckFiles" filter="#arguments.filter#" type="file" listinfo="name">
		<cfset theCount = CheckFiles.RecordCount />
	</cfif>
	<cfreturn theCount />
</cffunction>

<!---
 Gets available and total file space for all volumes on a server.
 
 @return Returns an array. 
 @author Sigi (siegfried.heckl@siemens.com) 
 @version 1, October 11, 2011 
--->
<cffunction name="getFileSpace" access="public" output="false" returntype="array" hint="returns disk filespaces of the server">
  <cfset var local = {} />
  <cfset var i = "">

  <cfobject type="java" action="create" class="java.io.File" name="local.objFile" />
  <cfset local.aDrives = local.objFile.listRoots() />
  <cfset local.aResult = [] />

  <cfloop array="#local.aDrives#" index="i">
    <cfset local.strTemp = { drivename = i.getAbsolutePath(),
                             available = i.getFreeSpace(),
                             total     = i.getTotalSpace() } />
    <cfset arrayAppend(local.aResult, local.strTemp) />
  </cfloop>

  <CFRETURN local.aResult />
</cffunction>

<!---
 This will return the CFML code for a given user-defined function.
 
 @param UDFunction 	 The UDF. (Required)
 @return Returns a string. 
 @author Paul Kenney (paul_kenney_77@yahoo.com) 
 @version 1, April 30, 2003 
--->
<cffunction name="getFunctionCode" returntype="string" output="false" hint="This function returns the CFML source code for a UDF.">
	<cfargument name="UDFunction" type="any" required="true" hint="This is a UDF."/>
	<!---  --->
	<cfset var EncryptedFileHeader = "Allaire Cold Fusion Template" & Chr(10) & "Header Size: New Version">
	<cfset var filename = "">
	<cfset var funcname = "">
	<cfset var filecontents = "">
	<cfset var results = StructNew()>
	<cfset var parts = StructNew()>
	<cfset var length = StructNew()>
	<cfset var startIndex = 1>
	<cfset var scriptIndex = 1>
	<cfset var counter = 0>
	<cfset var i = 0>
	<cfset var ret = "">
	
	<cfset results["start"] = StructNew()>
	<cfset results["end"] = StructNew()>
	<cfset results["funcname"] = StructNew()>
	<cfset results["cfscript"] = StructNew()>
	<cfset results["cfscript"]["start"] = StructNew()>
	<cfset results["cfscript"]["end"] = StructNew()>
	<cfset results["function"] = StructNew()>
	
	<cfset parts["opentag"] = "">
	<cfset parts["cfsript"] = "">
	
	<cfset length["file"] = 0>
	<cfset length["cfscript"] = 0>
	<cfset length["cffunction"] = 0>
	
	<cfif IsCustomFunction(Arguments.UDFunction)>
		<cfset filename = Arguments.UDFunction.PagePath>
		<cfset funcname = Arguments.UDFunction.Metadata.Name>
	
		<cfif FileExists(filename)>
			<cftry>
				<cffile action="read" file="#filename#" variable="filecontents"/>
							
				<cfif NOT Compare(Left(filecontents, 53), EncryptedFileHeader)>
				
					<!--- This is an encrypted template file.  Cannot read the code. --->
					<!--- Do nothing. --->
					
				<cfelse>
					<cfset length.file = Len(filecontents)>
					<cfset startIndex = 1>
				
					<!--- Search for the function in any <cffunction> tags (CFMX) --->		
					<cfloop condition="startIndex LT length.file">
						<cfset results.start = REFindNoCase("<" & "cffunction[^>]+>", filecontents, startIndex, true)>
						
						<cfif results.start.pos[1]>
							<cfset parts.opentag = Mid(filecontents, results.start.pos[1], results.start.len[1])>
							<cfset results.funcname = REFindNoCase("[ ]+name[ ]*=[ ]*""#funcname#""", parts.opentag, 1, true)>
							<cfset results.end = REFindNoCase("<" & "/cffunction>", filecontents, results.start.pos[1] + results.start.len[1], true)>
							
							<cfif results.funcname.pos[1]>
								<cfif results.end.pos[1]>
									<!--- Found the function. --->
									<cfset length.cffunction = results.end.pos[1] + results.end.len[1] - results.start.pos[1]>
									<cfset ret = Mid(filecontents, results.start.pos[1], length.cffunction)>
								<cfelse>
									<!--- Could not find the end tag. --->
								</cfif>
								<cfbreak/>
							<cfelse>
								<cfif results.end.pos[1]>
									<cfset startIndex = results.end.pos[1] + results.end.len[1]>
								<cfelse>
									<cfset startIndex = results.start.pos[1] + 1>
								</cfif>
							</cfif>
						<cfelse>
							<!--- Could not find a function that is written using <cffunction> --->
							<cfbreak/>
						</cfif>
					</cfloop>
					
					<!--- Search for the function in CF Script code (CF 5+). --->
					<cfif NOT Len(ret)>
						<cfset startIndex = 1>
						<cfset scriptIndex = 1>
						
						<!--- Iterate over all of the <cfscript> blocks in this file. --->
						<cfloop condition="startIndex LT length.file">
							<cfset results.cfscript.start = REFindNoCase("<cfscript>", filecontents, startIndex, true)>
							
							<cfif results.cfscript.start.pos[1]>
								<cfset results.cfscript.end = REFindNoCase("</cfscript>", filecontents, results.cfscript.start.pos[1] + results.cfscript.start.len[1], true)>
							
								<cfif results.cfscript.end.pos[1]>
									<cfset length.cfscript = results.cfscript.end.pos[1] + results.cfscript.end.len[1] - results.cfscript.start.pos[1]>
									<cfset parts.cfscript = Mid(filecontents, results.cfscript.start.pos[1], length.cfscript)>
								
									<!--- Iterate all the functoins in the current <cfscript> block. --->
									<cfset results.function = REFindNoCase("function[ ]+#funcname#[ ]*\([^\)]*\)", parts.cfscript, scriptIndex, true)>
									<cfif results.function.pos[1]>
										<cfset scriptIndex = Find("{", parts.cfscript, results.function.pos[1])> 
										<cfset counter = 0>
										<cfloop index="i" from="#scriptIndex#" to="#length.cfscript#">
											<cfset parts.char = Mid(parts.cfscript, i, 1)>
											<cfif ListFindNoCase("{,}", parts.char, ",")>
												<cfif NOT Compare(parts.char, "{")>
													<cfset counter = counter + 1>
												<cfelseif NOT Compare(parts.char, "}")>
													<cfset counter = counter - 1>
												</cfif>
											</cfif>
											<cfif counter IS 0>
												<cfset ret = Mid(parts.cfscript, results.function.pos[1], i - results.function.pos[1] + 1)>
												<cfbreak/>
											</cfif>
										</cfloop>
										<cfbreak/>
									<cfelse>
										<cfset startIndex = results.cfscript.end.pos[1] + results.cfscript.end.len[1]>
									</cfif>
								<cfelse>
									<!--- Could not find closing <cfscript> tag. --->
									<cfbreak/>
								</cfif>
							<cfelse>
								<!--- Could not find any <cfscript> blocks. --->
								<cfbreak/>
							</cfif>
						</cfloop>
						
					</cfif>
				</cfif>
				
				<cfcatch type="any">
					<!--- There was some error, so just return an empty string. --->
					<cfset ret = "">
				</cfcatch>
			</cftry>
		</cfif>
	</cfif>

	<cfreturn ret/>
</cffunction>

<cfscript>
/**
 * You give me a function and I return the hint. Useful for demo and documentation pages.
 * v2 modded by RCamden to support the lack of a hint
 * 
 * @param somefunction 	 A CFC method or UDF. (Required)
 * @return Returns a string. 
 * @author Alan McCollough (amccollough@anthc.org) 
 * @version 0, July 1, 2010 
 */
function getFunctionHint(somefunction){
	if(structKeyExists(somefunction.metadata, "hint")) return deserializeJSON(serializeJSON(somefunction.metadata.hint));
	return "";
}
</cfscript>

<!---
 This function will return information about a user's XBox Live status.
 
 @param tag 	 Username for the account. (Required)
 @return Returns a structure. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, January 18, 2007 
--->
<cffunction name="getGamerCard" output="false" returnType="struct">
	<cfargument name="tag" type="string" required="true">
	<cfset var result = structNew()>
	<cfset var theURL = "http://gamercard.xbox.com/#arguments.tag#.card">
	<cfset var httpResult = "">
	<cfset var gameblock = "">
	<cfset var foundImg = "">
	<cfset var img = "">
	<cfset var title = "">
	
	<cfset result.games = arrayNew(1)>
		
	<cfhttp url="#theURL#" result="httpResult">
	<cfset httpResult = httpResult.fileContent>
	
	<!--- first get the xboxlive level --->
	<cfset result.level = rereplace(httpResult, ".*XbcGamertag(.*?)"".*", "\1")>
	
	<!--- get gamertile --->
	<cfset result.gamertileimg = rereplace(httpResult, ".*(<img class=""XbcgcGamertile"" .*?>).*","\1")>
	<cfset result.gamertileimg = rereplace(result.gamertileimg, ".*src=""(.*?)"".*", "\1")>

	<!--- set url --->
	<cfset result.memberurl = "http://live.xbox.com/member/#arguments.tag#">
	
	<!--- gamer scope pattern:
	<img alt="Gamerscore" src="/xweb/lib/images/G_Icon_External.gif" /></span><span class="XbcFRAR">3095</span>
	--->
	<cfset result.gamerscore = rereplace(httpResult,".*<img alt=""Gamerscore"".*?<span class=""XbcFRAR"">([0-9]+).*","\1")>

	<!--- get ths block of links/images for recent games --->
	<cfset gameblock = rereplace(httpResult, ".*<div class=""XbcgcGames"">(.*?)</div>.*", "\1")>
	<cfset foundImg = reFind("<img", gameblock)>
	<!--- get all images in this block --->
	<cfloop condition="foundImg">
		<cfset img = reFindNoCase("(<img.*?>)",gameblock,1,1)>
		<cfif img.pos[1] gte 1>
			<cfset imgStr = mid(gameblock, img.pos[1], img.len[1])>
			<!--- now get the title --->
			<cfset title = rereplace(imgstr, ".*title=""(.*?)"".*", "\1")>
			<cfset arrayAppend(result.games, title)>
			<cfset gameblock = replace(gameblock, imgstr, "")>			
			<cfset foundImg = reFind("<img", gameblock)>
		</cfif>
	</cfloop>
	
	<cfreturn result>
	
</cffunction>

<!---
 Extracts the host name from a URL.
 
 @param url 	 the url from which you want to extract the host name (Optional)
 @return Returns a string containing the host name. 
 @author Todd Sharp (todd@cfsilence.com) 
 @version 1, June 5, 2008 
--->
<cffunction name="getHostFromURL" access="public" output="false" returntype="string">
	<cfargument name="url" required="false" default="" />
	<cfset var jURL = "" />
	<cfif len(arguments.url)>
		<cfset jURL = createObject("java", "java.net.URL").init(arguments.url) />
		<cfreturn jURL.getHost() />
	<cfelse>
		<cfreturn ""/>
	</cfif>
</cffunction>

<!---
 Introspect Java object's fields, methods, and all inheritance info.
 
 @param Object 	 Object to introspect. (Required)
 @return Returns a struct. 
 @author Paul Kenney (paul_kenney_77@yahoo.com) 
 @version 1, May 10, 2004 
--->
<cffunction name="getJavaMetadata" returntype="struct" output="false">
	<cfargument name="Object" type="any" required="true"/>
	<cfargument name="AccessLimit" type="string" required="false" default="public">
	<cfargument name="isMetadata" type="boolean" required="false" default="false"/>
	<!---  --->
	<cfset var NULL = Chr(0)>
	<cfset var Modifier = CreateObject("java", "java.lang.reflect.Modifier")>
	<cfset var class = NULL>
	<cfset var i = 0>
	<cfset var j = 0>
	<cfset var methods = NULL>
	<cfset var fields = NULL>
	<cfset var extends = NULL>
	<cfset var Current = StructNew()>
	<cfset var Data = StructNew()>
	<cfset var Limits = StructNew()>
	<cfset var LimitName = Arguments.AccessLimit>
	<cfset var ret = StructNew()>
	
	<cfif NOT Arguments.isMetadata>
		<cfset class = Arguments.Object.getClass()>
	<cfelse>
		<cfset class = Arguments.Object>
	</cfif>
	<cfif class.isArray()>
		<cfset class = class.getComponentType()>
	</cfif>	
	<cfset methods = class.getDeclaredMethods()>
	<cfset fields = class.getDeclaredFields()>
	
	<!-------------------------------------------------------------------------------->
	
	<cfset Limits["public"] = "public">
	<cfset Limits["protected"] = "public,protected">
	<cfset Limits["private"] = "public,protected,private">
	
	<!-------------------------------------------------------------------------------->
	
	<cfset Current["Method"] = NULL>
	<cfset Current["Params"] = NULL>
	<cfset Current["Param"] = StructNew()>
	<cfset Current["Param"]["Type"] = NULL>
	<cfset Current["Param"]["Name"] = NULL>
	<cfset Current["Return"] = StructNew()>
	<cfset Current["Return"]["Type"] = NULL>
	<cfset Current["Return"]["Name"] = NULL>
	<cfset Current["Exceptions"] = NULL>
	<cfset Current["Modifiers"] = NULL>
	<cfset Current["Field"] = StructNew()>
	<cfset Current["Field"]["Value"] = NULL>
	<cfset Current["Field"]["Class"] = NULL>
	<cfset Current["Field"]["Type"] = NULL>
	<cfset Current["Field"]["TypeName"] = NULL>
	
	<!-------------------------------------------------------------------------------->
	
	<cfset Current["Data"] = StructNew()>
	<cfset Current["Data"]["Methods"] = NULL>
	<cfset Current["Data"]["Method"] = NULL>
	<cfset Current["Data"]["Params"] = NULL>
	<cfset Current["Data"]["Param"] = NULL>
	<cfset Current["Data"]["Exceptions"] = NULL>
	<cfset Current["Data"]["Fields"] = NULL>
	<cfset Current["Data"]["Field"] = NULL>
			
	<!-------------------------------------------------------------------------------->

	<cfset ret["Class"] = class.getName()>
	<cfset ret["Name"] = class.getName()>
	<cfset ret["Package"] = class.getPackage().getName()>
	<cfset ret["Type"] = "java">

	<!-------------------------------------------------------------------------------->
	
	<cfif ArrayLen(Methods)>
		<cfset Current.Data.Methods = ArrayNew(1)>
		
		<cfloop index="i" from="1" to="#ArrayLen(Methods)#">
			<cfset Current.Data.Method = StructNew()>
			
			<cfset Current.Method = methods[i]>
			<cfset Current.Params = Current.Method.getParameterTypes()>
			
			<!---  --->
			
			<cfset Current.Modifiers = Current.Method.getModifiers()>
			<cfif Modifier.isPublic(Current.Modifiers)>
				<cfset Current.Data.Method["Access"] = "public">
			<cfelseif Modifier.isPrivate(Current.Modifiers)>
				<cfset Current.Data.Method["Access"] = "private">
			<cfelse>
				<cfset Current.Data.Method["Access"] = "protected">
			</cfif>
			
			<!---  --->
			
			<cfif ListFindNoCase(Limits[LimitName], Current.Data.Method.Access, ",")>
			
				<cfset Current.Data.Method["Declaration"] = Current.Method.toString()>
				<cfset Current.Data.Method["Name"] = Current.Method.getName()>
				
				<!---  --->
				
				<cfset Current.Return.Type = Current.Method.getReturnType()>
				<cfset Current.Return.Name = NULL>
				<cfloop condition="TRUE">
					<cfif Current.Return.Type.isArray()>
						<cfset Current.Return.Name = Current.Return.Name & "[]">
						<cfset Current.Return.Type = Current.Return.Type.getComponentType()>
					<cfelse>
						<cfset Current.Return.Name = Current.Return.Type.getName() & Current.Return.Name>
						<cfbreak/>
					</cfif>
				</cfloop>
					
				<cfset Current.Data.Method["ReturnType"] = Current.Return.Name>
	
				<!---  --->
				
				<cfset Current.Data.Method["Modifiers"] = ListToArray(Modifier.toString(Current.Modifiers), " ")>
				
				<!---  --->
				
				<cfif ArrayLen(Current.Params)>
					<cfset Current.Data.Params = ArrayNew(1)>
					
					<cfloop index="j" from="1" to="#ArrayLen(Current.Params)#">
						<cfset Current.Param.Type = Current.Params[j]>
						<cfset Current.Param.Name = NULL>
						
						<cfloop condition="TRUE">
							<cfif Current.Param.Type.isArray()>
								<cfset Current.Param.Name = Current.Param.Name & "[]">
								<cfset Current.Param.Type = Current.Param.Type.getComponentType()>
							<cfelse>
								<cfset Current.Param.Name = Current.Param.Type.getName() & Current.Param.Name>
								<cfbreak/>
							</cfif>
						</cfloop>
						
						<cfset ArrayAppend(Current.Data.Params, Current.Param.Name)>
					</cfloop>
					
					<cfset Current.Data.Method["Parameters"] = Current.Data.Params>
				</cfif>					
				
				<!---  --->
	
				<cfset Current.Exceptions = Current.Method.getExceptionTypes()>
				<cfif ArrayLen(Current.Exceptions)>
					<cfset Current.Data.Exceptions = ArrayNew(1)>
					<cfloop index="j" from="1" to="#ArrayLen(Current.Exceptions)#">
						<cfset ArrayAppend(Current.Data.Exceptions, Current.Exceptions[j].getName())>
					</cfloop>
					<cfset Current.Data.Method["Throws"] = Current.Data.Exceptions>						
				</cfif>
				
				<!---  --->
				<cfset ArrayAppend(Current.Data.Methods, Current.Data.Method)>
			</cfif>
		</cfloop>
		
		<cfif ArrayLen(Current.Data.Methods)>
			<cfset ret["Methods"] = Current.Data.Methods>
		</cfif>
	</cfif>
			
	<!-------------------------------------------------------------------------------->
			
	<cfif ArrayLen(Fields)>
		<cfset Current.Data.Fields = ArrayNew(1)>
		
		<cfloop index="i" from="1" to="#ArrayLen(Fields)#">
			<cfset Current.Data.Field = StructNew()>
		
			<cfset Current.Field.Value = fields[i]>
			<cfset Current.Field.Class = fields[i].getType()>
			
			<!---  --->
			
			<cfset Current.Modifiers = Current.Field.Value.getModifiers()>
			<cfif Modifier.isPublic(Current.Modifiers)>
				<cfset Current.Data.Field["Access"] = "public">
			<cfelseif Modifier.isPrivate(Current.Modifiers)>
				<cfset Current.Data.Field["Access"] = "private">
			<cfelse>
				<cfset Current.Data.Field["Access"] = "protected">
			</cfif>			
			
			<cfif ListFindNoCase(Limits[LimitName], Current.Data.Field.Access, ",")>
			
				<!---  --->
				<cfset Current.Data.Field["Declaration"] = Current.Field.Value.toString()>
				<cfset Current.Data.Field["Name"] = Current.Field.Value.getName()>
				<!---  --->
				
				<cfset Current.Field.Type = Current.Field.Class>
				<cfset Current.Field.TypeName = NULL>
				
				<cfloop condition="TRUE">
					<cfif Current.Field.Type.isArray()>
						<cfset Current.Field.TypeName = Current.Field.TypeName & "[]">
						<cfset Current.Field.Type = Current.Field.Type.getComponentType()>
					<cfelse>
						<cfset Current.Field.TypeName = Current.Field.Type.getName() & Current.Field.TypeName>
						<cfbreak/>
					</cfif>
				</cfloop>
				<cfset Current.Data.Field["Type"] = Current.Field.TypeName>
	
				<!---  --->
				<cfset Current.Data.Field["Modifiers"] = ListToArray(Modifier.toString(Current.Modifiers), " ")>
				<!---  --->
				
				<cfset ArrayAppend(Current.Data.Fields, Current.Data.Field)>
				
			</cfif>
		</cfloop>
		
		<cfif ArrayLen(Current.Data.Fields)>
			<cfset ret["Fields"] = Current.Data.Fields>
		</cfif>
	</cfif>
			
	<!-------------------------------------------------------------------------------->
			
	<cfif Compare(class.getName(), "java.lang.Object")>
		<cfset ret["Extends"] = getJavaMetadata(class.getSuperClass(), Arguments.AccessLimit, true)>
	</cfif>
			
	<!-------------------------------------------------------------------------------->
	
	<cfreturn ret/>
</cffunction>

<cfscript>
/**
 * Measures the elapsed time (load time) from when the single function was first called to the time it was last called.
 * 
 * @param mes 	 Type of measurement, either 'mil' for miliseconds or 'sec' for seconds. (Required)
 * @param beg 	 Beginning tick count. (Required)
 * @return Returns a string. 
 * @author Kyle W. McNamara (mac@kwm.tm) 
 * @version 1, October 10, 2002 
 */
function GetLoadTime(mes,beg) {
	var measurement = 0;
	var measure_text = "";
	var tickBeginValue = 0;
	var tickEnd = 0;
	var loadTime = "";

	if (mes eq "mil") {
		measurement = 1;
		measure_text = " Milliseconds";
	}
	else if (mes eq "sec") {
		measurement = 1000;
		measure_text = " Seconds";
	}
	tickBeginValue = beg;
	tickEnd = gettickcount();
	loadTime = ((tickEnd - tickBeginValue)/measurement) & measure_text;
	return loadTime;
}
</cfscript>

<!---
 A better version of getLocale.
 
 @return Returns a struct. 
 @author Reinhard Jung (reinhard.jung@gmail.com) 
 @version 1, June 13, 2008 
--->
<cffunction name="getLocaleInfo" description="gets the Locale" output="false">
    <cfset var myLocale = structNew() />
    <cfset var currentLocale    = CreateObject("java", "java.util.Locale").getDefault() />
    <cfset myLocale.short.country        = currentLocale.getCountry() />
    <cfset myLocale.short.language    = currentLocale.getLanguage() />
    <cfset myLocale.short                        = myLocale.short.language &'_' &myLocale.short.country />
    <cfset myLocale.long                        = getLocale() />
    <cfset myLocale.full                        = getLocaleDisplayName() />

    <cfreturn myLocale />
</cffunction>

<!---
 Gets the directory path for CF mapping logical path.
 
 @param name 	 Mapping name to translate. (Required)
 @return Returns a string. 
 @author Joseph Flanigan (joseph@switch-box.org) 
 @version 1, February 18, 2004 
--->
<cffunction name="getMapDirectory" returntype="string" output="false">
	<cfargument name="name" type="string" required="yes">
	<cfset factory = CreateObject("java", "coldfusion.server.ServiceFactory")>
 	<cfreturn StructFind(factory.RuntimeService.getMappings(),Arguments.name)>
</cffunction>

<cfscript>
/**
 * Returns mime type and subtype for a file.
 * 
 * @param filename 	 File name to examine. (Required)
 * @return Returns a string. 
 * @author Kenneth Rainey (kip.rainey@incapital.com) 
 * @version 1, April 21, 2004 
 */
function getMimeType(filename) {
	var mimeStruct=structNew();
	var fileExtension ="";
	//extract file extension from file name
	fileExtension = Reverse(SpanExcluding(Reverse(fileName),"."));
	//build mime type array
	mimeStruct.ai="application/postscript";
	mimeStruct.aif="audio/x-aiff";
	mimeStruct.aifc="audio/x-aiff";
	mimeStruct.aiff="audio/x-aiff";
	mimeStruct.asc="text/plain";
	mimeStruct.au="audio/basic";
	mimeStruct.avi="video/x-msvideo";
	mimeStruct.bcpio="application/x-bcpio";
	mimeStruct.bin="application/octet-stream";
	mimeStruct.c="text/plain";
	mimeStruct.cc="text/plain";
	mimeStruct.ccad="application/clariscad";
	mimeStruct.cdf="application/x-netcdf";
	mimeStruct.class="application/octet-stream";
	mimeStruct.cpio="application/x-cpio";
	mimeStruct.cpt="application/mac-compactpro";
	mimeStruct.csh="application/x-csh";
	mimeStruct.css="text/css";
	mimeStruct.dcr="application/x-director";
	mimeStruct.dir="application/x-director";
	mimeStruct.dms="application/octet-stream";
	mimeStruct.doc="application/msword";
	mimeStruct.drw="application/drafting";
	mimeStruct.dvi="application/x-dvi";
	mimeStruct.dwg="application/acad";
	mimeStruct.dxf="application/dxf";
	mimeStruct.dxr="application/x-director";
	mimeStruct.eps="application/postscript";
	mimeStruct.etx="text/x-setext";
	mimeStruct.exe="application/octet-stream";
	mimeStruct.ez="application/andrew-inset";
	mimeStruct.f="text/plain";
	mimeStruct.f90="text/plain";
	mimeStruct.fli="video/x-fli";
	mimeStruct.gif="image/gif";
	mimeStruct.gtar="application/x-gtar";
	mimeStruct.gz="application/x-gzip";
	mimeStruct.h="text/plain";
	mimeStruct.hdf="application/x-hdf";
	mimeStruct.hh="text/plain";
	mimeStruct.hqx="application/mac-binhex40";
	mimeStruct.htm="text/html";
	mimeStruct.html="text/html";
	mimeStruct.ice="x-conference/x-cooltalk";
	mimeStruct.ief="image/ief";
	mimeStruct.iges="model/iges";
	mimeStruct.igs="model/iges";
	mimeStruct.ips="application/x-ipscript";
	mimeStruct.ipx="application/x-ipix";
	mimeStruct.jpe="image/jpeg";
	mimeStruct.jpeg="image/jpeg";
	mimeStruct.jpg="image/jpeg";
	mimeStruct.js="application/x-javascript";
	mimeStruct.kar="audio/midi";
	mimeStruct.latex="application/x-latex";
	mimeStruct.lha="application/octet-stream";
	mimeStruct.lsp="application/x-lisp";
	mimeStruct.lzh="application/octet-stream";
	mimeStruct.m="text/plain";
	mimeStruct.man="application/x-troff-man";
	mimeStruct.me="application/x-troff-me";
	mimeStruct.mesh="model/mesh";
	mimeStruct.mid="audio/midi";
	mimeStruct.midi="audio/midi";
	mimeStruct.mif="application/vnd.mif";
	mimeStruct.mime="www/mime";
	mimeStruct.mov="video/quicktime";
	mimeStruct.movie="video/x-sgi-movie";
	mimeStruct.mp2="audio/mpeg";
	mimeStruct.mp3="audio/mpeg";
	mimeStruct.mpe="video/mpeg";
	mimeStruct.mpeg="video/mpeg";
	mimeStruct.mpg="video/mpeg";
	mimeStruct.mpga="audio/mpeg";
	mimeStruct.ms="application/x-troff-ms";
	mimeStruct.msh="model/mesh";
	mimeStruct.nc="application/x-netcdf";
	mimeStruct.oda="application/oda";
	mimeStruct.pbm="image/x-portable-bitmap";
	mimeStruct.pdb="chemical/x-pdb";
	mimeStruct.pdf="application/pdf";
	mimeStruct.pgm="image/x-portable-graymap";
	mimeStruct.pgn="application/x-chess-pgn";
	mimeStruct.png="image/png";
	mimeStruct.pnm="image/x-portable-anymap";
	mimeStruct.pot="application/mspowerpoint";
	mimeStruct.ppm="image/x-portable-pixmap";
	mimeStruct.pps="application/mspowerpoint";
	mimeStruct.ppt="application/mspowerpoint";
	mimeStruct.ppz="application/mspowerpoint";
	mimeStruct.pre="application/x-freelance";
	mimeStruct.prt="application/pro_eng";
	mimeStruct.ps="application/postscript";
	mimeStruct.qt="video/quicktime";
	mimeStruct.ra="audio/x-realaudio";
	mimeStruct.ram="audio/x-pn-realaudio";
	mimeStruct.ras="image/cmu-raster";
	mimeStruct.rgb="image/x-rgb";
	mimeStruct.rm="audio/x-pn-realaudio";
	mimeStruct.roff="application/x-troff";
	mimeStruct.rpm="audio/x-pn-realaudio-plugin";
	mimeStruct.rtf="text/rtf";
	mimeStruct.rtx="text/richtext";
	mimeStruct.scm="application/x-lotusscreencam";
	mimeStruct.set="application/set";
	mimeStruct.sgm="text/sgml";
	mimeStruct.sgml="text/sgml";
	mimeStruct.sh="application/x-sh";
	mimeStruct.shar="application/x-shar";
	mimeStruct.silo="model/mesh";
	mimeStruct.sit="application/x-stuffit";
	mimeStruct.skd="application/x-koan";
	mimeStruct.skm="application/x-koan";
	mimeStruct.skp="application/x-koan";
	mimeStruct.skt="application/x-koan";
	mimeStruct.smi="application/smil";
	mimeStruct.smil="application/smil";
	mimeStruct.snd="audio/basic";
	mimeStruct.sol="application/solids";
	mimeStruct.spl="application/x-futuresplash";
	mimeStruct.src="application/x-wais-source";
	mimeStruct.step="application/STEP";
	mimeStruct.stl="application/SLA";
	mimeStruct.stp="application/STEP";
	mimeStruct.sv4cpio="application/x-sv4cpio";
	mimeStruct.sv4crc="application/x-sv4crc";
	mimeStruct.swf="application/x-shockwave-flash";
	mimeStruct.t="application/x-troff";
	mimeStruct.tar="application/x-tar";
	mimeStruct.tcl="application/x-tcl";
	mimeStruct.tex="application/x-tex";
	mimeStruct.texi="application/x-texinfo";
	mimeStruct.texinfo="application/x-texinfo";
	mimeStruct.tif="image/tiff";
	mimeStruct.tiff="image/tiff";
	mimeStruct.tr="application/x-troff";
	mimeStruct.tsi="audio/TSP-audio";
	mimeStruct.tsp="application/dsptype";
	mimeStruct.tsv="text/tab-separated-values";
	mimeStruct.txt="text/plain";
	mimeStruct.unv="application/i-deas";
	mimeStruct.ustar="application/x-ustar";
	mimeStruct.vcd="application/x-cdlink";
	mimeStruct.vda="application/vda";
	mimeStruct.viv="video/vnd.vivo";
	mimeStruct.vivo="video/vnd.vivo";
	mimeStruct.vrml="model/vrml";
	mimeStruct.wav="audio/x-wav";
	mimeStruct.wrl="model/vrml";
	mimeStruct.xbm="image/x-xbitmap";
	mimeStruct.xlc="application/vnd.ms-excel";
	mimeStruct.xll="application/vnd.ms-excel";
	mimeStruct.xlm="application/vnd.ms-excel";
	mimeStruct.xls="application/vnd.ms-excel";
	mimeStruct.xlw="application/vnd.ms-excel";
	mimeStruct.xml="text/xml";
	mimeStruct.xpm="image/x-xpixmap";
	mimeStruct.xwd="image/x-xwindowdump";
	mimeStruct.xyz="chemical/x-pdb";
	mimeStruct.zip="application/zip";
	if(structKeyExists(mimeStruct,fileExtension)) return mimeStruct[fileExtension];
	else return "unknown/unknown";
}
</cfscript>

<!---
 Obtains current time data from NIST Internet Time Service servers.
 
 @param timeServer 	 Time server. Defaults to 192.43.244.18. (Optional)
 @return Returns a structure. 
 @author Ben Forta (ben@forta.com) 
 @version 1, December 7, 2005 
--->
<cffunction name="GetNISTTime" returntype="struct" output="false">
	<cfargument name="timeServer" type="string" default="192.43.244.18" required="false">
	<cfset var result=StructNew()>

	<!--- Try/catch block --->
	<cftry>

      <!--- Try get time data --->
      <cfhttp url="http://#arguments.timeServer#:13/" />
      <!--- Save raw data --->
      <cfset result.raw = CFHTTP.FileContent>
      <!--- Extract Julian date --->
      <cfset result.julian=ListGetAt(result.raw, 1, " ")>
      <!--- Extract current date and time --->
      <cfset result.now=ParseDateTime(ListGetAt(result.raw, 2, " ")
                              & " "
                              & ListGetAt(result.raw, 3, " "))>
      <!--- Extract daylight savings time flag --->
      <cfset result.dst=IIf(ListGetAt(result.raw, 4, " ") IS 0,
                        FALSE, TRUE)>
      <!--- Extract leap month flag --->
      <cfset result.leapmonth=IIf(ListGetAt(result.raw, 5, " ") IS 0,
                           FALSE, TRUE)>
      <!--- Extract health flag --->
      <cfset result.healthy=IIf(ListGetAt(result.raw, 6, " ") IS 0,
                           FALSE, TRUE)>
      <!--- Extract advance milliseconds --->
      <cfset result.msadv=ListGetAt(result.raw, 7, " ")>
      <!--- Success --->
      <cfset result.success=TRUE>

      <!--- Catch any errors --->
      <cfcatch type="any">
         <cfset result.success=FALSE>
      </cfcatch>

	</cftry>

	<cfreturn result>

</cffunction>

<!---
 Get array of available server printers (for use with CFPRINT).
 
 @return Returns an array. 
 @author Ben Forta (ben@forta.com) 
 @version 1, September 7, 2007 
--->
<cffunction name="GetPrinters" returntype="array" output="no">
   <!--- Define local vars --->
   <cfset var piObj="">

   <!--- Get PrinterInfo object --->
   <cfobject type="java"
         action="create"
         name="piObj"
         class="coldfusion.print.PrinterInfo">

   <!--- Return printer list --->
   <cfreturn piObj.getPrinters()>
</cffunction>

<cfscript>
/**
 * Gets all initialization file entries.
 * 
 * @param iniFile 	 Full path to ini file to read. (Required)
 * @return Returns a structure. 
 * @author Giampaolo Bellavite (giampaolo@bellavite.com) 
 * @version 1, October 23, 2005 
 */
function getProfile(iniFile) {
	var sections = getProfileSections(iniFile);
	var sectionName = "";
	var retProfile = structNew();
	var i = "";
	var entry = "";
	
	for (sectionName in sections) {
		retProfile[sectionName] = structNew();
		for (i=1;i LTE listLen(sections[sectionName]);i=i+1) {
			entry = listGetAt(sections[sectionName],i);
			retProfile[sectionName][entry]=getProfileString(iniFile,sectionName,entry);
		}
	}
	return retProfile;		
}
</cfscript>

<cfscript>
/**
 * Determines the root path of the application without hard-coding.
 * 
 * @return Returns a string. 
 * @author Billy Cravens (billy@architechx.com) 
 * @version 1, October 3, 2002 
 */
function GetRootPath() {
	var cNested = listLen(getBaseTemplatePath(),"\") - listLen(getCurrentTemplatePath(),"\");
	var	appRootDir = cgi.script_name;
	var i = 0;
	
	for (i=0;i lte cNested;i=incrementValue(i)) {
		appRootDir = listDeleteAt(appRootDir,listLen(appRootDir, "/"),"/");
	}
	appRootDir = appRootDir & "/";
	return appRootDir;
}
</cfscript>

<cfscript>
/**
 * This function will return a query listing all the schedule task on a ColdFusion server without admin access.
 * 
 * @return Returns a query. 
 * @author Qasim Rasheed (qasimrasheed@hotmail.com) 
 * @version 1, February 24, 2005 
 */
function getScheduledTasks(){
	var i = "";
	var j = "";
	var retquery = "";
	var alltasks = createobject("java","coldfusion.server.ServiceFactory").getCronService().listall();
	if (arraylen(alltasks )) {
		retquery = querynew(structkeylist(alltasks[1]));
		queryaddrow(retquery, arraylen(alltasks));
		for (i=1; i lte arraylen(alltasks); i = i+1){
			for (j in alltasks[i])
				querysetcell(retquery, j, alltasks[i][j]);
		}
	}
	else retquery = querynew( 'nothing' );
	return retquery;
}
</cfscript>

<cfscript>
/**
 * Gets the ip address of the server.
 * 
 * @return Returns a string. 
 * @author Robert Everland III (reverland@reactivevision.com) 
 * @version 1, January 12, 2004 
 */
function GetServerIP() {
   var iaclass="";
   var addr="";
      
   // Init class
   iaclass=CreateObject("java", "java.net.InetAddress");

   //Get Local host variable
   addr=iaclass.getLocalHost();

   // Return ip address
   return addr.getHostAddress();
}
</cfscript>

<cfscript>
/**
 * Gets all the session keys and session ids for an application.
 * v1 by Rupert de Guzman (rndguzmanjr@yahoo.com)
 * 
 * @param appname 	 Application name. (Required)
 * @return Returns a struct. 
 * @author Bobby Hartsfield (bobby@acoderslife.com) 
 * @version 3, December 5, 2006 
 */
function getSessionList(appname){
	var obj = CreateObject("java","coldfusion.runtime.SessionTracker");
	return obj.getSessionCollection(appname);
}
</cfscript>

<!---
 Call the skype website to know the status of a user
 
 @param userName 	 The Skype username to check. (Required)
 @param numeric 	 Boolean value that determines if the numeric or textual status is returned. (Optional)
 @param timeout 	 Default timeout for the HTTP call. Defaults to 20 seconds. (Optional)
 @return Returns a string. 
 @author Giampaolo Bellavite (gp@omniwhere.com) 
 @version 0, June 11, 2009 
--->
<cffunction name="getSkypeStatus" access="" returntype="any" output="false" 
			  hint="Call the skype website to know the status of a user">
	<cfargument name="userName" type="string" required="true" hint="The Skype username to check">
	<cfargument name="numeric" type="boolean" required="false" default="false" hint="Return the numeric status (default is textual)">	
	<cfargument name="timeOut" type="numeric" required="false" default="20" hint="Timeout while asking the skype service">	

	<cfset var cfhttp = "">
	<cfhttp url="http://mystatus.skype.com/#userName#.#IIF(numeric,DE('num'),DE('txt'))#" timeout="#timeout#">
	<cfreturn cfhttp.fileContent>
</cffunction>

<cfscript>
/**
 * Gets the current stack trace, even if no error was thrown, and returns it in a query.
 * Removed var e as it breaks in CF9
 * 
 * @return Returns a query. 
 * @author Ivo D. SIlva (aphex@netvisao.pt) 
 * @version 2, July 1, 2011 
 */
function getStackTrace() {
  var j = "";
  var i = "";
  var StackTrace = "";
  
  try
  {
    j = CreateObject("java","java.lang.Throwable");
    j = j.getStackTrace();

    StackTrace = QueryNew("ClassName,MethodName,NativeMethod,LineNumber,hashCode");
    QueryAddRow(StackTrace,ArrayLen(j));
  
    for (i=1; i le ArrayLen(j); i = i+1)
    {
      QuerySetCell(StackTrace,'ClassName',j[i].getClassName(),i);
      QuerySetCell(StackTrace,'MethodName',j[i].getMethodName(),i);
      QuerySetCell(StackTrace,'NativeMethod',j[i].isNativeMethod(),i);
      QuerySetCell(StackTrace,'LineNumber',j[i].getLineNumber(),i);
      QuerySetCell(StackTrace,'hashCode',j[i].hashCode(),i);
    }
  }
  catch ( any e )
  {
    return e;
  }
  
  return StackTrace;
}
</cfscript>

<cfscript>
/**
 * returns a list of tags for a module in CVS based on passed in rlog results.
 * 
 * @param rlog 	 RLog results from CVS. (Required)
 * @return Returns a string. 
 * @author Douglas Knudsen (doug@cubicleman.com) 
 * @version 1, October 14, 2008 
 */
function getTagListFromRLOG( rlog )	{
		var myrlog = replace(arguments.rlog,'=============================================================================',chr(236),'All');
		var myArray = ListToArray(myrlog,chr(236));
		var myLength = ArrayLen(myArray);
		var startStr = 'symbolic names:';
		var endStr = 'keyword substitution:';
		var startPos = 0;
		var myLen = 0;
		var HDList = '';
		var i = '';
		var j = '';
		var tag = '';
		var hdArray = '';
		var hdArrayLen = 0;
	
		for(i=1; i LTE myLength; i = i +1)	{
			startPos = Find(startStr,myArray[i])+Len(startStr);
			myLen = Find(endStr,myArray[i]) - Find(startStr,myArray[i]) - Len(endStr);
			if( myLen GT 0 )	{
				hdArray = ListToArray(myArray[i],':');
				hdArrayLen = ArrayLen(hdArray);
				for(j=1; j LTE hdArrayLen; j = j + 1)	{
					if( Find('HD',hdArray[j]) )	{
						tag = Mid(hdArray[j],Find('HD',hdArray[j]), Len(hdArray[j]));
						if(NOT ListContains(HDList,tag,',') )
							HDList = ListAppend(HDList,tag);
					}
				
				}
			
			}
		
		}
		return HDList;
	}
</cfscript>

<!---
 Quick and easy way to get a tinyurl.
 
 @param theurl 	 The URL that you would like to convert to a tinyurl. (Required)
 @return Returns a String containing the tinyurl. 
 @author Todd Sharp (todd@cfsilence.com) 
 @version 1, October 6, 2008 
--->
<cffunction name="getTinyURL" access="public" output="false" returntype="string">
	<cfargument name="theurl" required="true" type="string" />
	<cfset var apiURL = "http://tinyurl.com/api-create.php?url=" & URLEncodedFormat(arguments.theurl) />
	
	<cfhttp url="#apiURL#" />
	
	<cfreturn cfhttp.FileContent />
</cffunction>

<!---
 Does a simple Twitter lookup for a user.
 Added a success flag - thx Ben Nadel.
 
 @param screenname 	 Screen name to look up. (Required)
 @return Returns a struct. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, June 7, 2011 
--->
<cffunction name="getTwitterUser" output="false" returnType="struct">
	<cfargument name="screenname" type="string" required="true">
	<cfset var httpResult = "">
	
	<!--- remove the @ if they included it. --->
	<cfif left(arguments.screenname,1) is "@">
		<cfset arguments.screenname = right(arguments.screenname, len(arguments.screenname)-1)>
	</cfif>
	
	<cfset var theUrl = "http://api.twitter.com/1/users/show.json?screen_name=#arguments.screenname#">
	
	<cfhttp url="#theUrl#" result="httpResult">
	<cfset var result = deserializeJSON(httpResult.filecontent)>
	
	<cfif structKeyExists(result, "error")>
		<cfset result.success = false>
	<cfelse>
		<cfset result.success = true>
	</cfif>

	<cfreturn result>	
</cffunction>

<cfscript>
/**
 * Returns a structure containing upload information.
 * 
 * @return Returns a struct. 
 * @author David Boyer (dave@yougeezer.co.uk) 
 * @version 0, June 23, 2010 
 */
function getUploadData() {
  var local = {};
  local.result = {};
  if (cgi.request_method Eq 'post') {
    local.uploads = form.getPartsArray();
    if (StructKeyExists(local, 'uploads')) {
      local.count = ArrayLen(local.uploads);
      for (local.u = 1; local.u Lte local.count; local.u++) {
        local.info = GetFileInfo(form[local.uploads[local.u].getName()]);
        local.result[local.uploads[local.u].getName()] = {
          tempFileName = form[local.uploads[local.u].getName()],
          originalName = local.uploads[local.u].getFileName(),
          contentType = local.uploads[local.u].getContentType(),
          filesize = local.info.size,
          ext = ListLast(local.uploads[local.u].getFileName(), '.')
        };
      }
    }
  }
  return local.result;
}
</cfscript>

<!---
 Pass in file path to web root and a file and it returns URL relative to site root.
 
 @param webRootPath 	 Full path of the web root. (Required)
 @param filePath 	 Full path of the file to which a relative path is needed. (Required)
 @param encodeURL 	 Boolean value to encode the result. Defaults to false. (Optional)
 @return Returns a string. 
 @author Mike Gillespie (spidre@gmail.com) 
 @version 1, June 23, 2010 
--->
<cffunction name="getUrlRelativeToWebRoot" access="public" output="true" returntype="string" hint="pass in a web root and file path and get the url relative to the web root">
	<cfargument name="webRootPath" required="yes" type="string" hint="c:\wwwroot\ as an example">
	<cfargument name="filePath" required="yes" type="string" hint="c:\wwwroot\images\my image.gif">
	<cfargument name="encodeURL" required="no" type="boolean" default="false" hint="url encodes all between the slashes and ignores periods">
	<cfset var pathOut="">
	<!--- these two vars only needed if encodeURL is true --->
	<cfset var strPathOut="/">
	<cfset var arrPath=arraynew(1)>
	<cfset var x = "">

	<!--- strip out the web root path and convert the slashes --->
	<cfset pathOut=replace(replacenocase(arguments.filePath,arguments.webRootPath,"/","one"),"\","/","all")>
	<!--- made this an option since URLEncodedFormat() changes everything, including the slashes --->
	<cfif arguments.encodeURL>
		<!--- load the array --->
		<cfset arrPath=listtoarray(pathout,"/")>
		<!--- loop the array (old school for portability) --->
		<cfloop index="x" from="1" to="#arraylen(arrPath)#">
			<!--- encode the string, but change the periods back (personal preference) --->
			<cfset strPathOut=listAppend(strPathOut,replacenocase(urlencodedformat(arrPath[x]),"%2e",".","all"),"/")>
		</cfloop>
		<!--- re-populate the out var --->
		<cfset pathout=strPathOut>
	</cfif>
	<!--- lets make sure we have not duped any slashes to catch listAppend() and/or inconsistent data coming in --->
	<cfset pathout=replacenocase(pathOut,"//","/","all")>
	<cfreturn pathOut>
</cffunction>

<cfscript>
/**
 * Function that determines which scope an unscoped variable refers to.
 * 
 * @param localVar 	 Variable name to check. (Required)
 * @return Returns a string. 
 * @author Mosh Teitelbaum (mosh.teitelbaum@evoch.com) 
 * @version 1, August 6, 2004 
 */
function getVariableScope(locVar) {
	var scopeList = "VARIABLES,CGI,FILE,URL,FORM,COOKIE,CLIENT,APPLICATION,SESSION,SERVER,REQUEST,CFHTTP,CALLER,ATTRIBUTES,ERROR,CFCATCH,CFFTP";
	var listEle = "";
	var cnt = 1;

	while (cnt LTE ListLen(scopeList)) {
		// Get current list element
		listEle = ListGetAt(scopeList, cnt);

		// Check for existence within current scope.  CGI is a special case
		if (listEle is "CGI" AND structKeyExists(cgi, locVar)) {
				return listEle;
		} else if (not listEle is "CGI" AND IsDefined("#listEle#.#locVar#")) {
				return listEle;
		}

		// Increment counter
		cnt = cnt + 1;
	}

}
</cfscript>

<!---
 Reverses a URL shortened by Google's URL Shortening service.
 
 @param url 	 Shortened URL to expand. (Required)
 @return Returns a string. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, January 13, 2011 
--->
<cffunction name="googleURLExpand" output="false" returnType="string">
	<cfargument name="url" type="string" required="true">
	<cfset var httpResult = "">
	<cfset var result = "">

	<cfhttp url="https://www.googleapis.com/urlshortener/v1/url?shortUrl=#urlEncodedFormat(arguments.url)#" method="get" result="httpResult"></cfhttp>

	<cfset result = httpResult.filecontent.toString()>
	<cfreturn deserializeJSON(result).longUrl>
</cffunction>

<!---
 Uses Google's URL Shortening service to shorten a URL.
 v2 by RJLSoftware (rjlsoftware@gmail.com)
 
 @param url 	 URL to shorten. (Required)
 @param apiKey 	 Optional API key. (Optional)
 @return Returns a string. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, January 14, 2011 
--->
<cffunction name="googleURLShorten" output="false" returnType="string">
	<cfargument name="url" type="string" required="true">
	<cfargument name="apiKey" type="string" required="false" default="" hint="API key identifies your application to Google">

	<cfset var requestURL = "https://www.googleapis.com/urlshortener/v1/url">
	<cfset var httpResult = "">
	<cfset var result = "">
	<cfset var response = "">
	<cfset var body = {"longUrl"=arguments.url}>
	<cfset body = serializeJson(body)>

	<cfif arguments.apiKey NEQ "">
	    <cfset requestURL=requestURL & "?key=" & arguments.apiKey>
	</cfif>

	<cfhttp url="#requestURL#" method="post" result="httpResult">
		<cfhttpparam type="header" name="Content-Type" value="application/json">
		<cfhttpparam type="body" value="#body#">
	</cfhttp>
	<cfset response=deserializeJSON(httpResult.filecontent.toString())>

    <cfif structkeyexists(response, 'error')>
        <cfset result=response.error.message>
    <cfelse>
        <!--- No Errors, return response.id (which is the shortened url) --->
        <cfset result=response.id>
    </cfif>

	<cfreturn result>
</cffunction>

<cfscript>
/**
 * Converts an HTML (hex) color code to gray.  An optional second argument allows for conversion to a web-safe color in the same step.
 * 
 * @param hex_color 	 6 character hex color code you want converted to grayscale. 
 * @param web_safe 	 Boolean.  Indicates whether to return the closest web-safe grayscale value.  Default is No. 
 * @return Returns a string. 
 * @author Sierra Bufe (sierra@brighterfusion.com) 
 * @version 1.0, November 22, 2001 
 */
function Grayscale(hex_color) {
  // strip out any leading pound signs
  var clean_hex = replace(hex_color,'##','','ALL');
  // parse out rgb values, convert them to decimal, and make into a list
  var rgb = InputBaseN(Left(clean_hex,2),16) & "," & InputBaseN(Mid(clean_hex,3,2),16) & "," & InputBaseN(Right(clean_hex,2),16);
  // find average value from the list
  var gray = ArrayAvg(ListToArray(rgb));
  // check to see if a web_safe result is preferred
  if ((ArrayLen(Arguments) GT 1) AND Arguments[2])
    gray = Round(gray / 51) * 51;

  // convert gray to hexadecimal and pad with a zero if necessary
  gray = FormatBaseN(gray,16);
  if (len(gray) is 1) gray = "0" & gray;
    // return gray value as a new 6-digit hex color
    return gray & gray & gray;
}
</cfscript>

<cfscript>
/**
 * Unzip a gzipped (.gz) file.
 * 
 * @param infilePath 	 Full path to gz file. (Required)
 * @param outputPath 	 Where to extract the gzfile. Defaults to current directory. (Optional)
 * @return Returns a boolean. 
 * @author Vaughan Allan (vallan@abnamromorgans.com.au) 
 * @version 1, May 3, 2010 
 */
function gunzipFile(infilePath) {
	var zipfile = "";
	var outfile = "";
	var outputPath = "";
	var infile = "";
	var gzInStream = createObject('java','java.util.zip.GZIPInputStream');
	var outStream = createObject('java','java.io.FileOutputStream');
	var inStream = createObject('java','java.io.FileInputStream');
	var buffer = repeatString(" ",1024).getBytes();
	var length = 0;
	var rv = true;
   
	if (arrayLen(Arguments) gte 2) outputPath = arguments[2];
	else outputPath = getDirectoryFromPath(infilePath);

	if (right(infilePath,3) neq '.gz') infilePath = infilePath & '.gz';

	if(right(outputPath,1) neq "/" and right(outputPath,1) neq "\") outputPath = outputPath & "/";
   
	try {
		infile = getFileFromPath(infilePath);
		outfile = outputPath & left(infile,len(infile) - 3);
		inStream.init(infilePath);
		gzInStream.init(inStream);
		outStream.init(outfile);
		do {
			length = gzInStream.read(buffer,0,1024);
            if (length neq -1) outStream.write(buffer,0,length);
		} while (length neq -1);
		outStream.close();
		gzInStream.close();
	} 
	catch (any e) {
		rv = false;
		try {
			outStream.close();
		} catch (any e) { }
			try {
				gzInStream.close();
			} catch (any e) { }
	}
	return rv;
}
</cfscript>

<cfscript>
/**
 * Assign a &quot;heat&quot; color based on value's position within the range.
 * 
 * @param num 	 Value to check. (Required)
 * @param minVal 	 Minimum value. Defaults to 1. (Optional)
 * @param maxVal 	 Maximum value. Defaults to 100. (Optional)
 * @param colorStyle 	 Either roygiv or greentored. Defaults to greentored. (Optional)
 * @param lightness 	 Lightness of color. 0 is darkest, 0.9 is lightest. Defaults to 0. (Optional)
 * @param reverseOrder 	 Colors will go highest to lowest unless this argument is true. Defaults to false. (Optional)
 * @return Returns a string. 
 * @author James Moberg (james@ssmedia.com) 
 * @version 1, August 5, 2011 
 */
function heatColor(num) {
	var minval = 1;
	var maxval = 100;
	var colorStyle = 'greentored'; //roygbiv OR greentored
	var lightness = 0;  //sets lightness of color - 0 is darkest, 0.9 is lightest
	var reverseOrder = 0; // By default the values will be colored highest to lowest; set this to true to color lowest to highest 
	var position = 0;
	var x = 0;
	var R = "";
	var G = "";
	var B = "";
	var shft = 0;
	if(ArrayLen(arguments) GTE 2 AND isnumeric(arguments[2])) {
		minval = val(arguments[2]);
	}
	if(ArrayLen(arguments) GTE 3 AND val(arguments[3])) {
		maxval = val(arguments[3]);
	}
	if(ArrayLen(arguments) GTE 4 AND arguments[4] IS 'roygbiv') {
		colorStyle = arguments[4];
	}
	if(ArrayLen(arguments) GTE 5 AND val(arguments[5]) GTE 0 AND val(arguments[5]) LTE 0.9) {
		lightness = val(arguments[5]);
	}
	if(ArrayLen(arguments) GTE 6 AND val(arguments[6])) {
		reverseOrder = YesNoFormat(1);
	}
	if (reverseOrder){
		x = minval;
		minval = maxval;
		maxval = x;
	}
	position = (num - minval) / (maxval - minval);
	shft = position + 0.2 + 5.5*(1-position);
	if (colorStyle IS 'roygbiv'){
		shft = 0.5*position + 1.7*(1-position);
	}
	x = shft + position * (2*Pi());	
	if (colorStyle NEQ 'roygbiv'){	
		x = x * -1;
	}
	R = INT((cos(x) + 1) * 128);
	R = Ucase(FormatBaseN(INT(R + lightness * (256 - R)),16));
	if (Len(R) IS 1){ R = "0" & R;}
	
	G = INT((cos(x+Pi()/2) + 1) * 128);
	G = Ucase(FormatBaseN(INT(G + lightness * (256 - G)),16));
	if (Len(G) IS 1){ G = "0" & G;}
	
	B = INT((cos(x+Pi()) + 1) * 128);
	B = Ucase(FormatBaseN(INT(B + lightness * (256 - B)),16));
	if (Len(B) IS 1){ B = "0" & B;}
	
	return '##' & R & G & B;
}
</cfscript>

<cfscript>
/**
 * Convert a hex RGB triplet to HSL (hue, saturation, luminance).
 * 
 * @param RGBTriplet 	 Hex RGB triplet to convert to HSL triplet. 
 * @return Returns a comma delimited list of values. 
 * @author Matthew Walker (matthew@electricsheep.co.nz) 
 * @version 1, November 6, 2001 
 */
function HexToHSL(RGBTriplet) {
	// ref Foley and van Dam, Fundamentals of Interactive Computer Graphics
	
	var R = 0;
	var G = 0;
	var B = 0;
	var H = 0;
	var S = 0;
	var L = 0;
	var TidiedTriplet = Replace(RGBTriplet, "##", "", "ALL");
	var MinColor = 0;
	var MaxColor = 0;
	
	if ( ListLen(RGBTriplet) GT 1 ) {
		R = ListFirst(RGBTriplet);
		G = ListGetAt(RGBTriplet, 2);
		B = ListLast(RGBTriplet);
	}
	else {
		R = InputBaseN(Mid(TidiedTriplet, 1,2), 16) / 255;
		G = InputBaseN(Mid(TidiedTriplet, 3,2), 16) / 255;
		B = InputBaseN(Mid(TidiedTriplet, 5,2), 16) / 255;
	}	
		
	MinColor = Min(R, Min(G, B));
	MaxColor = Max(R, Max(G, B));
	L = (MaxColor + MinColor)/2;

	if ( MaxColor NEQ MinColor ) { // not grey
		if ( L LT 0.5 )
			S=(MaxColor-MinColor)/(MaxColor+MinColor);
		else
			S=(MaxColor-MinColor)/(2-MaxColor-MinColor);
		if ( R EQ MaxColor )
			H = (G-B)/(MaxColor-MinColor);
		if ( G EQ MaxColor )
			H = 2 + (B-R)/(MaxColor-MinColor);
		if ( B EQ MaxColor )
			H = 4 + (R-G)/(MaxColor-MinColor);
		H = H / 6;	
	}
	
	return "#H#,#S#,#L#";
}
</cfscript>

<cfscript>
/**
 * Convert a hexadecimal color into a RGB color value.
 * 
 * @param hexColor 	 6 character hexadecimal color value. 
 * @return Returns a string. 
 * @author Eric Carlisle (ericc@nc.rr.com) 
 * @version 1.0, November 6, 2001 
 */
function HexToRGB(hexColor){
  /* Strip out poundsigns. */
  Var tHexColor = replace(hexColor,'##','','ALL');
	
  /* Establish vairable for RGB color. */
  Var RGBlist='';
  Var RGPpart='';	

  /* Initialize i */
  Var i=0;

  /* Loop through each hex triplet */
  for (i=1; i lte 5; i=i+2){
    RGBpart = InputBaseN(mid(tHexColor,i,2),16);
    RGBlist = listAppend(RGBlist,RGBpart);
  }
  return RGBlist;
}
</cfscript>

<cfscript>
/**
 * Convert an HSL (hue, saturation, luminance) triplet to a hex RGB triplet.
 * 
 * @param h 	 Hue value between 0 and 1.  Decimals must have a leading zero. 
 * @param s 	 Saturation value between 0 and 1.  Decimals must have a leading zero. 
 * @param l 	 Luminosityvalue between 0 and 1.  Decimals must have a leading zero. 
 * @return Returns a string. 
 * @author Matthew Walker (matthew@electricsheep.co.nz) 
 * @version 1, November 6, 2001 
 */
function HSLtoHex(H,S,L) {
	// ref Foley and van Dam, Fundamentals of Interactive Computer Graphics
	var R = L;
	var G = L;
	var B = L;
        Var temp1=0;
        Var temp2=0;
        Var Rtemp3=0;
        Var Gtemp3=0;
        Var Btemp3=0;
        Var Rhex=0;
        Var Ghex=0;
        Var Bhex=0;
	if ( S ) {
		if ( L LT 0.5 )
			temp2 = L * (1 + S);
		else
			temp2 = L + S - L * S;
		temp1 = 2 * L - temp2;

		Rtemp3 = H + 1/3;
		Gtemp3 = H;
		Btemp3 = H - 1/3;
		if ( Rtemp3 LT 0 )
			Rtemp3 = Rtemp3 + 1;
		if ( Gtemp3 LT 0 )
			Gtemp3 = Gtemp3 + 1;
		if ( Btemp3 LT 0 )
			Btemp3 = Btemp3 + 1;
		if ( Rtemp3 GT 1 )
			Rtemp3 = Rtemp3 - 1;	
		if ( Gtemp3 GT 1 )
			Gtemp3 = Gtemp3 - 1;	
		if ( Btemp3 GT 1 )
			Btemp3 = Btemp3 - 1;	
		
		if ( 6 * Rtemp3 LT 1 )
			R = temp1 + (temp2 - temp1) * 6 * Rtemp3;
		else
			if ( 2 * Rtemp3 LT 1 )
				R = temp2;
			else
				if ( 3 * Rtemp3 LT 2 )
					R = temp1 + (temp2 - temp1) * ((2/3) - Rtemp3) * 6;
				else
					R = temp1;
		
		if ( 6 * Gtemp3 LT 1 )
			G = temp1 + (temp2 - temp1) * 6 * Gtemp3;
		else
			if ( 2 * Gtemp3 LT 1 )
				G = temp2;
			else
				if ( 3 * Gtemp3 LT 2 )
					G = temp1 + (temp2 - temp1) * ((2/3) - Gtemp3) * 6;
				else
					G = temp1;
		
		if ( 6 * Btemp3 LT 1 )
			B = temp1 + (temp2 - temp1) * 6 * Btemp3;
		else
			if ( 2 * Btemp3 LT 1 )
				B = temp2;
			else
				if ( 3 * Btemp3 LT 2 )
					B = temp1 + (temp2 - temp1) * ((2/3) - Btemp3) * 6;
				else
					B = temp1;
	}
	Rhex = FormatBaseN(R*255,16);
	if ( Len(Rhex) EQ 1 )
		Rhex = "0" & Rhex;
	Ghex = FormatBaseN(G*255,16);
	if ( Len(Ghex) EQ 1 )
		Ghex = "0" & Ghex;
	Bhex = FormatBaseN(B*255,16);
	if ( Len(Bhex) EQ 1 )
		Bhex = "0" & Bhex;
	
	return UCase(Rhex & Ghex & Bhex);
}
</cfscript>

<cfscript>
/**
 * Returns &quot;https&quot; if the current browser session is via SSL, or &quot;http&quot; if not.
 * 
 * @return Returns a string. 
 * @author Alan McCollough (amccollough@anmc.org) 
 * @version 1, July 29, 2008 
 */
function httpOrS() {   
   if(cgi.server_port_secure IS TRUE) return "https";
   else return "http";
}
</cfscript>

<cfscript>
/**
 * Returns the proper dimensions of an image resized to a certain maximum size.
 * 
 * @param originalWidth 	 Width of image. (Required)
 * @param originalHeight 	 Height of image. (Required)
 * @param target 	 New target size. (Required)
 * @return Returns a structure. 
 * @author Christopher Jordan (cjordan@placs.net) 
 * @version 1, February 22, 2006 
 */
function imageResizeAspectRatio(originalWidth,originalHeight,target){
	var width		= 0;
	var height		= 0;
	var percentage	= 0;
	var imageProperties	= structnew();

	percentage = (target / originalHeight);
	if (originalWidth gt originalHeight) { 
		percentage = (target / originalWidth);
	}
	
	newWidth				= round(originalWidth * percentage);
	newHeight				= round(originalHeight * percentage);
	imageProperties.width	= newWidth;
	imageProperties.height	= newHeight;
	
	return imageProperties;		
}
</cfscript>

<cfscript>
/**
 * Returns width or height of a scaled image.
 * 
 * @param selector 	 Dimension to scale. Either h (for height) or w (for width). (Required)
 * @param oldHeight 	 Old height. (Required)
 * @param oldWidth 	 Old width. (Required)
 * @param newParameter 	 New size. (Required)
 * @return Returns a number. 
 * @author Greg Nettles (gregnettles@hotmail.com) 
 * @version 1, October 18, 2006 
 */
function imageScale(selector,oldHeight,oldWidth,newParameter) {
		var ratioA = oldHeight/oldWidth;
		var ratioB = oldWidth/oldHeight;
		if (selector is 'h') {
			return round(newParameter * (1/ratioA));
		} else if (selector is 'w') {
			return round(newParameter * (1/ratioB));
		}
	}
</cfscript>

<cfscript>
/**
 * Returns width and height of images based on image type.
 * v2 fix by John Bliss
 * 
 * @param filename 	 Absolute or relative path to file. (Required)
 * @param mimetype 	 Minetype for the file. (Optional)
 * @return Returns a struct containing height and width information, or an error string. 
 * @author Peter Crowley (pcrowley@webzone.ie) 
 * @version 2, March 20, 2010 
 */
function ImageSize(filename) {
	// Jpeg variables
	var nFileLength=0; var nBlockLength=0; var nMarker=0;
	var nSOI = 65496; // Start of Image (FFD8)
	var nEOI = 65497; // End of Image (FFD9)
	var nSOF = 65472; // Start of frame nMarker (FFC0)
	var nSOF1 = 65473; // Start of frame extended sequential mode (FFC1)
	var nSOF2 = 65474; // Start of frame progressive mode (FFC2)
	var nSOF3 = 65475; // Start of frame lossless mode (FFC3)
	var nSOS = 65498; // Start of Scan (FFDA)

	
	var sImageType = "";
	var kCoords = structNew();
	var fInput = 0;
	var sByte=0;
	var sFullPath="";
	var sMimeType = "";
	
	if (Left(filename,1) IS "/" OR Left(filename,1) IS "\" OR MID(filename,2,1) IS ":")
		sFullPath=filename;
	else
		sFullPath=ExpandPath(filename);

	// Establish image type 
	if(arrayLen(arguments) gt 1) { 	//optional mimetype
		sMimeType = arguments[2];
		if (LCase(ListFirst(sMimeType,"/")) IS NOT "image") return "Wrong mime type";
		if (ListLen(sMimeType,"/") NEQ 2) return "Invalid mime type";
		sImageType=LCase(ListLast(sMimeType,"/"));
	} else { // work off file extension
		if (ListLen(filename,".") LT 2) return "Unknown image type";
		sImageType=LCase(ListLast(filename,"."));
	}

	if(not fileExists(sFullPath)) return "File does not exist.";
	
	//make a fileInputStream object to read the file into
	fInput = createObject("java","java.io.RandomAccessFile").init(sFullPath,"r");
	
	// Get X,Y resolution sizes for each image type supported
	switch (sImageType) {
	case "jpg": case "jpeg":
		do {
			nMarker = fInput.readUnsignedShort();

			if (nMarker NEQ nSOI AND nMarker NEQ nEOI AND nMarker NEQ nSOS) {

				nBlockLength = fInput.readUnsignedShort();

				if (nMarker EQ nSOF OR nMarker EQ nSOF1 OR nMarker EQ nSOF2 OR nMarker EQ nSOF3) { // Start of frame
					fInput.readUnsignedByte(); // skip sample precision in bits
					kCoords.ImageHeight = fInput.readUnsignedShort();
					kCoords.ImageWidth = fInput.readUnsignedShort();
					fInput.close();
					return kCoords;
				} else {
					fInput.skipBytes(JavaCast("int",nBlockLength-2));
				}
			}
		} while (BitSHRN(nMarker,8) EQ 255 AND nMarker NEQ nEOI);
		break;
	case "gif":
		fInput.skipBytes(6);
		
		sByte = fInput.readUnsignedByte();
		kCoords.ImageWidth = fInput.readUnsignedByte() * 256 + sByte;

		sByte = fInput.readUnsignedByte();
		kCoords.ImageHeight = fInput.readUnsignedByte() * 256 + sByte;

		fInput.close();
		return kCoords;
	default:
		break;
	}
	//close out this entry
	fInput.close();
	return "Unhandled image type";
}
</cfscript>

<cfscript>
/**
 * Invoke a remote method using cfhttp and JSON proxy
 * v1.0 by Henry Ho
 * 
 * @param url 	 The URL of the remote component (Required)
 * @param method 	 The name of the remote method to call (Required)
 * @param args 	 Any arguments to pass to the method (Optional)
 * @return Any data returned by remote method call. 
 * @author Henry Ho (henryho167@gmail.com) 
 * @version 1.0, March 10, 2013 
 */
function invokeRemoteMethodByJSON(required string url, required string method, struct args){
	var httpService = new http(url=url, method="post");

	httpService.addParam(type="formfield", name="method", value=method);
	httpService.addParam(type="formfield", name="returnformat", value="json");
	httpService.addParam(type="formfield", name="argumentCollection", value=serializeJSON(args));
	
	var result = httpService.send().GetPrefix();
	
	if (len(result.fileContent)) {
		if (!isJson(result.fileContent)){
			throw(message="Non-json string returned", detail=result.fileContent);
		}
			
		return deserializeJSON(result.fileContent);
	}
}
</cfscript>

<cfscript>
/**
 * Returns true if application variables are enabled.
 * 
 * @return Returns a boolean. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, April 29, 2002 
 */
function IsApplicationVarEnabled() {
	var foo = "";
	try {
		foo = application.applicationName;
		return true;
	} catch("Any" e) {
		return false;
	}
}
</cfscript>

<cfscript>
/**
 * Returns true if the function is a BIF (built in function).
 * 
 * @param name 	 The name to check. 
 * @return Returns a boolean. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, September 26, 2001 
 */
function IsBIF(name) {
    return ListFindNoCase(StructKeyList(GetFunctionList()),name) GT 0;
}
</cfscript>

<cfscript>
/**
 * Returns True if the user has not requested a page within the given time span.
 * 
 * @param timespan 	 Days, hours, minutes, and seconds (using CreateTimeSpan) before client variables should be timed out. (Required)
 * @return Returns a Boolean value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, August 9, 2002 
 */
function IsClientTimeout(timespan)
{
  if (DateCompare(CreateODBCDateTime(Now()), DateAdd("s", (Round(timespan* 86400)), Client.LastVisit)) GTE 0){ 
    Return True;
  }
  else{
    Return False;
  }
}
</cfscript>

<cfscript>
/**
 * Returns true if browser cookies are enabled.
 * 
 * @return Returns a boolean. 
 * @author Alex Baban (alexbaban@gmail.com) 
 * @version 1, March 13, 2009 
 */
function isCookiesEnabled() {
	return IsBoolean(URLSessionFormat("True"));
}
</cfscript>

<cfscript>
/**
 * Returns true/false if the current template is being called as a custom tag.
 * 
 * @return Returns a Boolean value. 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 1, January 29, 2002 
 */
function IsCustomTag() {
  return yesNoFormat( listFindNoCase( getBaseTagList(), "CF_" & listFirst( listLast( getCurrentTemplatePath(), "/\" ), "." ) ) );
}
</cfscript>

<cfscript>
/**
 * Returns a boolean if the datasource name exists.
 * 
 * @param nameToCheck 	 DSN to check for. (Required)
 * @return Returns a boolean. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, June 21, 2002 
 */
function isDatasource(nameToCheck) {
	//grab the datasourceService object
	var dsObj = createObject("Java","coldfusion.server.ServiceFactory");
	//check if the name is one of the datasources
	return structKeyExists(dsObj.datasourceService.getDatasources(),nameToCheck);
}
</cfscript>

<cfscript>
/**
 * Returns true if the function is a BIF (built in function) or UDF (user defined function).
 * 
 * @param name 	 The name to check. 
 * @return Returns a boolean. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, September 26, 2001 
 */
function IsFunction(str) {
 if(ListFindNoCase(StructKeyList(GetFunctionList()),str)) return 1;
 if(IsDefined(str) AND Evaluate("IsCustomFunction(#str#)")) return 1;
 return 0;
}
</cfscript>

<cfscript>
/**
 * Returns true if valid hexadecimal color.
 * 
 * @param hexInput 	 Hex value you want to validate. (Required)
 * @return Returns a Boolean. 
 * @author Tony Brandner (tony@brandners.com) 
 * @version 1, July 15, 2013 
 */
function IsHexColor(hexInput) {
  var cleanHexInput = replace(hexInput,'##','','ALL');
  if (Len(ReReplace(cleanHexInput, "[0-9abcdefABCDEF]", "","ALL")) eq 0 and Len(cleanHexInput) gt 5) {
    return True;
  } else {
      return False;
    }
}
</cfscript>

<cfscript>
/**
 * a template calling itself is at home, otherwise, its not at home.
 * 
 * @return Returns a boolean. 
 * @author Joshua Shaffner (joshua@curlyweb.com) 
 * @version 1, June 26, 2002 
 */
function IsHomeCircuit(){
	var baseDir=getDirectoryFromPath(getBaseTemplatePath());
	var currDir=getDirectoryFromPath(getCurrentTemplatePath());

	if(baseDir is currDir) return true;
	else return false;
}
</cfscript>

<!---
 Checks to see if an image URL contains a valid jpeg or gif.
 
 @param imgURL 	 URL. (Required)
 @return Returns a boolean. 
 @author Nick Maloney (nmaloney@prolucid.com) 
 @version 1, September 7, 2005 
--->
<cffunction name="isImage" returntype="boolean" output="false">
	<cfargument name="imgURL" type="string" required="true">
	<cftry>
		<cfhttp method="get" url="#arguments.imgURL#" />
		<cfif cfhttp.mimetype eq "image/jpeg" or cfhttp.mimetype eq "image/gif">
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	<cfcatch>
		<cfreturn false>
	</cfcatch>
	</cftry>
</cffunction>

<!---
 Identifies CMYK images.
 
 @param image 	 Either a path to an image or an image object. (Required)
 @return Returns a boolean 
 @author James Moberg (james@ssmedia.com) 
 @version 1, July 8, 2013 
--->
<cffunction name="isImageCMYK" returntype="boolean" output="false" hint="Returns a true/false indicator regarding if image uses CMYK (CUSTOM) palette.">
	<cfargument name="image" default="" required="true" hint="path w/file or image object" />
	<cfset local.testImage = "">
	<cfset local.isCMYK = 0>
	<cfif IsSimpleValue(arguments.image)>
		<cfif fileExists(arguments.image) and isImageFile(arguments.image)>
			<CFSET local.testImage = imageRead(arguments.image) />
		</cfif>
	<cfelseif isImage(arguments.image)>
		<cfset local.testImage = arguments.image />
	</cfif>
	<cfif isImage(local.testImage)>
		<cfif not val(imageGetBufferedImage(local.testImage).getType())>
			<cfset local.isCMYK = 1 />
		</cfif>
	</cfif>
	<cfreturn local.isCMYK />	
</cffunction>

<cfscript>
/**
 * Checks to see if calling template is base template.
 * 
 * @return Returns a boolean. 
 * @author Scott Wintheiser (scott@lightburndesigns.com) 
 * @version 1, February 24, 2002 
 */
function isIncluded(){
	IF (getCurrentTemplatePath() NEQ getBaseTemplatePath()) return true;
	else return false;
}
</cfscript>

<!---
 Mobile browser detector.
 v2 by Raymond Camden. Fixed var scoping, and made API key a argument.
 
 @param apikey 	 Required API key. (Required)
 @return Returns a boolean. 
 @author Chris Brickhouse (cbrickhouse@gmail.com) 
 @version 2, December 18, 2008 
--->
<cffunction name="isMobileBrowser" returntype="boolean" output="false">
	<cfargument name="strAPI" type="string" required="true" hint="API Key">
	<cfset var cfhttp = "">
	<!--- 	
	set options for http post. 
	see the handsetdetection api for more options.
	http://www.handsetdetection.com/pages/api 
	--->
	<cfset var options = "geoip, product_info, display">
	<cfset var str ="">
	<!---	
	sign up for an API key from handsetdetection.com, otherwise this will not work.
	--->
	<cfset var thisxmlok = "">
    <cfset var thisxml = "">
	<cfset var server = "http://c1.handsetdetection.com/devices/vendors.xml">
	
	<cfset str = str & "<?xml version='1.0'?>">
	<cfset str = str & "<request>">
	<cfset str = str & "<apikey>#strAPI#</apikey>">
	<cfset str = str & "<options>#options#</options>">
	<cfset str = str & "<User-Agent>#cgi.http_user_agent#</User-Agent>">
	<cfset str = str & "</request>">
	<cftry>
		<cfhttp method="Post" url='http://c1.handsetdetection.com/devices/detect.xml' resolveurl="false" timeout="10" >
			<cfhttpparam type="xml" value="#str#" >
		</cfhttp>
		<cfset thisXML = xmlparse(cfhttp.FileContent)>
		<cfset thisXMLOK = thisxml.reply.message.xmlText>
		<cfcatch type="any">
			<cfreturn false>
		</cfcatch>			
	</cftry>
    <!--- throw if bad api, don't hide it... --->
    <cfif findNoCase("Invalid API", thisxmlok)>
    	<cfthrow message="#thisxmlok#">
    </cfif>
	<cfif not comparenocase(thisxmlok,"OK")>
		<cftry>
			<cfset thisXMLOK = len(thisxml.reply.product_info.is_wireless_device.xmlText)>
			<cfif thisXMLOK>
				<cfreturn true>
			<cfelse>
				<cfreturn false>
			</cfif>
			<cfcatch type="any">
				<cfreturn false>
			</cfcatch>
		</cftry>
	<cfelse>
		<cfreturn false>
	</cfif>
</cffunction>

<cfscript>
/**
 * Checks to see whether a string passed to it passes the Luhn algorithm (also known as the Mod10 algorithm)
 * V2 update by Christopher Jordan cjordan@placs.net
 * V3 update by Peter J. Farrell (pjf@maestropublishing.com)
 * 
 * @param number 	 String to check. (Required)
 * @return Returns a boolean. 
 * @author Scott Glassbrook (cflib@vox.phydiux.com) 
 * @version 3, October 2, 2008 
 */
function isMod10(number) {
    var nDigits = Len(arguments.number);
    var parity = nDigits MOD 2;
    var digit = "";
    var sum = 0;
    var i = "";

    for (i=0; i LTE nDigits - 1; i=i+1) {
        digit = Mid(arguments.number, i+1, 1);
        if ((i MOD 2) EQ parity) {
            digit = digit * 2;
            if (digit GT 9) {
                digit = digit - 9;
            }
        }
        sum = sum + digit;
    }

    if (NOT sum MOD 10) return TRUE;
    else return FALSE;
}
</cfscript>

<!---
 Returns true if the specified task name exists as a scheduled task in the CF Administrator.
 
 @param Task 	 Task name you want to verify. (Required)
 @return Returns a Boolean. 
 @author Rob Brooks-Bilson (rbils@amkor.com) 
 @version 1, October 16, 2002 
--->
<CFFUNCTION NAME="IsScheduledTask" RETURN="Boolean">
  <CFARGUMENT NAME="TaskName" REQUIRED="True" TYPE="String">
  <!--- var local vars for the func --->
  <CFSET Var TaskXML="">
  <CFSET Var GetTasks="">
  
  <!--- get the scheduler xml file.  It's stored as WDDX --->
  <CFFILE ACTION="Read"
          FILE="#Server.ColdFusion.RootDir#\lib\neo-cron.xml"
          VARIABLE="TaskXML">
  
  <!--- convert the WDDX to CFML - and array of structs --->        
  <CFWDDX ACTION="WDDX2CFML" INPUT="#TaskXML#" OUTPUT="GetTasks"> 
  
  <!--- search the array of structs for the name passed to the func --->
  <CFIF ListContainsNoCase(StructKeyList(GetTasks[1]), Arguments.TaskName) EQ 0>
    <CFRETURN False>
  <CFELSE>
    <CFRETURN True>
  </CFIF>
</CFFUNCTION>

<cfscript>
/**
 * Returns true if session variables are enabled.
 * 
 * @return Returns a boolean. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, April 29, 2002 
 */
function IsSessionVarEnabled() {
	var foo = "";
	try {
		foo = session.urltoken;
		return true;
	} catch("Any" e) {
		return false;
	}
}
</cfscript>

<!---
 Returns true if the curent request is SOAP based.
 
 @return Returns a boolean. 
 @author Ben Forta (ben@forta.com) 
 @version 1, August 28, 2003 
--->
<cffunction name="isViaSoap" returnType="boolean" output="no">
   <!--- Get current message context --->
   <cfset var ctx = createObject("java", "org.apache.axis.MessageContext").getCurrentContext()>
	
   <!--- Invoke (cheap) method to see if it is null --->
   <cftry>
      <cfset ctx.isclient()>
      <cfcatch type="any">
         <cfreturn false>
      </cfcatch>
   </cftry>

   <cfreturn true>

</cffunction>

<cfscript>
/**
 * Returns true if the given color is a web safe hexadecimal color.
 * 
 * @param hexColor 	 Hex color representation to validate. 
 * @return Returns a Boolean value. 
 * @author Eric Carlisle (ericc@nc.rr.com) 
 * @version 1, November 6, 2001 
 */
function IsWebSafeColor(hexColor){
  /* Establish list of web safe colors */
  Var safeList = "00,33,66,99,cc,ff";
	
  /* Strip out poundsigns from argument. */
  Var tHexColor = replace(hexColor,'##','','ALL');

  /* Initialize i */
  Var i=0;
  
  /* Loop over r,g,b hex values */
  for (i=1; i lte 5; i=i+2){
		
    /* Set result to FALSE if a color isn't web safe. */	
    if (listFindNoCase(safeList,mid(tHexColor,i,2)) eq 0){
      return False;
    }
  }
  return True;
}
</cfscript>

<cfscript>
/**
 * Calculates the cost of a car journey.
 * 
 * @param miles 	 Miles traveled. (Required)
 * @param mpg 	 Miles per gallon. (Required)
 * @param ppl 	 Price per liter. (Required)
 * @return Returns a number. 
 * @author Dave Hill (write2dave@gmx.co.uk) 
 * @version 1, October 8, 2010 
 */
function journeyCost(miles,mpg,ppl) {
	var litresInGallon = 4.54;
	var cost = ( miles / mpg ) * litresInGallon * ( ppl / 100 );
	return decimalFormat(cost);
}
</cfscript>

<cfscript>
/**
 * A javascript alternative to the cflocation tag.
 * 
 * @param href 	 New url. (Required)
 * @return Returns a string. 
 * @author Isaac Dealey (info@turnkey.to) 
 * @version 1, May 9, 2003 
 */
function jslocation(href) { 
	var frame = "window"; 
		
	if (arraylen(arguments) gte 2) { frame = arguments[2]; } 
		
	return "<script language=""javascript"" type=""text/javascript"">" 
		& frame & ".location.replace(""" & jsstringformat(href) & """);</script>";
}
</cfscript>

<cfscript>
/**
 * Converts a byte value into kb or mb if over 1,204 bytes.
 * 
 * @param bytes 	 The number of bytes. (Required)
 * @return Returns a string. 
 * @author John Bartlett (jbartlett@strangejourney.net) 
 * @version 1, July 31, 2005 
 */
function KBytes(bytes) {
	var b=0;

	if(arguments.bytes lt 1024) return trim(numberFormat(arguments.bytes,"9,999")) & " bytes";
	
	b=arguments.bytes / 1024;
	
	if (b lt 1024) {
		if(b eq int(b)) return trim(numberFormat(b,"9,999")) & " KB";
		return trim(numberFormat(b,"9,999.9")) & " KB";
	}
	b= b / 1024;
	if (b eq int(b)) return trim(numberFormat(b,"999,999,999")) & " MB";
	return trim(numberFormat(b,"999,999,999.9")) & " MB";
}
</cfscript>

<cfscript>
/**
 * Lower Case Structure Keys
 * version 1.0 by Steve 'Cutter' Blades
 * 
 * @param str 	 Struct to lower-case the keys of (Required)
 * @return Returns a struct with its keys lower-cased 
 * @author Steve 'Cutter' Blades (no.junk@cutterscrossing.com) 
 * @version 1, August 26, 2012 
 */
function LCaseStructKeys(str){
	var i = "";
	var tmp = {};
	for(i in str){
		if(isStruct(str[i])){
			str[i] = LCaseStructKeys(str[i]);
		}
		tmp[LCase(i)] = duplicate(str[i]);
	}
	return tmp;
}
</cfscript>

<cfscript>
/**
 * Pass this UDF a Yes/No question, and it will return a prediction.
 * 
 * @param question 	 Yes/No question you want to ask the magic 8 ball. (Required)
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, July 14, 2009 
 */
function Magic8Ball(question){
  var validQuestion=False;
  var wordList="am,are,can,could,couldn't,will,would,wouldn't,won't,was,wasn't,must,musn't,may,if,is,isn't,should,shouldn't,do,did,don't,shall,shant";
  var i=0;
  var Answer=ArrayNew(1);
  for (i=1; i lte ListLen(wordList); i=i+1) {
    if (ListFirst(question, " ") EQ ListGetAt(wordList, i)){
	    validQuestion=True;
      break;
      }
  }
  // Initialize an array with all of the responses 
  Answer[1] = "Most likely";
  Answer[2] = "Very doubtful";
  Answer[3] = "It is certain";
  Answer[4] = "My sources say NO";
  Answer[5] = "As I see it, yes";
  Answer[6] = "Concentrate and ask again";
  Answer[7] = "My reply is NO";
  Answer[8] = "Signs point to yes";
  Answer[9] = "Cannot predict now";
  Answer[10] = "Outlook Good";
  Answer[11] = "Reply hazy, try again";
  Answer[12] = "It is decidedly so";
  Answer[13] = "Don't count on it";
  Answer[14] = "My sources say Yes";
  Answer[15] = "Yes, Definetly";
  Answer[16] = "Ask again later";
  Answer[17] = "Without a doubt";
  Answer[18] = "Outlook not so good";
  Answer[19] = "You may rely on it";
  Answer[20] = "Better not tell you now";
  Answer[21] = "YES";
  Answer[22] = "NO";
  
  if (ValidQuestion EQ True)
    return Answer[RandRange(1,22)];
  else
    return "I'm not sure I understand.  Please rephrase the question and ask again.";
}
</cfscript>

<cfscript>
/**
 * Creates a Select form item populated with given string items.
 * Mods by RCamden and Grant Furick.
 * 
 * @param name 	 The name of the Select item. (Required)
 * @param displayList 	 The text values for the drop down. (Required)
 * @param defaultSelected 	 The selected item. (Optional)
 * @param valueListSTR 	 The values for the drop down. Defaults to displayList. (Optional)
 * @param delimiter 	 The delimiter to use for all lists. (Optional)
 * @param mutliple 	 Turns on multiple for the drop down. Default is false. (Optional)
 * @param size 	 Size of the drop down.  (Optional)
 * @return Returns a string. 
 * @author Seth Duffey (sduffey@ci.davis.ca.us) 
 * @version 2, June 21, 2002 
 */
function MakeSelectList(name, displayList) {
    var outstring = "<select name=""#name#""";
	var defaultSelected = "";
	var valueListSTR = displayList;
	var delimiter = ",";
	var i = 1;

	if(arrayLen(arguments) gt 2) defaultSelected = arguments[3];
	if(arrayLen(arguments) gt 3) valueListSTR = arguments[4];
	if(arrayLen(arguments) gt 4) delimiter = arguments[5];
    if(arrayLen(arguments) gt 5 AND arguments[6]) outstring = outstring & " multiple";
    if(arrayLen(arguments) gt 6) outstring = outstring & " size=#arguments[7]#";
    outstring = outstring & ">";

    for (i=1; i LTE listLen(displayList,delimiter); i=i+1) {
		outstring = outstring & "<option value=""#listGetAt(valueListSTR,i,delimiter)#""";
		if(defaultSelected eq listGetAt(valueListSTR,i,delimiter)) outstring = outstring & " selected";
        outstring = outstring & ">#listGetAt(displayList,i,delimiter)#</option>";
    }

    outstring = outstring & "</select>";
	
    return outstring;
}
</cfscript>

<cfscript>
/**
 * Returns functions for recording a sequence of timed events
 * v1.0 by Adam Cameron
 * 
 * @return A struct containing functions start(), lap(), stop() 
 * @author Adam Cameron (dac.cfml@gmail.com) 
 * @version 1.0, December 22, 2013 
 */
struct function makeStopwatch(){
	var timeline		= [];

	var lap = function(string message=""){
		var ticksNow	= getTickCount();
		var lapCount	= arrayLen(timeline);
		var lap			= {
			currentClock	= ticksNow,
			lapDuration		= lapCount > 0 ? ticksNow - timeLine[lapCount].currentClock : 0,
			totalDuration	= lapCount > 0 ? ticksNow - timeLine[1].currentClock : 0,
			message			= message
		};
		arrayAppend(timeline, lap);
		return lap;
	};

	return {
		start		= function(string message="start"){
			return lap(message);
		},
		lap			= function(string message="lap"){
			return lap(message);
		},
		stop		= function(string message="stop"){
			return lap(message);
		},
		getTimeline	= function(){
			return timeLine;
		}
	};
}
</cfscript>

<cfscript>
/**
 * Calculate a vehicles Miles Per Gallon (MPG)
 * 
 * @param journeyStart 	 Miles on odometer at start. (Required)
 * @param journeyEnd 	 Miles on odometer at end. (Required)
 * @param liters 	 Liters of gas consumed. (Required)
 * @return Returns a number. 
 * @author Dave Hill (write2dave@gmx.co.uk) 
 * @version 1, October 8, 2010 
 */
function mpgcalc(journeyStart,journeyEnd,litres) {
	var litresInGallon = 4.54;
	
	var miles = journeyEnd - journeyStart;
	var gallons = litres/litresInGallon;
	var mpg = miles/gallons;
	return decimalFormat(mpg);
    
}
</cfscript>

<cfscript>
/**
 * Enables next 'n' browsing of a record set.
 * Modified by Ray Camden to: Make the url var dynamic, and disable the link on current page.
 * 
 * @param count 	 The record count of the query. (Required)
 * @param numToDiplay 	 How many records are displayed per page. (Required)
 * @param href 	 The URL to link to. This can include query string information. (Required)
 * @param startMarker 	 The name of the url variable that will signify which record to start with. Defaults to "nextStart." (Optional)
 * @return Returns a string. 
 * @author Joel Richards (joel@brainstormin.net) 
 * @version 2, October 10, 2002 
 */
function nextN(count,numToDisplay,href) {
	var totalRecords = count; // query recordcount
	var NsListLength = ceiling(totalRecords / numToDisplay); // this will give us the number of pages needed to display the full record set
	var NextStartList = ""; // list of start numbers
	var nextStart=1; // where to start outputting record
	var content = "";
	var i = 1;
	var startMarker = "nextStart"; // name of the url var to create
	
	if(arrayLen(arguments) gte 4) startMarker = arguments[4];
	
	for ( i = 1; i lte NsListLength; i = i + 1 ) {
		NextStartlist = listAppend(NextStartlist,nextStart); 
		// this will be the next start number in our list
		nextStart = nextStart + numToDisplay;
	}

	//output the links
	if (len(NextStartList) gt 1) {
		content = "Page ";
		for (i = 1; i lte listlen(NextStartList);  i = i + 1) {
			if(isDefined("url.#startMarker#") and url[startMarker] is listGetAt(NextStartList,i)) content = content & i;
			else content = content & " <a href=""" & href & "&#startMarker#=" & listGetAt(NextStartList,i) & """>" & i & "</a> ";
		} 
	}

	return content;
}
</cfscript>

<cfscript>
/**
 * NonZero returns TRUE if a value (numeric or text) is not an empty string and is greater than 0.
 * 
 * @param string 	 Value to check. (Required)
 * @return Returns a boolean. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, December 23, 2002 
 */
function NonZero(string){
	if(string NEQ "" OR string GT 0) return true;
	return false;
}
</cfscript>

<cfscript>
/**
 * A convenience function to determine if an expression evaluates to true or false.
 * 
 * @param expression 	 Expression to evaluate. (Required)
 * @return Returns a boolean. 
 * @author Mike Tangorre (mtangorre@cfcoder.com) 
 * @version 1, April 7, 2006 
 */
function nullFormat(expression) {
   if (expression) return true;
   return false;
}
</cfscript>

<cfscript>
/**
 * Pass in an optional UDF argument and define a default value at once.
 * 
 * @param args 	 Arguments (Required)
 * @param index 	 Index to check. (Required)
 * @param default 	 Value to use if args[index] doesn't exist. Defaults to an empty string. (Optional)
 * @return Returns a value (any type). 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 1, August 20, 2002 
 */
function OptArg( args, index ) {
	if( arrayLen( args ) GTE index ) {
		return args[ index ];
	} else if( arrayLen( arguments ) IS 3 ) {
		return arguments[ 3 ];
	} else {
		return "";
	}
}
</cfscript>

<cfscript>
/**
 * Pass in an optional UDF argument of a specific type and define a default value at once.
 * 
 * @param args 	 Arguments to check. (Required)
 * @param index 	 Index to check. (Required)
 * @param type 	 Type to use. (Required)
 * @param default 	 Value to use if args[index] doesn't exist. Defaults to an empty string if type isn't struct or array. (Optional)
 * @return Returns a value (any type). 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 1, August 20, 2002 
 */
function OptArgType( args, index, type ) {
	if( arrayLen( args ) GTE index AND typeOf( args[ index ] ) IS type ) {
		return args[ index ];
	} else if( arrayLen( arguments ) IS 4 ) {
		return arguments[ 4 ];
	} else {
		switch( type ) {
			case "structure" : return structNew();
			case "array" : return arrayNew( 1 );
			default : return "";
		}
	}
}
</cfscript>

<cfscript>
/**
 * Function to duplicate the cfparam for scoped variables.
 * 
 * @param scope 	 Scope to check. (Required)
 * @param varname 	 Variable name to param. (Required)
 * @param value 	 Value to use. Defaults to a space. (Optional)
 * @return Returns the value of the variable. 
 * @author Robert Blackburn (skorpiun@gmail.com) 
 * @version 1, February 13, 2006 
 */
function param(scope, varname) {
	var value = "";
	
	if(arrayLen(arguments) gt 2) {
		value = arguments[3];
	}
	
	if(NOT structKeyExists(arguments.scope, arguments.varname) ) {
		arguments.scope[arguments.varname] = value;
	}
	
	return arguments.scope[arguments.varname];
}
</cfscript>

<!---
 Converts an excel file to a structure of arrays
 Modded by Raymond Camden to fix incorrect col count
 added minor changes from Tony
 
 @param excelFile 	 Excel file to parse. (Required)
 @param returnType 	 Whether to return a query or a structure. Defaults to an empty string which means a query. (Optional)
 @return Returns a struct of arrays. 
 @author anthony petruzzi (tpetruzzi@gmail.com) 
 @version 2, May 19, 2011 
--->
<cffunction name="parseExcel" access="public" returntype="any" output="false">
       <cfargument name="excelFile" type="string" required="true">
       <cfargument name="returnType" type="string" required="false" default="">
       <cfset var loc = {}>
       <!--- structure to hold data retrieved --->
       <cfset loc.ret = {}>
       <!--- did we get headers yet --->
       <cfset loc.firstRow = true>
       <!--- create io stream for the excel file --->
       <cfset loc.io = CreateObject("java","java.io.FileInputStream").init(excelFile)>
       <!--- read the excel file --->
       <cfset loc.workbook = CreateObject("java","org.apache.poi.hssf.usermodel.HSSFWorkbook").init(loc.io)>
       <!--- get the first sheet of the workbook. zero indexed --->
       <cfset loc.workSheet = loc.workBook.getSheetAt(javacast("int", 0))>
       <!--- get the number of rows the sheet has. zero indexed --->
       <cfset loc.rows = loc.workSheet.getLastRowNum()>

       <cfif !loc.rows>
               <cfreturn loc.ret>
       </cfif>

       <!--- array to store data --->
       <cfset loc.data = []>
       <!--- loop through the rows and get the values. --->
       <cfloop from="0" to="#loc.rows#" index="loc.atrow">
               <!--- get the row --->
               <cfset loc.row = loc.workSheet.getRow(javacast("int", loc.atrow))>
               <!--- first check to see if first cell 1 is blank, if not process, if so move to next --->
               <cfset loc.checkCell = loc.row.getCell(0).getStringCellValue()>
               <!--- if the first cell isn't blank, proceed --->
               <cfif len(trim(loc.checkCell))>
                       <!--- the first row will tell us the number of columns to process --->
                       <cfif loc.firstRow>
                               <cfset loc.cols = loc.row.getLastCellNum() - 1>
                               <cfset loc.firstrow = false>
                       </cfif>
                       <cfset loc.values = []>
                       <!--- loop through the columns (cells) of the row and get the values --->
                       <cfloop from="0" to="#loc.cols#" index="loc.col">
                               <cfset loc.value = "">
                               <cfset loc.cellType = loc.row.getCell(javacast("int", loc.col))>
                               <cfif structkeyexists(loc, "celltype")>
                                       <cfif loc.cellType.getCellType() eq 0>
                                               <cfset loc.value = loc.cellType.getNumericCellValue()>
                                       <cfelse>
                                               <cfset loc.value = loc.cellType.getStringCellValue()>
                                       </cfif>
                               </cfif>
                               <cfset arrayappend(loc.values, loc.value)>
                       </cfloop>

                       <!--- store the data --->
                       <cfset arrayappend(loc.data, loc.values)>
               </cfif>
       </cfloop>

       <cfif !arraylen(loc.data)>
               <cfreturn loc.ret>
       </cfif>

       <!--- create a struct of arrays to return --->
       <cfset loc.numDown = arraylen(loc.data)>
       <cfset loc.numAcross = ++loc.cols>
       <cfloop from="1" to="#loc.numAcross#" index="loc.across">
               <cfloop from="1" to="#loc.numDown#" index="loc.down">
               <!--- header --->
               <cfif loc.down eq 1>
                       <cfset loc.key = loc.data[loc.down][loc.across]>
                       <cfset loc.ret[loc.key] = []>
               <cfelse>
                       <cfset arrayappend(loc.ret[loc.key], loc.data[loc.down][loc.across])>
               </cfif>
               </cfloop>
       </cfloop>

       <cfif arguments.returnType eq "query">
               <cfset loc.q = QueryNew("")>
               <cfloop collection="#loc.ret#" item="loc.i">
                       <cfset QueryAddColumn(loc.q, loc.i, "varchar", loc.ret[loc.i])>
               </cfloop>
               <cfset loc.ret = loc.q>
       </cfif>

       <cfreturn loc.ret>
</cffunction>

<!---
 Parses Form data structure out of HTTP header; this leaves empty entries in, unlike CFMX.
 
 @return Returns a structure. 
 @author Ken Fricklas (kenf@accessnet.net) 
 @version 1, September 7, 2005 
--->
<cffunction name="parseRawForm" returnType="struct" output="false">
	<cfset var raw = GetHttpRequestData().content>
	<cfset var sNewForm = structNew()>
	<cfset var iKey = "">
	<cfset var iVal = "">

	<cfloop list="#raw#" index="iHdr" delimiters="&">
		<cfif right(iHdr,1) EQ "=">
			<cfset iKey = ucase(left(iHdr, len(iHdr) - 1))>
			<cfset iVal = "">
		<cfelse>
			<cfset iKey = ucase(getToken(iHdr, 1, "="))>
			<cfset iVal = getToken(iHdr, 2, "=")>
		</cfif>
		<cfif structKeyExists(sNewForm, iKey)>
			<cfset sNewForm[iKey] = sNewForm[iKey] & ",#iVal#">
		<cfelse>
			<cfset sNewForm[iKey] = URLDecode(iVal)>
		</cfif>
	</cfloop>
	<cfset sNewform.fieldnames = structKeyList(sNewForm)>
	<cfreturn sNewForm>
</cffunction>

<cfscript>
/**
 * Simulates a paused state within an executed Coldfusion script.
 * Modified by Raymond Camden
 * 
 * @param TimeDelay 	 Number of seconds to paue. (Required)
 * @param DebugMode 	 If true, outputs debug information about the pause. Defaults to false. (Optional)
 * @return Returns nothing, unless debugmode is on. 
 * @author Tyler Bowler (tyler.bowler@rivhs.com) 
 * @version 1, December 20, 2007 
 */
function pause(TimeDelay) {
	
	//Gets the time the function starts processing for output purposes
	var StartTime = TimeFormat(CreateTime(Hour(Now()),Minute(Now()),Second(Now())), "HH:mm:ss");
	//Converts the start time to seconds 
	var StartTimeInSeconds = Val(Hour(Now()) * 720) + Val(Minute(Now()) * 60) + Second(Now());
	//Sets the delay equal to the startTime plus the amount of seconds passed to the function
	var Delay = StartTimeInSeconds + TimeDelay;
	//Makes the EndTime and CurrTimeInSeconds variable private to this function
	var EndTime = "";
	var CurrTimeInSeconds = "";
	var debugmode = false;
	
	if(arrayLen(arguments) gte 2) debugmode = arguments[2];

	//Start Loop
	do { 
		//Calculates the current seconds
		CurrTimeInSeconds = Val(Hour(Now()) * 720) + Val(Minute(Now()) * 60) + Second(Now()); 
		}
	while(CurrTimeInSeconds neq Delay);
	//Sets the EndTime when the do-while loop has completed
	EndTime = TimeFormat(CreateTime(Hour(Now()),Minute(Now()),Second(Now())), "HH:mm:ss");
	
	//Writes output if DebugMode is true
	if(debugMode) {
		WriteOutput('Start: #StartTime#<br />Paused for #TimeDelay# seconds<br />End: #EndTime#<br />');
	}
	 
}
</cfscript>

<cfscript>
/**
 * Creates the prefetch directive for Mozilla/Firefox browsers.
 * For more information on link prefetching see http://www.mozilla.org/projects/netlib/Link_Prefetching_FAQ.html#What_are_the_prefetching_hints
 * 
 * @param link 	 Link for prefetching. (Required)
 * @param title 	 Title for prefetched resource. (Optional)
 * @return Returns a string. 
 * @author Wayne Graham (wsgrah@wm.edu) 
 * @version 1, August 22, 2005 
 */
function prefetchLink(link){
	if(arrayLen(arguments) gte 2) return '<link rel="prefetch" href="#arguments.link#" title="#arguments[2]#" />';
	 return '<link rel="prefetch" href="#arguments.link#">';
}
</cfscript>

<cfscript>
/**
 * Converts a URL query string to a structure.
 * 
 * @param qs 	 Query string to parse. Defaults to cgi.query_string. (Optional)
 * @return Returns a struct. 
 * @author Malessa Brisbane (cflib@brisnicki.com) 
 * @version 1, April 11, 2006 
 */
function queryStringToStruct() {
	//var to hold the final structure
	var struct = StructNew();
	//vars for use in the loop, so we don't have to evaluate lists and arrays more than once
	var i = 1;
	var pairi = "";
	var keyi = "";
	var valuei = "";
	var qsarray = "";
	var qs = CGI.QUERY_STRING; // default querystring value
	
	//if there is a second argument, use that as the query string
	if (arrayLen(arguments) GT 0) qs = arguments[1];

	//put the query string into an array for easier looping
	qsarray = listToArray(qs, "&");
	//now, loop over the array and build the struct
	for (i = 1; i lte arrayLen(qsarray); i = i + 1){
		pairi = qsarray[i]; // current pair
		keyi = listFirst(pairi,"="); // current key
		valuei = urlDecode(listLast(pairi,"="));// current value
		// check if key already added to struct
		if (structKeyExists(struct,keyi)) struct[keyi] = listAppend(struct[keyi],valuei); // add value to list
		else structInsert(struct,keyi,valuei); // add new key/value pair
	}
	// return the struct
	return struct;
}
</cfscript>

<!---
 Simple table-based datadump from any query
 
 @param queryData 	 Query to display. (Required)
 @return Returns a string. 
 @author Jared Rypka-Hauer (jared@web-relevant.com) 
 @version 2, June 9, 2011 
--->
<cffunction name="queryToTableDump" access="public" returntype="string" output="false">
	<cfargument name="queryData" type="query" required="true" />
	<cfset var theQuery = arguments.queryData>
	<cfset var columns = arraytolist(theQuery.getMeta().getColumnLabels())>
	<cfset var theResults = "">
	<cfset var c = "">
	<cfset var i = "">
	<cfsavecontent variable="theResults">
		<cfoutput>
			<table border="1" cellpadding="0" cellspacing="0" align="left">
			<tr>
			<cfloop list="#columns#" index="c">
				<th>#c#</th>
			</cfloop>
			</tr>
			<cfloop from="1" to="#theQuery.recordCount#" index="i">
				<tr><cfloop list="#columns#" index="c">
					<td><cfif len(theQuery[c][i])>#theQuery[c][i]#<cfelse> </cfif></td></cfloop>
				</tr>
			</cfloop>
			</table>
		</cfoutput>
	</cfsavecontent>
	<cfreturn theResults />
</cffunction>

<cfscript>
/**
 * Reads a zip file and converts the entries into a query object (including optional binary data.)
 * 
 * @param filePath 	 Full path to zip file. (Required)
 * @param returnBinary 	 True/False; default is false. Should binary data be returned in the query. This is useful if you need to write the contents of a zip file to a database or you want to dynamically render contents of a zip file using cfcontent. (Optional)
 * @param regexFilter 	 A regex string to filter query results by the name in the zip file (the name would include pathing information.) For more advanced filtering, you can use a Query-of-Queries on the resultset. (Optional)
 * @return Returns a query. 
 * @author Dan G. Switzer, II (dswitzer@pengoworks.com) 
 * @version 1, October 9, 2006 
 */
function queryZipFile(filePath) {
	// create a new zip file object
	var zipFile = createObject("java", "java.util.zip.ZipFile").init(filePath); // ZipFile
	// used to enumeration the ZipEntry
	var entries = "";
	// the current enumerated ZipEntry
	var entry = "";
	// should we return binary data
	var bReturnBinary = false;
	// the regex filter to use to filter out specific entries
	var sRegExMatch = "";
	// the query object we'll return
	var getZipInfo = queryNew("id, name, size, date, mimeType, compressedSize, crc, method, type", "integer, varchar, integer, date, varchar, integer, varchar, varchar, varchar");
	// the current name of the entry
	var sName = "";
	// if the current entry is a directory
	var bDirectory = false;
	// the current entry's compression method
	var sMethod = "";
	// the number of entries
	var iFilesLen = 1;
	// a Java Date object, for converting time to CF
	var jDate = createObject("java", "java.util.Date");
	// a Java Long object, for converting CRC to Hex string
	var jLong = createObject("java", "java.lang.Long");
	// the Servlet context, for attempting to determine mime type of file
	var jServerContext = getPageContext().getServletContext();
	// buffer string used for getting the file contents
	var buffer = repeatString(" ", 1024).getBytes();
	// the input stream of the zip file
	var inStream = "";
	// create an BAOS as the output stream, this will allow us to store the file in memory
	var outStream = createObject("java", "java.io.ByteArrayOutputStream");
	// the length of the current stream
	var length = 0;
	// track valid compression methods
	var stMethods = structNew();

	// if the second argument is supplied, check to see if we should return binary data
	if( arrayLen(arguments) gt 1 ) bReturnBinary = arguments[2];
	// if the third argument is supplied, check to see if we should filter data based on a string
	if( arrayLen(arguments) gt 2 ) sRegExMatch = trim(arguments[3]);

	// if we're to add the binary data, add the column now
	if( bReturnBinary ) queryAddColumn(getZipInfo, "binary", "binary", arrayNew(1));

	// define the valid methods for a compression
	stMethods["-1"] = "unspecified";
	stMethods["0"] = "stored";
	stMethods["8"] = "deflated";

	// get the entries in the zip file
	entries = zipFile.entries();

	// loop through the all the entries
	while( entries.hasMoreElements() ){
		// get the next element
		entry = entries.nextElement();

		// get the current name
		sName = entry.getName();
		// is the entry a directory
		bDirectory = entry.isDirectory();
		// the method of compression
		sMethod = entry.getMethod();

		// if there hasn't been a search string supplied, or the match is found grab the entry
		if( (len(sRegExMatch) eq 0) or (NOT bDirectory and (reFindNoCase(sRegExMatch, sName) gt 0)) ){
			// convert the epoch time to a Java Date object
			jDate.setTime(entry.getTime());

			// add a row to the query for the current entry
			queryAddRow(getZipInfo);
			querySetCell(getZipInfo, "id", iFilesLen);
			querySetCell(getZipInfo, "name", sName);
			querySetCell(getZipInfo, "size", entry.getSize());
			querySetCell(getZipInfo, "date", createODBCDateTime(jDate.toString()));
			querySetCell(getZipInfo, "compressedSize", entry.getCompressedSize());
			if( structKeyExists(stMethods, sMethod) ){
				querySetCell(getZipInfo, "method", stMethods[sMethod]);
			} else {
				querySetCell(getZipInfo, "method", sMethod);
			}
			// return a type similar to cfdirectory (either "dir" or "file")
			if( bDirectory ){
				querySetCell(getZipInfo, "type", "dir");
			} else {
				// convert the CRC-32 to a hex string
				querySetCell(getZipInfo, "crc", uCase(jLong.toHexString(entry.getCrc())));
				querySetCell(getZipInfo, "mimeType", jServerContext.getMimeType(sName));
				querySetCell(getZipInfo, "type", "file");
			}

			// only grab the uncompressed binary data if it's a file and we've requested it
			if( NOT bDirectory and bReturnBinary ){
				// get the current entry's file stream
				inStream = zipFile.getInputStream(entry);

				// read in the 1K buffer chuck
				length = inStream.read(buffer);
				// loop through the inStream and grab each data chunk
				while( length GTE 0 ){
					outStream.write(buffer, 0, length);
					length = inStream.read(buffer);
				}
				// close the input stream
				inStream.close();

				// save the binary stream to the query
				querySetCell(getZipInfo, "binary", outStream.toByteArray());
				// reset the outStream -- close() has no affect, this will clear the contents
				outStream.reset();
			}

			// increase the zip file count
			iFilesLen = iFilesLen + 1;
		}
	}

	// close the zip file
	zipFile.close();

	// return the query object
	return getZipInfo;
}
</cfscript>

<!---
 Implementation of Hoare's Quicksort algorithm for sorting arrays of arbitrary items.
 Slight mods by RCamden (added var for comparison).
 Update my Mark Mandel to use List.addAll() functions.
 
 @param arrayToCompare 	 The array to be sorted. (Required)
 @param sorter 	 The comparison UDF. (Required)
 @return Returns a sorted array. 
 @author James Sleeman (james@innovativemedia.co.nz) 
 @version 3, January 15, 2012 
--->
<cffunction name="quickSort" hint="Implementation of quicksort" access="public" returntype="array" output="false">
       <cfargument name="arrayToCompare" hint="The array to compare" type="array" required="Yes">
       <cfargument name="sorter" hint="UDF for comparing items" type="any" required="Yes">
       <cfscript>
               var lesserArray  = ArrayNew(1);
               var greaterArray = ArrayNew(1);
               var pivotArray   = ArrayNew(1);
               var examine      = 2;
               var comparison = 0;

               pivotArray[1]    = arrayToCompare[1];

               if (arrayLen(arrayToCompare) LT 2) {
                       return arrayToCompare;
               }

               while(examine LTE arrayLen(arrayToCompare)){
                       comparison = arguments.sorter(arrayToCompare[examine], pivotArray[1]);
                       switch(comparison) {
                               case "-1": {
                                       arrayAppend(lesserArray, arrayToCompare[examine]);
                                       break;
                               }
                               case "0": {
                                       arrayAppend(pivotArray, arrayToCompare[examine]);
                                       break;
                               }
                               case "1": {
                                       arrayAppend(greaterArray, arrayToCompare[examine]);
                                       break;
                               }
                       }
                       examine = examine + 1;
               }

               if (arrayLen(lesserArray)) {
                       lesserArray  = quickSort(lesserArray, arguments.sorter);
               } else {
                       lesserArray = arrayNew(1);
               }

               if (arrayLen(greaterArray)) {
                       greaterArray = quickSort(greaterArray, arguments.sorter);
               } else {
                       greaterArray = arrayNew(1);
               }

               lesserArray.addAll(pivotArray);
               lesserArray.addAll(greaterArray);

               return lesserArray;
       </cfscript>
</cffunction>

<cfscript>
/**
 * Returns a completely random color. Beautiful, isn't it?
 * Version 2 by Raymond Camden
 * 
 * @return Returns a string. 
 * @author Nathan Strutz (nathans@dnsfirm.com) 
 * @version 2, May 13, 2003 
 */
function randomColor() {
	var redColor = formatBaseN(randRange(0,255),16);
	var greenColor = formatBaseN(randRange(0,255),16);
	var blueColor = formatBaseN(randRange(0,255),16);
	
	if(len(redColor) is 1) redColor = "0" & redColor;
	if(len(greenColor) is 1) greenColor = "0" & greenColor;
	if(len(blueColor) is 1) blueColor = "0" & blueColor;

	return "##" & redColor & greenColor & blueColor;
}
</cfscript>

<cfscript>
/**
 * Returns a random color close to your given color.
 * 
 * @param color 	 RGB color, minus the #. (Required)
 * @param closeness 	 How close the random color should be to the original. (Required)
 * @return Returns a RGB color in the form of a string. 
 * @author nathan (nathans@dnsfirm.com) 
 * @version 1, June 12, 2003 
 */
function randomColorClose(color,closeness) {
	var redColor = "";
	var greenColor = "";
	var blueColor = "";

	redColor = InputBaseN(Mid(color,1,2),16);
	greenColor = InputBaseN(Mid(color,3,2),16);
	blueColor = InputBaseN(Mid(color,5,2),16);

	// randomize and format back to base 16. min and max functions ensure characters don't leave base 16 size.
	redColor = FormatBaseN(Min(255,Max(0,RandRange(redColor-closeness,redColor+closeness))),16);
	greenColor = FormatBaseN(Min(255,Max(0,RandRange(greenColor-closeness,greenColor+closeness))),16);
	blueColor = FormatBaseN(Min(255,Max(0,RandRange(blueColor-closeness,blueColor+closeness))),16);

	// fix formatting
	if(len(redColor) is 1) redColor = "0" & redColor;
	if(len(greenColor) is 1) greenColor = "0" & greenColor;
	if(len(blueColor) is 1) blueColor = "0" & blueColor;

	return "##" & redColor & greenColor & blueColor;
}
</cfscript>

<cfscript>
/**
 * Returns a random color of a specified shade, light, dark, extra light, extra dark, or any.
 * 
 * @param contrast 	 A contract. Possible values are any (default), dark, exdark, light, exlight. (Optional)
 * @return Returns a string. 
 * @author Nathan Strutz (nathans@dnsfirm.com) 
 * @version 1, October 20, 2003 
 */
function randomColorShade() {
	var contrast = "any";
	var ranges = structNew();
	var redColor = "";
	var greenColor = "";
	var blueColor = "";
	
	ranges.any = "0,255";
	ranges.dark= "0,119";
	ranges.exdark = "0,51";
	ranges.light = "136,255";
	ranges.exlight = "204,255";
	
	if(arrayLen(arguments) gte 1) contrast = arguments[1];	
	
	redColor = formatBaseN(randRange(listFirst(ranges[contrast]),listLast(ranges[contrast])),16);
	greenColor = formatBaseN(randRange(listFirst(ranges[contrast]),listLast(ranges[contrast])),16);
	blueColor = formatBaseN(randRange(listFirst(ranges[contrast]),listLast(ranges[contrast])),16);
	if(len(redColor) is 1) redColor = "0" & redColor;
	if(len(greenColor) is 1) greenColor = "0" & greenColor;
	if(len(blueColor) is 1) blueColor = "0" & blueColor;
	
	return "##" & redColor & greenColor & blueColor;
}
</cfscript>

<!---
 Returns a random first name.
 
 @return Returns a string. 
 @author Matt Casey (matt@digitalhappy.com) 
 @version 1, June 22, 2010 
--->
<cffunction name="randomFirstName" output="false" access="public" returntype="any" hint="">
	<cfset var names = "Adam,Ahmed,Alex,Ali,Amanda,Amy,Andrea,Andrew,Andy,Angela,Anna,Anne,Anthony,Antonio,Ashley,Barbara,Ben,Bill,Bob,Brian,Carlos,Carol,Chris,Christian,Christine,Cindy,Claudia,Dan,Daniel,Dave,David,Debbie,Elizabeth,Eric,Gary,George,Heather,Jack,James,Jason,Jean,Jeff,Jennifer,Jessica,Jim,Joe,John,Jonathan,Jose,Juan,Julie,Karen,Kelly,Kevin,Kim,Laura,Linda,Lisa,Luis,Marco,Maria,Marie,Mark,Martin,Mary,Matt,Matthew,Melissa,Michael,Michelle,Mike,Mohamed,Monica,Nancy,Nick,Nicole,Patricia,Patrick,Paul,Peter,Rachel,Richard,Robert,Ryan,Sam,Sandra,Sara,Sarah,Scott,Sharon,Stephanie,Stephen,Steve,Steven,Susan,Thomas,Tim,Tom,Tony,William" />
	<cfreturn listGetAt(names, randRange(1,100)) />
</cffunction>

<cfscript>
/**
 * This will generate the specified number of unique random numbers.
 * 
 * @param count 	 Number of unique random numbers. (Required)
 * @param start 	 Lower range of random numbers. (Required)
 * @param end 	 Upper range of random numbers. (Required)
 * @return Returns an array. 
 * @author Srinivas.V.K (vksrinu@gmail.com) 
 * @version 1, December 1, 2006 
 */
function randomGenerator(count,start,end) {
	var myArray = arrayNew(1);
	var i = 0;
	var ran = 0;
			
	if((arguments.end-arguments.start+1) lt arguments.count) arguments.count = arguments.end-arguments.start+1;
	for(;arrayLen(myArray) lt arguments.count; i=i+1) {
		ran=randRange(arguments.start,arguments.end);
		//before appending random number to array,check the number in array
		if(not listFind(arrayToList(myArray),ran)) 
			arrayAppend(myArray,ran);
	}
	return myArray;
}
</cfscript>

<!---
 Returns a random last name.
 
 @return Returns a string. 
 @author Matt Casey (matt@digitalhappy.com) 
 @version 1, June 18, 2010 
--->
<cffunction name="randomLastName" output="false" access="public" returntype="any" hint="">
	<cfset names = "Adams,Ahmed,Ali,Allen,Anderson,Bailey,Baker,Barker,Barnes,Begum,Bell,Bennett,Brown,Butler,Campbell,Carter,Chapman,Clark,Clarke,Collins,Cook,Cooper,Cox,Davies,Davis,Dixon,Edwards,Ellis,Evans,Fisher,Foster,Gray,Green,Griffiths,Hall,Harris,Harrison,Harvey,Hill,Holmes,Hughes,Hunt,Hussain,Jackson,James,Jenkins,Johnson,Jones,Kelly,Khan,King,Knight,Lee,Lewis,Lloyd,Marshall,Martin,Mason,Matthews,Miller,Mills,Mitchell,Moore,Morgan,Morris,Murphy,Owen,Palmer,Parker,Patel,Phillips,Powell,Price,Richards,Richardson,Roberts,Robinson,Rogers,Russell,Scott,Shaw,Simpson,Singh,Smith,Stevens,Taylor,Thomas,Thompson,Turner,Walker,Ward,Watson,Webb,White,Wilkinson,Williams,Wilson,Wood,Wright,Young" />	
	<cfreturn listGetAt(names, randRange(1,100)) />
</cffunction>

<!---
 Load and parse a .properties file into a struct
 
 @param filepath 	 Path to the properties file. (Required)
 @param varScope 	 A structure containing variables that can be used as token replacements within the properties file. (Optional)
 @return Returns a structure. 
 @author Chris Carey (ccarey@fi.net.au) 
 @version 1, September 1, 2010 
--->
<cffunction name="readPropertiesFile" output="true" returnType="Struct" hint="Read a properties file and return a structure">
    <cfargument name="filePath" type="string" required="true" hint="path to properties file">
	<cfargument name="varScope" type="Struct" required="false" hint="optional variable scope for value replacement">

    <cfset VAR stProps = StructNew()>
	<cfset VAR sProps = "">
	<cfset VAR i=0>
	<cfset VAR prop = "">
	<cfset VAR value = "">
	<cfset VAR line = "">
	<cfset VAR aMatch = ArrayNew(1)>

	<cfif NOT FileExists(arguments.filePath)>
		<cfreturn stProps>
	</cfif>
	<!--- read props file --->
	<cffile action="read" file="#arguments.filePath#" variable="sProps">

	<!--- remove any whitespace at top and tail --->
	<cfset sProps = trim(sProps)>

	<!--- remove comments and blank lines --->
	<cfset sProps = ReReplace(sProps,"(?m)\##.*?$", "","all")>
	<cfset sProps = ReReplace(sProps,"[#Chr(13)##Chr(10)#]{2,}", "#Chr(13)##Chr(10)#","all")>

	<!--- loop over each line, ignore comments (#...) and insert keys/values into return struct --->
	<cfloop list="#sProps#" index="line" delimiters="#CHR(10)##CHR(13)#">
		<cfset line = trim(line)>
		<cfif LEN(line) AND line CONTAINS "=">
			<cfset prop = trim(ListFirst(line,"="))>
			<cfset value = trim(ListRest(line,"="))>
			<!--- parse value for other keys like ${foo} and replace from previously created struct keys --->
			<cfset aMatch = REMatch("\${.*?}",value)>
			<cfloop from="1" to="#ArrayLen(aMatch)#" index="i">
				<cfset aMatch[i] = ReReplace(aMatch[i],"\${(.*)?}", "\1")>
				<cfif StructKeyExists(stProps, aMatch[i])>
					<cfset value = ReplaceNoCase(value, "${#aMatch[i]#}", stProps[aMatch[i]], "all")>
				<cfelseif IsDefined("arguments.varScope")
							AND ListFirst(aMatch[i],".") eq "vars"
							AND StructKeyExists(arguments.varScope, ListRest(aMatch[i], "."))>
					<cfset value = ReplaceNoCase(value, "${#aMatch[i]#}", arguments.varScope[ListRest(aMatch[i], ".")], "all")>
				</cfif>
			</cfloop>
			<cfset stProps[prop] = value>
		</cfif>
	</cfloop>

	<cfreturn stProps>
</cffunction>

<cfscript>
/**
 * Works like cflocation.
 * 
 * @param location 	 URL to locate to. (Required)
 * @return Returns a string. 
 * @author anthony petruzzi (rip747@aol.com) 
 * @version 1, July 2, 2002 
 */
function redirectto(location){
	return "<meta http-equiv=""Refresh"" content=""0; URL=#location#"">";
}
</cfscript>

<cfscript>
/**
 * Normalize input structures (URL, FORM, FLASH) to a single Request.IN structure for ubiquitous name space programming.
 * V2 for BlueDragon Support
 * 
 * @param orderList 	 Order of scopes to normalize. Defaults to url, form, flash. (Optional)
 * @return Returns true on successful normalization. 
 * @author Joseph Flanigan (joseph@switch-box.org) 
 * @version 2, September 2, 2005 
 */
function requestInOut() {
                var orderList = "url,form,flash";
                var i = 0;

                // if request.IN does not exist, create it
                if(not isDefined("request.IN")) {request.IN = structNew();}
                if(not isDefined("request.OUT")) {request.OUT = structNew();}

                if(arrayLen(arguments) gte 1) orderList = arguments[1];

                for (i=1;i lte listLen(orderList); i = i+1){
                        switch( UCase(listGetAt(orderList,i))) {
                                case "URL": {
                                        structAppend(request.IN,URL); // add URL
                                        break;
                                }

                                case "FORM": {
                                        structAppend(request.IN,FORM); // add FORM
                                        break;
                                }

                                case "FLASH": {
                                        if (IsDefined("FLASH")) structAppend(Request.IN,FLASH); // add FLASH
                                        break;
                                }
                        } //end switch
                } // end for

                if(not structIsEmpty(request.IN)) {
                        request.IN.FIELDNAMES = ""; // make sure fieldnames exist and is empty
                        request.IN.FIELDNAMES = structKeyList(request.IN); // make list of fieldnames
                        // then remove FIELDNAMES itself as a fieldname
                        request.IN.FIELDNAMES = listDeleteAt(request.IN.FIELDNAMES, listFindNoCase(request.IN.FIELDNAMES,"FIELDNAMES"));
                        return TRUE; // function end, input normalized
                }
                else return FALSE; // function end, nothing to normalize

}
</cfscript>

<cfscript>
/**
 * Generate random colors for cfcharts!
 * 
 * @param numToReturn 	 Number of colors to return. (Required)
 * @return Returns a string. 
 * @author Pablo Varando (webmaster@easycfm.com) 
 * @version 0, June 12, 2009 
 */
function returnRandomHEXColors(numToReturn) {
	var returnList = ""; // define a clear var to return in the end with a list of colors
	var colorTable = "A,B,C,D,E,F,0,1,2,3,4,5,6,7,8,9"; // define all possible characters in hex colors
	var i = "";
	var tRandomColor = "";
	// loop through and generate as many colors as defined by the request
	for (i=1; i LTE val(numToReturn); i=i+1){
		// clear the color list
		tRandomColor = "";
		for(c=1; c lte 6; c=c+1){
			// generate a random (6) character hex code
			tRandomColor = tRandomColor & listGetAt(colorTable, randRange(1, listLen(colorTable)));
		}
		// append it to the list to return in the end
		returnList = listAppend(returnList, tRandomColor);
	
	}
	// return the list of random colors
	return returnList;
}
</cfscript>

<cfscript>
/**
 * Returns the translated (file system) location of the web root directory.
 * 
 * @return Returns a string. 
 * @author David Whiterod (whiterod.david@saugov.sa.gov.au) 
 * @version 1, May 9, 2003 
 */
function ReturnWebRootTranslated() {
  var tmpPath = Replace(CGI.SCRIPT_NAME, "/", "\", "ALL");
  return ReplaceNoCase(CGI.PATH_TRANSLATED, tmpPath, "", "ALL");
}
</cfscript>

<cfscript>
/**
 * Returns the opposite of a color.
 * 
 * @param startingColor 	 RGB value minus the #. (Required)
 * @return Returns a string. 
 * @author Matt Liotta (mliotta@r337.com) 
 * @version 1, November 18, 2003 
 */
function reverseColor(startingColor) {
	var start = InputBaseN(startingColor, 16);
	var red = InputBaseN("FF", 16);
	var green = InputBaseN("FF00", 16);
	var blue = InputBaseN("FF0000", 16);
	var tmp = "";

	invertRed = BitAnd(BitXOR(start, red), red);
	invertGreen = BitAnd(BitXOR(start, green), green);
	invertBlue = BitAnd(BitXOR(start, blue), blue);

	tmp = invertRed + invertGreen + invertBlue;
	tmp = Ucase(FormatBaseN(tmp, 16));
	if(len(tmp) is 4) tmp = "00" & tmp;

	return tmp;
}
</cfscript>

<cfscript>
/**
 * Converts an RGB color value into a hexadecimal color value.
 * 
 * @param r 	 Red value triplet (0-255) 
 * @param g 	 Green value triplet (0-255) 
 * @param b 	 Blue value triplet (0-255) 
 * @return Returns a string. 
 * @author Eric Carlisle (ericc@nc.rr.com) 
 * @version 1, November 27, 2001 
 */
function RGBtoHex(r,g,b){
  Var hexColor="";
  Var hexPart = '';
  Var i=0;
	
  /* Loop through the Arguments array, containing the RGB triplets */
  for (i=1; i lte 3; i=i+1){
    /* Derive hex color part */
    hexPart = formatBaseN(Arguments[i],16);
		
    /* Pad with "0" if needed */
    if (len(hexPart) eq 1){
      hexPart = '0' & hexPart;	
    } 
		
    /* Add hex color part to hexadecimal color string */
    hexColor = hexColor & hexPart;
  }
  return hexColor;
}
</cfscript>

<cfscript>
/**
 * Same as built-in RJUSTIFY, but allows optional parameter character to pad with.
 * 
 * @param string 	 String to manipulate. (Required)
 * @param length 	 Length of pad. (Required)
 * @return Returns a string. 
 * @author Al Everett (everett.al@gmail.com) 
 * @version 0, December 21, 2011 
 */
function rjustify2(string,length) {
	var padChar = " ";
	if (arrayLen(arguments) GT 2) {
		padChar=left(arguments[3],1);
	}
		
	return repeatString(padChar,max(0,arguments.length - len(arguments.string))) & arguments.string;
}
</cfscript>

<cfscript>
/**
 * Returns alternating color based on list of colors.
 * 
 * @param colorList 	 List of colors. (Required)
 * @param currentRow 	 Current row number. (Required)
 * @param delimiter 	 List delimiter for colorList. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Al Everett (everett.al@gmail.com) 
 * @version 1, December 21, 2011 
 */
function rowColor(colorList,currentRow) {
	var delimiter=",";
	var rowColor="";
	var colorIndex=1;

	if (ArrayLen(arguments) GT 2) delimiter = arguments[3];
	
	colorIndex=currentRow MOD ListLen(colorList,delimiter) + 1;
	
	rowColor=ListGetAt(colorList,colorIndex,delimiter);
	
	return rowColor;
}
</cfscript>

<!---
 Serializes data to JSONP format for cross domain JSON requests.
 
 @param data 	 Data to be converted into JSON. (Required)
 @param callback 	 The function call that will wrap the output. (Required)
 @return Returns a string. 
 @author Steve Good (sgood@lanctr.com) 
 @version 0, June 11, 2009 
--->
<cffunction name="serializeToJSONP" displayname="Serialize to JSONp" hint="Serializes supplied data in JSONp format" output="false" returntype="any">
	<cfargument name="data" displayName="data" type="any" hint="The data to serialize" required="true" />
	<cfargument name="callback" displayName="callback" type="string" hint="the jsonp callback to use" required="true" />
	
	<cfscript>
	var local = {};
	local.json = serializeJSON(arguments.data);
	local.jsonp = arguments.callback & '(' & local.json & ')';
	</cfscript>
	
	<cfreturn local.jsonp />
</cffunction>

<cfscript>
/**
 * Allows you to 'structclear' an entire session without worrying about deleting ColdFusion's built in variables.
 * 
 * @return Returns nothing. 
 * @author Robby Lansaw (robby@ohsogooey.com) 
 * @version 1, August 6, 2004 
 */
function sessionClear(){
	var dont_clear = "sessionid,cfid,cftoken,jsessionid,urltoken";
	var key = "";
	for(key in session) {
		if(not listFindNoCase(dont_clear, key)) structDelete(session,key);
	}
}
</cfscript>

<cfscript>
/**
 * Allows you to set the scheduling priority of the current thread.
 * 
 * @param newPriority 	 Thread priority. (Required)
 * @return Returns a boolean. 
 * @author Joe Bernard (cfdev@comcast.net) 
 * @version 1, February 10, 2005 
 */
function setThreadPriority(newPriority) {
	var thread = createObject("java", "java.lang.Thread");
	if (arguments.newPriority le thread.max_priority and arguments.newPriority ge thread.min_priority) {
		thread.setPriority(arguments.newPriority);
		return true;
	} else {
		return false;
	}
}
</cfscript>

<cfscript>
/**
 * Changes a sexagesimal latitude longitude co-ordinates to decimal format
 * v0.9 by John Allen
 * v1.0 by Adam Cameron (converted to script, changed return value to be a struct rather than a specially-formatted string)
 * 
 * @param latitude 	 Latitude in degrees/min/sec, using " and ' delimiters (Required)
 * @param latitudeRef 	 N or S (Required)
 * @param longitude 	 Longitude in degrees/min/sec, using " and ' delimiters (Required)
 * @param longitudeRef 	 E or W (Required)
 * @return A struct with keys longitude and latitude 
 * @author John Allen (jallen@figleaf.com) 
 * @version 1.0, December 20, 2012 
 */
function sexagesimalToDecimal(latitude, latitudeRef, longitude, longitudeRef){
	var coordinates = {};
	var latitudeParts = listToArray(arguments.latitude, "'""");
	coordinates.latitude = (
		latitudeParts[1] +
		(latitudeParts[2] / 60) +
		(latitudeParts[3] / 3600)
	);
	if (arguments.latitudeRef == "S"){
		coordinates.latitude *= -1;
	}

	var longitudeParts = listToArray(arguments.longitude,"'""");
	coordinates.longitude = (
		longitudeParts[1] +
		(longitudeParts[2] / 60) +
		(longitudeParts[3] / 3600)
	);
	if (arguments.longitudeRef == "W"){
		coordinates.longitude *= -1;
	}
	return coordinates;
}
</cfscript>

<cfscript>
/**
 * A supplemental script for Signature Pad that generates an image of the signature's JSON output server-side.
 * 
 * @param jsonData 	 String (JSON) output from Signature Pad (Required)
 * @return Returns an image object. 
 * @author James Moberg (james@ssmedia.com) 
 * @version 1, October 7, 2011 
 */
function sigJsonToImage(jsonData){
	var options = structNew();
	var lineOptions = structNew();
	options["imagesize"] = listtoarray("198, 55");
	options["bgColour"] = '##ffffff';
	options["penWidth"] = 2;
	options["penColour"]  = '##145394';
	options["drawMultiplier"] = 12;
	if(ArrayLen(arguments) GTE 2 AND isStruct(arguments[2])) {
		structAppend(options, arguments[2], true);
	}
	if(NOT isarray(jsonData) AND isjson(jsonData)){
		jsonData = DeserializeJSON(jsonData);
	}
	if (NOT IsArray(jsonData)){
		return "";
	} else if (NOT isStruct(jsonData[1])){
		return "";
	} else if (NOT structKeyExists(jsonData[1], "lx")){
		return "";
	}
	img = ImageNew("", options["imagesize"][1] * val(options["drawMultiplier"]), options["imagesize"][2] * val(options["drawMultiplier"]), "ARGB");
	ImageSetBackgroundColor(img, options["bgColour"]);
	imageSetAntialiasing(img, "on");
	ImageSetDrawingColor(img, options["penColour"]);
		
	lineOptions["width"] = options["penWidth"] * (options["drawMultiplier"] / 2);
	lineOptions["endcaps"] = "round";
	lineOptions["lineJoins"] = "round";  /* use join for CF9 */
	ImageSetDrawingStroke(img, lineOptions);

	for (v=1;v LTE ArrayLen(jsonData);v=v+1) {
		ImageDrawLine(img, jsonData[v].lx * val(options["drawMultiplier"]), jsonData[v].ly * val(options["drawMultiplier"]), jsonData[v].mx * val(options["drawMultiplier"]), jsonData[v].my * val(options["drawMultiplier"]));
	}

	ImageResize(img, options["imagesize"][1], options["imagesize"][2], "highPerformance");

	return img;
}
</cfscript>

<cfscript>
/**
 * The same as YesNoFormat() function, but in Italian.
 * 
 * @param b 	 A boolean value. (Required)
 * @return Returns a string. 
 * @author Giampaolo Bellavite (giampaolo@bellavite.com) 
 * @version 1, March 19, 2004 
 */
function SiNo(b) {
	if (isBoolean(b)) {
		if (b) return "S�";
		else return "No";
	} else return "Boh";
}
</cfscript>

<!---
 Ping multiple search engines with your sitemap.xml file and get the server response.
 
 @param service 	 A comma delimited string with search engine names. (Required)
 @param urltosubmit 	 A fully qualified URL to submit to search engines. (Required)
 @param feedback 	 The response to a submitted url by a specified server. (Optional)
 @param fbtype 	 The desired format of the returned response: XML or an array of structures. (Optional)
 @return An (optional) XML fragment OR array of structs with the response from the pinged server(s). 
 @author Frank Marion (mail@frankmarion.com) 
 @version 1, August 26, 2010 
--->
<cffunction name="sitemapPing" displayname="sitemapPing" access="public" output="false" returntype="Any" hint="Ping search engine services with sitemap location">

	<!--- Arg! --->
	<cfargument name="service" 		type="string" required="true" 	hint="A comma delimited string with search engine names.">
	<cfargument name="urltosubmit" 	type="string" required="true" 	hint="A fully qualified URL to submit to search engines.">
	<cfargument name="feedback" 	type="string" required="false" 	hint="The response to a submitted url by a specified server.">
	<cfargument name="fbtype" 		type="string" required="false" 	hint="The desired format of the returned response: XML or an array of structures.">

	<!--- Locals --->
	<cfset var serverList = {
		  ask = 		"http://submissions.ask.com/ping?sitemap="
		, bing = 		"http://www.bing.com/webmaster/ping.aspx?siteMap="
		, gblogsearch = "http://blogsearch.google.com/ping?URL="
		, google =		"http://www.google.com/webmasters/tools/ping?sitemap="
		, msn = 		"http://api.moreover.com/ping?u="
		, technocrati = "http://technorati.com/ping/?url="
		, yahoo =		"http://search.yahooapis.com/SiteExplorerService/V1/updateNotification?appid=SitemapWriter&url="
	} />
	<cfset var accessURL = "">
	<cfset var serverResponseAsArray = ArrayNew(1)>
	<cfset var xmlRespHead = '<?xml version="1.0" encoding="UTF-8"?><sitemapPingResponse>'>
	<cfset var xmlServResp = ''>
	<cfset var xmlRespFoot = '</sitemapPingResponse>'>

	<!--- For convenience --->
	<cfset var selectedService = Trim(arguments.service)>

	<!--- Did we choose "all"? --->
	<cfif selectedService EQ "all">
		<cfset selectedService = StructKeyList(serverList)>
	</cfif>

	<!--- Loop over the collection of services --->
	<cfloop collection="#serverList#" item="key">

		<!--- If we haz a match --->
		<cfif ListContainsNoCase(selectedService, key, ",")>

			<!--- Build the url and access it --->
			<cfset  accessURL = "#serverList[key]##Trim(arguments.urltosubmit)#">
			<cfhttp url="#accessURL#" method="get" throwonerror="false">

			<!--- Create a struct with the response from each server for later feedback --->
			<cfset serverResponseStruct = {
				  serverName	= key
				, statusCode	= cfhttp.StatusCode
				, errorDetail	= XMLFormat(cfhttp.errorDetail)
				, submittedUrl	= XMLFormat(accessURL)
			}>

			<!--- Add the response-in-struct to the reponse array for later feedback --->
			<cfset ArrayAppend(serverResponseAsArray,serverResponseStruct)>

			<!--- Create the xml fragment for later feedback --->
			<cfsavecontent variable="xmlFrag"><cfoutput>
				<server>
					<serverName>#serverResponseStruct.serverName#</serverName>
					<statusCode>#serverResponseStruct.statusCode#</statusCode>
					<errorDetail>#serverResponseStruct.errorDetail#</errorDetail>
					<submittedUrl>#serverResponseStruct.submittedUrl#</submittedUrl>
				</server>
			</cfoutput></cfsavecontent>
			<cfset xmlServResp = xmlServResp & xmlFrag>

		</cfif>

	</cfloop>

	<!--- Build the final XML response result (and trim the whitespace between tags) --->
	<cfset serverResponseAsXML = REReplaceNoCase(xmlRespHead & xmlServResp & xmlRespFoot,"[\t\r\n]+", "" ,"all")>

	<!--- Did we ask for a response? --->
	<cfif structKeyExists(arguments, "feedback")>
		<cfif structKeyExists(arguments, "fbtype") AND arguments.fbtype EQ "array">
			<cfreturn serverResponseAsArray />
		<cfelse>
			<cfreturn serverResponseAsXML />
		</cfif>
	<cfelse>
		<cfreturn true />
	</cfif>

</cffunction>

<cfscript>
/**
 * Causes the current request to wait for a specified amount of time.
 * 
 * @param ms 	 Number of miliseconds to sleep. (Required)
 * @return Returns nothing. 
 * @author Nathan Strutz (mrnate@hotmail.com) 
 * @version 1, September 29, 2003 
 */
function sleep(ms) {
	var thread = createObject("java", "java.lang.Thread");
	thread.sleep(ms);
}
</cfscript>

<cfscript>
/**
 * Like VerityClean, massages text input to make it Solr compatible.
 * v1.0 by Sami Hoda
 * v2.0 by Daria Norris to deal with wildcard characters used as the first letter of the search
 * v2.1 by Paul Alkema - updated list of characters to escape
 * v2.2 by Adam Cameron - Merge Paul's &amp; Daria's versions of the function, improve some regexes, fix logic error with input argument (was both required and had a default), converted wholly to script
 * 
 * @param input 	 String to run against (Required)
 * @return Returns a string. 
 * @author Sami Hoda (sami@bytestopshere.com) 
 * @version 2.2, October 2, 2012 
 */
string function solrClean(required string input){
	var cleanText = trim(arguments.input);
	// List of bad charecters. "+ - && || ! ( ) { } [ ] ^ " ~ * ? : \" 
	// http://lucene.apache.org/core/3_6_0/queryparsersyntax.html#Escaping Special Characters
	var reBadChars = "\+|-|&&|\|\||!|\(|\)|{|}|\[|\]|\^|\""|\~|\*|\?|\:|\\";
	
	// Replace comma with OR
	cleanText = replace(cleanText, "," , " or " , "all");

	// Strip bad characters
	cleanText = reReplace(cleanText, reBadChars, " ", "all");

	// Clean up sequences of space characters
	cleanText = reReplace(cleanText, "\s+", " ", "all");

    // clean up wildcard characters as first characters
    cleanText = reReplace(cleanText, "(^[\*\?]{1,})", "");

	// uCaseWords - and=AND, etc - lcase rest. if keyword is mixed case - solr treats as case-sensitive!
	cleanText = uCaseWordsForSolr(cleanText);
	return trim(cleanText);
}
</cfscript>

<cfscript>
/**
 * Combines structFindKey() and structFindValue()
 * v1.0 by Adam Cameron
 * v1.01 by Adam Cameron (fixing logic error in scope-handling)
 * 
 * @param struct 	 Struct to check (Required)
 * @param key 	 Key to find (Required)
 * @param value 	 Value to find for key (Required)
 * @param scope 	 Whether to find ONE (default) or ALL matches (Optional)
 * @return Returns an array as per structFindValue() 
 * @author Adam Cameron (dac.cfml@gmail.com) 
 * @version 1.01, September 9, 2013 
 */
public array function structFindKeyWithValue(required struct struct, required string key, required string value, string scope="ONE"){
	if (!isValid("regex", arguments.scope, "(?i)one|all")){
		throw(type="InvalidArgumentException", message="Search scope #arguments.scope# must be ""one"" or ""all"".");
	}
	var keyResult = structFindKey(struct, key, "all");
	var valueResult = [];
	for (var i=1; i <= arrayLen(keyResult); i++){
		if (keyResult[i].value == value){
			arrayAppend(valueResult, keyResult[i]);
			if (scope == "one"){
				break;
			}
		}
	}
	return valueResult;
}
</cfscript>

<cfscript>
/**
 * Converts a structure to hidden form fields.
 * 
 * @param struct 	 The structure to convert. 
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, March 10, 2002 
 */
function structToHidden(struct){
	//a variable for iterating
	var key = "";
	//a variable to return stuff
	var outVar = "";
	//now loop through the form scope and make hidden fields
	for(key in struct){
		if(isSimpleValue(struct[key]))
			outVar = outVar & "<input type=""hidden"" name=""" & key & """ value=""" & htmlEditFormat(struct[key]) & """>";
	}
	return outVar;		
}
</cfscript>

<cfscript>
/**
 * Extracts the keys from a struct
 * v1.0 by Adam Cameron (thanks to Simon Baynes for code review)
 * 
 * @param struct 	 A structure to extract the keys from (Required)
 * @param parent 	 A prefix to apply to each key (Optional)
 * @return Returns an array of keys with their fully-qualified dotted paths 
 * @author Adam Cameron (adamcameroncoldfusion@gmail.com) 
 * @version 1.0, September 20, 2012 
 */
array function structToKeys(required struct struct, string parent=""){
	var result = [];
	for (var key in struct){
		var thisPath = listAppend(parent, key, ".");
		arrayAppend(result, thisPath);
		if (isStruct(struct[key])){
			result.addAll(structToKeys(struct[key], thisPath));
		}
	}
	return result;
}
</cfscript>

<cfscript>
/**
 * A UDF that will add a spacer gif image in a varity of formats to assist in page layout.
 * 
 * @param height 	 Height of spacer image. Defaults to 1. (Optional)
 * @param width 	 Width of spacer image. Defaults to 1. (Optional)
 * @param border 	 Border of spacer image. Defaults to 1. (Optional)
 * @param srcURL 	 Source of image. Defaults to s.gif. (Optional)
 * @param alt 	 Alt tag value. Defaults to an empty string. (Optional)
 * @return Returns a string. 
 * @author Dave Forrest (dmf67@yahoo.com) 
 * @version 1, September 30, 2005 
 */
function ss() {	
	var height	= 1;
	var width	= 1;
	var border	= 0;
	var srcURL	= "s.gif";
	var alt		= "";
	var outString = "";
	if(arrayLen(arguments) gte 1) height = arguments[1];
	if(arrayLen(arguments) gte 2) width  = arguments[2];
	if(arrayLen(arguments) gte 3) border = arguments[3];
	if(arrayLen(arguments) gte 4) srcURL = arguments[4];
	if(arrayLen(arguments) gte 5) alt    = arguments[5];
	outString = "<img src=""#srcURL#"" height=""#height#"" width=""#width#"" alt=""#alt#"" border=""#border#"">";
	return outString;
}
</cfscript>

<cfscript>
/**
 * swfHeader reads a swf file's header and returns it's meta information, including height, width and Flash version.
 * 
 * @param filePath 	 Path to SWF file. (Required)
 * @return Returns a struct. 
 * @author Alan Rother (alan.rother@gmail.com) 
 * @version 0, August 21, 2009 
 */
function getSWFHeaderInfo(filePath) {
	//setup the vars
	var headerValues 	= 	StructNew();
	var fis				=	'';
	var decoder			=	'';
	var header			=	'';
	var rect			=	'';
	
	//create defaults for the return struct
	headerValues.IsCompressed			=	'';
	headerValues.FrameCount				=	0;
	headerValues.FrameRate				=	0;
	headerValues.FlashVersion			=	0;
	headerValues.Height					=	0;//returned in px
	headerValues.Width					=	0;//returned in px
	headerValues.Errors					=	'';
	
	if(ListLast(filePath, ".") IS "swf")
		{
			try
				{
					//Create a file input stream to load the SWF file into Java
					fis = createObject("java", "java.io.FileInputStream").init(filePath);
					//create a decoder object to read the file
					decoder = createObject("java", "macromedia.swf.TagDecoder").init(fis);
					// Decode the header
					header = decoder.decodeHeader(); 
					//close the input stream
					fis.close();
					//pull out the dimensions of the swf for later parsing
					rect = header.size;	
					//load the values returned from Java into the return struct
					headerValues.IsCompressed			=	header.compressed;
					headerValues.FrameCount				=	header.framecount;
					headerValues.FrameRate				=	header.rate;
					headerValues.FlashVersion			=	header.version;
					headerValues.Height					=	(rect.getHeight()/20);//divided by 20 to return the value in px (the orig value is in twips)
					headerValues.Width					=	(rect.getWidth()/20);//divided by 20 to return the value in px (the orig value is in twips)
				}
			catch(Any excpt)
				{
					headerValues.Errors					=	excpt.RootCause.Cause.Message;
				}
		}


	//return the struct
	return headerValues;
}
</cfscript>

<!---
 Programmatically kill any cfthread from any request.
 
 @param cfadminPassword 	 ColdFusion Admin password. (Required)
 @param cfthreadname 	 If killing a single thread and you know its cfthread name= attribute, use this. (Optional)
 @param threadname 	 f killing a single thread and you already know its java threadname, use this. (Optional)
 @param prefix 	 If you want to kill a set of threads which have a common prefix string, use this. (Optional)
 @return Returns the number of threads killed. 
 @author Kevin Miller (kmiller@websolete.com) 
 @version 0, June 11, 2009 
--->
<cffunction name="threadMurder" access="public" description="forcefully destroys any cfthread which matches the naming criteria; returns the number of cfthreads which were killed" output="false" returntype="numeric">
	<cfargument name="cfadminPassword" type="string" required="true"><!--- since we access the cfadmin api, we require the password for login --->	
	<cfargument name="cfthreadName" type="string" required="false" default=""><!--- if we're needing to kill a specific thread, this is the cfthread name= attribute --->
	<cfargument name="threadName" type="string" required="false" default=""><!--- if for some reason we already have the *java* threadname for the cfthread, we prefer to use it instead --->
	<cfargument name="prefix" type="string" required="false" default=""><!--- we can also target a set of threads by matching a prefix against each cfthread's name --->

	<!--- 
		Forcibly kills any cfthread
		
		@param cfadminPassword		The cfadministrator password (required)
		@param cfthreadName		If killing a single thread and you know its cfthread name= attribute, use this
		@param threadName		If killing a single thread and you already know its java threadname, use this
		@param prefix		If you want to kill a set of threads which have a common prefix string, use this
		
		@return numeric 	Returns the number of threads killed
		
		@author Kevin J. Miller (kmiller@websolete.com)
		@version 1.0
		@date 12/9/2008
		
		In certain instances where you have endlessly running/sleeping 'monitoring' threads, there is effectively
		no way to kill them short of a CF server cycle or via the CF8 server monitor.  This udf allows you to mimic 
		the CF8 abort thread functionality.
		
		I had this issue during development where inside an app scoped component I was creating two 'monitor' threads, which were charged
		with monitoring two separate queues, sleeping every few seconds.  Whenever the app scope was reinitialized, two 
		more threads would be created, up to the point where all threads were utilized and the app bombed due to the lingering
		(and idle) threads left from the previous instantiation.
		
		CFThreads are not application specific, they are bound to the server; furthermore, multiple threads with the same 
		name can be created in different requests.  In order to attempt to 'bind' a thread to a given application, I recommend 
		prefixing all threads with an application-specific string unique prefix; this will allow you to use the prefix argument 
		and effectively kill only those threads which were spawned from a particular application.
		
		Since the cfadmin password is required (the udf interacts with the cfadmin api), if you need to embed this 
		routine into an app, you are suggested to alter the code to allow an encrypted password to be passed in which 
		is subsequently decrypted as required before invoking the admin api login method.
	 --->	
	
	<cfset var local = structnew()>
	
	<cftry>
	
		<!--- validate input --->
		
		<cfif not len(arguments.cfthreadname) and not len(arguments.threadname) and not len(arguments.prefix)>
			<cfthrow type="InvalidArguments" message="You must specify either a cfthreadname, threadname (java name) or a prefix.">
		</cfif>
		
		<cfscript>
			local.adminObj = createobject("component","cfide.adminapi.administrator").login(arguments.cfadminPassword);
			local.monitorObj = createobject("component","cfide.adminapi.servermonitoring"); 
			
			local.threads = local.monitorObj.getAllActiveCFThreads(); 
			local.threadsKilled = 0; 
			
			if(arraylen(local.threads)) { 
				for(local.i = 1; local.i lte arraylen(local.threads); local.i++) { 
					local.mycfthreadname = local.threads[local.i].cfthreadname; 
					local.mythreadname = local.threads[local.i].threadname; 
					
					// declared cfthreadname
					if(len(arguments.cfthreadname) and not comparenocase(local.mycfthreadname,arguments.cfthreadname)) { 
						local.homicide = local.monitorObj.abortCFThread(local.mythreadname); 
						if(local.homicide) { 
							local.threadsKilled = 1; 
							break; 
						}
					}
					// declared threadname (java)
					else if(len(arguments.threadname) and not comparenocase(local.mythreadname,arguments.threadname)) { 
						local.homicide = local.monitorObj.abortCFThread(local.mythreadname); 
						if(local.homicide) { 
							local.threadsKilled = 1; 
							break; 
						}
					}
					else if(len(arguments.prefix) and not comparenocase(left(local.mycfthreadname,len(arguments.prefix)),arguments.prefix)) { 						
						local.homicide = local.monitorObj.abortCFThread(local.mythreadname); 
						if(local.homicide) { 
							local.threadsKilled++; 
						}
					}
				}
			}
			
			return local.threadsKilled; 
		</cfscript>
		
		<cfcatch>
			<cfrethrow>
		</cfcatch>
		
	</cftry>

</cffunction>

<cfscript>
/**
 * Toggles a value (ie: &quot;stop&quot;/&quot;start&quot;) between two options.
 * 
 * @param variable 	 The variable that stores the value you will toggle. (Required)
 * @param value1 	 The first value of the toggle. (Required)
 * @param value2 	 The second value of the toggle. (Required)
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, July 3, 2002 
 */
function toggleValue(variable,value1,value2){
	//make a struct in which the value is the opposite of the key
	var toggler = structNew();
	toggler[value1] = value2;
	toggler[value2] = value1;
	//return whichever value is not the current value
	return toggler[variable];
}
</cfscript>

<cfscript>
/**
 * Translates a RSS Feed's items to a query.
 * 
 * @param rssDoc 	 RSS document to translate. (Required)
 * @return Returns a query. 
 * @author William Steiner (williams@hkusa.com) 
 * @version 1, October 30, 2003 
 */
function TranslateRSSItems(rssDoc) {

	// the current token we are looking at 
	var Token = GetToken(rssDoc,1,"<>");
	
	// LoopControl needs to be initialized
	var LoopControl = 1;
	
	// Initialize the Current Query Row 
	var RowNumber = 1;

	// the number of the next token we are looking at 
	var NextToken = 2;
	
	var RSS_Struct = StructNew();

	// Initialize Return Query 
	var ResultQuery = QueryNew("Title, Link, Description");
	
	// loop until we are out of tokens 
	while(Token is not "/rss"){
		switch(Left(Token,7)){
			case "channel":{
				// loop thru until we get to the first "item"
				// skiping all tokens relating to document itself
				while(Token is not "item") {
					// increment next token
					NextToken = NextToken + 1;
					Token = GetToken(rssDoc,NextToken,"<>");
				}
			} // end channel case
			case "item":{
				// if we are getting a item token, we want to:
				// create a new blank structure 
				
				// define new structure
				RSS_Struct = StructNew();
				
				// increment next token
				NextToken = NextToken + 1;
				break;
			} // end item case		
			
			case "/item":{
				// if we are getting a /item token, we want to:
				// Create a new row in the query the each item 
				// Assuming the structure isn't empty 
				
				// copy existing structure into result array
				if (not StructIsEmpty(RSS_Struct)){
					// add a new row to the query 
					RowNumber = QueryAddRow(ResultQuery);
					
					// populate Query 
					QuerySetCell(ResultQuery, "Title", RSS_Struct.Title, RowNumber);
					QuerySetCell(ResultQuery, "Link", RSS_Struct.Link, RowNumber);
					QuerySetCell(ResultQuery, "Description", RSS_Struct.Description, RowNumber);
				}
				
				// increment next token
				NextToken = NextToken + 1;
				break;
			} // end /item case		

			case "title":{
				// if we are getting the title token, then we want to:
				// add the next token to our structure, because that will be our title text
				// increment the 'nexttoken' variable two increments past the end title token

				// add the title to the structure
				StructInsert(RSS_Struct, "Title", GetToken(rssDoc,  NextToken+1, "<>"));
				
				// increment next token
				NextToken = NextToken + 2;

				break;
			} // end title case

			case "Link":{
				// if we are getting the Link token, then we want to:
				// add the next token to our structure, because that will be our link text
				// increment the 'nexttoken' variable two increments past the end link token

				// add the title to the structure
				StructInsert(RSS_Struct, "Link", GetToken(rssDoc,  NextToken+1, "<>"));
				
				// increment next token
				NextToken = NextToken + 2;
				
				break;
			} // end link case 


			case "descrip":{	
				// if we are getting the description token, then we want to:
				// add the next token to our structure, because that will be our description text
				// increment the nexttoken variable once

				// add the title to the structure
				StructInsert(RSS_Struct, "description", GetToken(rssDoc,  NextToken+1, "<>"));
				
				// increment next token
				NextToken = NextToken + 1;
				
				break;
			} // end description case 

			default: {
				Token = GetToken(rssDoc,NextToken,"<>");
				NextToken = NextToken + 1;
				break;
			} // end default case 
		} // end switch
		Token = GetToken(rssDoc,NextToken,"<>");
	} // end while

	return (ResultQuery);
}
</cfscript>

<cfscript>
/**
 * Simple function to format a true / false value to an integer (true=1, false=0).
 * 
 * @param value 	 Value to check. (Required)
 * @return Returns an integer. 
 * @author Cory Toth (ctoth@tmctech.com) 
 * @version 1, August 6, 2004 
 */
function trueFalseToInt(value){
	return iif(value, 1, 0);
}
</cfscript>

<!---
 Works with SolrClean UDF to UCASE Solr Keywords.
 
 @param string 	 String to run against (Required)
 @return Returns a string. 
 @author Sami Hoda (sami@bytestopshere.com) 
 @version 1, August 5, 2011 
--->
<cffunction name="uCaseWordsForSolr" access="public" output="false" returntype="Any" >
	<cfargument name="string" type="string" default="" required="true" hint="String to run against" />
	<cfargument name="listOfWords" type="string" default="AND,OR,NOT,TO" required="false" hint="Comma-delim list of words to uCase" />

	<cfset var sLocal = StructNew() />

	<cfset sLocal.newString = lcase(arguments.string) /> <!--- lcase by default. mixed-case treated as case-sensitive by Solr --->
	<cfset sLocal.i = "" />

	<cfloop list="#arguments.listOfWords#" index="sLocal.i">

		<cfset sLocal.newString = reReplaceNoCase(sLocal.newString, "([^a-z])(#sLocal.i#)([^a-z])", "\1#ucase(sLocal.i)#\3", "all")/>

	</cfloop>

	<cfreturn sLocal.newString />
</cffunction>

<cfscript>
/**
 * Converts the URL structure to hidden form fields.
 * 
 * @param excludeList 	 A list of keys not to copy from the URL structure. 
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, March 10, 2002 
 */
function urlToHidden(){
	//a variable for iterating
	var key = "";
	//should we exlude any?  by default, no
	var excludeList = "";
	//a variable to return stuff
	var outVar = "";
	//if there is an argument, it is a list to exclude
	if(arrayLen(arguments))
		excludeList = arguments[1];
	//now loop through the form scope and make hidden fields
	for(key in url){
		if(NOT listFindNoCase(excludeList,key))
			outVar = outVar & "<input type=""hidden"" name=""" & key & """ value=""" & htmlEditFormat(url[key]) & """>";
	}
	return outVar;		
}
</cfscript>

<cfscript>
/**
 * Determines the correct UTM letter designator for a given latitude.
 * 
 * @param lat 	 Latitude. (Required)
 * @return Returns a string. 
 * @author Wayne Graham (wsgrah@wm.edu) 
 * @version 1, January 26, 2006 
 */
function UTMLetterDesignator(lat){
	var UTMLetter = "Z";
			
	if(84 GTE lat AND lat GTE 72) UTMLetter = "X";
	else if(72 GT lat AND lat GTE 64) UTMLetter = "W";
	else if(64 GT lat AND lat GTE 56) UTMLetter = "V";
	else if (56 GT lat AND lat GTE 48) UTMLetter = "U";
	else if (48 GT lat AND lat GTE 40) UTMLetter = "T";
	else if (40 GT lat AND lat GTE 32) UTMLetter = "S";
	else if (32 GT lat AND lat GTE 24) UTMLetter = "R";
	else if (24 GT lat AND lat GTE 16) UTMLetter = "Q";
	else if (16 GT lat AND lat GTE 8) UTMLetter = "P";
	else if (8 GT lat AND lat GTE 0) UTMLetter = "N";
	else if (0 GT lat AND lat GTE -8) UTMLetter = "M";
	else if (-8 GT lat AND lat GTE -16) UTMLetter = "L";
	else if (-16 GT lat AND lat GTE -32) UTMLetter = "K";
	else if (-32 GT lat AND lat GTE -40) UTMLetter = "J";
	else if (-40 GT lat AND lat GTE -48) UTMLetter = "H";
	else if (-48 GT lat AND lat GTE -56) UTMLetter = "G";
	else if (-56 GT lat AND lat GTE -64) UTMLetter = "F";
	else if (-64 GT lat AND lat GTE -72) UTMLetter = "E";
	else if (-72 GT lat AND lat GTE -80) UTMLetter = "C";
	return UTMLetter;
}
</cfscript>

<cfscript>
/**
 * Validate an email existence using an external web service.
 * v2 mods by Raymond Camden
 * 
 * @param emailAddress 	 Address to validate. (Required)
 * @return Returns a structure. 
 * @author Craig Kaminsky (imageaid@gmail.com) 
 * @version 3, July 15, 2009 
 */
function verifyEmail(emailAddress){
	// local variables
	var email_address = Trim( arguments.emailaddress );
	var results = StructNew();
	var validationResponse = "";
	var ws = "";
	// add the default keys and values for returned struct 
	results.wsdl = "http://www.webservicex.net/ValidateEmail.asmx?wsdl";
	results.attemptTime = Now();
	// setup the web service
	ws = createObject( "webservice", results.wsdl );
	// ensure, first, that we have a properly formatted email address
	if( IsValid( "email", email_address )) {
		// setup some exception handling just in case the Web Service is down, etc.
		try
		{
			validationResponse = ws.IsValidEmail( Email=email_address );
		}
		catch( Any err )
		{
			results.emailResult = false;
			results.message = "Web Service response error: " + err.Message;
			results.resultCode = "fail";
			// exit the function and return the results struct
			return results;
		}			
		// check the response from the web service
		if( Ucase(Trim( validationResponse )) is "YES" )
		{
			results.emailResult = true;
			results.message = "Email address passed validation and verification.";
			results.resultCode = "valid";
		}
		else
		{
			results.emailResult = false;
			results.message = "Email address passed validation but failed verification.";
			results.resultCode = "invalid";
		}
	}
	else
	{
		results.emailResult = false;
		results.message = "Email address failed validation. It is not properly formatted.";
		results.resultCode = "invalid";
	}
	return results;
}
</cfscript>

<cfscript>
/**
 * Increments the values of a 3 place version number.
 * Version 2 by Raymond Camden
 * 
 * @param version 	 String in the form of a version number, as in x.x.x. (Required)
 * @return Returns a string. 
 * @author Byron Bignell (byronj@bignell.com) 
 * @version 2, June 12, 2003 
 */
function versionThis(str){
	str = replace(str,".","","all") + 1;
	str = left(str,len(str) - 2) & "." & mid(str,len(str)-1,1) & "." & right(str,1);
	return str;
}
</cfscript>

<cfscript>
/**
 * Returns a visual representation of stylesheet elements.
 * 
 * @param cssCode 	 CSS to parse. (Required)
 * @return Returns a string. 
 * @author Shlomy Gantz (shlomy@bluebrick.com) 
 * @version 1, December 20, 2005 
 */
function viewCSS(cssCode) {
	var i ="";
	var cssItem="";
	var ret="";
	for(i=1;i lte listlen(arguments.cssCode,'}');i=i+1) {
		cssItem = listgetAt(arguments.cssCode,i,'}');
		if(findNocase('{',cssItem)) ret = ret & '<div style="#trim(mid(cssItem,findNocase("{",cssItem)+1,len(cssItem)))#">#trim(mid(cssItem,1,findNocase("{",cssItem)-1))#</div><br>';
	}
	return ret;
}
</cfscript>

<cfscript>
/**
 * creates a webmaster@... address out of any URL.
 * 
 * @param input 	 URL to parse. (Required)
 * @return Returns a string. 
 * @author Michael Muller (michael@mullertech.com) 
 * @version 1, September 27, 2008 
 */
function webmaster_email(input) {
    if(left(input,4) eq "http") return "webmaster@" & listRest(listGetAt(input,2,"/"),".");
    else return "webmaster@" & listRest(listFirst(input,"/"),".");
}
</cfscript>

<cfscript>
/**
 * Easily creates a state select dropdown/
 * 
 * @param formVar 	 Name of form field to create. (Required)
 * @param abbreviate 	 If true, abbreviations are used. (Required)
 * @param addCanada 	 If true, adds Canadian provicnes. (Required)
 * @param selectedVal 	 Specifies which value to pre-select. (Optional)
 * @param cssclass 	 CSS class to use in generated form field. (Optional)
 * @return Returns a string. 
 * @author Tony Felice (sites@breckcomm.com) 
 * @version 0, January 6, 2009 
 */
function writeStateSelect(formVar,abbreviate,addCanada){
	var abbrevList = "AL,AK,AZ,AR,CA,CO,CT,DE,DC,FL,GA,HI,ID,IL,IN,IA,KS,KY,LA,ME,MD,MA,MI,MN,MS,MO,MT,NE,NV,NH,NJ,NM,NY,NC,ND,OH,OK,OR,PA,RI,SC,SD,TN,TX,UT,VT,VA,WA,WV,WI,WY";
	var nameList = "Alabama,Alaska,Arizona,Arkansas,California,Colorado,Connecticut,Delaware,District of Columbia,Florida,Georgia,Hawaii,Idaho,Illinois,Indiana,Iowa,Kansas,Kentucky,Louisiana,Maine,Maryland,Massachusetts,Michigan,Minnesota,Mississippi,Missouri,Montana,Nebraska,Nevada,New Hampshire,New Jersey,New Mexico,New York,North Carolina,North Dakota,Ohio,Oklahoma,Oregon,Pennsylvania,Rhode Island,South Carolina,South Dakota,Tennessee,Texas,Utah,Vermont,Virginia,Washington,West Virginia,Wisconsin,Wyoming";
	var provCodeList = ",---,AB,BC,MB,NB,NL,NT,NS,NU,ON,PE,QC,SK,YT";
	var provList = ",-- CANADIAN PROVINCES --,Alberta,British Columbia,Manitoba,New Brunswick,Newfoundland and Labrador,Northwest Territories,Nova Scotia,Nunavut,Ontario,Prince Edward Island,Quebec,Saskatchewan,Yukon";
	var selectedVal = "";
	var cssclass="none";
	var stateSelect = "";
	if (ArrayLen(arguments) gt 3){
		selectedVal = arguments[4];
	}
	if(ArrayLen(arguments) gt 4){
		cssclass = arguments[5];
	}
	if(addCanada eq 1){
		abbrevList = abbrevList & provCodeList;
		nameList = nameList & provList;
	}
	stateSelect = "<select name=""" & formVar & """ class=""" & cssclass & """>";
	if(abbreviate){
		stateSelect = stateSelect & "<option value=""0""></option>";
	}else{
		stateSelect = stateSelect & "<option value=""0"">Select State" & iif(addCanada eq 1,DE(" or Province"),DE("")) & "</option>";
	}
	for(i = 1;i lte listLen(abbrevList);i=i+1){
		stateSelect = stateSelect & "<option value=""" & listGetAt(abbrevList,i) & """ " & iif(selectedVal eq listGetAt(abbrevList,i),DE("selected"),DE("")) & ">" & iif(abbreviate eq 1,DE(listGetAt(abbrevList,i)),DE(listGetAt(nameList,i)))  & "</option>";
	}
	stateSelect = stateSelect & "</select>";
	
	return stateSelect;
}
</cfscript>








</cfcomponent>