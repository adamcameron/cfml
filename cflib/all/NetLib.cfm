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

<cfscript>
/**
 * calculate a network address from an IP address and a (sub)Netmask.
 * 
 * @param myIP 	 IP Address. (Required)
 * @param myNetMask 	 Netmask. (Required)
 * @return Returns an IP address (string). 
 * @author Tanguy Rademakers (t@newmediatwins.net) 
 * @version 1, May 12, 2003 
 */
function calcNetAddress (myIP, myNetMask) {
	var NetAddress = "";
	var i = 1;
	
	for (i = 1; i lte 4; i = i + 1) {
		NetAddress = ListAppend(NetAddress, BitAnd(ListGetAt(myIP,i,'.'),ListGetAt(myNetMask,i,'.')) ,'.'); 
	}
	return NetAddress;
}
</cfscript>

<cfscript>
/**
 * Converts CIDR numbers to valid network mask numbers.
 * 
 * @param cidr 	 CIDR number. (Required)
 * @return Returns a string. 
 * @author Sufiyan bin Yasa (cinod_79@yahoo.com) 
 * @version 1, July 19, 2005 
 */
function cidrToNetMask (cidr) {
	var netMask = "";	

	var post = 0;
	var remainder = cidr MOD 8;
	var divide = cidr \ 8;

	while(divide gt 0) {
		netMask = listAppend(netMask, 255,'.'); 
		divide = divide - 1;
		post = post + 1;		
	}

	if(remainder gt 0) {			
		netMask = listAppend(NetMask,
				  bitSHLN(BitOr(0,2^remainder-1), 8-remainder),
				  '.'); 		
		post = post +1;			
	}

	while(post lt 4) {
		netMask = listAppend(netMask, "0",'.'); 			
		post = post + 1;
	}
	
	if(right(netMask, 1) eq "."){		
		netMask = left(netMask,len(netMask));
	}
	return netMask;
}
</cfscript>

<!---
 Connect to sockets through your ColdFusion application.
 Mods by Raymond Camden
 
 @param host 	 Host to connect to. (Required)
 @param port 	 Port for connection. (Required)
 @param message 	 Message to be sent. (Required)
 @return Returns a string. 
 @author George Georgiou (george1977@gmail.com) 
 @version 1, August 27, 2009 
--->
<cffunction name="easySocket" access="private" returntype="any" hint="Uses Java Sockets to connect to a remote socket over TCP/IP" output="false">

    <cfargument name="host" type="string" required="yes" default="localhost" hint="Host to connect to and send the message">
    <cfargument name="port" type="numeric" required="Yes" default="8080" hint="Port to connect to and send the message">
    <cfargument name="message" type="string" required="yes" default="" hint="The message to transmit">

   <cfset var result = "">
   <cfset var socket = createObject( "java", "java.net.Socket" )>
   <cfset var streamOut = "">
	<cfset var output = "">
	<cfset var input = "">

   <cftry>
      <cfset socket.init(arguments.host,arguments.port)>
      <cfcatch type="Object">
         <cfset result = "Could not connected to host <strong>#arguments.host#</strong>, port <strong>#arguments.port#</strong>.">
         <cfreturn result>
      </cfcatch>  
   </cftry>

   <cfif socket.isConnected()>
       <cfset streamOut = socket.getOutputStream()>
       
       <cfset output = createObject("java", "java.io.PrintWriter").init(streamOut)>
       <cfset streamInput = socket.getInputStream()>
       
       <cfset inputStreamReader= createObject( "java", "java.io.InputStreamReader").init(streamInput)>
       <cfset input = createObject( "java", "java.io.BufferedReader").init(InputStreamReader)>
        
       <cfset output.println(arguments.message)>
       <cfset output.println()> 
       <cfset output.flush()>
       
       <cfset result=input.readLine()>
       <cfset socket.close()>
   <cfelse>
      <cfset result = "Could not connected to host <strong>#arguments.host#</strong>, port <strong>#arguments.port#</strong>.">
   </cfif>
   
   <cfreturn result>
</cffunction>

<!---
 Checks to see if a CF FTP connection is still connected.
 
 @param ftpObject 	 Result of a previous CFFTP call. (Required)
 @return Returns a boolean. 
 @author Willy Chang (willy.mx@gmail.com) 
 @version 1, September 22, 2005 
--->
<cffunction name="ftpisConnected" output="false" returnType="boolean">
	<cfargument name="ftpObject" required="yes">
	<cfreturn ftpObject.isConnected()>
</cffunction>

<cfscript>
/**
 * Looks up all IP addresses for a hostname and returns them in an array.  Requires Java.
 * 
 * @param host 	 Host name. (Required)
 * @return Returns an array. 
 * @author David Chaplin-Loebell (davidcl@tlavideo.com) 
 * @version 1, September 22, 2005 
 */
function getAllHostAddresses(host) {
	var iaclass=""; //holds the Java object
	var addr="";    //holds the array returned by the java object
	var hostaddr=arrayNew(1);    //holds the returned array of IP addresses.
	var i = "";
	   
	// Init class
	iaclass=CreateObject("java", "java.net.InetAddress");

	// Get address
	addr=iaclass.getAllByName(host);

	// Return the address
	for (i=1; i LTE ArrayLen(addr); i=i+1) {
		iaclass = Addr[i]; //can't access Addr[i].getHostAddress() directly in CF5
		hostaddr[i] = iaclass.getHostAddress();
	}
	return hostaddr;
}
</cfscript>

<cfscript>
/**
 * Performs a DNS lookup.
 * 
 * @param host 	 The host name to lookup. (Required)
 * @return Returns an IP address. 
 * @author Ben Forta (ben@forta.com) 
 * @version 1, January 12, 2012 
 */
function GetHostAddress(host) {
   // Variables
   var iaclass="";
   var addr="";
   
   // Init class
   iaclass=CreateObject("java", "java.net.InetAddress");

   // Get address
   addr=iaclass.getByName(host);

   // Return the address	
   return addr.getHostAddress();
}
</cfscript>

<cfscript>
/**
 * Get the TLD and Hostname from FQDN.
 * v2 by Ray - just added a var scope
 * 
 * @param domain 	 Full Qualified Domain Name. (Required)
 * @return Returns a struct with hostname and toplevel domain. 
 * @author Patrick Heppler (p.heppler@fusionality.de) 
 * @version 2, October 29, 2010 
 */
function getHostAndTLD(domain) {
var result=structnew();
if (len(domain) lte 0) return false;
       result.hostname=listfirst(domain,".");
       if(listlen(domain,".") gt 2){
               result.tld=listgetat(domain,2,".")&"."&listgetat(domain,3,".");
               }
       else{
               result.tld=listlast(domain,".");
               }
       return result;
}
</cfscript>

<cfscript>
/**
 * Performs a DNS lookup on an IP address.
 * 
 * @param address 	 IP address to look up. 
 * @return Returns a domain name. 
 * @author Ben Forta (ben@forta.com) 
 * @version 1, December 19, 2001 
 */
function GetHostName(address) {
   // Variables
   var iaclass="";
   var addr="";
   
   // Init class
   iaclass=CreateObject("java", "java.net.InetAddress");

   // Get address
   addr=iaclass.getByName(address);

   // Return the name	
   return addr.getHostName();
}
</cfscript>

<cfscript>
/**
 * UDF equivelant of &lt;CFHTTP&gt;
 * 
 * @param u 	 The URL to fetch. (Required)
 * @return Returns a string. 
 * @author Ben Forta (ben@forta.com) 
 * @version 1, November 11, 2002 
 */
function HTTPGet(u) {
   // Variables
   var urlclass="";
   var page="";
   var stream="";
   var c="";
   var output="";
   
   // Init class
   urlclass=CreateObject("java", "java.net.URL");

   // Get page
   page=urlclass.init(u);

   // Get stream
   stream=page.getContent();
	
   // Display it
   for (c=stream.read(); c GT 0; c=stream.read())
   {
      output=output&chr(c);
   }

   // don't forget this part
   stream.close();
   
   return output;
}
</cfscript>

<cfscript>
/**
 * Converts a string containing an (IPv4) Internet Protocol dotted address (aaa.bbb.ccc.ddd) into a proper address representation.
 * 
 * @param ip 	 IP address as string. (Required)
 * @return Returns a number. 
 * @author Troy Pullis (tpullis@yahoo.com) 
 * @version 0, January 9, 2009 
 */
function ip2long(ip) {
	var iparr = ListToArray(ip,".");
	if (ArrayLen(iparr) != 4)
		return 0;
	else 
	 	return iparr[1]*256^3 + iparr[2]*256^2 + iparr[3]*256 + iparr[4];
}
</cfscript>

<cfscript>
/**
 * IP4r converts standard dotted IP addresses to their reversed IP4r equivalent.
 * 
 * @param ip4 	 IP address. (Required)
 * @return Returns a string. 
 * @author Scott Glassbrook (cflib@vox.phydiux.com) 
 * @version 2, November 18, 2004 
 */
function ip4r(ip4) {
	return ReReplaceNoCase(ip4,  "([0-9]{1,3}).([0-9]{1,3}).([0-9]{1,3}).([0-9]{1,3})",  "\4.\3.\2.\1");
}
</cfscript>

<cfscript>
/**
 * Converts an IP address to a 32-bit dotted decimal IP number.
 * 
 * @param ipAddress 	 IP Address to convert. (Optional)
 * @return Returns a number. 
 * @author Jonathan Pickard (j_pickard@hotmail.com) 
 * @version 1, September 27, 2002 
 */
function IPAddress2IPDottedDecimal( ipAddress ) {
	var	ipValue = 0;
	var lBitShifts = "24,16,8,0";
	var i = 1;

	if ( ListLen( ipAddress, "." ) EQ 4 )
	{
		for ( ; i LTE 4; i = i + 1 )
		{
			ipValue = ipValue + BitSHLN( ListGetAt( ipAddress, i, "." ), ListGetAt( lBitShifts, i ) );
		}
	}

	return ipValue;
}
</cfscript>

<cfscript>
/**
 * Converts an IP address to a network class.
 * 
 * @param ip 	 IP address. (Required)
 * @return Returns a string. 
 * @author del usr (delusrexpert@hotmail.com) 
 * @version 1, February 14, 2004 
 */
function IPclass(ip) {
	var myint = listFirst(ip, ".");
	if (myint GTE 1 and myint LTE 127) return "Class A";
	if (myint GTE 128 and myint LTE 191) return "Class B";
	if (myint GTE 192 and myint LTE 223) return "Class C";
	if (myint GTE 224 and myint LTE 239) return "Class D";
	if (myint GTE 240 and myint LTE 255) return "Class E";
}
</cfscript>

<cfscript>
/**
 * Converts IPs to integers and back for efficient database storage.
 * 
 * @param ip or numeric version 	 IP or numeric version of IP. (Required)
 * @return Returns either a number of an IP. 
 * @author Aaron Eisenberger (aaron@x-clothing.com) 
 * @version 1, August 28, 2003 
 */
function IPConvert(val) {
	var int = '';
	var ip = arraynew(1);
	if (find('.',val))
		{
		int = 0;
		int = ListGetAt(val, 1, ".") * 256^3;
		int = int + ListGetAt(val, 2, ".") * 256^2;
		int = int + ListGetAt(val, 3, ".") * 256;
		int = int + ListGetAt(val, 4, ".");
		return int;
		}
	else
		{
		int = val;
		ip[1] = Int(int / 256^3);
		int = int - (ip[1] * 256^3);
		ip[2] = int(int / 256^2);
		int = int - (ip[2] * 256^2);
		ip[3] = int(int / 256);
		ip[4] = int - (ip[3] * 256);
		ip = ip[1] & "." & ip[2] & "." & ip[3] & "." & ip[4];
		return ip;
		}
}
</cfscript>

<cfscript>
/**
 * Converts a 32-bit dotted decimal IP number to an IP address.
 * 
 * @param ipValue 	 Dotted decimal value of IP address. (Required)
 * @return Returns a string. 
 * @author Jonathan Pickard (j_pickard@hotmail.com) 
 * @version 1, September 27, 2002 
 */
function IPDottedDecimal2IPAddress( ipvalue ) {
	var ipAddress = "";
	var lBitMasks = "24,16,8,0";
	var i = 1;

	for ( ; i LTE 4; i = i + 1 )
	{
		ipAddress = ipAddress & "." & BitMaskRead( ipvalue, ListGetAt( lBitMasks, i ), 8 );
	}
	ipAddress = Right( ipAddress, Len( ipAddress ) - 1 );

	return ipAddress;
}
</cfscript>

<cfscript>
/**
 * Is this IP within any of the IP ranges supplied.
 * 
 * @param sIP 	 The IP. (Required)
 * @param sIPREList 	 List of IP Regex strings. (Required)
 * @return Returns a boolean. 
 * @author Peter Crowley (pcrowley@webzone.ie) 
 * @version 1, April 14, 2005 
 */
function isIPInRange(sIP,sIPREList) {
	var i = 1;
	var nREListCount=ListLen(sIPREList);
	
	for (i = 1; i LTE nREListCount; i = i+1) {
		if (REFind(ListGetAt(sIPREList,i),sIP)) return true;
	}
	return false;
}
</cfscript>

<cfscript>
/**
 * Checks to see if a specifid address (IP address or host name) is a multicast address (Class D).
 * 
 * @param address 	 The address to check. 
 * @return Returns a boolean. 
 * @author Ben Forta (ben@forta.com) 
 * @version 1, December 19, 2001 
 */
function IsMulticastAddress(address) {
   // Variables
   var iaclass="";
   var addr="";
   
   // Init class
   iaclass=CreateObject("java", "java.net.InetAddress");

   // Get address
   addr=iaclass.getByName(address);

   // Is Multicast (Class D)?
   return addr.isMulticastAddress();
}
</cfscript>

<cfscript>
/**
 * Generates an (IPv4) Internet Protocol dotted address (aaa.bbb.ccc.ddd) from the proper address representation.
 * 
 * @param longip 	 Numeric version of IP address. (Required)
 * @return Returns the IP as a string. 
 * @author Troy Pullis (tpullis@yahoo.com) 
 * @version 0, January 9, 2009 
 */
function long2ip(longip) {
	var ip = "";
	var i = "";
    if (longip < 0 || longip > 4294967295) 
		return 0;
    for (i=3;i>=0;i--) {
        ip = ip & int(longip / 256^i);
        longip = longip - int(longip / 256^i) * 256^i;
        if (i>0) 
			ip = ip & ".";
    }
    return ip;
}
</cfscript>

<!---
 Pings a website using .net framework
 
 @param host 	 URL/IP that you would like to ping. (Required)
 @return A string containing the results of the ping. 
 @author Elias (eliasjp@msn.com) 
 @version 1, October 14, 2008 
--->
<cffunction name="Ping" returntype="string" output="false" access="public">
    <cfargument name="host" type="string" required="yes">
    <!--- Local vars --->
    <cfset var pingClass="">
    <cfset var pingReply="">
    <!--- Get Ping class --->
    <cfobject type=".NET" name="pingClass"
            class="System.Net.NetworkInformation.Ping">
    <!--- Perform synchronous ping (using defaults) ---> 
    <cfset pingReply=pingClass.Send(Arguments.host)>
    <!--- Return result --->
    <cfreturn pingReply.Get_Status().ToString()>
</cffunction>

<!---
 Pings a TrackBack URL.
 
 @param trackbackurl 	 The TrackBack ping URL to ping (Required)
 @param permalink 	 The permalink for the entry (Required)
 @param charset 	 Default to utf-8. (Optional)
 @param title 	 The title of the entry (Optional)
 @param excerpt 	 An excerpt of the entry (Optional)
 @param blogName 	 The name of the weblog to which the entry was posted (Optional)
 @param timeout 	 Default to 30. Value, in seconds, that is the maximum time the request can take (Optional)
 @return Returns a string. 
 @author Giampaolo Bellavite (giampaolo@bellavite.com) 
 @version 1, January 12, 2006 
--->
<cffunction name="pingTrackback" output="false" returntype="string">
	<cfargument name="trackBackURL" type="string" required="yes">
	<cfargument name="permalink" type="string" required="yes">
	<cfargument name="charset" type="string" required="no" default="utf-8">
	<cfargument name="title" type="string" required="no">
	<cfargument name="excerpt" type="string" required="no">
	<cfargument name="blogName"  type="string" required="no">
	<cfargument name="timeout"  type="numeric" required="no" default="30">
	<cfset var cfhttp = "">
	<cfhttp url="#arguments.trackBackURL#" method="post" timeout="#arguments.timeout#" charset="#arguments.charset#">
		<cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded; charset=#arguments.charset#">
		<cfhttpparam type="formfield" encoded="yes" name="url" value="#arguments.permalink#">
		<cfif structKeyExists(arguments, "title")>
			<cfhttpparam type="formfield" encoded="yes" name="title" value="#arguments.title#">
		</cfif>
		<cfif structKeyExists(arguments, "excerpt")>
			<cfhttpparam type="formfield" encoded="yes" name="excerpt" value="#arguments.excerpt#">
		</cfif>
		<cfif structKeyExists(arguments, "blogName")>
			<cfhttpparam type="formfield" encoded="yes" name="blog_name" value="#arguments.blogName#">
		</cfif>
	</cfhttp>
	<cfreturn cfhttp.FileContent>
</cffunction>

<!---
 Sends a UDP packet.
 
 @param host 	 Host to send the UDP (Required)
 @param port 	 Port to send the UDP (Required)
 @param message 	 The message to transmit (Required)
 @return Returns nothing. 
 @author GaoChangwei (coldfusion.jquery@gmail.com) 
 @version 1, July 31, 2013 
--->
<cffunction name="sendUDP" access="private" returntype="string" output="false">
	<cfargument name="host" type="string" required="yes" hint="Host to send the UDP">
	<cfargument name="port" type="numeric" required="yes" hint="Port to send the UDP">
	<cfargument name="message" type="string" required="yes"  hint="The message to transmit">

	<cfset var text = arguments.message />
	<cfset var msg = arraynew(1) />
	
	<cfset var i = 0>
	<cfloop index="i" from="1" to="#len(text)#">
		<cfset msg[i] = asc( Mid(text, i, 1) ) />
	</cfloop>
	<!--- Get the internet address of the specified host --->
	<cfset address = createObject("java", "java.net.InetAddress").getByName(arguments.host) />
	
	<!--- Initialize a datagram packet with data and address --->
	<cfset packet = createObject("java", "java.net.DatagramPacket").init( javacast("byte[]",msg), 
																		  javacast("int",arrayLen(msg)), 
																		  address, 
																		  javacast("int",arguments.port)) />
																		  
	<!--- Create a datagram socket, send the packet through it, close it. --->
	<cfset dsocket = createObject("java", "java.net.DatagramSocket") />	
	<cfset dsocket.send(packet) />
	<cfset dsocket.close() />

</cffunction>

<!---
 Checks to see if a particular URL actually exists.
 Gus made some changes to handle a unresolving domain.
 
 @param u 	 The URL to check. (Required)
 @return Returns a boolean. 
 @author Ben Forta (ben@forta.com) 
 @version 1, January 3, 2006 
--->
<cffunction name="urlExists" output="no" returntype="boolean">
	<!--- Accepts a URL --->
	<cfargument name="u" type="string" required="yes">

	<!--- Initialize result --->
	<cfset var result=true>

	<!--- Attempt to retrieve the URL --->
	<cfhttp url="#arguments.u#" resolveurl="no" throwonerror="no" />

	<!--- Check That a Status Code is Returned --->
	<cfif isDefined("cfhttp.responseheader.status_code")>
		<cfif cfhttp.responseheader.status_code EQ "404">
			<!--- If 404, return FALSE --->
			<cfset result=false>
		</cfif>
	<cfelse>
		<!--- No Status Code Returned --->
		<cfset result=false>
	</cfif>
	<cfreturn result>
</cffunction>

<!---
 Verifies a mail server connection.
 
 @param protocol 	 Mail protocol: SMTP, POP3 or IMAP (Required)
 @param host 	 Mail server name (Example: pop.gmail.com) (Required)
 @param port 	 Mail server port number. Default is -1, meaning use the default port for this protocol) (Optional)
 @param user 	 Mail account username (Required)
 @param password 	 Mail account password (Required)
 @param useSSL 	 If true, use SSL (Secure Sockets Layer). Default is false. (Optional)
 @param useTLS 	 If true, use TLS (Transport Level Security). Default to false. (Optional)
 @param enforceTLS 	 If true, require TLS support, Default is false. (Optional)
 @param timeout 	 Maximum milliseconds to wait for connection. Default is 0 (wait forever) (Optional)
 @param debug 	 If true, enable debugging. By default information is sent to is sent to System.out. Default is false. (Optional)
 @param logPath 	 Send debugging output to this file. Absolute file path. Has no effect if debugging is disabled. (Optional)
 @param append 	 If false, the existing log file will be overwritten. Default is true. (Optional)
 @return Returns a struct. 
 @author Leigh (cfsearching@gmail.com) 
 @version 1, July 1, 2010 
--->
<cffunction name="verifyMailServer" returntype="struct" access="public" output="true">
	<cfargument name="protocol" type="string" required="true" hint="Mail protocol: SMTP, POP3 or IMAP" />
	<cfargument name="host" type="string" required="true" hint="Mail server name (Example: pop.gmail.com)"/>
	<cfargument name="port" type="numeric" default="-1" hint="Mail server port number. Default is -1, meaning use the default port for this protocol)" />
	<cfargument name="user" type="string" required="true" hint="Mail account username" />
	<cfargument name="password" type="string" required="true" hint="Mail account password" />
	<cfargument name="useSSL" type="boolean" default="false" hint="If true, use SSL (Secure Sockets Layer)" >
	<cfargument name="useTLS" type="boolean" default="false" hint="If true, use TLS (Transport Level Security)" >
	<cfargument name="enforceTLS" type="boolean" default="false" hint="If true, require TLS support" >
	<cfargument name="timeout" type="numeric" default="0" hint="Maximum milliseconds to wait for connection. Default is 0 (wait forever)" />
	<cfargument name="debug" type="boolean" default="false" hint="If true, enable debugging. By default information is sent to is sent to System.out." >
	<cfargument name="logPath" type="string" default="" hint="Send debugging output to this file. Absolute file path. Has no effect if debugging is disabled." >
	<cfargument name="append" type="boolean" default="true" hint="If false, the existing log file will be overwritten" >

	<cfset var status 		= structNew() />
	<cfset var props 		= "" />
	<cfset var mailSession 	= "" />
	<cfset var store 		= "" />
	<cfset var transport	= "" />
	<cfset var logFile		= "" />
	<cfset var fos 			= "" />
	<cfset var ps 			= "" />
	
	<!--- validate protocol --->
	<cfset arguments.protocol = lcase( trim(arguments.protocol) ) />
	<cfif not listFindNocase("pop3,smtp,imap", arguments.protocol)>
		<cfthrow type="IllegalArgument" message="Invalid protocol. Allowed values: POP3, IMAP and SMTP" />
	</cfif>
	
	<cfscript>
		// initialize status messages
		status.wasVerified 	= false;
		status.errorType  	= "";
		status.errorDetail  = "";

		try {
   			props = createObject("java", "java.util.Properties").init();

			// enable security settings
   			if (arguments.useSSL or arguments.useTLS) {

   				// use the secure protocol
   				// this will set the property mail.{protocol}.ssl.enable = true
				if (arguments.useSSL) {
					arguments.protocol = arguments.protocol &"s";			
				}
				
   				// enable identity check (recommended)
   				props.put("mail."& protocol &".ssl.checkserveridentity", "true");

				// enable transport level security and make it mandatory
				// so the connection fails if TLS is not supported
   				if (arguments.useTLS) {
   					props.put("mail."& protocol &".starttls.required", "true");
   					props.put("mail."& protocol &".starttls.enable", "true");
   				}

   			}

			// force authentication command
			props.put("mail."& protocol &".auth", "true");

			// for simple verifications, apply timeout to both socket connection and I/O 
			if (structKeyExists(arguments, "timeout")) {
	   			props.put("mail."& protocol &".connectiontimeout", arguments.timeout);
   				props.put("mail."& protocol &".timeout", arguments.timeout);
			}

	   		// create a new mail session 
    		mailSession = createObject("java", "javax.mail.Session").getInstance( props );

    		// enable debugging
    		if (arguments.debug) {
   				mailSession.setDebug( true );
   				
    			// redirect the output to the given log file
    			if ( len(trim(arguments.logPath)) ) {
    				logFile = createObject("java", "java.io.File").init( arguments.logPath );
   					fos  	= createObject("java", "java.io.FileOutputStream").init( logFile, arguments.overwrite );
   					ps   	= createObject("java", "java.io.PrintStream").init( fos ); 
   					mailSession.setDebugOut( ps );
    			}
    		}
    		
			// Connect to an SMTP server ... 
			if ( left(arguments.protocol, 4) eq "smtp") {

		    		transport = mailSession.getTransport( protocol );
	    			transport.connect(arguments.host, arguments.port, arguments.user, arguments.password);
	    			transport.close();
		    		// if we reached here, the credentials should be verified
					status.wasVerified 	= true;

			}
			// Otherwise, it is a POP3 or IMAP server
			else {

	    			store = mailSession.getStore( protocol );
	    			store.connect(arguments.host, arguments.port, arguments.user, arguments.password);
	    			store.close();
		    		// if we reached here, the credentials should be verified
					status.wasVerified 	= true;

			}     	

	     }
	     //for authentication failures
	     catch(javax.mail.AuthenticationFailedException e) {
	   			status.errorType 	= "Authentication";
	     		status.errorDetail 	= e;
	   	 }
	     // some other failure occurred like a javax.mail.MessagingException
	     catch(Any e) {
	     		status.errorType 	= "Other";
	     		status.errorDetail 	= e;
	     }


	     // always close the stream ( messy work-around for lack of finally clause prior to CF9...)
	     if ( not IsSimpleValue(ps) ) {
		 	ps.close();
	     }

	     return status;
	</cfscript>
</cffunction>






