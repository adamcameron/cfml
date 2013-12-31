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

<cfscript>
/**
 * Abbreviates a given string to roughly the given length, stripping any tags, making sure the ending doesn't chop a word in two, and adding an ellipsis character at the end.
 * Fix by Patrick McElhaney
 * v3 by Ken Fricklas kenf@accessnet.net, takes care of too many spaces in text.
 * 
 * @param string 	 String to use. (Required)
 * @param len 	 Length to use. (Required)
 * @return Returns a string. 
 * @author Gyrus (gyrus@norlonto.net) 
 * @version 3, September 6, 2005 
 */
function abbreviate(string,len) {
	var newString = REReplace(string, "<[^>]*>", " ", "ALL");
	var lastSpace = 0;
	newString = REReplace(newString, " \s*", " ", "ALL");
	if (len(newString) gt len) {
		newString = left(newString, len-2);
		lastSpace = find(" ", reverse(newString));
		lastSpace = len(newString) - lastSpace;
		newString = left(newString, lastSpace) & "  &##8230;";
	}	
	return newString;
}
</cfscript>

<cfscript>
/**
 * This turns a Microsoft Access hyperlink field into a standard URL.
 * 
 * @param strval 	 Variable containing the MS Access link you want to 'clean'. 
 * @return Returns a string. 
 * @author Mark Andrachek (hallow@webmages.com) 
 * @version 1, January 3, 2002 
 */
function AccessLinkClean(strval)  
{
   return Mid(strval,2,Len(strval)-2); 
}
</cfscript>

<cfscript>
/**
 * Strip pattern-matching wildcards from a string appearing in an Access query.
 * Modded list order (rkc 8/14/02)
 * 
 * @param string 	 The string to format. (Required)
 * @return Returns a string. 
 * @author Matthew Walker (matthew@cabbagetree.co.nz) 
 * @version 2, August 14, 2002 
 */
function AccessPatternMatchingFormat(string) {
	return ReplaceList(string, "[,%,_,##", "[[],[%],[_],[##]");
}
</cfscript>

<cfscript>
/**
 * Pass in a set of words to only display its acronym.
 * 
 * @param sTerms 	 String to modify. (Required)
 * @return Returns a string. 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 1, July 18, 2013 
 */
function acronym(sTerms) {
	return '<acronym title="' & sTerms & '">' & trim( reReplaceNoCase( " " & sTerms & " ", "(\w)\w+\s", "\1", "all" ) ) & '</acronym>';
}
</cfscript>

<cfscript>
/**
 * Converts text links into HTML links within a string
 * 
 * @param string 	 Input string. (Required)
 * @return Returns a string. 
 * @author Robin Scherberich (scherberich.r@gmail.com) 
 * @version 1, February 22, 2011 
 */
function activateLinks( string )
{
	var stringLen = len( string );
	var currentPosition = 1;
	var urlArray = [];

	while( currentPosition < stringLen )
	{
		rezArray = REFindNoCase( "(?i)\b((?:https?://|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'"".,<>?«»‘’]))", arguments.string, currentPosition, true );
		
		if( rezArray.len[1] != 0 ){
			arrayAppend( urlArray, mid( string, rezArray.pos[1]-2, rezArray.len[1]+2 ) );
			currentPosition = rezArray.pos[1] + rezArray.len[1];
		} else {
			currentPosition = stringLen;
		}
	}

	for( i = 1; i <= arrayLen( urlArray ); i++ )
	{
		if( left( urlArray[i], 2 ) != '="' )
		{
			link = right( urlArray[i], len( urlArray[i] )-2 );
			string = replace( string, link, '<a href="'& link &'">'& link &'</a>', "all" );
		} else {
			i++;
		}
	}

	return string;
}
</cfscript>

<cfscript>
/**
 * This function takes URLs in a text string and turns them into links.
 * Version 2 by Lucas Sherwood, lucas@thebitbucket.net.
 * Version 3 Updated to allow for ;
 * 
 * @param string 	 Text to parse. (Required)
 * @param target 	 Optional target for links. Defaults to "". (Optional)
 * @param paragraph 	 Optionally add paragraphFormat to returned string. (Optional)
 * @return Returns a string. 
 * @author Joel Mueller (jmueller@swiftk.com) 
 * @version 3, August 11, 2004 
 */
function ActivateURL(string) {
	var nextMatch = 1;
	var objMatch = "";
	var outstring = "";
	var thisURL = "";
	var thisLink = "";
	var	target = IIf(arrayLen(arguments) gte 2, "arguments[2]", DE(""));
	var paragraph = IIf(arrayLen(arguments) gte 3, "arguments[3]", DE("false"));
	
	do {
		objMatch = REFindNoCase("(((https?:|ftp:|gopher:)\/\/)|(www\.|ftp\.))[-[:alnum:]\?%,\.\/&##!;@:=\+~_]+[A-Za-z0-9\/]", string, nextMatch, true);
		if (objMatch.pos[1] GT nextMatch OR objMatch.pos[1] EQ nextMatch) {
			outString = outString & Mid(String, nextMatch, objMatch.pos[1] - nextMatch);
		} else {
			outString = outString & Mid(String, nextMatch, Len(string));
		}
		nextMatch = objMatch.pos[1] + objMatch.len[1];
		if (ArrayLen(objMatch.pos) GT 1) {
			// If the preceding character is an @, assume this is an e-mail address
			// (for addresses like admin@ftp.cdrom.com)
			if (Compare(Mid(String, Max(objMatch.pos[1] - 1, 1), 1), "@") NEQ 0) {
				thisURL = Mid(String, objMatch.pos[1], objMatch.len[1]);
				thisLink = "<A HREF=""";
				switch (LCase(Mid(String, objMatch.pos[2], objMatch.len[2]))) {
					case "www.": {
						thisLink = thisLink & "http://";
						break;
					}
					case "ftp.": {
						thisLink = thisLink & "ftp://";
						break;
					}
				}
				thisLink = thisLink & thisURL & """";
				if (Len(Target) GT 0) {
					thisLink = thisLink & " TARGET=""" & Target & """";
				}
				thisLink = thisLink & ">" & thisURL & "</A>";
				outString = outString & thisLink;
				// String = Replace(String, thisURL, thisLink);
				// nextMatch = nextMatch + Len(thisURL);
			} else {
				outString = outString & Mid(String, objMatch.pos[1], objMatch.len[1]);
			}
		}
	} while (nextMatch GT 0);
		
	// Now turn e-mail addresses into mailto: links.
	outString = REReplace(outString, "([[:alnum:]_\.\-]+@([[:alnum:]_\.\-]+\.)+[[:alpha:]]{2,4})", "<A HREF=""mailto:\1"">\1</A>", "ALL");
		
	if (paragraph) {
		outString = ParagraphFormat(outString);
	}
	return outString;
}
</cfscript>

<cfscript>
/**
 * Convert ASCII characters into a decimal number.
 * Removed evaluate
 * 
 * @param string 	 String to format. (Required)
 * @param order 	 Byte order (i for Intel or m for Motorola) (Optional)
 * @param signed 	 Process signed integers normally or in two's complement notation. Values are false (process normally), true (signed), and tcn (2's complement notation) (Optional)
 * @return Returns a string. 
 * @author Evan Keller (coldfusion@evankeller.com) 
 * @version 2, January 2, 2003 
 */
function AsciiToDec(string) {
	var order="i";		//Optional arrtibute: Byte Order
						//"i"= Intel (default)
						//"m"= Motorola
	var signed=false;	//Optional attribute: Signed
						//false= unsigned (default)
						//true= signed
						//"tcn"= 2's Complement Notation
	var result=0;
	var i=0;
	
	if (ArrayLen(arguments) gt 1) {
		order = arguments[2];
	}
	if (ArrayLen(arguments) gt 2) {
		signed = arguments[3];
	}
	for (i=1; i LTE len(string)+1; i=i+1) {
		if (order is "i") {
			result = result + (asc(mid(string, i, 1)) * 256^(i-1));
		}
		if (order is "m") {
			result = result + (asc(mid(string, i, 1)) * 256^(len(string)-i));
		}
	}
	switch (signed) {
		case true:
			if (len(string) is 0) { //If the string is "0" the length is calculated as zero,
									//which throws things off, we set the string to " " so
									//it has a length of one.
				string = " ";
			}
			result = result - 256^len(string)/2;
		case "tcn":
			if (result GTE 256^len(string)/2) {
				result = result - 256^len(string);
			}
		default:
			result = result;
	}
	return result;
}
</cfscript>

<!---
 Given unbalanced or truncated XHTML, returns balanced XHTML
 v1.0 by Chris Herdt
 
 @param string 	 A string containing a fragment of XHTML (Required)
 @return Returns a string with any unbalanced opening tags re-balanced with matching closing tags 
 @author Chris Herdt (cherdt@gmail.com) 
 @version 1.0, November 22, 2012 
--->
<cffunction name="balanceTags" access="public" output="false" returntype="string" hint="Takes (possibly truncated) XHTML content and balances the tags">
	<cfargument name="string" type="string" required="true" hint="The HTML string to balance">
	<cfset var returnString = arguments.string>
	<cfset var tagStack = arrayNew(1)>
	<cfset var tag = "">
	<cfset var tagString = "">
	<cfset var word = "">
	<cfset var startPosition = 1>

	<!--- First, find any broken tags (as opposed to broken elements) --->
	<!--- Loop backwards through text one char at a time --->
	<!--- If you find a < before a > then there is a broken tag --->
	<cfset startPosition = len(returnString)>
	<cfloop condition="startPosition GT 0">
		<cfif find("<",returnString,startPosition) GT 0>
			<!--- This represents a broken tag. Truncate the string at this position --->
			<cfset returnString = left(returnString,startPosition-1)>
			<cfbreak>
		<cfelseif find(">",returnString,startPosition) GT 0>
			<!--- Found the end of the tag (properly ended), so we can break the loop --->
			<cfbreak>
		<cfelse>
			<!--- Check the next char to the left --->
			<cfset startPosition = startPosition-1>
		</cfif>
	</cfloop>

	<!--- Reset start position to begin at the first char --->
	<cfset startPosition = 1>

	<!--- Next, find any broken elements (i.e. start tags without end tags --->
	<cfloop condition="startPosition GT 0 AND startPosition LT len(returnString)">
		<cfset startPosition = find("<",returnString,startPosition)>
		<cfset tag = REFind("</?[A-Za-z]+[^>]*>",returnString,startPosition,true)>
		<cfif tag.len[1] GT 0>
			<cfset tagString = mid(returnString,tag.pos[1],tag.len[1])>
			<!--- Check for self-closing tag --->
			<cfif REFind("\s*/\s*>",tagString) GT 0>
				<!--- Do nothing --->
			<cfelse>
				<cfset word = REFind("/?[A-Za-z]+",tagString,1,true)>
				<cfif word.len[1] GT 0>
					<!--- Is this a start tag or an end tag? --->
					<cfif NOT find("/",mid(tagString,word.pos[1],word.len[1]))>
						<!--- Start tag: Push the word (start tag) onto the stack --->
						<cfset arrayAppend(tagStack,mid(tagString,word.pos[1],word.len[1]))>
					<cfelse>
						<!--- End tag: Pop word --->
						<cfset arrayDeleteAt(tagStack,arrayLen(tagStack))>
						<!--- TODO:
						What if the tags are not only unbalanced, but not properly nested?
						E.g. "<div><p>Here is <strong>some</p><p>text</strong></p></div>"
						We could try to insert the end tag before the closing of the parent tag.
						Although then we would have a stray end tag.
						--->
					</cfif>
				</cfif>
			</cfif>
			<!--- Ignore everything that was part of the current tag --->
			<cfset startPosition = tag.pos[1]+tag.len[1]>
			<!--- Advance to next tag --->
			<cfset startPosition = find("<",returnString,startPosition)>
		</cfif>
	</cfloop>

	<!--- While the stack is not empty, pop items from the stack --->
	<cfloop condition="arrayLen(tagStack) GT 0">
		<!--- Add the popped word (top of stack) as an end tag --->
		<cfset returnString = returnString & "</" & tagStack[ArrayLen(tagStack)] & ">">
		<cfset arrayDeleteAt(tagStack,arrayLen(tagStack))>
	</cfloop>

	<cfreturn returnString>
</cffunction>

<cfscript>
/**
 * Format a value as 1 or 0.
 * 
 * @param num 	 Value to format. (Required)
 * @return Returns a number. 
 * @author Trevor Orr (fractorr@yahoo.com) 
 * @version 1, August 14, 2007 
 */
function BitFormat(num) {
	return (IIF(IsNumeric(Trim(arguments.num)) AND Trim(arguments.num) NEQ 0, 1, 0));
}
</cfscript>

<cfscript>
/**
 * Returns a negative number in brackets.
 * 
 * @param myNum 	 Number to format. (Required)
 * @return Returns a string. 
 * @author Andrew Peterson (webmaster@mail.ioc.state.il.us) 
 * @version 1, August 26, 2002 
 */
function BracketNumberFormat(myNum) {
   if(myNum eq "") {
    return 0;
    } else {
      if(myNum lt 0)
      {
         return '(' & numberformat(right(myNum, len(myNum)-1)) & ')';
      } else {
         return numberFormat(myNum);
      }
    }
  }
</cfscript>

<cfscript>
/**
 * Works like the built-in function lsCurrencyFormat, but do it right for Brazilian Currency (R$ - Real).
 * 
 * @param valor 	 Number to be formatted. (Required)
 * @return Returns a string. 
 * @author Fernando Segalla (segalla@intralab.com.br) 
 * @version 1, November 1, 2002 
 */
function BRCurrencyFormat(valor) {
	valor = DecimalFormat(valor);
	valor = Replace(valor,',','.','ALL');
	valor = Reverse(Replace(Reverse(valor),'.',',','ONE'));
	if(valor LT 0) return "(R$" & Right(valor,Len(valor)-1) & ")";
	else return "R$" & valor;
}
</cfscript>

<cfscript>
/**
 * Creates a bread crumb trail based on your sites sirectory structure.
 * 
 * @return Returns a string. 
 * @author Jon Lesser (jdl1101@rit.edu) 
 * @version 1, July 25, 2006 
 */
function breadCrumb() {
	var baseLink = "/";
	var delimiter = " > ";
	var crumbs = "<a href='" & baseLink & "'>Home</a>" & delimiter;
	var breadCrumbArray = listToArray(replace(cgi.script_name, "_", " ", "all") , "/");
	var i = 1;
	
	for(i=1; i lt arrayLen(breadCrumbArray); i=i+1) {
		baseLink = baseLink & replace(breadCrumbArray[i], " ", "_", "all") & "/";
		
		if(i lt ArrayLen(breadCrumbArray)-1) crumbs = crumbs & "<a href='" & baseLink & "'>" & capFirstTitle(breadCrumbArray[i]) & "</a>" & delimiter;
		else crumbs = crumbs & capFirstTitle(breadCrumbArray[i]);		
	}
	return crumbs;
}
</cfscript>

<cfscript>
/**
 * Generates a byline from a list of names.
 * 
 * @param names 	 List of Names. (Required)
 * @param editors 	 Boolean signifying that the list is a list of editors. Defaults to false. (Optional)
 * @param extrasMode 	 String signifying extrasMode to use. Currently "IMDB" is support. Defaults to "none". (Optional)
 * @return Returns a string. 
 * @author Gyrus (gyrus@norlonto.net) 
 * @version 1, October 10, 2002 
 */
function Byline(names) {
	// Initialise
	var i = 0;
	var name = "";
	var bylineString = "";
	var edited = FALSE;
	var extrasMode = "none";
	if (ArrayLen(Arguments) GT 1) {
		edited = Arguments[2];
	}
	if (ArrayLen(Arguments) GT 2) {
		extrasMode = Arguments[3];
	}
	// Loop through names
	if (ListLen(names)) {
		for (i=1; i LTE ListLen(names); i=i+1) {
			name = ListGetAt(names, i);
			// Edited?
			if (edited) {
				name = "#name# (ed.)";
			}
			// Perform extras
			switch (extrasMode) {
				case "imdb": {
					name = "<a href=""http://uk.imdb.com/Name?#Replace(name,' ','+','ALL')#"" title=""check for information on this person on the Internet Movie Database"">#name#</a>";
					break;
				}
			}
			if (i EQ 1) {
				bylineString = "by #name#";
			} else if (i EQ ListLen(names)) {
				bylineString = "#bylineString# &amp; #name#";
			} else {
				bylineString = "#bylineString#, #name#";
			}
		}
	}
	return bylineString;
}
</cfscript>

<!---
 Converts Byte values to the shortest human-readable format
 03-mar-2010 minor change to the way units variable was created
 
 @param bytes 	 size in bytes to format (Required)
 @param maxreduction 	 limit on reduction (Optional)
 @return returns a string 
 @author Joerg Zimmer (joerg@zimmer-se.de) 
 @version 0, March 3, 2010 
--->
<cffunction name="byteAutoConvert" access="public" returntype="string" output="false">
	<cfargument name="bytes" type="numeric" required="true">
	<cfargument name="maxreduction" type="numeric" required="false" default="9">
	<cfset var units = listToArray("B,KB,MB,GB,TB,PB,EB,ZB,YB",",")>> 
	<cfset var conv = 0>
	<cfset var exp = 0>
	
	<cfif arguments.maxreduction gte 9>
		<cfset arguments.maxreduction = arraylen(units) - 1>
	</cfif>
	
	<cfif arguments.bytes gt 0>
		<cfset exp = fix(log(arguments.bytes) / log(1024))>
		<cfif exp gt arguments.maxreduction>
			<cfset exp = arguments.maxreduction>
		</cfif>
		<cfset conv = arguments.bytes / (1024^exp)>
	</cfif>
			
	<cfreturn "#trim(lsnumberformat(conv,"_____.00"))# #units[exp + 1]#"/>
</cffunction>

<cfscript>
/**
 * Breaks a camelCased string into separate words
 * 8-mar-2010 added option to capitalize parsed words Brian Meloche brianmeloche@gmail.com
 * 
 * @param str 	 String to use (Required)
 * @param capitalize 	 Boolean to return capitalized words (Optional)
 * @return Returns a string 
 * @author Richard (acdhirr@trilobiet.nl) 
 * @version 0, March 8, 2010 
 */
function camelToSpace(str) {
	var rtnStr=lcase(reReplace(arguments.str,"([A-Z])([a-z])","&nbsp;\1\2","ALL"));
	if (arrayLen(arguments) GT 1 AND arguments[2] EQ true) {
		rtnStr=reReplace(arguments.str,"([a-z])([A-Z])","\1&nbsp;\2","ALL");
		rtnStr=uCase(left(rtnStr,1)) & right(rtnStr,len(rtnStr)-1);
	}
return trim(rtnStr);
}
</cfscript>

<!---
 Capitalizes the first letter in each word.
 Made udf use strlen, rkc 3/12/02
 v2 by Sean Corfield.
 
 @param string 	 String to be modified. (Required)
 @return Returns a string. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, March 9, 2007 
--->
<cffunction name="CapFirst" returntype="string" output="false">
	<cfargument name="str" type="string" required="true" />
	
	<cfset var newstr = "" />
	<cfset var word = "" />
	<cfset var separator = "" />
	
	<cfloop index="word" list="#arguments.str#" delimiters=" ">
		<cfset newstr = newstr & separator & UCase(left(word,1)) />
		<cfif len(word) gt 1>
			<cfset newstr = newstr & right(word,len(word)-1) />
		</cfif>
		<cfset separator = " " />
	</cfloop>

	<cfreturn newstr />
</cffunction>

<!---
 Capitalize the first letter of each item in a list.
 
 @param str 	 List to parse. (Required)
 @param delimiter 	 List delimiter. Defaults to a comma. (Optional)
 @return Returns a string. 
 @author Randy Johnson (randy@cfconcepts.com) 
 @version 1, May 30, 2010 
--->
<cffunction name="capFirstList" returntype="string" output="false">
    <cfargument name="str" type="string" required="true" />
    <cfargument name="delimiter" default="," required="false">

    <cfset var newstr = "" />
    <cfset var word = "" />
    <cfset var separator = "" />

    <cfloop index="word" list="#arguments.str#" delimiters="#arguments.delimiter#">
        <cfset newstr = newstr & separator & UCase(left(word,1)) />
        <cfif len(word) gt 1>
            <cfset newstr = newstr & right(word,len(word)-1) />
        </cfif>
        <cfset separator = arguments.delimiter />
    </cfloop>

    <cfreturn newstr />
</cffunction>

<cfscript>
/**
 * Returns a string with words capitalized for a title.
 * Modified by Ray Camden to include var statements.
 * Modified by James Moberg to use structs, added more words, and reset-to-all-caps list.
 * 
 * @param initText 	 String to be modified. (Required)
 * @return Returns a string. 
 * @author Ed Hodder (ed.hodder@bowne.com) 
 * @version 3, October 7, 2011 
 */
function capFirstTitle(initText){
       var j = 1; var m = 1;
       var doCap = true;
       var tempVar = "";
       /* Make each word in text an array variable */
       var Words = ListToArray(LCase(trim(initText)), " ");
       var excludeWords = structNew();
       var ResetToALLCAPS = structNew();
       /* Words to never capitalize */
       tempVar =  ListToArray("a,above,after,ain't,among,an,and,as,at,below,but,by,can't,don't,for,from,from,if,in,into,it's,nor,of,off,on,on,onto,or,over,since,the,to,under,until,up,with,won't");
       for(j=1; j LTE (ArrayLen(tempVar)); j = j+1){
               excludeWords[tempVar[j]] = 0;
       }
       /* Words to always capitalize */
       tempVar = ListToArray("II,III,IV,V,VI,VII,VIII,IX,X,XI,XII,XIII,XIV,XV,XVI,XVII,XVIII,XIX,XX,XXI");
       for(j=1; j LTE (ArrayLen(tempVar)); j = j+1){
               ResetToALLCAPS[tempVar[j]] = 0;
       }
       /* Check words against exclude list */
       for(j=1; j LTE (ArrayLen(Words)); j = j+1){
               doCap = true;
               /* Word must be less than four characters to be in the list of excluded words */
               if(LEN(Words[j]) LT 4){
                       if(structKeyExists(excludeWords,Words[j])){ doCap = false; }
               }
               /* Capitalize hyphenated words */
               if(ListLen(trim(Words[j]),"-") GT 1){
                       for(m=2; m LTE ListLen(Words[j], "-"); m=m+1){
                               tempVar = ListGetAt(Words[j], m, "-");
                               tempVar = UCase(Mid(tempVar,1, 1)) & Mid(tempVar,2, LEN(tempVar)-1);
                               Words[j] = ListSetAt(Words[j], m, tempVar, "-");
                       }
               }
               /* Automatically capitalize first and last words */
               if(j eq 1 or j eq ArrayLen(Words)){ doCap = true; }
               /* Capitalize qualifying words */
               if(doCap){ Words[j] = UCase(Mid(Words[j],1, 1)) & Mid(Words[j],2, LEN(Words[j])-1); }
               if (structKeyExists(ResetToALLCAPS, Words[j])) Words[j] = ucase(Words[j]);
       }
       return ArrayToList(Words, " ");
}
</cfscript>

<cfscript>
/**
 * Convert cardinal number strings to ordinal number strings.
 * 
 * @param cardinalString 	 Cardinal string to format. (Required)
 * @return Returns a string. 
 * @author Howard Fore (me@hofo.com) 
 * @version 1, May 26, 2003 
 */
function CardinalToOrdinal(cardinalString) {
  var resultString = "";        // Generated result to return
  var lastCardinal = "";        // Last word in cardinal number string
  var TempNum = 0;              // temp integer

  cardinalSpecialStrings = "One,one,Two,two,Three,three,Four,four,Five,five,Six,six,Eight,eight,Nine,nine,Twelve,twelve";
  ordinalSpecialStrings = "First,first,Second,second,Third,third,Fourth,fourth,Fifth,fifth,Sixth,sixth,Eighth,eighth,Ninth,ninth,Twelfth,twelfth";
  
  cardinalString = trim(cardinalString);
  lastCardinal = listLast(cardinalString," ");
  resultString = ListDeleteAt(cardinalString,ListLen(cardinalString," ")," ");
  
  // Is lastCardinal a special case?
  TempNum = listFindNoCase(cardinalSpecialStrings,lastCardinal);
  if (TempNum GT 0) {
  	resultString = ListAppend(resultString,ListGetAt(ordinalSpecialStrings,TempNum)," ");
  } else {
    if (ListFindNoCase(Right(lastCardinal,2),"en"))
    {
      // Last word ends with "en", add "th"
      resultString = ListAppend(resultString,lastCardinal & "th"," ");
    } 
    if (ListFindNoCase(Right(lastCardinal,1),"d"))
    {
      // Last word ends with "d", add "th"
      resultString = ListAppend(resultString,lastCardinal & "th"," ");
    } 
    if (ListFindNoCase(Right(lastCardinal,1),"y"))
    {
      // Last word ends with "y", delete "y", add "ieth"
      resultString = ListAppend(resultString, Left(lastCardinal,Len(lastCardinal) - 1) & "ieth"," ");
    } 
    if (ListFindNoCase(Right(lastCardinal,3),"ion"))
    {
      // Last word ends with "ion", add "th"
      resultString = ListAppend(resultString,lastCardinal & "th"," ");
    } 
  }
  return resultString;
}
</cfscript>

<cfscript>
/**
 * Escapes a credit card number, showing only the last 4 digits. The other digits are replaced with the * character.
 * return just stars if str too short, found by Tony Monast
 * 
 * @param ccnum 	 Credit card number you want to escape. (Required)
 * @return Returns a string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 2, April 26, 2009 
 */
function ccEscape(ccnum){
	if(len(ccnum) lte 4) return "****";
	return "#RepeatString("*",val(Len(ccnum)-4))##Right(ccnum,4)#";
}
</cfscript>

<cfscript>
/**
 * Proper capitalization for us Mc's and Mac's!
 * v2 by Kris Korsmo
 * 
 * @param lastName 	 String to modify. (Required)
 * @return Returns a string. 
 * @author Kyle McNamara (kyle@themacs.info) 
 * @version 2, December 5, 2010 
 */
function celticMcCaps(lastName) {
    var capLastName = lCase(lastName);
    if (left(lastName,2) eq "Mc") {
        capLastName = uCase(left(lastName,1)) & lCase(mid(lastName,2,1)) & uCase(mid(lastName,3,1)) & lCase(right(lastName,len(lastName)-3));
        return capLastName;
    }
    else if (left(lastName,3) eq "Mac") {
        capLastName = uCase(left(lastName,1)) & lCase(mid(lastName,2,1)) & lCase(mid(lastName,3,1)) & uCase(mid(lastName,4,1)) & lCase(right(lastName,len(lastName)-4));
        return capLastName;
    }
    else if (left(lastName,2) eq "O'") {
        capLastName = uCase(left(lastName,1)) & "'" & uCase(mid(lastName,3,1)) & lCase(right(lastName,len(lastName)-3));
        return capLastName;
    }
    else return lastName;
}
</cfscript>

<!---
 Display rss feed.
 Changes by Raymond Camden and Steven (v2 support amount)
 
 @param feedURL 	 RSS URL. (Required)
 @param amount 	 Restricts the amount of items returned. Defaults to number of items in the feed. (Optional)
 @return Returns a query. 
 @author Jose Diaz-Salcedo (bleachedbug@gmail.com) 
 @version 2, November 20, 2008 
--->
<cffunction name="cfRssFeed" access="public" returntype="query" output=false>
	<cfargument name="feedUrl" type="string" required="true"/>
	<cfset var news_file = arguments.feedurl>
	<cfset var rss = "">
	<cfset var items = "">
	<cfset var rssItems = "">
	<cfset var i = "">
	<cfset var row = "">
	<cfset var title = "">
	<cfset var link = "">
	
	<cfhttp url="#news_file#" method="get" />
	
	<cfset rss = xmlParse(cfhttp.filecontent)>

	<cfset items = xmlSearch(rss, "/rss/channel/item")>
	<cfset rssItems = queryNew("title,description,link")>

	<cfloop from="1" to="#ArrayLen(items)#" index="i">
		<cfset row = queryAddRow(rssItems)>
		<cfset title = xmlSearch(rss, "/rss/channel/item[#i#]/title")>

		<cfif arrayLen(title)>
			<cfset title = title[1].xmlText>
		<cfelse>
			<cfset title="">
		</cfif>

		<cfset description = XMLSearch(items[i], "/rss/channel/item[#i#]/description")>

		<cfif ArrayLen(description)>
			<cfset description = description[1].xmlText>
		<cfelse>
			<cfset description="">
		</cfif>

		<cfset link = xmlSearch(items[i], "/rss/channel/item[#i#]/link")>

		<cfif arrayLen(link)>
			<cfset link = link[1].xmlText>
		<cfelse>
			<cfset link="">
		</cfif>

		<cfset querySetCell(rssItems, "title", title, row)>
		<cfset querySetCell(rssItems, "description", description, row)>
		<cfset querySetCell(rssItems, "link", link, row)>

	</cfloop>

	<cfreturn rssItems />

</cffunction>

<cfscript>
/**
 * companion to jsstringformat - formats a string for use as a coldfusion literal value
 * 
 * @param mystring 	 String to format. (Required)
 * @return Returns a string. 
 * @author Isaac Dealey (info@turnkey.to) 
 * @version 1, May 9, 2003 
 */
function cfStringFormat(mystring) { 
	var x = 0; 
	var npc = ""; 
	var npcc = ""; 

	mystring = rereplacenocase(mystring,"(""|##)","\1\1","ALL"); 
	for (x = 1; x lte 31; x = x + 1) { 
		npc = listappend(npc,chr(x)); 
		npcc = listappend(npcc,"##chr(#x#)##"); 
	} 
	return replacelist(mystring,npc,npcc); 
}
</cfscript>

<cfscript>
/**
 * Returns the character at a certain position in a string.
 * 
 * @param str 	 String to be checked. 
 * @param pos 	 Position to get character from. 
 * @return Returns a character. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, December 3, 2001 
 */
function CharAt(str,pos) {
    return Mid(str,pos,1);
}
</cfscript>

<cfscript>
/**
 * Only allow ASCII text string.
 * 
 * @param str 	 String to check. (Required)
 * @param denylist 	 Additional list of codes to deny. (Optional)
 * @return Returns a boolean. 
 * @author Tjarko Rikkerink (tjarko@ditadres.com) 
 * @version 1, September 23, 2004 
 */
function checkAsc(str){ 
	var i = 1;
	var nr = "";
	var denylist = "";
		
	if(arrayLen(arguments) gte 2) denylist = arguments[2];
	while (i LTE len(str)) { 
		nr = asc(mid(str,i,1)); 
		if (nr LT 33 OR nr GT 126 OR listFind(denylist,nr)){
			return false;
		} 
		i = i + 1; 
	} 

	return true; 
}
</cfscript>

<cfscript>
/**
 * This UDF is an extensible, easy to use pattern validator using regular expressions.
 * Rewrites by rcamden.
 * 
 * @param checkWhat 	 Name of the pattern to use. (Required)
 * @param str 	 String to check. (Required)
 * @return Returns a boolean. 
 * @author Chris Chay (itadept@earthlink.net) 
 * @version 2, January 15, 2003 
 */
function CheckPattern(checkWhat, str) {
	var rePattern=""; // Assign RE pattern to this variable
	switch (checkWhat){
		case "isEmail":
			rePattern="^([\w\d\-\.]+)@{1}(([\w\d\-]{1,67})|([\w\d\-]+\.[\w\d\-]{1,67}))\.(([a-zA-Z\d]{2,4})(\.[a-zA-Z\d]{2})?)$";
			break;
		case "isIP":
			rePattern="^(((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|0?[0-9]?[0-9])\.){3,3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|0?[0-9]?[0-9]))$";
			break;
		case "isFloat":
			rePattern="^[-+]?\d*\.?\d*$";
			break;
		case "isInteger":
			rePattern="^[+-]?\d+$";
			break;
		case "isUSPhone":
			rePattern="^((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}$";
			break;
		case "isUSCurrency":
			rePattern="^\$(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$";
			break;
		case "isDate":
			rePattern="^(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$";
			break;
		case "isCreditCard":
			rePattern="^((4\d{3})|(5[1-5]\d{2})|(6011))-?\d{4}-?\d{4}-?\d{4}|3[4,7]\d{13}$";
			break;
		case "isSSN":
			rePattern="^\d{3}-\d{2}-\d{4}$";
			break;
		case "isZipCode":
			rePattern="^\d{5}-\d{4}|\d{5}|[A-Z]\d[A-Z] \d[A-Z]\d$";
			break;
		default:
			return("That pattern check is not available");
			break;
	}
	return reFindNoCase(rePattern,str);
}
</cfscript>

<!---
 Charset attribute enabled extended chr function.
 
 @param value 	 Value to encode. (Required)
 @param charset 	 Character set. Defaults to systems default. (Optional)
 @param radix 	 Radix for value. (Optional)
 @return Returns a string. 
 @author Hiroshi Okugawa (okugawa@mail.com) 
 @version 1, July 15, 2004 
--->
<cffunction name="chrex" return="string" output="false">
  <cfargument name="value" type="string" required="true">
  <cfargument name="charset" type="string" required="false" default="">
  <cfargument name="radix" type="numeric" required="false" default="16">
  <cfset var a="">
  <cfset var tmp="">
  <cfset var st = "">
  <cfset var integer = "">
  <cfset var string = "">
  <cfset var byte = "">
  <cfset var system = "">
  
  <cfobject type="java" class="java.util.StringTokenizer" action="create" name="st">
  <cfobject type="java" class="java.lang.Integer" action="create" name="integer">
  <cfobject type="java" class="java.lang.String" action="create" name="string">
  <cfobject type="java" class="java.lang.Byte" action="create" name="byte">

  <cfif not len(arguments.charset)>
    <cfobject type="java" class="java.lang.System" action="create" name="system">
    <cfset arguments.charset=system.getProperty("file.encoding")>
  </cfif>
 
  <cfset a=arraynew(1)>
  <cfset st.init(arguments.value, " ,#chr(9)#")>
  <cfloop condition="#st.hasMoreTokens()#">
    <cfset tmp=integer.parseInt(st.nextToken(), arguments.radix)>
    <cfset arrayappend(a, byte.init(tmp))>
  </cfloop>
  <cfreturn string.init(a, arguments.charset)>
</cffunction>

<cfscript>
/**
 * Same as built-in CJustify(), but allows optional parameter character to pad with.
 * version 1.0 by Al Everett
 * 
 * @param string 	 String to justify (Required)
 * @param length 	 Length of field (Required)
 * @param padChar 	 Character to use for padding (Optional)
 * @return A string, center-justified to occupy the specified field length 
 * @author Al Everett (everett.al@gmail.com) 
 * @version 1.0, September 16, 2012 
 */
function cJustify2(string,length) {
	var padChar = " ";
	var padLeftCount = 0;
	var padRightCount = 0;
	if (arrayLen(arguments) GT 2) {
		padChar=left(arguments[3],1);
	}
		
	if (len(string) LT length) {
		padLeftCount = (arguments.length - len(arguments.string)) \ 2; // integer divide by 2 the number of characters for padding
		padRightCount = arguments.length - len(arguments.string) - padLeftCount; // take whatever is left over and put on the right
	}
		
	return repeatString(padChar,padLeftCount) & arguments.string & repeatString(padChar,padRightCount);
}
</cfscript>

<cfscript>
/**
 * Strips unnecessary characters from phone numbers and returns a consistent looking phone number and extension, if necessary.
 * 
 * @param phoneNum 	 Phone number string to "clean." (Required)
 * @return Returns a string. 
 * @author Jeff Horne (jeff.horne@trizetto.com) 
 * @version 0, June 24, 2011 
 */
function cleanPhone(PhoneNum) {
	var thisCleanPhone ="";

	PhoneNum = ReReplace(trim(PhoneNum), "[^[:digit:]]", "", "all");
	
	// Trim away leading 1 in phone numbers.  No area codes start with 1 
	
	if (Left(Trim(PhoneNum),1) eq 1) {
      PhoneNum = Replace(PhoneNum,'1','');
	}

	thisCleanPhone = PhoneFormat(Left(PhoneNum,10));
	
	// if phone number is greater that 10 digits, use remaining digits as an extension
	
	if (len(trim(PhoneNum)) gt 10) {
		thisCleanPhone = thisCleanPhone &" x"& Right(PhoneNum,(len(trim(PhoneNum))-10));	
	}
	
	return trim(thisCleanPhone);

}
</cfscript>

<cfscript>
/**
 * Takes a two letter Country Code (i.e. US) and returns the full Country Name (i.e. UNITED STATES).
 * 
 * @param code 	 Two letter country code you want converted to the country name. (Required)
 * @return Returns a string. 
 * @author Scott Delatush (delatush@yahoo.com) 
 * @version 1, March 5, 2010 
 */
function CodeToCountry(Code) {
  var countries = "AFGHANISTAN,ALBANIA,ALGERIA,AMERICAN SAMOA,ANDORRA,ANGOLA,ANGUILLA,ANTARCTICA,ANTIGUA AND BARBUDA,ARGENTINA,
ARMENIA,ARUBA,AUSTRALIA,AUSTRIA,AZERBAIJAN,BAHAMAS,BAHRAIN,BANGLADESH,BARBADOS,BELARUS,BELGIUM,BELIZE,BENIN,
BERMUDA,BHUTAN,BOLIVIA,BOSNIA AND HERZEGOVINA,BOTSWANA,BOUVET ISLAND,BRAZIL,BRITISH INDIAN OCEAN TERRITORY,
BRUNEI DARUSSALAM,BULGARIA,BURKINA FASO,BURUNDI,CAMBODIA,CAMEROON,CANADA,CAPE VERDE,CAYMAN ISLANDS,CENTRAL AFRICAN REPUBLIC,
CHAD,CHILE,CHINA,CHRISTMAS ISLAND,COCOS (KEELING) ISLANDS,COLOMBIA,COMOROS,CONGO,THE DEMOCRATIC REPUBLIC OF THE CONGO,
COOK ISLANDS,COSTA RICA,CÔTE D'IVOIRE,CROATIA,CUBA,CYPRUS,CZECH REPUBLIC,DENMARK,DJIBOUTI,DOMINICA,DOMINICAN REPUBLIC,
EAST TIMOR,ECUADOR,EGYPT,EL SALVADOR,EQUATORIAL GUINEA,ERITREA,ESTONIA,ETHIOPIA,FALKLAND ISLANDS (MALVINAS),FAROE ISLANDS,
FIJI,FINLAND,FRANCE,FRENCH GUIANA,FRENCH POLYNESIA,FRENCH SOUTHERN TERRITORIES,GABON,GAMBIA,GEORGIA,GERMANY,GHANA,
GIBRALTAR,GREECE,GREENLAND,GRENADA,GUADELOUPE,GUAM,GUATEMALA,GUINEA,GUINEA-BISSAU,GUYANA,HAITI,
HEARD ISLAND AND MCDONALD ISLANDS,HOLY SEE (VATICAN CITY STATE),HONDURAS,HONG KONG,HUNGARY,ICELAND,INDIA,INDONESIA,
ISLAMIC REPUBLIC OF IRAN,IRAQ,IRELAND,ISRAEL,ITALY,JAMAICA,JAPAN,JORDAN,KAZAKSTAN,KENYA,KIRIBATI,
DEMOCRATIC PEOPLE'S REPUBLIC OF KOREA,REPUBLIC OF KOREA,KUWAIT,KYRGYZSTAN,LAO PEOPLE'S DEMOCRATIC REPUBLIC,LATVIA,
LEBANON,LESOTHO,LIBERIA,LIBYAN ARAB JAMAHIRIYA,LIECHTENSTEIN,LITHUANIA,LUXEMBOURG,MACAU,THE FORMER YUGOSLAV REPUBLIC OF MACEDONIA,
MADAGASCAR,MALAWI,MALAYSIA,MALDIVES,MALI,MALTA,MARSHALL ISLANDS,MARTINIQUE,MAURITANIA,MAURITIUS,MAYOTTE,MEXICO,
FEDERATED STATES OF MICRONESIA,REPUBLIC OF MOLDOVA,MONACO,MONGOLIA,MONTSERRAT,MOROCCO,MOZAMBIQUE,MYANMAR,NAMIBIA,NAURU,
NEPAL,NETHERLANDS,NETHERLANDS ANTILLES,NEW CALEDONIA,NEW ZEALAND,NICARAGUA,NIGER,NIGERIA,NIUE,NORFOLK ISLAND,
NORTHERN MARIANA ISLANDS,NORWAY,OMAN,PAKISTAN,PALAU,OCCUPIED PALESTINIAN TERRITORY,PANAMA,PAPUA NEW GUINEA,PARAGUAY,
PERU,PHILIPPINES,PITCAIRN,POLAND,PORTUGAL,PUERTO RICO,QATAR,RÉUNION,ROMANIA,RUSSIAN FEDERATION,RWANDA,SAINT HELENA,
SAINT KITTS AND NEIS,SAINT LUCIA,SAINT PIERRE AND MIQUELON,SAINT VINCENT AND THE GRENADINES,SAMOA,SAN MARINO,
SAO TOME AND PRINCIPE,SAUDI ARABIA,SENEGAL,SEYCHELLES,SIERRA LEONE,SINGAPORE,SLOVAKIA,SLOVENIA,SOLOMON ISLANDS,SOMALIA,
SOUTH AFRICA,SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS,SPAIN,SRI LANKA,SUDAN,SURINAME,SVALBARD AND JAN MAYEN,SWAZILAND,
SWEDEN,SWITZERLAND,SYRIAN ARAB REPUBLIC,TAIWAN PROVINCE OF CHINA,TAJIKISTAN,UNITED REPUBLIC OF TANZANIA,THAILAND,TOGO,
TOKELAU,TONGA,TRINIDAD AND TOBAGO,TUNISIA,TURKEY,TURKMENISTAN,TURKS AND CAICOS ISLANDS,TUVALU,UGANDA,UKRAINE,
UNITED ARAB EMIRATES,UNITED KINGDOM,UNITED STATES,UNITED STATES MINOR OUTLYING ISLANDS,URUGUAY,UZBEKISTAN,VANUATU,
VENEZUELA,VIET NAM,BRITISH VIRGIN ISLANDS,U.S. VIRGIN ISLANDS,WALLIS AND FUTUNA,WESTERN SAHARA,YEMEN,YUGOSLAVIA,ZAMBIA,ZIMBABWE";

  var cCode ="AF,AL,DZ,AS,AD,AO,AI,AQ,AG,AR,AM,AW,AU,AT,AZ,BS,BH,BD,BB,BY,BE,BZ,BJ,BM,BT,BO,BA,BW,BV,BR,IO,BN,BG,BF,BI,KH,CM,CA,CV,KY,CF,TD,CL,CN,CX,CC,CO,KM,CG,CD,CK,CR,CI,HR,CU,CY,CZ,DK,DJ,DM,DO,TP,EC,EG,SV,GQ,ER,EE,ET,FK,FO,FJ,FI,FR,GF,PF,TF,GA,GM,GE,DE,GH,GI,GR,GL,GD,GP,GU,GT,GN,GW,GY,HT,HM,VA,HN,HK,HU,IS,IN,ID,IR,IQ,IE,IL,IT,JM,JP,JO,KZ,KE,KI,KP,KR,KW,KG,LA,LV,LB,LS,LR,LY,LI,LT,LU,MO,MK,MG,MW,MY,MV,ML,MT,MH,MQ,MR,MU,YT,MX,FM,MD,MC,MN,MS,MA,MZ,MM,NA,NR,NP,NL,AN,NC,NZ,NI,NE,NG,NU,NF,MP,NO,OM,PK,PW,PS,PA,PG,PY,PE,PH,PN,PL,PT,PR,QA,RE,RO,RU,RW,SH,KN,LC,PM,VC,WS,SM,ST,SA,SN,SC,SL,SG,SK,SI,SB,SO,ZA,GS,ES,LK,SD,SR,SJ,SZ,SE,CH,SY,TW,TJ,TZ,TH,TG,TK,TO,TT,TN,TR,TM,TC,TV,UG,UA,AE,GB,US,UM,UY,UZ,VU,VE,VN,VG,VI,WF,EH,YE,YU,ZM,ZW";

  if(listFindNoCase(cCode,Code))
	Code=listGetAt(countries,listFindNoCase(cCode,Code));
  return Code;
}
</cfscript>

<cfscript>
/**
 * Takes an ISO 669 Two-Letter Language Code (e.g., EN) and returns the Language (e.g., English).
 * 
 * @param code 	 Country code. (Required)
 * @return Returns a string. 
 * @author Stephen Lapointe (stephen@waldenstreet.com) 
 * @version 1, August 10, 2005 
 */
function codeToLanguage(code) {
  var lCode ="AA,AB,AF,AM,AR,AS,AY,AZ,BA,BE,BG,BH,BI,BN,BN,BO,BR,CA,CO,CS,CY,DA,DE,DZ,EL,EN,EN,EN,EO,ES,ET,EU,FA,FI,FJ,FO,FR,FY,GA,GD,GD,GL,GN,GU,HA,HI,HR,HU,HY,IA,IE,IK,IN,IS,IT,IW,JA,JI,JW,KA,KK,KL,KM,KN,KO,KS,KU,KY,LA,LN,LO,LT,LV,LV,MG,MI,MK,ML,MN,MO,MR,MS,MT,MY,NA,NE,NL,NO,OC,OM,OM,OR,PA,PL,PS,PS,PT,QU,RM,RN,RO,RU,RW,SA,SD,SG,SH,SI,SK,SL,SM,SN,SO,SQ,SR,SS,ST,SU,SV,SW,TA,TE,TG,TH,TI,TK,TL,TN,TO,TR,TS,TT,TW,UK,UR,UZ,VI,VO,WO,XH,YO,ZH,ZU";  
  var languages = "Afar,Abkhazian,Afrikaans,Amharic,Arabic,Assamese,Aymara,Azerbaijani,Bashkir,Byelorussian,Bulgarian,Bihari,Bislama,Bengali ,Bangla,Tibetan,Breton,Catalan,Corsican,Czech,Welsh,Danish,German,Bhutani,Greek,English,English (British),English (American),Esperanto,Spanish,Estonian,Basque,Persian,Finnish,Fiji,Faeroese,French,Frisian,Irish,Gaelic,Gaelic (Scots),Galician,Guarani,Gujarati,Hausa,Hindi,Croatian,Hungarian,Armenian,Interlingua,Interlingue,Inupiak,Indonesian,Icelandic,Italian,Hebrew,Japanese,Yiddish,Javanese,Georgian,Kazakh,Greenlandic,Cambodian,Kannada,Korean,Kashmiri,Kurdish,Kirghiz,Latin,Lingala,Laothian,Lithuanian,Latvian ,Lettish,Malagasy,Maori,Macedonian,Malayalam,Mongolian,Moldavian,Marathi,Malay,Maltese,Burmese,Nauru,Nepali,Dutch,Norwegian,Occitan,Oromo,Afan,Oriya,Punjabi,Polish,Pashto ,Pushto,Portuguese,Quechua,Rhaeto-Romance,Kirundi,Romanian,Russian,Kinyarwanda,Sanskrit,Sindhi,Sangro,Serbo-Croatian,Singhalese,Slovak,Slovenian,Samoan,Shona,Somali,Albanian,Serbian,Siswati,Sesotho,Sudanese,Swedish,Swahili,Tamil,Tegulu,Tajik,Thai,Tigrinya,Turkmen,Tagalog,Setswana,Tonga,Turkish,Tsonga,Tatar,Twi,Ukrainian,Urdu,Uzbek,Vietnamese,Volapuk,Wolof,Xhosa,Yoruba,Chinese,Zulu";

  if(listFindNoCase(lCode,code)) return listGetAt(languages,listFindNoCase(lCode,code));
}
</cfscript>

<cfscript>
/**
 * Adds commas after every third non-ending digit to the left of the decimal point.
 * 
 * @param inNum 	 Number to format. (Required)
 * @param default 	 If number isn't numeric, display default instead. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, August 26, 2002 
 */
function CommaFormat(inNum) {
	var outStr  = "";
	var decStr  = "";

	var default_value = inNum;
	if(ArrayLen(Arguments) GTE 2) default_value = Arguments[2];

	if (not IsNumeric(inNum)) {
		return (default_value);
	} else {
		if(ListLen(inNum, ".") GT 1) {
			outStr = ListFirst(inNum, ".");
			decStr = "." & ListLast(inNum, ".");
		} else if (Find(".", Trim(inNum)) EQ 1) {
			decStr = inNum;
		} else {
			outStr = inNum;
		}
		if (Trim(outStr) NEQ "") {
			outStr = Reverse(outStr);
			outStr = REReplace(outStr, "([0-9][0-9][0-9])", "\1,", "ALL");
			outStr = REReplace(outStr, ",$", "");   // delete potential leading comma
			outStr = REReplace(outStr, ",([^0-9]+)", "\1");   // delete leading comma w/ spaces in front of
			outStr = Reverse(outStr);
		}
		return (outStr & decStr);
	}
}
</cfscript>

<cfscript>
/**
 * Performs a comparison of two strings ignoring any whitespace characters.
 * 
 * @param string1 	 First string to compare. (Required)
 * @param string2 	 Second string to compare. (Required)
 * @param isCompareCaseSensitive 	 Determines if the comparison should check case. Default is true. (Optional)
 * @return Returns a boolean. 
 * @author Mark G. Smith (mark.g.smith@baesystems.com) 
 * @version 1, December 2, 2008 
 */
function CompareIgnoreWhiteSpace(string1,string2) {
	var string1NoWhiteSpace = REReplace(string1,"[\s]","","ALL");
	var string2NoWhiteSpace = REReplace(string2,"[\s]","","ALL");
	var isCompareCaseSensitive = true;
	
	if(arrayLen(arguments) gte 3) isCompareCaseSensitive = arguments[3];
	
	if (isCompareCaseSensitive)
		return Compare(string1NoWhiteSpace, string2NoWhiteSpace);
	else
		return CompareNoCase(string1NoWhiteSpace, string2NoWhiteSpace);
}
</cfscript>

<!---
 Convert between ISO country types: Name, Numeric, Alpha2 and Alpha3
 
 @param name 	  (Optional)
 @return Returns a string. 
 @author Jules Gravinese (jules@universeg.com) 
 @version 0, March 6, 2010 
--->
<cffunction name="countryISOcodes">
	<cfargument name="value" default="840">
	<cfargument name="output" default="name">
	
	<cfset var name=
		"Afghanistan,Aland Islands,Albania,Algeria,American Samoa,Andorra,Angola,Anguilla,Antarctica,Antigua and Barbuda,Argentina,Armenia,Aruba,Australia,Austria,Azerbaijan,Bahamas,Bahrain,Bangladesh,Barbados,Belarus,Belgium,Belize,Benin,Bermuda,Bhutan,Bolivia (Plurinational State of),Bosnia and Herzegovina,Botswana,Bouvet Island,Brazil,British Indian Ocean Territory,Brunei Darussalam,Bulgaria,Burkina Faso,Burundi,Cambodia,Cameroon,Canada,Cape Verde,Cayman Islands,Central African Republic,Chad,Chile,China,Christmas Island,Cocos (Keeling) Islands,Colombia,Comoros,Congo,Congo (the Democratic Republic of the),Cook Islands,Costa Rica,Cote d'Ivoire ? Côte d'Ivoire,Croatia,Cuba,Cyprus,Czech Republic,Denmark,Djibouti,Dominica,Dominican Republic,Ecuador,Egypt,El Salvador,Equatorial Guinea,Eritrea,Estonia,Ethiopia,Falkland Islands (Malvinas),Faroe Islands,Fiji,Finland,France,French Guiana,French Polynesia,French Southern Territories,Gabon,Gambia,Georgia,Germany,Ghana,Gibraltar,Greece,Greenland,Grenada,Guadeloupe,Guam,Guatemala,Guernsey,Guinea,Guinea-Bissau,Guyana,Haiti,Heard Island and McDonald Islands,Holy See (Vatican City State),Honduras,Hong Kong,Hungary,Iceland,India,Indonesia,Iran (Islamic Republic of),Iraq,Ireland,Isle of Man,Israel,Italy,Jamaica,Japan,Jersey,Jordan,Kazakhstan,Kenya,Kiribati,Korea (Democratic People's Republic of),Korea (Republic of),Kuwait,Kyrgyzstan,Lao People's Democratic Republic,Latvia,Lebanon,Lesotho,Liberia,Libyan Arab Jamahiriya,Liechtenstein,Lithuania,Luxembourg,Macao,Macedonia (the former Yugoslav Republic of),Madagascar,Malawi,Malaysia,Maldives,Mali,Malta,Marshall Islands,Martinique,Mauritania,Mauritius,Mayotte,Mexico,Micronesia (Federated States of),Moldova (Republic of),Monaco,Mongolia,Montenegro,Montserrat,Morocco,Mozambique,Myanmar,Namibia,Nauru,Nepal,Netherlands,Netherlands Antilles,New Caledonia,New Zealand,Nicaragua,Niger,Nigeria,Niue,Norfolk Island,Northern Mariana Islands,Norway,Oman,Pakistan,Palau,Palestinian Territory (Occupied),Panama,Papua New Guinea,Paraguay,Peru,Philippines,Pitcairn,Poland,Portugal,Puerto Rico,Qatar,Reunion ? Réunion,Romania,Russian Federation,Rwanda,Saint Barthélemy,Saint Helena (Ascension and Tristan da Cunha),Saint Kitts and Nevis,Saint Lucia,Saint Martin (French part),Saint Pierre and Miquelon,Saint Vincent and the Grenadines,Samoa,San Marino,Sao Tome and Principe,Saudi Arabia,Senegal,Serbia,Seychelles,Sierra Leone,Singapore,Slovakia,Slovenia,Solomon Islands,Somalia,South Africa,South Georgia and the South Sandwich Islands,Spain,Sri Lanka,Sudan,Suriname,Svalbard and Jan Mayen,Swaziland,Sweden,Switzerland,Syrian Arab Republic,Taiwan (Province of China),Tajikistan,Tanzania (United Republic of),Thailand,Timor-Leste,Togo,Tokelau,Tonga,Trinidad and Tobago,Tunisia,Turkey,Turkmenistan,Turks and Caicos Islands,Tuvalu,Uganda,Ukraine,United Arab Emirates,United Kingdom,United States,United States Minor Outlying Islands,Uruguay,Uzbekistan,Vanuatu,Venezuela (Bolivarian Republic of),Viet Nam,Virgin Islands (British),Virgin Islands (U.S.),Wallis and Futuna,Western Sahara,Yemen,Zambia,Zimbabwe">
	<cfset var numeric=
		"004,248,008,012,016,020,024,660,010,028,032,051,533,036,040,031,044,048,050,052,112,056,084,204,060,064,068,070,072,074,076,086,096,100,854,108,116,120,124,132,136,140,148,152,156,162,166,170,174,178,180,184,188,384,191,192,196,203,208,262,212,214,218,818,222,226,232,233,231,238,234,242,246,250,254,258,260,266,270,268,276,288,292,300,304,308,312,316,320,831,324,624,328,332,334,336,340,344,348,352,356,360,364,368,372,833,376,380,388,392,832,400,398,404,296,408,410,414,417,418,428,422,426,430,434,438,440,442,446,807,450,454,458,462,466,470,584,474,478,480,175,484,583,498,492,496,499,500,504,508,104,516,520,524,528,530,540,554,558,562,566,570,574,580,578,512,586,585,275,591,598,600,604,608,612,616,620,630,634,638,642,643,646,652,654,659,662,663,666,670,882,674,678,682,686,688,690,694,702,703,705,090,706,710,239,724,144,736,740,744,748,752,756,760,158,762,834,764,626,768,772,776,780,788,792,795,796,798,800,804,784,826,840,581,858,860,548,862,704,092,850,876,732,887,894,716">
	<cfset var alpha2=
		"AF,AX,AL,DZ,AS,AD,AO,AI,AQ,AG,AR,AM,AW,AU,AT,AZ,BS,BH,BD,BB,BY,BE,BZ,BJ,BM,BT,BO,BA,BW,BV,BR,IO,BN,BG,BF,BI,KH,CM,CA,CV,KY,CF,TD,CL,CN,CX,CC,CO,KM,CG,CD,CK,CR,CI,HR,CU,CY,CZ,DK,DJ,DM,DO,EC,EG,SV,GQ,ER,EE,ET,FK,FO,FJ,FI,FR,GF,PF,TF,GA,GM,GE,DE,GH,GI,GR,GL,GD,GP,GU,GT,GG,GN,GW,GY,HT,HM,VA,HN,HK,HU,IS,IN,ID,IR,IQ,IE,IM,IL,IT,JM,JP,JE,JO,KZ,KE,KI,KP,KR,KW,KG,LA,LV,LB,LS,LR,LY,LI,LT,LU,MO,MK,MG,MW,MY,MV,ML,MT,MH,MQ,MR,MU,YT,MX,FM,MD,MC,MN,ME,MS,MA,MZ,MM,NA,NR,NP,NL,AN,NC,NZ,NI,NE,NG,NU,NF,MP,NO,OM,PK,PW,PS,PA,PG,PY,PE,PH,PN,PL,PT,PR,QA,RE,RO,RU,RW,BL,SH,KN,LC,MF,PM,VC,WS,SM,ST,SA,SN,RS,SC,SL,SG,SK,SI,SB,SO,ZA,GS,ES,LK,SD,SR,SJ,SZ,SE,CH,SY,TW,TJ,TZ,TH,TL,TG,TK,TO,TT,TN,TR,TM,TC,TV,UG,UA,AE,GB,US,UM,UY,UZ,VU,VE,VN,VG,VI,WF,EH,YE,ZM,ZW">
	<cfset var alpha3=
		"AFG,ALA,ALB,DZA,ASM,AND,AGO,AIA,ATA,ATG,ARG,ARM,ABW,AUS,AUT,AZE,BHS,BHR,BGD,BRB,BLR,BEL,BLZ,BEN,BMU,BTN,BOL,BIH,BWA,BVT,BRA,IOT,BRN,BGR,BFA,BDI,KHM,CMR,CAN,CPV,CYM,CAF,TCD,CHL,CHN,CXR,CCK,COL,COM,COG,COD,COK,CRI,CIV,HRV,CUB,CYP,CZE,DNK,DJI,DMA,DOM,ECU,EGY,SLV,GNQ,ERI,EST,ETH,FLK,FRO,FJI,FIN,FRA,GUF,PYF,ATF,GAB,GMB,GEO,DEU,GHA,GIB,GRC,GRL,GRD,GLP,GUM,GTM,GGY,GIN,GNB,GUY,HTI,HMD,VAT,HND,HKG,HUN,ISL,IND,IDN,IRN,IRQ,IRL,IMN,ISR,ITA,JAM,JPN,JEY,JOR,KAZ,KEN,KIR,PRK,KOR,KWT,KGZ,LAO,LVA,LBN,LSO,LBR,LBY,LIE,LTU,LUX,MAC,MKD,MDG,MWI,MYS,MDV,MLI,MLT,MHL,MTQ,MRT,MUS,MYT,MEX,FSM,MDA,MCO,MNG,MNE,MSR,MAR,MOZ,MMR,NAM,NRU,NPL,NLD,ANT,NCL,NZL,NIC,NER,NGA,NIU,NFK,MNP,NOR,OMN,PAK,PLW,PSE,PAN,PNG,PRY,PER,PHL,PCN,POL,PRT,PRI,QAT,REU,ROU,RUS,RWA,BLM,SHN,KNA,LCA,MAF,SPM,VCT,WSM,SMR,STP,SAU,SEN,SRB,SYC,SLE,SGP,SVK,SVN,SLB,SOM,ZAF,SGS,ESP,LKA,SDN,SUR,SJM,SWZ,SWE,CHE,SYR,TWN,TJK,TZA,THA,TLS,TGO,TKL,TON,TTO,TUN,TUR,TKM,TCA,TUV,UGA,UKR,ARE,GBR,USA,UMI,URY,UZB,VUT,VEN,VNM,VGB,VIR,WLF,ESH,YEM,ZMB,ZWE">	
	
	<cfset var place = listFindNoCase(name, value)>
	<cfif place eq 0>
		<cfset place = listFindNoCase(numeric, value)>
	</cfif>
	<cfif place eq 0>
		<cfset place = listFindNoCase(alpha2, value)>
	</cfif>
	<cfif place eq 0>
		<cfset place = listFindNoCase(alpha3, value)>
	</cfif>
	
	<cfreturn listGetAt(evaluate(output), place)>
	
</cffunction>

<!---
 Converts a unit of memory to another unit of memory.
 
 @param num 	 number to convert (Required)
 @param fromUnit 	 unit to convert from (Required)
 @param toUnit 	 unit to convert to (Required)
 @param format 	 format to return number in (Optional)
 @return returns a string 
 @author Chris Schofield (chris@chrisschofield.com) 
 @version 0, May 9, 2009 
--->
<cffunction name="convertMemoryUnit" access="public" returntype="string">
	<!--- Number to convert. CMS --->
	<cfargument name="num" 		required="true" type="numeric" />
	<!--- Memory unit of arguments.num (byte, kilobyte, etc.). CMS --->
	<cfargument name="fromunit"	required="true" type="string" />
	<!--- Memory to convert to. CMS --->
	<cfargument name="tounit" 	required="true" type="string" />
	<!--- Number format to return (9.99, 9.99999, etc.). CMS --->
	<cfargument name="format" 	default="9.9"	type="string" />

	<!--- Convert the number to bytes. CMS --->
	<cfset var bytes = 0 />
	<cfset var conv = 0 />

	<!--- Then convert to the specified unit. CMS --->
	<cfswitch expression="#arguments.fromunit#">
		<cfcase value="bit"> 			<cfset bytes = (arguments.num/8) /> 		</cfcase>
		<cfcase value="byte"> 			<cfset bytes = arguments.num /> 			</cfcase>
		<cfcase value="kilobit"> 		<cfset bytes = (arguments.num*(2^10)/8) />	</cfcase>
		<cfcase value="kilobyte"> 		<cfset bytes = (arguments.num*(2^10)) />	</cfcase>
		<cfcase value="megabit"> 		<cfset bytes = (arguments.num*(2^20)/8) />	</cfcase>
		<cfcase value="megabyte"> 		<cfset bytes = (arguments.num*(2^20)) />	</cfcase>
		<cfcase value="gigabit"> 		<cfset bytes = (arguments.num*(2^30)/8) />	</cfcase>
		<cfcase value="gigabyte"> 		<cfset bytes = (arguments.num*(2^30)) />	</cfcase>
		<cfcase value="terabit"> 		<cfset bytes = (arguments.num*(2^40)/8) />	</cfcase>
		<cfcase value="terabyte"> 		<cfset bytes = (arguments.num*(2^40)) />	</cfcase>
		<cfcase value="petabit"> 		<cfset bytes = (arguments.num*(2^50)/8) />	</cfcase>
		<cfcase value="petabyte"> 		<cfset bytes = (arguments.num*(2^50)) />	</cfcase>
		<cfcase value="exabit"> 		<cfset bytes = (arguments.num*(2^60)/8) />	</cfcase>
		<cfcase value="exabyte"> 		<cfset bytes = (arguments.num*(2^60)) />	</cfcase>
		<cfcase value="zettabit"> 		<cfset bytes = (arguments.num*(2^70)/8) />	</cfcase>
		<cfcase value="zettabyte"> 		<cfset bytes = (arguments.num*(2^70)) />	</cfcase>
		<cfcase value="yottabit"> 		<cfset bytes = (arguments.num*(2^80)/8) />	</cfcase>
		<cfcase value="yottabyte"> 		<cfset bytes = (arguments.num*(2^80)) />	</cfcase>
		<cfdefaultcase>
			<cfthrow message="Could not convert #arguments.num# to #arguments.fromunit#."
					detail="Unit #arguments.fromunit# is not supported." />
		</cfdefaultcase>
	</cfswitch>

	<!--- First convert to bytes. CMS --->
	<cfswitch expression="#arguments.tounit#">
		<cfcase value="bit"> 		<cfset conv = (bytes*8) /> 			</cfcase>
		<cfcase value="byte"> 		<cfset conv = bytes /> 				</cfcase>
		<cfcase value="kilobit"> 	<cfset conv = (bytes/(2^10)*8) />	</cfcase>
		<cfcase value="kilobyte"> 	<cfset conv = (bytes/(2^10)) />		</cfcase>
		<cfcase value="megabit"> 	<cfset conv = (bytes/(2^20)*8) />	</cfcase>
		<cfcase value="megabyte"> 	<cfset conv = (bytes/(2^20)) />		</cfcase>
		<cfcase value="gigabit"> 	<cfset conv = (bytes/(2^30)*8) />	</cfcase>
		<cfcase value="gigabyte"> 	<cfset conv = (bytes/(2^30)) />		</cfcase>
		<cfcase value="terabit"> 	<cfset conv = (bytes/(2^40)*8) />	</cfcase>
		<cfcase value="terabyte"> 	<cfset conv = (bytes/(2^40)) />		</cfcase>
		<cfcase value="petabit"> 	<cfset conv = (bytes/(2^50)*8) />	</cfcase>
		<cfcase value="petabyte"> 	<cfset conv = (bytes/(2^50)) />		</cfcase>
		<cfcase value="exabit"> 	<cfset conv = (bytes/(2^60)*8) />	</cfcase>
		<cfcase value="exabyte"> 	<cfset conv = (bytes/(2^60)) />		</cfcase>
		<cfcase value="zettabit"> 	<cfset conv = (bytes/(2^70)*8) />	</cfcase>
		<cfcase value="zettabyte"> 	<cfset conv = (bytes/(2^70)) />		</cfcase>
		<cfcase value="yottabit"> 	<cfset conv = (bytes/(2^80)*8) />	</cfcase>
		<cfcase value="yottabyte"> 	<cfset conv = (bytes/(2^80)) />		</cfcase>
		<cfdefaultcase>
			<cfthrow message="Could not convert #arguments.num# to #arguments.tounit#."
					detail="Unit #arguments.tounit# is not supported." />
		</cfdefaultcase>
	</cfswitch>

	<!--- Then convert the bytes to the tounit. CMS --->
	<cfreturn NumberFormat(conv,arguments.format) />
</cffunction>

<cfscript>
/**
 * Converts the letters in a phone number to the corresponding digits on an American phone.
 * version 1.0 by Brian Swartzfager
 * 
 * @param oldNumber 	 A string representing the phone number to convert (Optional)
 * @return A string with letters converted back to digits 
 * @author Brian Swartzfager (bcswartz@gmail.com) 
 * @version 1.0, August 26, 2012 
 */
public string function convertPhoneLetters(required string oldNumber) {
  var newNumber= arguments.oldNumber;
  var regArray= [
    "[A-Ca-c]",
    "[D-Fd-f]",
    "[G-Ig-i]",
    "[J-Lj-l]",
    "[M-Om-o]",
    "[P-Sp-s]",
    "[T-Vt-v]",
    "[W-Zw-z]"
  ];
		
  var resultArray= [
    2,3,4,5,6,7,8,9
  ];
		
  for (var x=1; x <= arrayLen(regArray); x++) {
    newNumber= REReplace(newNumber,regArray[x],resultArray[x],"all");
  }
		
  return newNumber;
}
</cfscript>

<cfscript>
/**
 * Reformats special chars typically found when copying and pasting from Word.
 * v2 by James Moberg
 * 
 * @param str 	 The string to modify. (Required)
 * @return Returns a string. 
 * @author Glen Salisbury (gsalisbury@collegepublisher.com) 
 * @version 2, January 3, 2011 
 */
function ConvertSpecialChars(textin) {
       var bad = "#chr(145)#,#chr(146)#,#chr(147)#,#chr(148)#,#chr(151)#,#CHR(8217)#,#CHR(8216)#,#chr(188)#,#chr(189)#,#chr(190)#,#chr(174)#,#chr(173)#,#chr(169)#,#chr(160)#,#chr(153)#,#chr(150)#,#chr(149)#,#chr(133)#,#CHR(8220)#,#CHR(8221)#";
       var good = "',',"","",-,',',1/4,1/2,3/4,(R),-,(C), ,TM,--,*,...,"",""";
       return ReplaceList(textin, bad, good);
}
</cfscript>

<cfscript>
/**
 * Get a count on searching string in the searched string.
 * Updated by Raymond Camden
 * 
 * @param str 	 The string to search. (Required)
 * @param c 	 The string to look for. (Required)
 * @return Returns a numeric value. 
 * @author Peini Wu (pwu@hunter.com) 
 * @version 1, October 17, 2003 
 */
function CountIt(str, c) {
	var pos = findnocase(c, str, 1);
	var count = 0;

	if(c eq "") return 0;
	
	while(pos neq 0){
		count = count + 1;
		pos = findnocase(c, str, pos+len(c));
	}
	
	return count;
}
</cfscript>

<cfscript>
/**
 * This function returns the number of lines in a text file.
 * 
 * @param text 	 String to parse. (Required)
 * @return Returns a number. 
 * @author Matheus Antonelli (matheus_antonelli@ig.com.br) 
 * @version 1, June 3, 2003 
 */
function CountLines(text) {
  var CRLF = Chr(13) & Chr(10);
  return ListLen(text,CRLF);
}
</cfscript>

<cfscript>
/**
 * Takes a Country (i.e. United Kingdom) and returns the 3 letter ISO Country Name (i.e. GBR).
 * 
 * @param country 	 The name of the country. (Required)
 * @return Returns a string. 
 * @author Will Swain (will@hothorse.com) 
 * @version 1, March 5, 2010 
 */
function CountryTo3ACode(country) {
  var countries = "AFGHANISTAN,ALBANIA,ALGERIA,AMERICAN SAMOA,ANDORRA,ANGOLA,ANGUILLA,ANTARCTICA,ANTIGUA AND BARBUDA,ARGENTINA,ARMENIA,ARUBA,AUSTRALIA,AUSTRIA,AZERBAIJAN,BAHAMAS,BAHRAIN,BANGLADESH,BARBADOS,BELARUS,BELGIUM,BELIZE,BENIN,BERMUDA,BHUTAN,BOLIVIA,BOSNIA AND HERZEGOVINA,BOTSWANA,BOUVET ISLAND,BRAZIL,BRITISH INDIAN OCEAN TERRITORY,BRUNEI DARUSSALAM,BULGARIA,BURKINA FASO,BURUNDI,CAMBODIA,CAMEROON,CANADA,CAPE VERDE,CAYMAN ISLANDS,CENTRAL AFRICAN REPUBLIC,CHAD,CHILE,CHINA,CHRISTMAS ISLAND,COCOS (KEELING) ISLANDS,COLOMBIA,COMOROS,CONGO,THE DEMOCRATIC REPUBLIC OF THE CONGO,COOK ISLANDS,COSTA RICA,CÔTE D'IVOIRE,CROATIA,CUBA,CYPRUS,CZECH REPUBLIC,DENMARK,DJIBOUTI,DOMINICA,DOMINICAN REPUBLIC,EAST TIMOR,ECUADOR,EGYPT,EL SALVADOR,EQUATORIAL GUINEA,ERITREA,ESTONIA,ETHIOPIA,FALKLAND ISLANDS (MALVINAS),FAROE ISLANDS,FIJI,FINLAND,FRANCE,FRENCH GUIANA,FRENCH POLYNESIA,FRENCH SOUTHERN TERRITORIES,GABON,GAMBIA,GEORGIA,GERMANY,GHANA,GIBRALTAR,GREECE,GREENLAND,GRENADA,GUADELOUPE,GUAM,GUATEMALA,GUINEA,GUINEA-BISSAU,GUYANA,HAITI,HEARD ISLAND AND MCDONALD ISLANDS,HOLY SEE (VATICAN CITY STATE),HONDURAS,HONG KONG,HUNGARY,ICELAND,INDIA,INDONESIA,ISLAMIC REPUBLIC OF IRAN,IRAQ,IRELAND,ISRAEL,ITALY,JAMAICA,JAPAN,JORDAN,KAZAKSTAN,KENYA,KIRIBATI,DEMOCRATIC PEOPLE'S REPUBLIC OF KOREA,REPUBLIC OF KOREA,KUWAIT,KYRGYZSTAN,LAO PEOPLE'S DEMOCRATIC REPUBLIC,LATVIA,LEBANON,LESOTHO,LIBERIA,LIBYAN ARAB JAMAHIRIYA,LIECHTENSTEIN,LITHUANIA,LUXEMBOURG,MACAU,THE FORMER YUGOSLAV REPUBLIC OF MACEDONIA,MADAGASCAR,MALAWI,MALAYSIA,MALDIVES,MALI,MALTA,MARSHALL ISLANDS,MARTINIQUE,MAURITANIA,MAURITIUS,MAYOTTE,MEXICO,FEDERATED STATES OF MICRONESIA,REPUBLIC OF MOLDOVA,MONACO,MONGOLIA,MONTSERRAT,MOROCCO,MOZAMBIQUE,MYANMAR,NAMIBIA,NAURU,NEPAL,NETHERLANDS,NETHERLANDS ANTILLES,NEW CALEDONIA,NEW ZEALAND,NICARAGUA,NIGER,NIGERIA,NIUE,NORFOLK ISLAND,NORTHERN MARIANA ISLANDS,NORWAY,OMAN,PAKISTAN,PALAU,OCCUPIED PALESTINIAN TERRITORY,PANAMA,PAPUA NEW GUINEA,PARAGUAY,PERU,PHILIPPINES,PITCAIRN,POLAND,PORTUGAL,PUERTO RICO,QATAR,RÉUNION,ROMANIA,RUSSIAN FEDERATION,RWANDA,SAINT HELENA,SAINT KITTS AND NEVIS,SAINT LUCIA,SAINT PIERRE AND MIQUELON,SAINT VINCENT AND THE GRENADINES,SAMOA,SAN MARINO,SAO TOME AND PRINCIPE,SAUDI ARABIA,SENEGAL,SEYCHELLES,SIERRA LEONE,SINGAPORE,SLOVAKIA,SLOVENIA,SOLOMON ISLANDS,SOMALIA,SOUTH AFRICA,SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS,SPAIN,SRI LANKA,SUDAN,SURINAME,SVALBARD AND JAN MAYEN,SWAZILAND,SWEDEN,SWITZERLAND,SYRIAN ARAB REPUBLIC,TAIWAN PROVINCE OF CHINA,TAJIKISTAN,UNITED REPUBLIC OF TANZANIA,THAILAND,TOGO,TOKELAU,TONGA,TRINIDAD AND TOBAGO,TUNISIA,TURKEY,TURKMENISTAN,TURKS AND CAICOS ISLANDS,TUVALU,UGANDA,UKRAINE,UNITED ARAB EMIRATES,UNITED KINGDOM,UNITED STATES,UNITED STATES MINOR OUTLYING ISLANDS,URUGUAY,UZBEKISTAN,VANUATU,VENEZUELA,VIET NAM,BRITISH VIRGIN ISLANDS,U.S. VIRGIN ISLANDS,WALLIS AND FUTUNA,WESTERN SAHARA,YEMEN,YUGOSLAVIA,ZAIRE,ZAMBIA,ZIMBABWE";
  var cCode ="AFG,ALB,DZA,ASM,AND,AGO,AIA,ATA,ATG,ARG,ARM,ABW,AUS,AUT,AZE,BHS,BHR,BGD,BRB,BLR,BEL,BLZ,BEN,BMU,BTN,BOL,BIH,BWA,BVT,BRA,IOT,BRN,BGR,BFA,  BDI,KHM,CMR,CAN,CPV,CYM,CAF,TCD,CHL,CHN,CXR,CCK,COL,COM,COG,COD,COK,CRI,CIV,HRV,CUB,CYP,CZE,DNK,DJI,DMA,DOM,TMP,ECU,EGY,SLV,GNQ,ERI,EST,ETH,FLK,FRO,FJI,FIN,FRA,GUF,PYF,ATF,GAB,GMB,GEO,DEU,GHA,GIB,GRC,GRL,GRD,GLP,GUM,GTM,GIN,GNB,GUY,HTI,HMD,VAT,HND,HKG,HUN,ISL,IND,IDN,IRN,IRQ,IRL,ISR,ITA,JAM,JPN,JOR,KAZ,KEN,KIR,PRK,KOR,KWT,KGZ,LAO,LVA,LBN,LSO,LBR,LBY,LIE,LTU,LUX,MAC,MKD,MDG,MWI,MYS,MDV,MLI,MLT,MHL,MTQ,MRT,MUS,MYT,MEX,FSM,MDA,MCO,MNG,MSR,MAR,MOZ,MMR,NAM,NRU,NPL,NLD,ANT,NCL,NZL,NIC,NER,NGA,NIU,NFK,MNP,NOR,OMN,PAK,PLW,PSE,PAN,PNG,PRY,PER,PHL,PCN,POL,PRT,PRI,QAT,REU,ROM,RUS,RWA,SHN,KNA,LCA,SPM,VCT,WSM,SMR,STP,SAU,SEN,SYC,SLE,SGP,SVK,SVN,SLB,SOM,ZAF,SGS,ESP,LKA,SDN,SUR,SJM,SWZ,SWE,CHE,SYR,TWN,TJK,TZA,THA,TGO,TKL,TON,TTO,TUN,TUR,TKM,TCA,TUV,UGA,UKR,ARE,GBR,USA,UMI,URY,UZB,VUT,VEN,VNM,VGB,VIR,WLF,ESH,YEM,YUG,ZAR,ZMB,ZWE";

  if(listFindNoCase(countries,country))
	country=listGetAt(cCode,listFindNoCase(countries,country));
  return country;
}
</cfscript>

<cfscript>
/**
 * Takes a Country (i.e. United United Kingdom) and returns theISO Country Name (i.e. GB).
 * 
 * @param country 	 Name of the country. (Required)
 * @return Returns a string. 
 * @author Neil Robertson-Ravo (neil.robertson-ravo@csd.reedexpo.com) 
 * @version 1, March 5, 2010 
 */
function countryToCode(country) {
  var countries = "AFGHANISTAN,ALBANIA,ALGERIA,AMERICAN SAMOA,ANDORRA,ANGOLA,ANGUILLA,ANTARCTICA,ANTIGUA AND BARBUDA,ARGENTINA,
ARMENIA,ARUBA,AUSTRALIA,AUSTRIA,AZERBAIJAN,BAHAMAS,BAHRAIN,BANGLADESH,BARBADOS,BELARUS,BELGIUM,BELIZE,BENIN,
BERMUDA,BHUTAN,BOLIVIA,BOSNIA AND HERZEGOVINA,BOTSWANA,BOUVET ISLAND,BRAZIL,BRITISH INDIAN OCEAN TERRITORY,
BRUNEI DARUSSALAM,BULGARIA,BURKINA FASO,BURUNDI,CAMBODIA,CAMEROON,CANADA,CAPE VERDE,CAYMAN ISLANDS,CENTRAL AFRICAN REPUBLIC,
CHAD,CHILE,CHINA,CHRISTMAS ISLAND,COCOS (KEELING) ISLANDS,COLOMBIA,COMOROS,CONGO,THE DEMOCRATIC REPUBLIC OF THE CONGO,
COOK ISLANDS,COSTA RICA,CÔTE D'IVOIRE,CROATIA,CUBA,CYPRUS,CZECH REPUBLIC,DENMARK,DJIBOUTI,DOMINICA,DOMINICAN REPUBLIC,
EAST TIMOR,ECUADOR,EGYPT,EL SALVADOR,EQUATORIAL GUINEA,ERITREA,ESTONIA,ETHIOPIA,FALKLAND ISLANDS (MALVINAS),FAROE ISLANDS,
FIJI,FINLAND,FRANCE,FRENCH GUIANA,FRENCH POLYNESIA,FRENCH SOUTHERN TERRITORIES,GABON,GAMBIA,GEORGIA,GERMANY,GHANA,
GIBRALTAR,GREECE,GREENLAND,GRENADA,GUADELOUPE,GUAM,GUATEMALA,GUINEA,GUINEA-BISSAU,GUYANA,HAITI,
HEARD ISLAND AND MCDONALD ISLANDS,HOLY SEE (VATICAN CITY STATE),HONDURAS,HONG KONG,HUNGARY,ICELAND,INDIA,INDONESIA,
ISLAMIC REPUBLIC OF IRAN,IRAQ,IRELAND,ISRAEL,ITALY,JAMAICA,JAPAN,JORDAN,KAZAKSTAN,KENYA,KIRIBATI,
DEMOCRATIC PEOPLE'S REPUBLIC OF KOREA,REPUBLIC OF KOREA,KUWAIT,KYRGYZSTAN,LAO PEOPLE'S DEMOCRATIC REPUBLIC,LATVIA,
LEBANON,LESOTHO,LIBERIA,LIBYAN ARAB JAMAHIRIYA,LIECHTENSTEIN,LITHUANIA,LUXEMBOURG,MACAU,THE FORMER YUGOSLAV REPUBLIC OF MACEDONIA,
MADAGASCAR,MALAWI,MALAYSIA,MALDIVES,MALI,MALTA,MARSHALL ISLANDS,MARTINIQUE,MAURITANIA,MAURITIUS,MAYOTTE,MEXICO,
FEDERATED STATES OF MICRONESIA,REPUBLIC OF MOLDOVA,MONACO,MONGOLIA,MONTSERRAT,MOROCCO,MOZAMBIQUE,MYANMAR,NAMIBIA,NAURU,
NEPAL,NETHERLANDS,NETHERLANDS ANTILLES,NEW CALEDONIA,NEW ZEALAND,NICARAGUA,NIGER,NIGERIA,NIUE,NORFOLK ISLAND,
NORTHERN MARIANA ISLANDS,NORWAY,OMAN,PAKISTAN,PALAU,OCCUPIED PALESTINIAN TERRITORY,PANAMA,PAPUA NEW GUINEA,PARAGUAY,
PERU,PHILIPPINES,PITCAIRN,POLAND,PORTUGAL,PUERTO RICO,QATAR,RÉUNION,ROMANIA,RUSSIAN FEDERATION,RWANDA,SAINT HELENA,
SAINT KITTS AND NEIS,SAINT LUCIA,SAINT PIERRE AND MIQUELON,SAINT VINCENT AND THE GRENADINES,SAMOA,SAN MARINO,
SAO TOME AND PRINCIPE,SAUDI ARABIA,SENEGAL,SEYCHELLES,SIERRA LEONE,SINGAPORE,SLOVAKIA,SLOVENIA,SOLOMON ISLANDS,SOMALIA,
SOUTH AFRICA,SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS,SPAIN,SRI LANKA,SUDAN,SURINAME,SVALBARD AND JAN MAYEN,SWAZILAND,
SWEDEN,SWITZERLAND,SYRIAN ARAB REPUBLIC,TAIWAN PROVINCE OF CHINA,TAJIKISTAN,UNITED REPUBLIC OF TANZANIA,THAILAND,TOGO,
TOKELAU,TONGA,TRINIDAD AND TOBAGO,TUNISIA,TURKEY,TURKMENISTAN,TURKS AND CAICOS ISLANDS,TUVALU,UGANDA,UKRAINE,
UNITED ARAB EMIRATES,UNITED KINGDOM,UNITED STATES,UNITED STATES MINOR OUTLYING ISLANDS,URUGUAY,UZBEKISTAN,VANUATU,
VENEZUELA,VIET NAM,BRITISH VIRGIN ISLANDS,U.S. VIRGIN ISLANDS,WALLIS AND FUTUNA,WESTERN SAHARA,YEMEN,YUGOSLAVIA,ZAMBIA,ZIMBABWE";

  var cCode ="AF,AL,DZ,AS,AD,AO,AI,AQ,AG,AR,AM,AW,AU,AT,AZ,BS,BH,BD,BB,BY,BE,BZ,BJ,BM,BT,BO,BA,BW,BV,BR,IO,BN,BG,BF,BI,KH,CM,CA,CV,KY,CF,TD,CL,CN,CX,CC,CO,KM,CG,CD,CK,CR,CI,HR,CU,CY,CZ,DK,DJ,DM,DO,TP,EC,EG,SV,GQ,ER,EE,ET,FK,FO,FJ,FI,FR,GF,PF,TF,GA,GM,GE,DE,GH,GI,GR,GL,GD,GP,GU,GT,GN,GW,GY,HT,HM,VA,HN,HK,HU,IS,IN,ID,IR,IQ,IE,IL,IT,JM,JP,JO,KZ,KE,KI,KP,KR,KW,KG,LA,LV,LB,LS,LR,LY,LI,LT,LU,MO,MK,MG,MW,MY,MV,ML,MT,MH,MQ,MR,MU,YT,MX,FM,MD,MC,MN,MS,MA,MZ,MM,NA,NR,NP,NL,AN,NC,NZ,NI,NE,NG,NU,NF,MP,NO,OM,PK,PW,PS,PA,PG,PY,PE,PH,PN,PL,PT,PR,QA,RE,RO,RU,RW,SH,KN,LC,PM,VC,WS,SM,ST,SA,SN,SC,SL,SG,SK,SI,SB,SO,ZA,GS,ES,LK,SD,SR,SJ,SZ,SE,CH,SY,TW,TJ,TZ,TH,TG,TK,TO,TT,TN,TR,TM,TC,TV,UG,UA,AE,GB,US,UM,UY,UZ,VU,VE,VN,VG,VI,WF,EH,YE,YU,ZM,ZW";

  if(listFindNoCase(countries,Country))
	return listGetAt(cCode,listFindNoCase(countries,Country));
}
</cfscript>

<cfscript>
/**
 * Converts a ColdFusion string to a Java byte array
 * * version 1.0 by Marcos Placona
 * 
 * @param string 	 A string to convert to a byte array (Required)
 * @return Returns a byte array 
 * @author Marcos Placona (marcos.placona@gmail.com) 
 * @version 1.0, August 17, 2012 
 */
function createByteArray(string){
	var objString = createObject("Java", "java.lang.String").init(JavaCast("string", string));
	return objString.getBytes();
}
</cfscript>

<cfscript>
/**
 * Returns a UUID in the Microsoft form.
 * 
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, July 17, 2001 
 */
function CreateGUID() {
	return insert("-", CreateUUID(), 23);
}
</cfscript>

<cfscript>
/**
 * Implementation of Luhn algorithm or Mod10.
 * v2 fix by Mike Causer
 * 
 * @param number 	 Value to format. (Required)
 * @return Returns a number. 
 * @author Lucas Sherwood (lucas@thebitbucket.net) 
 * @version 2, September 9, 2009 
 */
function createMod10(number) {
	// this function generates the check digit and appends it to the orignal string
	var nDigits = len(arguments.number);
	var sum = 0;
	var i=0;
	var digit = "";
	var checkdigit = 0;
	for (i=0; i LT nDigits; i=i+1) {
		digit = mid(arguments.number, nDigits-i, 1);
		if(NOT (i MOD 2)) {
			digit = digit+digit;
			// check to see if we should add
			if(len(digit) gt 1) {
				digit = left(digit,1) + right(digit,1);
			}
		}
		checkdigit = checkdigit + digit;
	}
	// divid by 10 and subtract from 10
	checkdigit = 10 - (checkdigit mod 10);
	return arguments.number & right( checkdigit, 1 );
}
</cfscript>

<cfscript>
/**
 * Flexible PIN generator, supporting alphabetical, numeric, and alphanumeric types, upper, lower, and mixed cases, and validating prescence of letters and numbers in alphanumeric PINs at least 2 characters long.
 * 
 * @param chars 	 Number of characters to return. (Required)
 * @param type 	 Type of PIN to create. Types are: n (numeric), a (alphabetical), m (mixed, or alphanumeric). Default is m. (Optional)
 * @param format 	 Case of PIN. Options are: u (uppercase), l (lowercase), m (mixed). Default is m. (Optional)
 * @return Returns a string. 
 * @author Sierra Bufe (sierra@brighterfusion.com) 
 * @version 1, May 14, 2002 
 */
function createPIN(chars){
	var type    = "m";
	var format  = "m";
	var PIN     = "";
	var isValid = false;
	var i       = 0;
	var j       = 0;
	var r	    = 0;
	
	// Check to see if type was provided.  If not, default to "m" (mixed, or alphanumeric).
	if (ArrayLen(Arguments) GT 1) {
		type = Arguments[2];
		if (type is "alphanumeric")
			type = "m";
		type = left(type,1);
		if ("a,n,m" does not contain type)
			return "Invalid type argument.  Valid types are:  alpha, numeric, alphanumeric, mixed, a, n, m.  This argument is optional, and defaults to alphanumeric";
	}
	
	// Check to see if format was provided.  If not, default to "m" (mixed upper and lower).
	if (ArrayLen(Arguments) GT 2) {
		format = Arguments[3];
		format = left(format,1);
		if ("u,l,m" does not contain format)
			return "Invalid format argument.  Valid formats are:  upper, lower, mixed, u, l, m.";
	}
	
	// if type is alphanumeric, set j to 10 to allow for numbers in the RandRange
	if (type is "m")
		j = 10;
	
	while (not isValid) {
	
		PIN = "";
		
		// loop through each character of the PIN
		for (i = 1; i LTE chars; i = i+1) {
		
			// numeric type
			if (type is "n") {
				r = RandRange(0,9) + 48;
			
			// lowercase format
			} else if (format is "l") {
				r = RandRange(97,122 + j);
				if (r GTE 123)
					r = r - 123 + 48;
			
			// uppercase format
			} else if (format is "u") {
				r = RandRange(65,90 + j);
				if (r GTE 91)
					r = r - 91 + 48;
			
			// upper and lower cases mixed
			} else if (format is "m") {
				r = RandRange(65,116 + j);
				if (r GTE 117)
					r = r - 117 + 48;
				else if (r GTE 91)
					r = r + 6;
			
			}
			
			PIN = PIN & Chr(r);
		}
		
		// verfify that alphanumeric strings contain both letters and numbers
		if (type is "m" AND chars GTE 2) {
			if (REFind("[A-Z,a-z]+",PIN) AND REFind("[0-9]+",PIN))
				isValid = true;
		} else {
			isValid = true;
		}
	
	}
		
	return PIN;
}
</cfscript>

<!---
 Converts an RSS 0.9+ feed into a structure.
 
 @param url 	 URL to retrive. (Required)
 @return Returns a structure. 
 @author Joe Nicora (joe@seemecreate.com) 
 @version 1, August 25, 2005 
--->
<cffunction name="createRSSQuery">
	/**
	 * Converts an RSS 0.9+ feed into a query.
	 * 
	 * @param url 	 		RSS feed url, must be valid RSS. (Required)
	 * @param feedName 	 	Name to give the feed's information returned as a structure. (Required)
	 * @return 				Returns a query. 
	 * @author 				Joe Nicora (joe@seemecreate.com) 
	 * @version 1, 			May 16, 2005 
	 */
	<cfargument name="url" required="Yes" />
	
	<cfset var xmlText = "">
	<cfset var start = "">
	<cfset var end = "">
	<cfset var lenth = "">
	<cfset var xmlDoc = "">
	<cfset var myXMLDoc = "">
	<cfset var feedLen = "">
	<cfset var columnList = "title,description,link,pubDate">
	<cfset var result = structNew()>
	<cfset var row = "">
	<cfset var col = "">
		
	<cfhttp url="#url#" method="GET" resolveurl="false" /> 
	
	<cfscript>
		XMLText = cfhttp.fileContent;
		if (find("<?",XMLText)) {
			start = find("<?",XMLText);
			end = find("?>",XMLText);
			length = end - start;
			XMLText = right(XMLText,len(XMLText)-length);
		}
		XMLDoc = "<root>" & XMLText & "</root>";
		myXMLDoc = XMLParse(XMLDoc,false);
		feedLen = arrayLen(myXMLDoc.root.rss.channel.item);
		
		result.title = myXMLDoc.root.rss.channel.title.XMLText;
		result.description = myXMLDoc.root.rss.channel.description.XMLText;
		result.link = myXMLDoc.root.rss.channel.link.XMLText;
		
		result.feedQuery = queryNew(columnList);
		
		queryAddRow(result.feedQuery,feedLen);
		
		for (row=1; row LTE feedLen; row=row+1) {
			for (col=1; col LTE listLen(columnList); col=col+1) {
				if (NOT col IS 4) 
					querySetCell(result.feedQuery,listGetAt(columnList,col), myXMLDoc.root.rss.channel.item[row][listGetAt(columnList,col)].XMLText,row);
				else
					querySetCell(result.feedQuery,listGetAt(columnList,col),parseDateTime(myXMLDoc.root.rss.channel.item[row][listGetAt(columnList,col)].XMLText),row);
			}	
		}
		return result;
	</cfscript>
</cffunction>

<cfscript>
/**
 * Replaces all unnecessary characters from a section of CSS code.
 * 
 * @param sInput 	 CSS you want to compress. (Required)
 * @return Returns a string. 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 1, November 19, 2002 
 */
function CssCompactFormat(sInput) {
  sInput = reReplace( sInput, "[[:space:]]{2,}", " ", "all" );
  sInput = reReplace( sInput, "/\*[^\*]+\*/", " ", "all" );
  sInput = reReplace( sInput, "[ ]*([:{};,])[ ]*", "\1", "all" );
  return sInput;
}
</cfscript>

<!---
 Convert CSS Rules to a ColdFusion struct.
 v2 fixes by Raymond Camden (wasn't trimming right)
 
 @param css_data 	 CSS string. (Required)
 @return Returns a struct. 
 @author Brandon Hansen (brandon@melissa-brandon.com) 
 @version 0, January 9, 2009 
--->
<cffunction name="cssToStruct" access="public" returntype="any" output="false">
	<cfargument name="css_data" type="string" required="yes">
    
    <!---Inspiration (and some code [all the regex]) from Ben Nadel http://www.bennadel.com/index.cfm?dax=blog:584.view--->
    
    <!---Create the local scope--->
	<cfset var local = {}>
    
    <!---This struct will hold all of the rules--->
    <cfset LOCAL.cssRules = {}>
     
    <!---
        Remove all line breaks. We are going to be doing some
        regular expressions and stripping out line breaks will
        make things slightly less complicated.
    --->
    <cfset LOCAL.strCSSData = reReplace(arguments.css_data,"[\r\n]+", " ","all") />
     
    <!---
        Strip out the CSS comments. These hold no value for us
        when we are getting the classes.
    --->
    <cfset LOCAL.strCSSData = reReplace(LOCAL.strCSSData,"/\*.*?\*/", " ", "all" ) />
    
    <!--- Create an array to hold all of the class names. --->
    <cfset LOCAL.arrClasses = ArrayNew( 1 ) />
     
     
    <!---
        Loop over the rules. Remember, each rule is now sepparated
        by a pipe (when we stripped out the {..} stuff), so we
        can loop over the rules as a pipe-delimited list.
    --->
    <cfloop
        index="LOCAL.strRule"
        list="#LOCAL.strCSSData#"
        delimiters="}">
     
        <!---
            Check to see if we still have a length (name(s)) of
            CSS classes.
        --->
        <cfif Len( trim(LOCAL.strRule) )>
        	<!---Add the item to the array--->
            <cfset arrayAppend(LOCAL.arrClasses,LOCAL.strRule) />
        </cfif>
     
    </cfloop>
    
    <cfloop array="#LOCAL.arrClasses#" index="LOCAL.each_class">
        <cfset LOCAL.cssRules[trim(listFirst(LOCAL.each_class,"{"))] = {}>
        <cfloop list="#trim(listLast(LOCAL.each_class,"{"))#" delimiters=";" index="LOCAL.each_rule">
            <cfset LOCAL.cssRules[trim(listFirst(LOCAL.each_class,"{"))][trim(listFirst(LOCAL.each_rule,":"))] = trim(listLast(LOCAL.each_rule,":"))>
        </cfloop>
    </cfloop>
    
    <cfreturn LOCAL.cssRules>
</cffunction>

<!---
 Converts a CSV file to an array.
 
 @param fileContent 	 Data to be parsed. (Required)
 @param charNewLine 	 New line character. Defaults to chr(13)chr(10) (Optional)
 @return Returns an array. 
 @author Duncan Loxton (duncan@sixfive.co.uk) 
 @version 1, July 18, 2013 
--->
<cffunction name="CSVtoArray" returntype="array" output="false">

	<cfargument name="FileContent" type="string" required="yes" hint="The contents of a CSV file"/>
	<cfargument name="CharNewLine" required="no" hint="The line delimiter" default="#chr(13)##chr(10)#"/>

	<cfset var LineCount=0>
	<cfset var fileLined = arrayNew(1)>
	<cfset var Line = "">
	<cfset var Full_Word = "">
	<cfset var Quote_Search = False>
	<cfset var Value_Array = "">
	<cfset var Word = "">
	<cfset var Quote_Count = 0>
	<cfset var Search_Word = '"'>
	<cfset var LineList = "">
	<cfset var i = 0>
	<cfset var j = 0>


	<cfloop index="Line" list="#arguments.FileContent#" delimiters="#arguments.CharNewLine#">

		<cfset LineCount=LineCount+1>

		<cfif len(trim(Line)) and left(Line,2) neq ',,'>

			<!--- Initialising variables --->

			<cfset Full_Word = "">

			<!--- Putting a pair of double quotes at the first and last position if there is no data
				  also in between if field is empty --->

			<cfset Line=Replace(Line,   ",,", ","""",", "all")>
			<cfset Line=Replace(Line,   ",,", ","""",", "all")>
			<cfset Line=ReReplace(Line, "^,", """"",",  "all")>
			<cfset Line=ReReplace(Line, ",$", ",""""",  "all")>

			<cfset Quote_Search =False>
			<cfset Value_Array = ArrayNew(1)>

			<!--- Loop for each field data separated by comma --->

			<cfloop index="Word" list="#Line#" delimiters=",">

				<!--- Checking for first character whether it is double quote or not.
					  If it is double quote then check how many double quotes are in this word.
					  If odd then add it to next elements, else add it to array --->

				<cfif left(trim(Word),1) eq '"' or Quote_Search>

					<cfset Full_Word = Full_Word & Word>

					<!--- Initilizing Quote_Count --->

					<cfset Quote_Count = 0>
					<cfset Search_Word = """">

					<!--- Script for calculating number of double quote in Full_Word variable--->

					<cfscript>
						for(i=1; i LTE len(Full_Word); i = i + 1)
						{
							if(mid(Full_Word, i, len(Search_Word)) EQ Search_Word)
							{
								Quote_Count = Quote_Count + 1;
							}
						}
					</cfscript>

					<cfif (Quote_Count MOD 2) EQ 0>
						<cfset Full_Word=Replace(Full_Word, ",", "|", "all")>
						<cfset ArrayAppend(Value_Array,replace(mid(Full_Word,2,len(Full_Word) - 2),"""""","""","all"))>
						<cfset Quote_Search = false>
						<cfset Full_Word = "">
					<cfelse>
						<cfset Quote_Search = true>
						<cfset Full_Word = Full_Word & ",">
					</cfif>

				<cfelse>

					<cfset ArrayAppend(Value_Array, Word)>

				</cfif>

			</cfloop>

			<cfset LineList=ArrayToList(Value_Array)>

			<cfset LineList=Replace(LineList,   ",,", ","""",", "all")>
			<cfset LineList=Replace(LineList,   ",,", ","""",", "all")>
			<cfset LineList=ReReplace(LineList, "^,", """"",",  "all")>
			<cfset LineList=ReReplace(LineList, ",$", ",""""",  "all")>

			<!--- put what we know into an array --->
			<cfset fileLined[LineCount] = ArrayNew(1)>

			<cfloop from="1" to="#ListLen(LineList)#" index="j">
				<cfif ListLen(LineList) ge j>
					<cfset fileLined[LineCount][j] = trim(Replace(Replace(ListGetAt(LineList,j), '""', ''), '|', ',', 'all'))>
				</cfif>
			</cfloop>


		</cfif>

	</cfloop>

	<cfreturn fileLined>

</cffunction>

<cfscript>
/**
 * Convert Cyrillic DOS coded text to Unicode text.
 * 
 * @param str 	 String to convert. (Required)
 * @return Returns a string. 
 * @author Namchin (namchin@gmail.com) 
 * @version 1, August 23, 2005 
 */
function cyrillicDostoUnicode(str) {
	var result="";
	var dos = "1026,1027,8218,1107,8222,8230,8224,8225,8364,8240,1033,8249,1034,1036,1035,1039,1106,8216,8217,8220,8221,8226,8211,8212,0,8482,1113,8250,1114,1116,1115,1119,160,1038,1118,1032,164,1168,166,167,1025,169,1028,171,172,173,174,1031,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087";
	var i=0;
	for (i=1; i LTE len(str); i=i+1) {
		j = ListFind(dos,Asc(mid(str,i,1)),",");
		if (j neq 0) result = result & Chr(j+1039);
		else if (Asc(mid(str, i, 1)) eq 65533) result = result & Chr(1064);
		else if (Asc(mid(str, i, 1)) eq 1088) result = result & Chr(1025);
		else if (Asc(mid(str, i, 1)) eq 1089) result = result & Chr(1105);
		else if (Asc(mid(str, i, 1)) eq 1090) result = result & Chr(1028);//1256
		else if (Asc(mid(str, i, 1)) eq 1091) result = result & Chr(1108);//1257
		else if (Asc(mid(str, i, 1)) eq 1092) result = result & Chr(1111);//1198
		else if (Asc(mid(str, i, 1)) eq 1093) result = result & Chr(1031);//1199
		else result = result & mid(str, i, 1);
	}
	return result;
}
</cfscript>

<cfscript>
/**
 * Replaces accented characters with their non accented closest equivalents.
 * version 1.0 by Rachel Lehman
 * version 1.1 by Pat Branley (improved portability, fixed bug with &quot;x&quot; remapping
 * version 1.2 by Nathan Dintenfass (used more thorough Java-based approach)
 * 
 * @param str 	 String within which to replace accented characters (Required)
 * @return Returns a string. 
 * @author Rachel Lehman (raelehman@gmail.com) 
 * @version 1.2, December 20, 2012 
 */
function deAccent(str){
	//based on the approach found here: http://stackoverflow.com/a/1215117/894061
	var Normalizer = createObject("java","java.text.Normalizer");
	var NormalizerForm = createObject("java","java.text.Normalizer$Form");
	var normalizedString = Normalizer.normalize(str, createObject("java","java.text.Normalizer$Form").NFD);
	var pattern = createObject("java","java.util.regex.Pattern").compile("\p{InCombiningDiacriticalMarks}+");
	return pattern.matcher(normalizedString).replaceAll("");
}
</cfscript>

<cfscript>
/**
 * Corrects rounding bug in DecimalFormat.
 * Minor update.
 * 
 * @param number 	 The number to format. (Required)
 * @return Returns a number. 
 * @author duncan cumming (duncan.cumming@alienationdesign.co.uk) 
 * @version 2, October 12, 2004 
 */
function DecimalFormatCorrectly(number) {
	var lhs=0;
	var rhs=0;
	var decLen = 0;
	var i = 0;
	
	if(ListLen(number, ".") EQ 2) {	//xxx.xxx
		lhs = ListFirst(number, ".");
		rhs = ListLast(number, ".");
	} else if (Find(".", Trim(number)) EQ 1) { // .xx
		rhs = number;
	} else if (Find(".", Trim(number)) EQ 0) {	// xx
		lhs = number;
	} else {
		return number;
	}
	
	if (NOT IsNumeric(lhs) OR NOT IsNumeric(rhs)) return number;
	
	for (i = 0; i LT 2; i=i+1) {
		if (Len(rhs) LT 2) rhs = rhs & "0";
	}
	
	// count how many digits > 2dp there are
	decLen = Len(rhs) - 2; 

	// divide by this number of zeroes
	for (i = 0; i LT decLen; i=i+1) {
		rhs = rhs / 10;
	} 

	// round it
	rhs = Round(rhs);

	if (rhs GTE 100) { 
		rhs = 0;
		lhs = lhs + 1;
	}

	// pad with zeros if necessary
	if (rhs LT 10) {
		rhs = "0" & rhs;
	}	
	
	lhs = NumberFormat(lhs);
	
	return (lhs & "." & rhs);
}
</cfscript>

<cfscript>
/**
 * Adds delimiting character(s) before capital letters in interCap strings.
 * 
 * @param str 	 String to format. (Required)
 * @param delimiter 	 Delimiter used to format string. (Required)
 * @param capFirst 	 Boolean used to determine if first character should be set to uppercase. (Required)
 * @return Returns a string. 
 * @author Rachel Maxim (rmaxim@gmail.com) 
 * @version 1, July 9, 2008 
 */
function delimitInterCap(str,delimiter,capFirst) {
	var newStr = '';
	var currentChar = '';
	var replaceStr = '';
	var i = 0;
	//should the first letter be upper case?
	if (isBoolean(capFirst) and capFirst is true) {
		newStr = uCase(left(str,1));
	} else {
		newStr = left(str,1);
	}
	//loop over each character in the string starting with the second
	for (i = 2; i lte len(str); i = i + 1) {
		//get the character at this index
		currentChar = mid(str,i,1);
		//search for capital letters
		if  (reFind('[A-Z]',currentChar)) {
			//if capital, prepend with delimiter
			replaceStr = delimiter & currentChar;
			//append to the new string
			newStr = newStr & replaceStr;
		} else {
			//append original character to the new string
			newStr = newStr & currentChar;
		}
	}
	return newStr;
}
</cfscript>

<cfscript>
/**
 * Fixes text using Microsoft Latin-1 &quot;Extentions&quot;, namely ASCII characters 128-160.
 * ASCII8217 mod by Tony Brandner
 * 
 * @param text 	 Text to be modified. (Required)
 * @return Returns a string. 
 * @author Shawn Porter (sporter@rit.net) 
 * @version 2, September 2, 2010 
 */
function deMoronize (text) {
    var i = 0;

// map incompatible non-ISO characters into plausible 
    // substitutes
    text = Replace(text, Chr(128), "&euro;", "All");

    text = Replace(text, Chr(130), ",", "All");
    text = Replace(text, Chr(131), "<em>f</em>", "All");
    text = Replace(text, Chr(132), ",,", "All");
    text = Replace(text, Chr(133), "...", "All");
        
    text = Replace(text, Chr(136), "^", "All");

    text = Replace(text, Chr(139), ")", "All");
    text = Replace(text, Chr(140), "Oe", "All");

    text = Replace(text, Chr(145), "`", "All");
    text = Replace(text, Chr(146), "'", "All");
    text = Replace(text, Chr(147), """", "All");
    text = Replace(text, Chr(148), """", "All");
    text = Replace(text, Chr(149), "*", "All");
    text = Replace(text, Chr(150), "-", "All");
    text = Replace(text, Chr(151), "--", "All");
    text = Replace(text, Chr(152), "~", "All");
    text = Replace(text, Chr(153), "&trade;", "All");

    text = Replace(text, Chr(155), ")", "All");
    text = Replace(text, Chr(156), "oe", "All");

    // remove any remaining ASCII 128-159 characters
    for (i = 128; i LTE 159; i = i + 1)
        text = Replace(text, Chr(i), "", "All");

    // map Latin-1 supplemental characters into
    // their &name; encoded substitutes
    text = Replace(text, Chr(160), "&nbsp;", "All");

    text = Replace(text, Chr(163), "&pound;", "All");

    text = Replace(text, Chr(169), "&copy;", "All");

    text = Replace(text, Chr(176), "&deg;", "All");

    // encode ASCII 160-255 using ? format
    for (i = 160; i LTE 255; i = i + 1)
        text = REReplace(text, "(#Chr(i)#)", "&###i#;", "All");

	for (i = 8216; i LTE 8218; i = i + 1) text = Replace(text, Chr(i), "'", "All");
      
// supply missing semicolon at end of numeric entities
    text = ReReplace(text, "&##([0-2][[:digit:]]{2})([^;])", "&##\1;\2", "All");
    
// fix obscure numeric rendering of &lt; &gt; &amp;
    text = ReReplace(text, "&##038;", "&amp;", "All");
    text = ReReplace(text, "&##060;", "&lt;", "All");
    text = ReReplace(text, "&##062;", "&gt;", "All");

    // supply missing semicolon at the end of &amp; &quot;
    text = ReReplace(text, "&amp(^;)", "&amp;\1", "All");
    text = ReReplace(text, "&quot(^;)", "&quot;\1", "All");

    return text;
}
</cfscript>

<!---
 Strips all table and table content tags and extra whitespace from a string.
 
 @param string 	 String to format. (Required)
 @return Returns a string. 
 @author Jared Rypka-Hauer (jared@web-relevant.com) 
 @version 1, August 25, 2005 
--->
<cffunction name="detableize">
	<cfargument name="string" type="string" required="true" />
	<cfset var outputString = arguments["string"]>
	<cfset outputString = reReplaceNoCase(outputString , "</*table>", "", "all")>
	<cfset outputString = reReplaceNoCase(outputString , "</*t[rhd](\s*\w*=*""*\w*""*)*>", "", "all")>
	<cfset outputString = reReplaceNoCase(outputString , "(?m)^\s*", "", "all")>
	<cfset outputString = reReplaceNoCase(outputString , "\n{2,}", "#chr(10)#", "all")>
	<cfreturn outputString />
</cffunction>

<cfscript>
/**
 * This function try to guess the language of a given text.
 * 
 * @param text 	 Text to check. (Required)
 * @return Returns a string. 
 * @author Guido Bellomo (guidobellomo@gmail.com) 
 * @version 1, May 29, 2007 
 */
function detectLanguage(text) {
	var strLanguage = StructNew();
	var strPoints = StructNew();	
	var keys = "";
	var languages = "";
	var i = 0;
	var result = "";
	var maxPoints = 0;
	var currentPoint = 0;
	
	// Init structure
	strLanguage["it"] = "il,lo,la,gli,le,delle,dalle,dallo,ciao,che,questo,quello,quella,del,dal,in";
	strLanguage["en"] = "the,where,to,one,that,those,in,out,is";
	strLanguage["de"] = "der,die,das,es,dass,diese,wir,ihr,sie,aus,ein,jenes,diese,dieses,jene,und,nein,ja,auch,nicht,wieso,warum,weshlab,wie,was,warum,wer,durch,um,wegen,mit,ohne";
	strPoints["it"] = 0;
	strPoints["en"] = 0;
	strPoints["de"] = 0;		
	keys = StructKeyList(strLanguage);
	languages = StructKeyList(strLanguage);
	// Clean HTML
	text = ReReplace(text,"<.*?>","","ALL");
	// Start race
	for (i = 1; i lte ListLen(languages); i = i + 1) {
		// Get test words
		lang = ListGetAt(languages,i);
		testWords = StructFind(strLanguage,lang);
		for (k = 1; k lte ListLen(testWords); k = k + 1) {
			if (ReFindNoCase("\b#ListGetAt(testWords,k)#\b",text)) {
				strPoints[lang] = strPoints[lang]+1; 
			}					
		}
	}		
	// Check the winning langage
	for (i = 1; i lte ListLen(languages); i = i + 1) {
		currentPoint = StructFind(strPoints,ListGetAt(languages,i));
		if (currentPoint gt maxPoints) {
			result = ListGetAt(languages,i);
			maxPoints = currentPoint;
		}
	}
	return result;
}
</cfscript>

<cfscript>
/**
 * Divide a string in parts of equal size with separators in between/
 * 
 * @param str 	 String to dice (Required)
 * @param size 	 Size of the resulting parts (Required)
 * @param sep 	 Separator between resulting parts (Optional)
 * @return Returns a string. 
 * @author Richard (acdhirr@trilobiet.nl) 
 * @version 1, April 24, 2012 
 */
function dice(str,size) {

	var r = "";
	var i = 0;
	var sep = "<wbr/>";	

	if (arrayLen(arguments) GT 2 ) sep = arguments[3];
	
	for ( i=0; i LT len(str); i=i+1 ) {
		if ( (i-size+1) mod size eq 1) r&=sep; 
		r &= str.charAt(i);
	}	
	
	return trim(r);
}
</cfscript>

<cfscript>
/**
 * Counts how many different chars are in a string.
 * removed use of arguments. to make it cf5 compat
 * 
 * @param string 	 String to check. (Required)
 * @param caseSensitive 	 Determines if case sensitivity is used. Defaults to false. (Optional)
 * @return Returns a number. 
 * @author Bjorn Jensen (public.cflib@saghian.com) 
 * @version 1, February 6, 2004 
 */
function differentChars(string){
	var iCount = 0;
	var i = 0;
	var sChars = "";
	var sChar = "";
	var caseSensitive = false;

	if (arrayLen(arguments) eq 2 and isBoolean(arguments[2]) and arguments[2]) {
		caseSensitive = true;
	}
	
	for(i=1;i lte len(string);i=i+1){
		sChar = mid(string, i, 1);
		if (caseSensitive and not find(sChar, sChars)){
			sChars = sChars & sChar;
			iCount = iCount+1;
		} else if (not caseSensitive and not findNoCase(sChar, sChars)){
			sChars = sChars & sChar;
			iCount = iCount+1;
		}
	}

	return iCount;
}
</cfscript>

<cfscript>
/**
 * Returns a number converted into a string (i.e. 1 becomes "One Dollar").
 * 
 * @param dollaramount 	 The number representing the dollar amount. 
 * @param centsasdigits 	 Boolean value (defaults to no) that specifies if cents should be displayed as digits. 
 * @return Returns a string. 
 * @author Ben Forta (ben@forta.com) 
 * @version 1, July 18, 2001 
 */
function DollarAsString(number)
{
   VAR Result="";          // Generated result
   VAR Strs=StructNew();   // Strings structure
   VAR Str="";             // Temp string
   VAR n=0;                // Temp number
   VAR Dollars=0;          // Dollar amount
   VAR Cents=0;            // Cents amount
   VAR CentsAsDigits=0;    // Cents as digits flag
   
   // Initialize strings
   if (NOT IsDefined("REQUEST.DStrs"))
   {
      REQUEST.DStrs=StructNew();
      REQUEST.DStrs.space=" ";
      REQUEST.DStrs.and="and";
      REQUEST.DStrs.dollar="Dollar";
      REQUEST.DStrs.dollars="Dollars";
      REQUEST.DStrs.cent="Cent";
      REQUEST.DStrs.cents="Cents";
   }
   
   // Check for optional parameter
   if (ArrayLen(Arguments) GTE 2 AND IsBoolean(Arguments[2]))
      CentsAsDigits=Arguments[2];
   
   // Extract dollar and cent portions
   Dollars=Int(number);
   n=Find(".", number);
   if (n)
   {
      // There is a cents value
      Str=Trim(Mid(number, n+1, Len(number)-n));
      if (Len(Str) IS 1)
         Cents=Str&"0";
      else if (Len(Str) IS 2)
         Cents=Val(Str);
      else if (Len(Str) GTE 3)
      {
         Str=Left(Str, 2)&"."&Right(Str, Len(Str)-2);
         Cents=Round(Str);
      }
   }
      
   // Build result
   if (Dollars)
      Result=Result&NumberAsString(Dollars)&REQUEST.DStrs.space&IIf(Dollars IS 1, DE(REQUEST.DStrs.dollar), DE(REQUEST.DStrs.dollars));
   if (Cents)
   {
      if (Dollars)
         Result=Result&REQUEST.DStrs.space&REQUEST.DStrs.and&REQUEST.DStrs.space;
      if (CentsAsDigits)
         Str=Cents;
      else
         Str=NumberAsString(Cents);
      Result=Result&Str&REQUEST.DStrs.space&IIf(Cents IS 1, DE(REQUEST.DStrs.cent), DE(REQUEST.DStrs.cents));
   }
   
   return Result;
}
</cfscript>

<cfscript>
/**
 * Works like the built-in function DollarFormat, but does no rounding.
 * 
 * @param inNum 	 Number to format. (Required)
 * @param default_var 	 Value to use if number isn't a proper number. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, September 16, 2002 
 */
function DollarFormat2(inNum) {
	var out_str             = "";
	var decimal_str         = "";

	var default_value = inNum;
	if(ArrayLen(Arguments) GTE 2) default_value = Arguments[2];

	if (not IsNumeric(inNum)) {
		return (default_value);
	} else {
		inNum = Trim(inNum);
		if(ListLen(inNum, ".") GT 1) {
			out_str = Abs(ListFirst(inNum, "."));
			decimal_str = "." & ListLast(inNum, ".");
		} else if (Find(".", inNum) EQ 1) {
			decimal_str = inNum;
		} else {
			out_str = Abs(inNum);
		}
		if (out_str NEQ "") {
			// add commas
			out_str = Reverse(out_str);
			out_str = REReplace(out_str, "([0-9][0-9][0-9])", "\1,", "ALL");
			out_str = REReplace(out_str, ",$", "");   // delete potential leading comma
			out_str = Reverse(out_str);
		}

		// add dollar sign (and parenthesis if negative)
		if(inNum LT 0) {
			return ("($" & out_str & decimal_str & ")");
		} else {
			return ("$" & out_str & decimal_str);
		}
	}
}
</cfscript>

<cfscript>
/**
 * When given an email address this function will return the address in a format safe from email harvesters.
 * Minor edit by Rob Brooks-Bilson (rbils@amkor.com)
 * Update now converts all characters in the email address to unicode, not just the @ symbol. (by author)
 * 
 * @param EmailAddress 	 Email address you want to make safe. (Required)
 * @param Mailto 	 Boolean (Yes/No). Indicates whether to return formatted email address as a mailto link.  Default is No. (Optional)
 * @return Returns a string 
 * @author Seth Duffey (sduffey@ci.davis.ca.us) 
 * @version 2, May 2, 2002 
 */
function EmailAntiSpam(EmailAddress) {
	var i = 1;
	var antiSpam = "";
	for (i=1; i LTE len(EmailAddress); i=i+1) {
		antiSpam = antiSpam & "&##" & asc(mid(EmailAddress,i,1)) & ";";
	}
	if ((ArrayLen(Arguments) eq 2) AND (Arguments[2] is "Yes")) return "<a href=" & "mailto:" & antiSpam & ">" & antiSpam & "</a>"; 
	else return antiSpam;
}
</cfscript>

<cfscript>
/**
 * Formats an e-mail address so that its domain is a link to its web site.
 * 
 * @param theEmailAddress 	 Email address. (Required)
 * @param theTarget 	 Optional target for new window. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, September 29, 2003 
 */
function emailDomainLink(theEmailAddress) {
	var this_username  = listFirst(theEmailAddress, "@");
	var this_domain    = listLast(theEmailAddress, "@");
	var theTarget      = "";
	if(arrayLen(arguments) gte 2) theTarget = arguments[2];
	if(Len(theTarget) GT 0) return "#this_username#@<a href=""http://www.#this_domain#"" target=""#theTarget#"">#this_domain#</a>";
	else return "#this_username#@<a href=""http://www.#this_domain#"">#this_domain#</a>";
}
</cfscript>

<cfscript>
/**
 * Replaces variable placeholders with values of said variables using any list of possible identifiers.
 * 
 * @param thisstring 	 The string to parse. (Required)
 * @param identifiers 	 Characters to use as identifiers. (Optional)
 * @return Returns a string. 
 * @author Steven Van Gemert (svg2@placs.net) 
 * @version 1, July 13, 2005 
 */
function evaluateVariables(thisstring) {
	var poundsign = "##";
	var poundsignplaceholder = "";
	var identifiers = poundsign; //Default identifier.
	var thisdelimiter = "!"; //Default delimiter.
	var i = 1;
	
	if (ArrayLen(arguments) EQ 2){ //If we were passed a list of identifiers...
		identifiers = arguments[2]; //...then use them.
	}
	while(findnocase(thisdelimiter,identifiers & poundsign)){ //If we were passed the same identifier as we chose for our delimiter, or it's a pound sign or single quote...
		thisdelimiter = chr(asc(thisdelimiter) + 1); //...then use a different delimiter.
	}
	poundsignplaceholder = repeatstring(thisdelimiter,3) & "PoundSign" & repeatstring(thisdelimiter,3); //Create the pound sign placeholder to preserve existing pound signs in the string.
	
	if(not findnocase(poundsign,identifiers)){ //If the pound sign is not one of the identifiers...
		thisstring = replace(thisstring,poundsign,poundsignplaceholder,"ALL"); //...then replace any existing pound signs with a place holder to preserve them.
	}

	for(i=1; i LTE len(identifiers); i = i + 1){ //For each identifier...
		if(listlen(thisdelimiter & thisstring & thisdelimiter,mid(identifiers,i,1)) mod 2){ //If there is an odd number of items in the list (cursory check - not definitive - to verify that the evaluate statement will function properly).
			thisstring = replace(thisstring,mid(identifiers,i,1),poundsign,"ALL"); //...replace it with pound signs.
		}
	}

	thisstring = evaluate(de(thisstring)); //Evaluate the variables.
	
	if(not findnocase(poundsign,identifiers)){ //If the pound sign is not one of the identifiers...
		thisstring = replace(thisstring,poundsignplaceholder,poundsign,"ALL"); //...then re-instate the preserved pound signs.
	}

	return thisstring; //Return the evaluated string.
}
</cfscript>

<cfscript>
/**
 * Applies a filter mask to a string.
 * 
 * @param string 	 String to be modified. (Required)
 * @param mask 	 See Mask description above. (Required)
 * @param filter 	 Option filter to apply before applying the mask. May be 'alpha', 'numeric', or 'alphanumeric'. Any characters not within the set specified are removed from the input before the mask is applied. (Optional)
 * @return Returns a string. 
 * @author Joshua Olson (joshua@waetech.com) 
 * @version 2, October 15, 2004 
 */
function FilterMask(value, mask) {

 var filter = ",";
 var t_value = "";
 var pos = 1;
 var t_value_len = 0;
 var character = "";
 var literal = 0;
 var char_at_pos = "";
 var argc = ArrayLen(arguments);
 
 if (argc EQ 2) ArrayAppend(arguments,filter);
 filter = arguments[3];

  t_value = value;
  value = "";

  if (LCase(filter) IS "alphanumeric")
    t_value = REReplace(t_value, "[^[:alnum:]]", "", "ALL");
  else if (LCase(filter) IS "numeric")
    t_value = REReplace(t_value, "[^[:digit:]]", "", "ALL");
  else if (LCase(filter) IS "alpha")
    t_value = REReplace(t_value, "[^[:alpha:]]", "", "ALL");

  t_value_len = Len(t_value);

  
  for (i=1; i LTE Len(mask); i = i + 1) {
    character = Mid(mask, i, 1);
    if (literal)
    {
      value = value & character;
      literal = "0";
    } else
    {
      if (t_value_len GTE pos)
        char_at_pos = Mid(t_value, pos, 1);
      else
        char_at_pos = "";
      
      pos = pos + 1;
      if (character IS "9") {
        if (IsNumeric(char_at_pos)) value = value & Val(char_at_pos);
      } else
      if (character IS "0") {
        value = value & Val(char_at_pos);
      } else
      if (character IS "_") {
        value = value & char_at_pos;
      } else
      if (character IS "A") {
        value = value & UCase(char_at_pos);
      } else
      if (character IS "a") {
        value = value & LCase(char_at_pos);
      } else
      if (character IS "B") {
        if (NOT IsNumeric(char_at_pos)) value = value & UCase(char_at_pos);
      } else
      if (character IS "b") {
        if (NOT IsNumeric(char_at_pos)) value = value & LCase(char_at_pos);
      } else
      if (character IS "\") {
        literal = 1;
        pos = pos - 1;
      }
      else {
        value = value & character;
        pos = pos - 1;
      }
    }
  }
  
  return value;
}
</cfscript>

<cfscript>
/**
 * Finds all occurrences of a substring in a string.
 * Fix by RCamden to make start optional.
 * 
 * @param substring 	 String to search for. (Required)
 * @param string 	 String to parse. (Required)
 * @param start 	 Starting position. Defaults to 1. (Optional)
 * @return Returns an array. 
 * @author Jeremy Rottman (rottmanj@hsmove.com) 
 * @version 2, July 29, 2008 
 */
function findALL(substring,string) {
	var findArray = arrayNew(1);	
	var start = 1;	
	var posStart = "";
	var i = 1;
	var newPos = "";
	
	if(arrayLen(arguments) gte 3) start = arguments[3];

	posStart = find(substring,string,start);
	
	if(posStart GT 0){
		findArray[i] = posStart;
		while(posStart gt 0 ){
			posStart = posStart + 1;
			newPos = find(substring,string,posStart);
			if(newPos gt 0){
				i = i + 1;
				findArray[i] = newPos;
				posStart = newPos;
			}else{
				posStart = 0;
			}
		}
	}else{
		return 0;
	}
	return findArray;
}
</cfscript>

<!---
 Finds within a given string the location of the first occurrence of any element in a list.
 
 @param valueList 	 List of values to check for. (Required)
 @param stringtocompare 	 String to be searched. (Required)
 @param start 	 Optional starting position. Defaults to 1.  (Optional)
 @param delim 	 List delimiter. Defaults to a comma. (Optional)
 @return The position of first found list element in string; or 0, if no list elements are in string. 
 @author Charlie Arehart (charlie@carehart.org) 
 @version 0, September 15, 2008 
--->
<cffunction name="findList" returnType="numeric" output="false">
	<cfargument name="valuelist" required="Yes" type="string">
	<cfargument name="stringtocompare" required="Yes" type="string">
	<cfargument name="start" required="No" type="numeric" default="0">
	<cfargument name="delim" required="no" type="string" default=",">
	<cfset var test=arrayNew(1)>
	<cfset var x = "">


	<cfloop list="#arguments.valuelist#" index="x" delimiters="#arguments.delim#">
		<cfset ArrayAppend(test,findnocase(x,arguments.stringtocompare, arguments.start)) />
	</cfloop>

	<cfreturn arrayMin(test) />
</cffunction>

<cfscript>
/**
 * Returns the number of times a pattern exists within a string.
 * Modified by Raymond Camden
 * Rewritten based on original UDF by Cory Aiken (corya@fusedsolutions.com)
 * 
 * @param tString 	 The string to check. 
 * @param tsubString 	 The string to look for. 
 * @return Returns the number of occurrences. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 3, March 20, 2002 
 */
function FindOccurrences(tString,tsubString){
	if(not len(tString) OR not len(tsubString)) return 0;
	else {
		// delete all occurences of tString
		// and then calculate the number of occurences by comparing string sizes
		return ((len(tString) - len(replaceNoCase(tString, tsubString, "", "ALL"))) / len(tsubString));
	}
}
</cfscript>

<cfscript>
/**
 * Finds the first paragraph in a given string.
 * 
 * @param str 	 String to parse. (Required)
 * @return Returns a string. 
 * @author Neil Merton (neil.merton@mewebdev.net) 
 * @version 1, December 7, 2006 
 */
function firstParagraph(str) {
	str = trim(str);
	endTag = findNoCase("</p>", str);
	if (endTag gt 0) {
		endTag = endTag + 3;
		extract = left(str, endTag);
	} else {
		extract = str;
	}
	return extract;
}
</cfscript>

<cfscript>
/**
 * Remove extra characters from a form post added by Mac IE.
 * Changed attributes check to form[ check.
 * 
 * @return Returns True. 
 * @author Anthony Cooper (ant@bluevan.co.uk) 
 * @version 2, February 7, 2003 
 */
function FixMacPost() {
  var thisField	= "";
	
  if (findNoCase("mac", cgi.HTTP_USER_AGENT) AND findNoCase("msie", cgi.HTTP_USER_AGENT)) {
    for (thisField in form) {
      if ((len(form[thisField]) GTE 2) AND NOT findNoCase(getTempDirectory(), form[thisField])) {
       form[thisField] = trim(form[thisField]);
      }
    }
  }
  return true;

}
</cfscript>

<cfscript>
/**
 * This is a workaround for the URLDecode bug that exists in CF5 and CFMX.
 * 
 * @param string 	 String to url decode. (Required)
 * @return Returns a string. 
 * @author Anthony Petruzzi (tonyp@rolist.com) 
 * @version 1, September 23, 2004 
 */
function fixURLDecode(string){
	return URLDecode(ReReplaceNoCase(string, "%([^A-F0-9{2}])", "%25\1", "ALL"));
}
</cfscript>

<cfscript>
/**
 * Converts a string into &quot;Flash&quot; safe HTML.
 * 
 * @param text 	 Text to be converted. (Required)
 * @return Returns a string. 
 * @author William Steiner (williams@hkusa.com) 
 * @version 1, September 15, 2003 
 */
function FlashHTMLFormat(someText) {
	var returnText = someText;
	var listCount = 0;
	returnText = ReplaceNoCase(returnText, "#Chr(10)#", "", "ALL");
	returnText = ReplaceNoCase(returnText, "<OL></OL>", "", "ALL");
	returnText = StripCR(returnText);

	while (FindNoCase('<OL>', returnText) neq 0) {
		while ((FindNoCase('</OL>', returnText) gt FindNoCase('<li>', returnText)) AND (FindNoCase('<li>', returnText) neq 0)) {
			startSearchAt = FindNoCase('<OL>', returnText);
			listCount = listCount + 1;
			// replaces the next <li> with the correct number.
			if (listCount gt 9)
				returnText = ReplaceNoCase(returnText, "<li>", "<BR>  #listCount#.  ");
			else
				returnText = ReplaceNoCase(returnText, "<li>", "<BR>    #listCount#.  ");
		}
		// we are done with that list, get rid of the <ol> tag so we can find the next 
		listCount = 0;
		returnText = ReplaceNoCase(returnText, "<OL>", "<br>", "one"); 
		returnText = ReplaceNoCase(returnText, "</OL>", "<br><br>", "one"); 
	}
	
	returnText = ReplaceNoCase(returnText, "<LI>", "<br>", "ALL"); 
	// Step xx, get rid of ALL </li>, </ol>, and </ul> tags
	returnText = ReplaceNoCase(ReplaceNoCase(ReplaceNoCase(returnText, "</li>", "", "ALL"), "</ol>", "<br><br>", "ALL"), "</ul>", "<br><br>", "ALL");
	// Step xx, REReplace statement changes the color attribute of the font tag to have
	// quotes around it...ActiveEdit strips them out :(
	returnText = REReplaceNoCase(returnText, "<FONT color=(#Chr(35)#[A-Za-z0-9]*)></FONT>", "", "ALL");
	returnText = REReplaceNoCase(returnText, "target=([A-Za-z0-9_]*)", "target=#Chr(34)#\1#Chr(34)#", "ALL");
	returnText = REReplaceNoCase(returnText, "face=([A-Za-z0-9_ ]*)", "face=#Chr(34)#\1#Chr(34)#", "ALL");
	returnText = REReplaceNoCase(returnText, "color=(#Chr(35)#[A-Za-z0-9]*)", "color=#Chr(34)#\1#Chr(34)#", "ALL");
	returnText = REReplaceNoCase(returnText, "size=([A-Za-z0-9]*)", "size=#Chr(34)#\1#Chr(34)#", "ALL");
	returnText = ReplaceNoCase(returnText, "&nbsp;", " ", "ALL");
	returnText = ReplaceNoCase(returnText, "&##39;", "'", "ALL");
	returnText = ReplaceNoCase(returnText, "'", "'", "ALL");
	returnText = ReplaceNoCase(returnText, "'", "'", "ALL");
	returnText = ReplaceNoCase(returnText, """", "#Chr(34)#", "ALL");
	returnText = ReplaceNoCase(returnText, """", "#Chr(34)#", "ALL");
	returnText = ReplaceNoCase(returnText, "<EM>", "<I>", "ALL");
	returnText = ReplaceNoCase(returnText, "</EM>", "</I>", "ALL");
	returnText = ReplaceNoCase(returnText, "<STRONG>", "<B>", "ALL");
	returnText = ReplaceNoCase(returnText, "</STRONG>", "</B>", "ALL");
	return returnText;
}
</cfscript>

<cfscript>
/**
 * Uses the Java String format() method to format a string in CFML.
 * v0.9 by Anthony Cole
 * v1.0 by Adam Cameron (renamed from sprintf to format, as this more closely reflects the underlying implementation; improved argument/variable names and tweaked the logic slightly)
 * 
 * @param str 	 A format string (Required)
 * @param args 	 Array of arguments referenced by the format specifiers in the format string. (Required)
 * @return A formatted string 
 * @author Anthony Cole (acole76@gmail.com) 
 * @version 1.0, March 10, 2013 
 */
string function format(required string str, required array args){
	return str.format(str, args);
}
</cfscript>

<cfscript>
/**
 * Formats a JSON string with indents &amp; new lines.
 * v1.0 by Ben Koshy
 * 
 * @param str 	 JSON string (Required)
 * @return Returns a string of indent-formated JSON 
 * @author Ben Koshy (cf@animex.com) 
 * @version 0, September 16, 2012 
 */
// formatJSON() :: formats and indents JSON string
// based on blog post @ http://ketanjetty.com/coldfusion/javascript/format-json/
// modified for CFScript By Ben Koshy @animexcom
// usage: result = formatJSON('STRING TO BE FORMATTED') OR result = formatJSON(StringVariableToFormat);

public string function formatJSON(str) {
	var fjson = '';
    var pos = 0;
    var strLen = len(arguments.str);
	var indentStr = chr(9); // Adjust Indent Token If you Like
    var newLine = chr(10); // Adjust New Line Token If you Like <BR>
	
	for (var i=1; i<strLen; i++) {
		var char = mid(arguments.str,i,1);
		
		if (char == '}' || char == ']') {
			fjson &= newLine;
			pos = pos - 1;
			
			for (var j=1; j<pos; j++) {
				fjson &= indentStr;
			}
		}
		
		fjson &= char;	
		
		if (char == '{' || char == '[' || char == ',') {
			fjson &= newLine;
			
			if (char == '{' || char == '[') {
				pos = pos + 1;
			}
			
			for (var k=1; k<pos; k++) {
				fjson &= indentStr;
			}
		}
	}
	
	return fjson;
}
</cfscript>

<cfscript>
/**
 * Function that formats a numeric list so that successive numbers are shown as a series.
 * 
 * @param theList 	 The list to parse. (Required)
 * @return Returns a string. 
 * @author Mosh Teitelbaum (mosh.teitelbaum@evoch.com) 
 * @version 2, January 14, 2010 
 */
function formatListAsSeries(theList) {
    var lastEle = "";
    var isSet = false;
    var fList = "";
    var currEle = "";
    var idx = 0;
	
	theList = listSort(theList, "numeric", "asc");
	
	for ( idx = 1; idx LTE ListLen(theList); idx = idx + 1 ) {
		currEle = ListGetAt(theList, idx);
		
		if ( Len(lastEle) EQ 0 ) {
			fList = fList & currEle;
			lastEle = currEle;
			isSet = false;
		} else if ( lastEle EQ currEle ) {
			//do nothing
		} else if ( lastEle + 1 NEQ currEle ) {
			if ( isSet ) {
				fList = fList & lastEle;
			}
			fList = fList & ", " & currEle;
			lastEle = currEle;
			isSet = false;
		} else {
		if ( NOT isSet ) {
			fList = fList & "-";
		}
		lastEle = currEle;
		isSet = true;
		}
	}

	if ( isSet ) {
		fList = fList & lastEle;
	}

	return fList;
}
</cfscript>

<cfscript>
/**
 * Translates a 9 digit string into a social security number.
 * 
 * @param string 	 String to be modified. 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, July 16, 2001 
 */
function FormatSSN(str)
{
  var SSN = "";
  if (Not IsNumeric(str)) return "Error, str must be numeric";
  if (Len(Str) NEQ 9) return "Error, str must be 9 digits long";
  SSN = ReReplace(str,'([0-9]{3})([0-9]{2})([0-9]{4})','\1-\2-\3');
  return SSN;
}
</cfscript>

<cfscript>
/**
 * Displays n number of characters from a string without cutting off in the middle of a word
 * Code used from FullLeft
 * 
 * @param string 	 String to be modified. (Required)
 * @param number 	 Number of characters to include in teaser. (Required)
 * @param urlArgument 	 URL to use for 'more' link. (Optional)
 * @return Returns a string. 
 * @author Bryan LaPlante (blaplante@netwebapps.com) 
 * @version 3, July 31, 2003 
 */
function FormatTeaser(string,number){
	var urlArgument = "";
	var shortString = "";
	
	//return quickly if string is short or no spaces at all
	if(len(string) lte number or not refind("[[:space:]]",string)) return string;
	
	if(arrayLen(arguments) gt 2) urlArgument = "... <a href=""" & arguments[3] & """>[more]</a>";

	//Full Left code (http://www.cflib.org/udf.cfm?ID=329)
	if(reFind("[[:space:]]",mid(string,number+1,1))) {
	  	shortString = left(string,number);
	} else { 
		if(number-refind("[[:space:]]", reverse(mid(string,1,number)))) shortString = Left(string, (number-refind("[[:space:]]", reverse(mid(string,1,number))))); 
		else shortString = left(str,1);
	}
	
	return shortString & urlArgument;

}
</cfscript>

<cfscript>
/**
 * Returns either a formatted value or the passed default string.
 * 
 * @param begin_str 	 String to prepend to output. (Required)
 * @param str 	 Variable to check. (Required)
 * @param end_str 	 String to append to output. (Required)
 * @param default_str 	 String to return if  str is empty. (Required)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function FormattedValueOrString(begin_str, str, end_str, default_str) {
	if (str IS "") return default_str;
	return begin_str & str & end_str;
}
</cfscript>

<!---
 Returns a custom-formated timespan, similar to timeFormat().
 
 @param value 	 Timespan value. (Required)
 @param mask 	 Formatting string. (Required)
 @return Returns a string. 
 @author Oblio Leitch (oleitch@locustcreek.com) 
 @version 1, August 14, 2007 
--->
<cffunction name="formatTimespan" access="public" returntype="string" output="no">
	<cfargument name="value" type="numeric" hint="timespan value" required="yes" />
	<cfargument name="mask" type="string" hint="formating string" required="yes" />
	<cfset var l=structNew() />

	<cfscript>
		l.dValue=arguments.value;
		l.result=arguments.mask;

		//year
		if(reFind("(?i)\by",l.result)){
			l.value=dateDiff("yyyy",0,l.dValue);
			l.dValue=l.dValue-dateAdd("yyyy",l.value,0);
			if(reFind("(?i)\by\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\by",l.value);
		}
		//month
		if(reFind("(?i)\bm",l.result)){
			l.value=dateDiff("m",0,l.dValue);
			l.dValue=l.dValue-dateAdd("m",l.value,0);
			if(reFind("(?i)\bm\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\bm",l.value);
		}
		//week
		if(reFind("(?i)\bw",l.result)){
			l.value=dateDiff("ww",0,l.dValue);
			l.dValue=l.dValue-dateAdd("ww",l.value,0);
			if(reFind("(?i)\bw\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\bw",l.value);
		}
		//day
		if(reFind("(?i)\bd",l.result)){
			l.value=dateDiff("d",0,l.dValue);
			l.dValue=l.dValue-dateAdd("d",l.value,0);
			if(reFind("(?i)\bd\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\bd",l.value);
		}
		//hour
		if(reFind("(?i)\bh",l.result)){
			l.value=dateDiff("h",0,l.dValue);
			l.dValue=l.dValue-dateAdd("h",l.value,0);
			if(reFind("(?i)\bh\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\bh",l.value);
		}
		//minute
		if(reFind("(?i)\bn",l.result)){
			l.value=dateDiff("n",0,l.dValue);
			l.dValue=l.dValue-dateAdd("n",l.value,0);
			if(reFind("(?i)\bn\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\bn",l.value);
		}
		//minute
		if(reFind("(?i)\bs",l.result)){
			l.value=dateDiff("s",0,l.dValue);
			l.dValue=l.dValue-dateAdd("s",l.value,0);
			if(reFind("(?i)\bs\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\bs\B",l.value);
		}
	</cfscript>
	<cfreturn l.result />
</cffunction>

<cfscript>
/**
 * Formats a string to become a valid UK postcode
 * version 1.0 by Steve Chandler
 * 
 * @param str 	 String to format (Required)
 * @return Returns a string 
 * @author Steve Chandler (cflib@chandler.it) 
 * @version 1, July 27, 2012 
 */
function formatUKPostcode(str){
	var strPostcode = ucase(trim(replaceNoCase(str,' ','','all')));
	return left(strPostcode,len(strPostcode)-3) & ' ' & right(strPostcode,3);
}
</cfscript>

<cfscript>
/**
 * Strips HTML from all form fields.
 * Version 1.1 by Raymond Camden
 * 
 * @param nostrip 	 List of form fields that should not be modified. 
 * @return Returns true. 
 * @author Douglas Williams (klenzade@avondale.com) 
 * @version 1.1, December 19, 2001 
 */
function FormStripHTML() {
	var nostrip = "";
	if(arraylen(Arguments)) nostrip = Arguments[1];

        if(structIsEmpty(form)) return;

	for (field in form) {
   		if(NOT listfindnocase(nostrip, field)) form[field] = ReReplaceNoCase(form[field], "<[^>]*>", "", "ALL");
	}

        return true;
}
</cfscript>

<!---
 I generate concatenated name-value pairs from forms.
 
 @param formStruct 	 form structure (Required)
 @param doNotProcessList 	 List of fields to ignore (Optional)
 @return Returns a string 
 @author Stephen Withington (steve@stephenwithington.com) 
 @version 0, June 17, 2009 
--->
<cffunction name="formToNameValuePairs" returntype="string" output="false" access="remote"
			hint="pass me a form and i'll generate concatenated name-value pairs.">

	<cfargument name="formStruct" type="struct" required="true" hint="the form struct to parse and concatenate" />
	<cfargument name="doNotProcessList" type="string" required="false" hint="a list of form fields to ignore" default="" />

	<cfset var local = structNew() />
	<cfset local.nameValuePairs = "" />
	<cfset local.doNotProcess = arguments.doNotProcessList />
	<cfset local.field = "" />

	<cfif structKeyExists(arguments,"formStruct") and structKeyExists(arguments.formStruct,"fieldnames")>
	    	<cfloop list="#arguments.formStruct.fieldnames#" index="local.field"> 
	    	    <cfif not listFindNoCase(local.doNotProcess,local.field)>
	    	        <cfset local.doNotProcess = listAppend(local.doNotProcess,local.field) />
	        	    <cfset local.nameValuePairs = listAppend(local.nameValuePairs,lcase(local.field) & "=" & urlEncodedFormat(form[local.field], "utf-8"), "&") />                        
	    	   	 </cfif>
	    	</cfloop>
	   </cfif>	

	<cfreturn local.nameValuePairs />    
</cffunction>

<cfscript>
/**
 * An enhanced version of left() that doesn't cut words off in the middle.
 * Minor edits by Rob Brooks-Bilson (rbils@amkor.com) and Raymond Camden (ray@camdenfamily.com)
 * 
 * Updates for version 2 include fixes where count was very short, and when count+1 was a space. Done by RCamden.
 * 
 * @param str 	 String to be checked. 
 * @param count 	 Number of characters from the left to return. 
 * @return Returns a string. 
 * @author Marc Esher (jonnycattt@aol.com) 
 * @version 2, April 16, 2002 
 */
function fullLeft(str, count) {
	if (not refind("[[:space:]]", str) or (count gte len(str)))
		return Left(str, count);
	else if(reFind("[[:space:]]",mid(str,count+1,1))) {
	  	return left(str,count);
	} else { 
		if(count-refind("[[:space:]]", reverse(mid(str,1,count)))) return Left(str, (count-refind("[[:space:]]", reverse(mid(str,1,count))))); 
		else return(left(str,1));
	}
}
</cfscript>

<cfscript>
/**
 * Give the fully escaped URL encoding of a string.
 * 
 * @param str 	 String to encode. (Required)
 * @return Returns a string. 
 * @author Umbrae (umbrae@gmail.com) 
 * @version 1, August 2, 2005 
 */
function fullurlencode(str) {
  var encstr="";
  var len=len(str);
  var i=1;
  for(i=1; i LTE len; i=i+1)
    encstr = encstr & "%" & FormatBaseN(Asc(Mid(str,i,1)),16);
  return encstr;
}
</cfscript>

<cfscript>
/**
 * Returns the page anchor from a specified URL.
 * 
 * @param this_url 	 URL to parse. 
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, February 21, 2002 
 */
function GetAnchorFromURL(this_url) {
	var re_found_struct = "";
	
	this_url = trim(this_url);
	
	re_found_struct = REFind("##[^\?]*", this_url, 1, "True");
	
	if (re_found_struct.pos[1] GT 0) {
		return Mid(this_url, re_found_struct.pos[1]+1, re_found_struct.len[1]-1);
	} else return "";
}
</cfscript>

<cfscript>
/**
 * Gets the next text container (placeholder, tag, etc.) from a string as designated by starting and ending identifiers.
 * 
 * @return Returns a structure. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 0, October 2, 2002 
 */
function GetContainer(theString, startIdentifier, endIdentifier){
	// some code based on Joshua Miller's RePlaceHolders()
	var startIdentifier_len  = Len(startIdentifier);
	var endIdentifier_len    = Len(endIdentifier);
	var container            = StructNew();

	var startIndex = 1;
	if(ArrayLen(Arguments) GTE 4) startIndex = Arguments[4];

	container.start      = 0;
	container.end        = 0;
	container.len        = 0;
	container.str        = 0;

	container.contents         = StructNew();
	container.contents.start   = 0;
	container.contents.end     = 0;
	container.contents.len     = 0;
	container.contents.str     = 0;

	container.start = FindNoCase(startIdentifier, theString, startIndex);
	if (container.start GT 0) {
		container.end      = FindNoCase(endIdentifier, theString, container.start+startIdentifier_len) + endIdentifier_len -1;
		container.len      = container.end - container.start +1;
		container.str      = Mid(theString, container.start, container.len);

		container.contents.start   = container.start + startIdentifier_len;
		container.contents.end     = container.end - endIdentifier_len;
		container.contents.len     = container.contents.end - container.contents.start +1;
		container.contents.str     = Mid(theString, container.contents.start, container.contents.len);
	}

	return container;
}
</cfscript>

<cfscript>
/**
 * Searches a string for email addresses.
 * Based on the idea by Gerardo Rojas and the isEmail UDF by Jeff Guillaume.
 * New TLDs  
 * v3 fix by Jorge Asch
 * 
 * @param str 	 String to search. (Required)
 * @return Returns a list. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 3, June 13, 2011 
 */
function getEmails(str) {
	var email = "(['_a-z0-9-]+(\.['_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.((aero|coop|info|museum|name|jobs|travel)|([a-z]{2,3})))";
	var res = "";
	var marker = 1;
	var matches = "";
	
	matches = reFindNoCase(email,str,marker,marker);

	while(matches.len[1] gt 0) {
		res = listAppend(res,mid(str,matches.pos[1],matches.len[1]));
		marker = matches.pos[1] + matches.len[1];
		matches = reFindNoCase(email,str,marker,marker);		
	}
	return res;
}
</cfscript>

<cfscript>
/**
 * Returns the file name from a specified URL.
 * 
 * @param this_url 	 URL to parse. 
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, March 4, 2002 
 */
function GetFileFromURL(this_url) {
	var i               = 0;
	var cnt             = 0;
	var re_found_struct = "";
	var this_file_name  = "";
	var num_dots        = "";
	
	this_url = trim(this_url);
	
	// find the last "/" character, after the scheme
	if(not Find("/", this_url)) {
		i=1;
	} else {
		if(Find("://", this_url)){
			i = Find("://", this_url);
			cnt = Len(this_url) -i -2;
			if(cnt LT 1) cnt=1;
			this_url = Right(this_url, cnt);   // now the scheme is chopped off
		}
		i = Len(this_url) - Find("/", Reverse(this_url)) +2;
	}
	
	re_found_struct = REFind("([^##\?]+\.[^##\?]+)", this_url, i, "True");
	if (re_found_struct.pos[1] GT 0) {
		this_file_name = Mid(this_url, re_found_struct.pos[2], re_found_struct.len[2]);
		num_dots = (Len(this_file_name) - Len(Replace(this_file_name, ".", "", "ALL")));
		if ( ((not Find("/", this_url)) and (num_dots GT 1)) or (FindOneOf("@:", this_file_name)) ){
			// since this URL doesn't contain any "/" and since the "file" has two or more dots (".")
			// or if the filename contains a "@" or a ":"
			// then this filename is probably actually a host name
			return ""; 
		}
		return this_file_name;
	} else {
		return "";
	}
}
</cfscript>

<!---
 Determines a light or dark text color based on the given background color.
 
 @param backgroundHEX 	 string containing HEX color (Required)
 @return returns a string 
 @author Scott Lingle (sal21@psu.edu) 
 @version 0, May 9, 2009 
--->
<cffunction name="getForegroundColor" output="false" access="private" returntype="string" hint="gets the appropriate FG color.">
    <cfargument name="backgroundHEX" required="true" />
    <cfscript>
        // clean up the incoming color, strip the pound sign.
        var cleanHex = Replace(arguments.backgroundHEX,"##","");
        // break the hex up and convert to RGB
        var R = InputBaseN(Mid(cleanHex, 1, 2),16);
        var G = InputBaseN(Mid(cleanHex, 3, 2),16);        
        var B = InputBaseN(Mid(cleanHex, 5, 2),16);
        
        //determine the backgrounds 'brightness' (from a W3C Accessibility draft)
        var brightness = ((R * 299) + (G * 587) + (B * 114)) / 1000;
        //determine if it is a light or dark background and set the return to either black or white.
        if(255 - brightness lt 128) {
            return "##000000";
        } else {
            return "##ffffff";
        }
    </cfscript>    
</cffunction>

<cfscript>
/**
 * Pass it a http_referer value and this fuction will parse out the keywords used to find it if referred from Google.
 * 
 * @param referer 	 The referer string to check. (Required)
 * @return Returns a string. 
 * @author Matthew Fusfield (matt@fus.net) 
 * @version 1, June 28, 2002 
 */
function getGoogleKeywords(referer) {
	
	var Keywords='';
	var StartPos=0;
	var EndString='';
	
	if (referer contains 'google.com') {
		StartPos=ReFindNoCase('q=.',referer);
	
		if (StartPos GT 0) {
			EndString=mid(referer,StartPos+2,Len(referer));
			Keywords=ReReplaceNoCase(EndString,'&.*','','ALL');
			Keywords=URLDecode(Keywords);
			}
		
		return Keywords;
	}
	else {
		return '';
	}
	
	
	
}
</cfscript>

<cfscript>
/**
 * Returns the host from a specified URL.
 * RE fix for MX, thanks to Tom Lane
 * 
 * @param this_url 	 URL to parse. (Required)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 2, August 23, 2002 
 */
function GetHostFromURL(this_url) {
	var first_char       = "";
	var re_found_struct  = "";
	var num_expressions  = 0;
	var num_dots         = 0;
	var this_host        = "";
	
	this_url = trim(this_url);
	
	first_char = Left(this_url, 1);
	if (Find(first_char, "./")) {
		return "";   // relative URL = no host   (ex: "../dir1/filename.html" or "/dir1/filename.html")
	} else if(Find("://", this_url)){
		// absolute URL    (ex: "ftp://user:pass@ftp.host.com")
		re_found_struct = REFind("[^@]*@([^/:\?##]+)|([^/:\?##]+)", this_url, Find("://", this_url)+3, "True");
	} else {
		// abbreviated URL (ex: "user:pass@ftp.host.com")
		re_found_struct = REFind("[^@]*@([^/:\?##]+)|([^/:\?##]+)", this_url, 1, "True");
	}
	
	if (re_found_struct.pos[1] GT 0) {
		num_expressions = ArrayLen(re_found_struct.pos);
                if(re_found_struct.pos[num_expressions] is 0) num_expressions = num_expressions - 1;
		this_host = Mid(this_url, re_found_struct.pos[num_expressions], re_found_struct.len[num_expressions]);
		num_dots = (Len(this_host) - Len(Replace(this_host, ".", "", "ALL")));;
		if ((not FindOneOf("/@:", this_url)) and (num_dots LT 2)){
			// since this URL doesn't contain any "/" or "@" or ":" characters and since the "host" has fewer than two dots (".")
			// then it is probably actually a file name
			return ""; 
		}
		return this_host;
	} else {
		return "";
	}
}
</cfscript>

<cfscript>
/**
 * Parses an HTML page and returns the title.
 * 
 * @param str 	 The HTML string to check. 
 * @return Returns a string. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, December 3, 2001 
 */
function GetHTMLTitle(str) {
	var matchStruct = reFindNoCase("<[[:space:]]*title[[:space:]]*>([^<]*)<[[:space:]]*/title[[:space:]]*>",str,1,1);
	if(arrayLen(matchStruct.len) lt 2) { writeoutput("error<BR>");return ""; }
	return Mid(str,matchStruct.pos[2],matchStruct.len[2]);	
}
</cfscript>

<cfscript>
/**
 * Converts Barcode to valid ISBN number (without &quot;-&quot;).
 * 
 * @param BarCodeNum 	 Bar code number. (Required)
 * @return Returns a string. 
 * @author Amar Trivedi (atrivedi@ekomcorp.com) 
 * @version 1, January 28, 2004 
 */
function getISBN(BarCodeNum) {
  var x ='';
  var sum = 0;
  var i = 0;
  var digitsum = 0;
  var ModSum=0;

  // Barcode Must be 13 digits AND numeric 
  if(len(BarCodeNum) NEQ  13) return 0;
  if(not IsNumeric(BarCodeNum)) return 0;
  /** get rid of first 3 characters since they are  NOT used for conversion **/
  x = right(BarCodeNum,10);
  x = left(x,9);
  // loop through middle 9 digits
  for(i = 1; i LTE 9; i = i + 1) {
       digitsum = Mid( x, i, 1 ) * i;
       sum = sum + digitsum;
  }
  // check for the last letter/digit
  ModSum = sum MOD 11;
  if(ModSum EQ 10) ModSum = "x";
  return x & ModSum;
}
</cfscript>

<cfscript>
/**
 * Display N leading characters of a text block which may include HTML.
 * 
 * @param input 	 String to parse. (Required)
 * @param maxChars 	 Maximum number of characters. (Required)
 * @return Returns a string. 
 * @author Max Paperno (max@wdg.us) 
 * @version 1, June 18, 2010 
 */
function getLeadingHtml(input, maxChars) {
	// token matches a word, tag, or special character
	var	token = "[[:word:]]+|[^[:word:]<]|(?:<(\/)?([[:word:]]+)[^>]*(\/)?>)|<";
	var	selfClosingTag = "^(?:[hb]r|img)$";
	var	output = "";
	var	charCount = 0;
	var	openTags = ""; var strPos = 0; var tag = "";
	var i = 1;

	var	match = REFind(token, input, i, "true");

	while ( (charCount LT maxChars) AND match.pos[1] ) {
		// If this is an HTML tag
		if (match.pos[3]) {
			output = output & Mid(input, match.pos[1], match.len[1]);
			tag = Mid(input, match.pos[3], match.len[3]);
			// If this is not a self-closing tag
			if ( NOT ( match.pos[4] OR REFindNoCase(selfClosingTag, tag) ) ) {
				// If this is a closing tag
				if ( match.pos[2] AND ListFindNoCase(openTags, tag) ) {
					openTags = ListDeleteAt(openTags, ListFindNoCase(openTags, tag)); 
				} else {
					openTags = ListAppend(openTags, tag);
				}
			}
		} else {
			charCount = charCount +  match.len[1];
			if (charCount LTE maxChars) output = output & Mid(input, match.pos[1], match.len[1]);
		}
		
		i = i + match.len[1];
		match = REFind(token, input, i, "true");
	}

	// Close any tags which were left open
	while ( ListLen(openTags) ) {
		output = output & "</" & ListLast(openTags) & ">";
		openTags = ListDeleteAt(openTags, ListLen(openTags));
	}

	if ( Len(input) GT Len(output) )
		output = output & "...";
	
	return output;
}
</cfscript>

<cfscript>
/**
 * Finds all anchor or frame tags and creates a structure that you can use to look up a URL by name.
 * 
 * @param BodyText 	 String to parse. (Required)
 * @return Returns a structure of matches. 
 * @author James Moberg (james@ssmedia.com) 
 * @version 1, February 21, 2011 
 */
function getLinks(BodyText){
	var objLinks = StructNew();
	var objIndex = StructNew();
	var arrLink = ArrayNew(1);
	var arrDesc = ArrayNew(1);
	var nextMatch = 1;
	var Counter = 1;
	do { /* find opening anchor tag. */
		objMatch = REFindNoCase("<(A|FRAME)[[:space:]]+[^>]*(HREF|SRC) ?= ?[""']?([^[:space:]""'>]+)(>|(([""']|[[:space:]])[^>]*>))", BodyText, nextMatch, true);
		nextMatch = objMatch.pos[1] + objMatch.len[1];
		if (ArrayLen(objMatch.pos) GTE 4) {
			thisURL = Mid(BodyText, objMatch.pos[4], objMatch.len[4]);
			thisTag = Mid(BodyText, objMatch.pos[2], objMatch.len[2]);
			if (CompareNoCase(thisTag, "A") EQ 0) {
				descEnd = FindNoCase("</A>", BodyText, nextMatch);
				thisDesc = Mid(BodyText, nextMatch, descEnd - nextMatch);
				nextMatch = descEnd + 4;
			} else { /* get the frame name */
				fullTag = Mid(BodyText, objMatch.pos[1], objMatch.len[1]);
				frameName = "";
				objFrame = REFindNoCase("NAME ?= ?[""']?([^[:space:]""'>]+)(>|(([""']|[[:space:]])[^>]*>))", fullTag, 1, true);
				if (ArrayLen(objFrame.pos) GT 1) {
					frameName = Mid(fullTag, objFrame.pos[2], objFrame.len[2]);
				}
				thisDesc = "FRAME: " & frameName;
			}
			StructInsert(objIndex, thisDesc, Counter, true);
			arrLink[Counter] = thisURL;
			arrDesc[Counter] = thisDesc;
			Counter = Counter + 1;
		}
	} while (nextMatch NEQ 0);
	StructInsert(objLinks, "index", objIndex);
	StructInsert(objLinks, "link", arrLink);
	StructInsert(objLinks, "desc", arrDesc);
	return objLinks;
}
</cfscript>

<cfscript>
/**
 * Parses an HTML string and returns META tag information.
 * Regex fix for names with spaces by Johan Steenkamp (johan@orbital.co.nz).
 * Fix for self closing tags.
 * 
 * @param str 	 The string to check. (Required)
 * @return Returns an array. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 4, May 2, 2007 
 */
function GetMetaHeaders(str) {
	var matchStruct = structNew();
	var name = "";
	var content = "";
	var results = arrayNew(1);
	var pos = 1;
	var regex = "<meta[[:space:]]*(name|http-equiv)[[:space:]]*=[[:space:]]*(""|')([^""]*)(""|')[[:space:]]*content=(""|')([^""]*)(""|')[[:space:]]*/{0,1}>"; 	
	
	matchStruct = REFindNoCase(regex,str,pos,1);
	while(matchStruct.pos[1]) {
		results[arrayLen(results)+1] = structNew();
		results[arrayLen(results)][ Mid(str,matchStruct.pos[2],matchStruct.len[2])] = Mid(str,matchStruct.pos[4],matchStruct.len[4]);
		results[arrayLen(results)].content = Mid(str,matchStruct.pos[7],matchStruct.len[7]);
		pos = matchStruct.pos[6] + matchStruct.len[6] + 1;
		matchStruct = REFindNoCase(regex,str,pos,1);
	}
	return results;
}
</cfscript>

<cfscript>
/**
 * Extracts the initials of a name from long string.
 * 
 * @param str 	 String to parse. (Required)
 * @return Returns a string. 
 * @author Anonymous (anonymous@gmail.com) 
 * @version 1, October 4, 2007 
 */
function getNameInitials(str) {
	var newstr = "";
	var word = "";
	var i = 1;
	var strlen = listlen(str," ");
	for(i=1;i lte strlen;i=i+1) {
		word = ListGetAt(str,i," ");
		newstr = newstr & UCase(Left(word,1));
	}
	return newstr;
}
</cfscript>

<cfscript>
/**
 * Returns the passed string with all non-numbers removed (letters, punctuation, whitespace, etc.).
 * 
 * @param textStr 	 String containing numbers you want returned. 
 * @param allowDec 	 Boolean (yes/no) indicating whether to preserve decimal points.  Default is No. 
 * @return Returns a number. 
 * @author Mark Andrachek (hallow@webmages.com) 
 * @version 1, December 18, 2001 
 */
function GetNumbers(textstr) {
  if (arraylen(arguments) GTE 2) { 
    return REReplace(textstr,"[^0-9\.]",'','ALL'); }
  else { 
    return REReplace(textstr,"[^0-9]",'','ALL');  }
}
</cfscript>

<cfscript>
/**
 * Count the occureneces of a value or list of values in a given string.
 * 
 * @param content 	 String to parse. (Required)
 * @param countThis 	 Character, or list of characters to count. (Required)
 * @param countThisDelimiter 	 Delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Cody Ridgway (cridgway@dcccd.edu) 
 * @version 1, October 13, 2006 
 */
function getOccurrenceCount(content, countThis) {
	var countThisDelimiter = ','; 
	var countThisLen = 1; 
	var countThisItem = ';
	var returnCount = ';
	var i = 1;
	
	if(arrayLen(Arguments) GT 2) countThisDelimiter = Left(arguments[3],1);
	countThisLen = ListLen(countThis, countThisDelimiter);
	
	if(countThisLen GT 1) {
		for(i=1; i LTE countThisLen; i=i+1){
			countThisItem = listGetAt(countThis, i, countThisDelimiter);
			returnCount = ListAppend(returnCount, val(len(content) - len(replace(content,countThisItem,"","all")))/Len(countThisItem));
		}
	}
	else{
		returnCount = val(len(content) - len(replace(content,countThis,"","all")))/Len(countThis);
	}
	return returnCount;
}
</cfscript>

<cfscript>
/**
 * Returns the 2 character english text ordinal for numbers.
 * 
 * @param num 	 Number you wish to return the ordinal for. (Required)
 * @return Returns a string. 
 * @author Mark Andrachek (hallow@webmages.com) 
 * @version 1, November 5, 2003 
 */
function GetOrdinal(num) {
  // if the right 2 digits are 11, 12, or 13, set num to them.
  // Otherwise we just want the digit in the one's place.
  var two=Right(num,2);
  var ordinal="";
  switch(two) {
       case "11": 
       case "12": 
       case "13": { num = two; break; }
       default: { num = Right(num,1); break; }
  }

  // 1st, 2nd, 3rd, everything else is "th"
  switch(num) {
       case "1": { ordinal = "st"; break; }
       case "2": { ordinal = "nd"; break; }
       case "3": { ordinal = "rd"; break; }
       default: { ordinal = "th"; break; }
  }

  // return the text.
  return ordinal;
}
</cfscript>

<cfscript>
/**
 * Returns the password from a specified URL.
 * 
 * @param this_url 	 URL to parse. 
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, February 21, 2002 
 */
function GetPasswordFromURL(this_url) {
	var first_char       = "";
	var re_found_struct  = "";
	
	this_url = trim(this_url);
	
	first_char = Left(this_url, 1);
	if (Find(first_char, "./")) {
		return "";   // relative URL = no password   (ex: "../dir1/filename.html" or "/dir1/filename.html")
	} else if(Find("://", this_url)){
		// absolute URL    (ex: "ftp://user:pass@ftp.host.com")
		re_found_struct = REFind("[^:]*:([^@]*@)", this_url, Find("://", this_url)+3, "True");
	} else {
		// abbreviated URL (ex: "user:pass@ftp.host.com")
		re_found_struct = REFind("[^:]*:([^@]*@)", this_url, 1, "True");
	}
	
	if (re_found_struct.pos[1] GT 0) {
		return Mid(this_url, re_found_struct.pos[2], re_found_struct.len[2]-1);
	} else {
		return "";
	}
}
</cfscript>

<cfscript>
/**
 * Returns the path from a specified URL.
 * 
 * @param this_url 	 URL to parse. 
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, February 21, 2002 
 */
function GetPathFromURL(this_url) {
	var first_char        = "";
	var re_found_struct   = "";
	var path              = "";
	var i                 = 0;
	var cnt               = 0;
	
	this_url = trim(this_url);
	
	first_char = Left(this_url, 1);
	if (Find(first_char, "./")) {
		// relative URL (ex: "../dir1/filename.html" or "/dir1/filename.html")
		re_found_struct = REFind("[^##\?]+", this_url, 1, "True");
	} else if(Find("://", this_url)){
		// absolute URL    (ex: "ftp://user:pass@ftp.host.com")
		re_found_struct = REFind("/[^##\?]*", this_url, Find("://", this_url)+3, "True");
	} else {
		// abbreviated URL (ex: "user:pass@ftp.host.com")
		re_found_struct = REFind("/[^##\?]*", this_url, 1, "True");
	}
	
	if (re_found_struct.pos[1] GT 0)  {
		// get path with filename (if exists)
		path = Mid(this_url, re_found_struct.pos[1], re_found_struct.len[1]);
		
		// chop off the filename
 		if(find("/", path)) {
			i = len(path) - find("/" ,reverse(path)) +1;
			cnt = len(path) -i;
			if (cnt LT 1) cnt =1;
			if (REFind("[^##\?]+\.[^##\?]+", Right(path, cnt))){
				// if the part after the last slash is a file name then chop it off
				path = Left(path, i);
			}
		}
		return path;
	} else {
		return "";
	}
}
</cfscript>

<cfscript>
/**
 * Returns the port number from a specified URL.
 * 
 * @param this_url 	 URL to parse. 
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, February 21, 2002 
 */
function GetPortFromURL(this_url) {
	var re_found_struct = "";
	
	this_url = trim(this_url);
	
	re_found_struct = REFind("[^./].[^./:]+(:[[:digit:]]+)", this_url, 1, "True");

	if (re_found_struct.pos[1] GT 0) {
		return Mid(this_url, re_found_struct.pos[2]+1, re_found_struct.len[2]-1);
	} else {
		return "";
	}
}
</cfscript>

<cfscript>
/**
 * Returns a random alphanumeric string of a user-specified length.
 * 
 * @param stringLenth 	 Length of random string to generate. (Required)
 * @return Returns a string. 
 * @author Kenneth Rainey (kip.rainey@incapital.com) 
 * @version 1, February 3, 2004 
 */
function getRandString(stringLength) {
	var tempAlphaList = "a|b|c|d|e|g|h|i|k|L|m|n|o|p|q|r|s|t|u|v|w|x|y|z";
	var tempNumList = "1|2|3|4|5|6|7|8|9|0";
	var tempCompositeList = tempAlphaList&"|"&tempNumList;
	var tempCharsInList = listLen(tempCompositeList,"|");
	var tempCounter = 1;
	var tempWorkingString = "";
	
	//loop from 1 to stringLength to generate string
	while (tempCounter LTE stringLength) {
		tempWorkingString = tempWorkingString&listGetAt(tempCompositeList,randRange(1,tempCharsInList),"|");
		tempCounter = tempCounter + 1;
	}
	
	return tempWorkingString;
}
</cfscript>

<cfscript>
/**
 * Returns the scheme from a specified URL.
 * 
 * @param this_url 	 URL to parse. 
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, February 21, 2002 
 */
function GetSchemeFromURL(this_url) {
	var i = 0;
	
	this_url = trim(this_url);
	
	i = Find("://", this_url, 1);
	if (i LT 1) {
		return ""; // relative url = no scheme   (ex: "../dir1/filename.html" or "/dir1/filename.html")
	} else {
		return Left(this_url, i+2);  // return the "://" and everything to the left of it
	}
}
</cfscript>

<cfscript>
/**
 * Returns the search part from a specified URL.
 * 
 * @param this_url 	 URL to parse. 
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, February 21, 2002 
 */
function GetSearchFromURL(this_url) {
	var re_found_struct = "";
	
	this_url = trim(this_url);
	
	// the search part is simply everything after a "?" character
	re_found_struct = REFind("\?.*", this_url, 1, "True");
	
	if (re_found_struct.pos[1] GT 0) {
		return Mid(this_url, re_found_struct.pos[1]+1, re_found_struct.len[1]);
	} else return "";
}
</cfscript>

<!---
 Creates an HTTPS URL for the current page, or for given page information.
 
 @param domain 	 url to secure (Optional)
 @param path 	 page to secure (Optional)
 @param queryString 	 queryString for page (Optional)
 @param port 	 additional port to use in url (Optional)
 @return Returns a string 
 @author Jon Hartmann (jon.hartmann@gmail.com) 
 @version 0, May 9, 2009 
--->
<cffunction name="GetSecureURL" output="false" returntype="string">
	<cfargument name="domain" typ="string" required="false" default="#cgi.server_name#" />
	<cfargument name="path" typ="string" required="false" default="#cgi.script_name#" />
	<cfargument name="queryString" typ="string" required="false" default="#cgi.query_string#" />
	<cfargument name="port" typ="string" required="false" default="#cgi.server_port#" />
	
	<cfset var HTTPSURL = "https://" & arguments.domain />
	
	<cfif IsNumeric(arguments.port)>
		<cfset HTTPSURL = HTTPSURL & ":" & arguments.port />
	</cfif>
	
	<cfset HTTPSURL = HTTPSURL & arguments.path />
	
	<cfif Len(arguments.queryString)>
		<cfset HTTPSURL = HTTPSURL & "?" & arguments.queryString />
	</cfif>
	
	<cfreturn HTTPSURL />
</cffunction>

<cfscript>
/**
 * This UDF will take a Tab delimited text file and parse it into a mutlidimensional array
 * 
 * @param x 	 Tab text to parse. (Required)
 * @return Retuns an array. 
 * @author Ray Bayly (rbayly@mediageneral.com) 
 * @version 1, May 9, 2003 
 */
function GetTabTextFeed(X){
	//Declare all variables used within this UDF
	var Xy = "";//This is an array that holds the lines
	var Xc = "";//this is the count for the number of lines 
 	var Yl = "";//This is a temp holder for the line
	var Yc = "";//This holds the length of the line bieng called
	var Yt = "";//this is an array that holds the line
	var i = 1;
	
	Xy = ArrayNew(1);
	Xc = ListLen(X, chr(10));
	for(i=1;i LTE Xc;i=i+1){
		Yl = ListGetAt(X, i, chr(10));
		//Now I check for missing data 
		Yl = replaceNoCase(Yl, "		", "	NA	", "ALL");
		Yl = replaceNoCase(Yl, "	 	", "	NA	", "ALL");
		Yl = replaceNoCase(Yl, "			", "	NA	NA	", "ALL");
	    //I know redundant code but for some reason it does not 
		//catch all the tabs the first time through
	 	Yl = replaceNoCase(Yl, "		", "	NA	", "ALL");
		Yl = replaceNoCase(Yl, "	 	", "	NA	", "ALL");
		Yl = replaceNoCase(Yl, "			", "	NA	NA	", "ALL");
		//Now we grab the size of the Line/List
		Yc = ListLen(Yl, chr(9));
		//Set Yt as the array for the line
		Yt = ArrayNew(1);
		for(ix=1;ix LTE Yc;ix=ix+1){
			//load each piece of text into an Array Dimension
			Yt[ix] = ListGetAt(Yl, ix, chr(9));
		}
		//Add the New "Array Line" to the Master Array
		Xy[i] = Yt;
	}
	return Xy;
}
</cfscript>

<cfscript>
/**
 * Returns the content enclosed in a tag pair.
 * 
 * @param tag 	 The tag to look for. Should be passed without < or > and without attributes. (Required)
 * @param string 	 The string to search. (Required)
 * @return Returns a string. 
 * @author Johan Steenkamp (johan@orbital.co.nz) 
 * @version 1, September 16, 2002 
 */
function getTagContent(tag,str) {
	var matchStruct = structNew();
	var startTag = "<#tag#[^>]*>";
	var endTag = "</#tag#>";
	var endTagStart = 0;
	matchStruct = REFindNoCase(startTag,str,1,"true");
	if(matchStruct.len[1] eq 0 ) return ""; 
	endTagStart = REFindNoCase(endTag,str,matchStruct.pos[1],"false");
	return Mid(str,matchStruct.pos[1]+matchStruct.len[1],endTagStart-matchStruct.pos[1]-matchStruct.len[1]);
}
</cfscript>

<cfscript>
/**
 * Extract all occurrences of a given tag pair from a string.
 * 
 * @param tag 	 Tag to look for. Do not include brackets. (Required)
 * @param str 	 String to parse. (Required)
 * @return Returns an array. 
 * @author Todd Sharp (todd@cfsilence.com) 
 * @version 1, October 24, 2008 
 */
function getTagContentAll(tag,str) {
	var matchStruct = structNew();
	var matchPos = "";
	var matchLen = "";
	var startTag = "<#lcase(tag)#";
	var endTag = "</#tag#>";
	var endTagStart = 0;
	var firstOcc = REFindNoCase(startTag,str,1,true);
	var returnArray = ArrayNew(1);

	//check the char following the tag - if it closes the tag then set the startTag accordingly
	if(mid(str, firstOcc.pos[1]+len(startTag),1) eq ">") {
		startTag = "<#tag#>";
	} else {
	//there are attributes so the RE should accommodate
	//include a space following the tag name so that searching
	//for 'b' does not find 'b' and 'body', etc
	startTag = "<#tag# [^>]*>";
	}

	matchStruct = REFindNoCase(startTag,str,1,"true");
	matchPos = matchStruct.pos [1];
	matchLen = matchStruct.len[1];
	
	if(matchLen eq 0) return returnArray;
	endTagStart = REFindNoCase(endTag,str,matchPos,"false");
	//if no end tag exists return out
	if(endTagStart eq 0) return returnArray;

	ArrayAppend(returnArray,Mid(str,matchPos+matchLen,endTagStart-matchPos-matchLen));

	while (matchLen neq 0) {
		matchStruct = REFindNoCase(startTag,str,matchPos+matchLen,"true");
		matchPos = matchStruct.pos [1];
		matchLen = matchStruct.len[1];
		if(matchLen eq 0) return returnArray;
		endTagStart = REFindNoCase(endTag,str,matchPos,"false");
		ArrayAppend(returnArray,Mid(str,matchPos+matchLen,endTagStart-matchPos-matchLen));
	}

	return returnArray;
}
</cfscript>

<cfscript>
/**
 * Returns the username from a specified URL.
 * Modified to handle differences in regex in cf5/mx. Thanks to Tom Lane for pointing out the issue.
 * 
 * @param this_url 	 URL to parse. (Required)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 2, August 23, 2002 
 */
function GetUsernameFromURL(this_url) {
	var first_char       = "";
	var re_found_struct  = "";
	var num_expressions  = 0;
	
	this_url = trim(this_url);
	
	first_char = Left(this_url, 1);
	if (Find(first_char, "./")) {
		return "";   // relative URL = no username (ex: "../dir1/filename.html" or "/dir1/filename.html")
	} else if(Find("://", this_url)){
		// absolute URL    (ex: "ftp://user:pass@ftp.host.com")
		re_found_struct = REFind("(([^:@]*:)[^:@]*@)|([^:@]*@)", this_url, Find("://", this_url)+3, "True");
	} else {
		// abbreviated URL (ex: "user:pass@ftp.host.com")
		re_found_struct = REFind("(([^:@]*:)[^:@]*@)|([^:@]*@)", this_url, 1, "True");
	}
	
	if (re_found_struct.pos[1] GT 0) {
		num_expressions = ArrayLen(re_found_struct.pos);
		if(re_found_struct.pos[num_expressions] is 0) num_expressions = num_expressions - 1;
		return Mid(this_url, re_found_struct.pos[num_expressions], re_found_struct.len[num_expressions]-1);
	} else {
		return "";
	}
}
</cfscript>

<cfscript>
/**
 * Shortens a string without cutting words in half.
 * Modified by Raymond Camden on July 30, 2001
 * 
 * @param str 	 The string to modify. 
 * @param words 	 The number of words to display. 
 * @author David Grant (david@insite.net) 
 * @version 2, July 30, 2001 
 */
function getWords(str,words) {
	var numWords = 0;
	var oldPos = 1;
	var i = 1;
	var strPos = 0;
	
	str = trim(str);
	str = REReplace(str,"[[:space:]]{2,}"," ","ALL");
	numWords = listLen(str," ");
	if (words gte numWords) return str;
	for (i = 1; i lte words; i=i+1) {
		strPos = find(" ",str,oldPos);
		oldPos = strPos + 1;
	}
	if (len(str) lte strPos) return left(str,strPos-1);
	return left(str,strPos-1) & "...";
}
</cfscript>

<!---
 Compresses a string using the gzip algorithm; returns binary or a string of (base64|hex|uu).
 
 @param text 	 String to compress. (Required)
 @param format 	 binary,base64,hex, or uu. Defaults to binary. (Optional)
 @return Returns a string. 
 @author Oblio Leitch (oleitch@locustcreek.com) 
 @version 1, November 14, 2007 
--->
<cffunction name="gzip"
	returntype="any"
	displayname="gzip"
	hint="compresses a string using the gzip algorithm; returns binary or string(base64|hex|uu)"
	output="no">
	<!---
		Acknowledgements:
		Andrew Scott, original gzip compression routine
		 - http://www.andyscott.id.au/index.cfm/2006/9/12/Proof-of-Concept
	--->
	<cfscript>
		var result="";
		var text=createObject("java","java.lang.String").init(arguments[1]);
		var dataStream=createObject("java","java.io.ByteArrayOutputStream").init();
		var compressDataStream=createObject("java","java.util.zip.GZIPOutputStream").init(dataStream);
		compressDataStream.write(text.getBytes());
		compressDataStream.finish();
		compressDataStream.close();

		if(arrayLen(arguments) gt 1){
			result=binaryEncode(dataStream.toByteArray(),arguments[2]);
		}else{
			result=dataStream.toByteArray();
		}
		return result;
	</cfscript>
</cffunction>

<cfscript>
/**
 * Converts a hex value to a string.
 * 
 * @param hex 	 Hex string. (Required)
 * @return Returns a string. 
 * @author Michael Krock (michael.krock@avv.com) 
 * @version 1, January 28, 2004 
 */
function hexToString(hex) {
	
	var str = "";
	var i = 0;
		
	for (i=1; i LTE len(hex); i=i+2) {
		str = str & chr(inputBaseN(mid(hex,i,2),16));
	}
		
	return str;
}
</cfscript>

<cfscript>
/**
 * Disguise a link using JavaScript's window.status attribute.
 * 
 * @param href 	 URL for the link. (Required)
 * @param display 	 Text to disply in window.status. (Required)
 * @param caption 	 Text for the link. (Required)
 * @return Returns a string. 
 * @author Jeff Guillaume (jeff@kazoomis.com) 
 * @version 1, September 20, 2002 
 */
function HideLink(href, display, caption) {

	var str = "";
	
	str = "<a href=""#XMLFormat(href)#"" onmouseover=""window.status='#XMLFormat(display)#'; return true;"" onmouseout=""window.status=''; return true;""";
	str = str & ">";
	str = str & "#caption#</a>";
	
	return str;
	
}
</cfscript>

<cfscript>
/**
 * Applies a simple highlight to a word in a string.
 * Original version by Raymond Camden.
 * 
 * @param string 	 The string to format. (Required)
 * @param word 	 The word to highlight. (Required)
 * @param front 	 This is the HTML that will be placed in front of the highlighted match. It defaults to <span style= (Optional)
 * @param back 	 This is the HTML that will be placed at the end of the highlighted match. Defaults to </span> (Optional)
 * @param matchCase 	 If true, the highlight will only match when the case is the same. Defaults to false. (Optional)
 * @return Returns a string. 
 * @author Dave Forrest (dmf67@yahoo.com) 
 * @version 2, June 12, 2003 
 */
function highLight(source,lookfor) {
	var tmpOn       = "[;;^";
	var tmpOff      = "^;;]";
	var hilightitem	= "<SPAN STYLE=""background-color:yellow;"">";
	var endhilight  = "</SPAN>";
	var matchCase   = false;
	var obracket    = "";
	var tmps		= "";
	var stripperRE  = "";
	var badTag		= "";
	var nextStart	= "";
	
	if(ArrayLen(arguments) GTE 3) hilightitem = arguments[3];
	if(ArrayLen(arguments) GTE 4) endhilight  = arguments[4];
	if(ArrayLen(arguments) GTE 5) matchCase   = arguments[5];
	if(NOT matchCase) 	source = REReplaceNoCase(source,"(#lookfor#)","#tmpOn#\1#tmpOff#","ALL");
	else 				source = REReplace(source,"(#lookfor#)","#tmpOn#\1#tmpOff#","ALL");
	obracket   = find("<",source);
	stripperRE = "<.[^>]*>";	
	while(obracket){
		badTag = REFindNoCase(stripperRE,source,obracket,1);
		if(badTag.pos[1]){
			tmps 	  = Replace(Mid(source,badtag.pos[1],badtag.len[1]),"#tmpOn#","","ALL");
			source 	  = Replace(source,Mid(source,badtag.pos[1],badtag.len[1]),tmps,"ALL");
			tmps 	  = Replace(Mid(source,badtag.pos[1],badtag.len[1]),"#tmpOff#","","ALL");
			source 	  = Replace(source,Mid(source,badtag.pos[1],badtag.len[1]),tmps,"ALL");
			nextStart = badTag.pos[1] + badTag.len[1];
		}
		else nextStart = obracket + 1;
		obracket = find("<",source,nextStart);
	}
	source = Replace(source,tmpOn,hilightitem,"ALL");
	source = Replace(source,tmpOff,endhilight,"ALL");
	return source;
}
</cfscript>

<!---
 Crops a string and highlights keywords.
 v2 mods by Tuyen (tuyen.k.tran@gmail.com).
 
 @param string 	 String to scan/crop. (Required)
 @param term 	 Search term to find/highlight. Can be a list. (Required)
 @param size 	 Size of the cropped string. Defaults to total size of the string. (Optional)
 @param wrap 	 The HTML to use to wrap the term. (Optional)
 @return Returns a string. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, March 24, 2010 
--->
<cffunction name="highlightAndCrop" access="public" output="false" hint="Given an arbitrary string and a search term, find it, and return a 'cropped' set of text around the match.">
	<cfargument name="string" type="string" required="true" hint="Main blob of text">
	<cfargument name="term" type="string" required="true" hint="Keyword to look for.">
	<cfargument name="size" type="numeric" required="false" hint="Size of result string. Defaults to total size of string. Note this is a bit fuzzy - we split it in two and return that amount before and after the match. The size of term and wrap will therefore impact total string length.">
	<cfargument name="wrap" type="string" required="false" default="<b></b>" hint="HTML to wrap the match. MUST be one pair of HTML tags.">

	<cfset var excerpt = "">
	<cfset var pad = "">
	<cfset var match = "">
	<cfset var thisKeyword = "">
	<cfset var end = "">
	<cfset var endInitialTag = "">
	<cfset var beginTag = "">
	<cfset var endTag = "">
	
	<!--- clean the string --->
	<cfset arguments.string = trim(rereplace(arguments.string, "<.*?>", "", "all"))>

	<!--- pad is half our total --->
	<cfif not structKeyExists(arguments, "size")>
		<cfset arguments.size = len(arguments.string)>
	</cfif>
	<cfset pad = ceiling(arguments.size/2)>

	<cfloop list="#arguments.term#" index="thisKeyword">
		<cfif match is 0>
			<cfset match = findNoCase(thisKeyword, arguments.string)>
		<cfelseif findNoCase(thisKeyword, arguments.string) lt match>
			<cfset match = findNoCase(thisKeyword, arguments.string)>
		</cfif>
	</cfloop>
	   
	<cfif match lte pad>
		<cfset match = 1>
	</cfif>
	<cfset end = match + len(arguments.term) + arguments.size>

	<!--- now create the main string around the match --->
	<cfif len(arguments.string) gt arguments.size>
		<cfif match gt 1>
			<cfset excerpt = "..." & mid(arguments.string, match-pad, end-match)>
		<cfelse>
			<cfset excerpt = left(arguments.string,end)>
		</cfif>
		<cfif len(arguments.string) gt end>
			<cfset excerpt = excerpt & "...">
		</cfif>
	<cfelse>
		<cfset excerpt = arguments.string>
	</cfif>

	<!--- split up my wrap - I bet this can be done better... --->
	<cfset endInitialTag = find(">",arguments.wrap)>
	<cfset beginTag = left(arguments.wrap, endInitialTag)>
	<cfset endTag = mid(arguments.wrap, endInitialTag+1, len(arguments.wrap))>

	<cfloop list="#arguments.term#" index="thisKeyword">
		<cfset excerpt = reReplaceNoCase(excerpt, "(#thisKeyword#)", "#beginTag#\1#endTag#","all")>
	</cfloop>
	<cfreturn excerpt>
</cffunction>

<cfscript>
/**
 * Applies a simple highlight from and to a given position in a string.
 * version 2 by rcmamden
 * 
 * @param str 	 String to modify. (Required)
 * @param start 	 Position to insert highlight. (Required)
 * @param end 	 Position to end highlight. (Required)
 * @param startHi 	 String to use for the beginning of the highlight. Defaults to <span style="background-color: yellow;"> (Optional)
 * @param endHi 	 String to use for the end of the highlight. Defaults to </span> (Optional)
 * @return Returns a string. 
 * @author Scott Delatush (delatush@yahoo.com) 
 * @version 2, September 24, 2002 
 */
function HighLightFromTo(str,start, end) {
	var startHi = "<span style=""background-color: yellow;"">";
	var endHi = "</span>";

	if(arrayLen(arguments) gte 4) startHi = arguments[4];
	if(arrayLen(arguments) gte 5) endHi = arguments[5];

	if(start gte (len(str) - 1)) return str;
	if(end gte len(str)) end = len(str);

	str = insert(startHi,str,start-1);
	str = insert(endHi,str,end+len(startHi));
	return str;
}
</cfscript>

<cfscript>
/**
 * Highlights words in a string that are found in a keyword list.
 * v0.9 by Simon Bingham.
 * v1.0 by Adam Cameron. Improved regex and added configurable highlighting.
 * 
 * @param str 	 The string to highlight. (Required)
 * @param keywords 	 The list of keywords to highlight within the string. (Required)
 * @param highlight 	 A struct containing keys for tag and attributes, These are used to highlight the keyword. Defaults to an EM tag. (Required)
 * @return Returns the string  with the keywords highlighted. 
 * @author Simon Bingham (me@simonbingham.me.uk) 
 * @version 1.0, September 29, 2012 
 */
string function highlightKeywords(required string str, required string keywords, struct highlight){
	var keyword		= "";
	var replacement	= "";
	
	param name="highlight.tag"			default="em";
	param name="highlight.attributes"	default="";
	
	for (var index=1; index <= listLen( arguments.keywords ); index++){
		keyword = listGetAt(arguments.keywords, index);
		replacement = "<#highlight.tag#";
		if (len(highlight.attributes)){
			replacement &= " #highlight.attributes#";
		}
		replacement &= ">" & keyword & "</#highlight.tag#>";

		arguments.str = reReplaceNoCase( arguments.str, "\b#keyword#\b", replacement, "all" );
	}
	return arguments.str;
}
</cfscript>

<cfscript>
/**
 * Formats a time difference in hours, minutes and seconds.
 * 
 * @param time 	 An integer representing a time duration. (Required)
 * @param type 	 The type of the time duration. Defaults to milliseconds. (Optional)
 * @param mask 	 Mask for HSMFormat. Defaults to "HH:MM:SS" (Optional)
 * @param displayMS 	 Boolean to display milliseconds. Defaults to false. (Optional)
 * @return Returns a string. 
 * @author Pascal Peters (ppeters@lrt.be) 
 * @version 1, May 14, 2002 
 */
function HMSFormat(time) {
	var str = "";
	var tmptime = 0;
	var h = 0;
	var m = 0;
	var s = 0;
	var sign = "";
	// default values for optional parameters
	var type = "ms";
	var mask = "HH:MM:SS";
	var displayMs = false;
	
	if(ArrayLen(Arguments) gte 2) type = Arguments[2];
	if(ArrayLen(Arguments) gte 3) mask = Arguments[3];
	if(ArrayLen(Arguments) gte 4) displayMs = Arguments[4];
	
	if(not IsNumeric(time)) return time;
	if(time lt 0){
		time = Abs(time);
		sign = "-";
	} 
	
	switch(type){
	case "h":
		h = int(time);
		tmptime = (time - h)*60;
		m = int(tmptime);
		s = (tmptime - m)*60;
		break;
	case "m":
		h = int(time/60);
		tmptime = time - h*60;
		m = int(tmptime);
		s = (tmptime - m)*60;
		break;
	case "s":
		h = int(time/3600);
		tmptime = time - h*3600;
		m = int(tmptime/60);
		s = tmptime - m*60;
		break;
	default:
		h = int(time/3600000);
		tmptime = time - h*3600000;
		m = int(tmptime/60000);
		tmptime = tmptime - m*60000;
		s = tmptime/1000;
		break;
	}
	
	m = NumberFormat(m,"00");
	if(displayMs) s = NumberFormat(s,"00.000");
	else s = NumberFormat(Round(s),"00");
	str = Replace(mask,"HH",sign & h,"ALL");
	str = Replace(str,"MM",m,"ALL");
	str = Replace(str,"SS",s,"ALL");

	return str;
}
</cfscript>

<cfscript>
/**
 * Extracts all links from a given string and puts them into a list.
 * 
 * @param inputString 	 String to parse. (Required)
 * @param delimiter 	 Delimiter for returned list. Defaults to a comma. (Optional)
 * @return Returns a list. 
 * @author Marcus Raphelt (cfml@raphelt.de) 
 * @version 1, February 22, 2006 
 */
function hrefsToList(inputString) {
	var pos=1;
	var tmp=0;
	var linklist = "";
	var delimiter = ",";
	var endpos = "";
	
	if(arrayLen(arguments) gte 2) delimiter = arguments[2];
		
	while(1) {
		tmp = reFindNoCase("<a[^>]*>[^>]*</a>", inputString, pos);
		if(tmp) {
			pos = tmp;
			endpos = findNoCase("</a>", inputString, pos)+4;
			linkList = listAppend(linkList, mid(inputString, pos, endpos-pos), delimiter);
			pos = endpos;
		}
		else break;
	}

	return linkList;
}
</cfscript>

<cfscript>
/**
 * Replaces a huge amount of unnecessary whitespace from your HTML code.
 * 
 * @param sInput 	 HTML you wish to compress. (Required)
 * @return Returns a string. 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 1, November 19, 2002 
 */
function HtmlCompressFormat(sInput)
{
   var level = 2;
   if( arrayLen( arguments ) GTE 2 AND isNumeric(arguments[2]))
   {
      level = arguments[2];
   }
   // just take off the useless stuff
   sInput = trim(sInput);
   switch(level)
   {
      case "3":
      {
         //   extra compression can screw up a few little pieces of HTML, doh         
         sInput = reReplace( sInput, "[[:space:]]{2,}", " ", "all" );
         sInput = replace( sInput, "> <", "><", "all" );
         sInput = reReplace( sInput, "<!--[^>]+>", "", "all" );
         break;
      }
      case "2":
      {
         sInput = reReplace( sInput, "[[:space:]]{2,}", chr( 13 ), "all" );
         break;
      }
      case "1":
      {
         // only compresses after a line break
         sInput = reReplace( sInput, "(" & chr( 10 ) & "|" & chr( 13 ) & ")+[[:space:]]{2,}", chr( 13 ), "all" );
         break;
      }
   }
   return sInput;
}
</cfscript>

<cfscript>
/**
 * Inverse of HTMLEditFormat, similar to URLDecode
 * v1.0 by Adam Tuttle
 * 
 * @param HTML 	 A string to decode (Required)
 * @return Returns a decoded string 
 * @author Adam Tuttle (adam@fusiongrokker.com) 
 * @version 1.0, July 24, 2013 
 */
function htmlDecode(HTML){
	return replaceList(arguments.HTML, "&lt;,&gt;,&amp;,&quot;", '<,>,&,"');
}
</cfscript>

<cfscript>
/**
 * Converts HTML encoded entities into utf8 characters.
 * version 0.1 by Matt Casey
 * version 1.0 by Adam Cameron - using an array instead of a list converted to an array for the look-up data.  Made replacement case-insensitive.
 * version 1.1 by Adam Cameron - fixing bug that I introduced in v1.0: the replacement should *not* have been case-insensitive! Thanks for the heads-up jeremyhalliwell
 * 
 * @param source 	 A string to parse (Required)
 * @return A string with HTML entities replaced with UTF-8 characters 
 * @author Matt Casey (matt@digitalhappy.com) 
 * @version 1.1, July 28, 2013 
 */
string function htmlEntityToUTF8(required string source){
	var idx = 0;
	var ents = [
		"171","laquo","172","not","173","shy","174","reg","175","macr","176","deg","177","plusmn","178","sup2","179","sup3","180","acute","181","micro","182","para",
		"183","middot","184","cedil","185","sup1","186","ordm","187","raquo","188","frac14","189","frac12","190","frac34","191","iquest","192","Agrave","193","Aacute",
		"194","Acirc","195","Atilde","196","Auml","197","Aring","198","AElig","199","Ccedil","200","Egrave","201","Eacute","202","Ecirc","203","Euml","204","Igrave",
		"205","Iacute","206","Icirc","207","Iuml","208","ETH","209","Ntilde","210","Ograve","211","Oacute","212","Ocirc","213","Otilde","214","Ouml","215","times",
		"216","Oslash","217","Ugrave","218","Uacute","219","Ucirc","220","Uuml","221","Yacute","222","THORN","223","szlig","224","agrave","225","aacute","226","acirc",
		"227","atilde","228","auml","229","aring","230","aelig","231","ccedil","232","egrave","233","eacute","234","ecirc","235","euml","236","igrave","237","iacute",
		"238","icirc","239","iuml","240","eth","241","ntilde","242","ograve","243","oacute","244","ocirc","245","otilde","246","ouml","247","divide","248","oslash",
		"249","ugrave","250","uacute","251","ucirc","252","uuml","253","yacute","254","thorn","255","yuml","402","fnof","913","Alpha","914","Beta","915","Gamma","916","Delta",
		"917","Epsilon","918","Zeta","919","Eta","920","Theta","921","Iota","922","Kappa","923","Lambda","924","Mu","925","Nu","926","Xi","927","Omicron","928","Pi","929","Rho",
		"931","Sigma","932","Tau","933","Upsilon","934","Phi","935","Chi","936","Psi","937","Omega","945","alpha","946","beta","947","gamma","948","delta","949","epsilon",
		"950","zeta","951","eta","952","theta","953","iota","954","kappa","955","lambda","956","mu","957","nu","958","xi","959","omicron","960","pi","961","rho","962","sigmaf",
		"963","sigma","964","tau","965","upsilon","966","phi","967","chi","968","psi","969","omega","977","thetasym","978","upsih","982","piv","8226","bull","8230","hellip",
		"8242","prime","8243","Prime","8254","oline","8260","frasl","8472","weierp","8465","image","8476","real","8482","trade","8501","alefsym","8592","larr","8593","uarr",
		"8594","rarr","8595","darr","8596","harr","8629","crarr","8656","lArr","8657","uArr","8658","rArr","8659","dArr","8660","hArr","8704","forall","8706","part","8707","exist",
		"8709","empty","8711","nabla","8712","isin","8713","notin","8715","ni","8719","prod","8721","sum","8722","minus","8727","lowast","8730","radic","8733","prop","8734","infin",
		"8736","ang","8743","and","8744","or","8745","cap","8746","cup","8747","int","8756","there4","8764","sim","8773","cong","8776","asymp","8800","ne","8801","equiv","8804","le","8805","ge",
		"8834","sub","8835","sup","8836","nsub","8838","sube","8839","supe","8853","oplus","8855","otimes","8869","perp","8901","sdot","8968","lceil","8969","rceil","8970","lfloor",
		"8971","rfloor","9001","lang","9002","rang","9674","loz","9824","spades","9827","clubs","9829","hearts","9830","diams","338","OElig","339","oelig","352","Scaron","353","scaron",
		"376","Yuml","710","circ","732","tilde","8194","ensp","8195","emsp","8201","thinsp","8204","zwnj","8205","zwj","8206","lrm","8207","rlm","8211","ndash","8212","mdash","8216","lsquo",
		"8217","rsquo","8218","sbquo","8220","ldquo","8221","rdquo","8222","bdquo","8224","dagger","8225","Dagger","8240","permil","8249","lsaquo","8250","rsaquo","8364","euro" 
	];
	for (idx=1; idx <=arrayLen(ents); idx+=2){
		arguments.source = replace(arguments.source, "&#ents[idx+1]#;", chr(ents[idx]), "all");	
	}
	
	return arguments.source;
}
</cfscript>

<cfscript>
/**
 * Coverts special characters to character entities, making a string safe for display in HTML.
 * Version 2 update by Eli Dickinson (eli.dickinson@gmail.com)
 * Fixes issue of lists not being equal and adding bull
 * v3, extra semicolons
 * 
 * @param string 	 String to format. (Required)
 * @return Returns a string. 
 * @author Gyrus (gyrus@norlonto.net) 
 * @version 3, August 30, 2006 
 */
function HTMLSafe(string) {
	// Initialise
	var badChars = "&,"",#Chr(161)#,#Chr(162)#,#Chr(163)#,#Chr(164)#,#Chr(165)#,#Chr(166)#,#Chr(167)#,#Chr(168)#,#Chr(169)#,#Chr(170)#,#Chr(171)#,#Chr(172)#,#Chr(173)#,#Chr(174)#,#Chr(175)#,#Chr(176)#,#Chr(177)#,#Chr(178)#,#Chr(179)#,#Chr(180)#,#Chr(181)#,#Chr(182)#,#Chr(183)#,#Chr(184)#,#Chr(185)#,#Chr(186)#,#Chr(187)#,#Chr(188)#,#Chr(189)#,#Chr(190)#,#Chr(191)#,#Chr(215)#,#Chr(247)#,#Chr(192)#,#Chr(193)#,#Chr(194)#,#Chr(195)#,#Chr(196)#,#Chr(197)#,#Chr(198)#,#Chr(199)#,#Chr(200)#,#Chr(201)#,#Chr(202)#,#Chr(203)#,#Chr(204)#,#Chr(205)#,#Chr(206)#,#Chr(207)#,#Chr(208)#,#Chr(209)#,#Chr(210)#,#Chr(211)#,#Chr(212)#,#Chr(213)#,#Chr(214)#,#Chr(216)#,#Chr(217)#,#Chr(218)#,#Chr(219)#,#Chr(220)#,#Chr(221)#,#Chr(222)#,#Chr(223)#,#Chr(224)#,#Chr(225)#,#Chr(226)#,#Chr(227)#,#Chr(228)#,#Chr(229)#,#Chr(230)#,#Chr(231)#,#Chr(232)#,#Chr(233)#,#Chr(234)#,#Chr(235)#,#Chr(236)#,#Chr(237)#,#Chr(238)#,#Chr(239)#,#Chr(240)#,#Chr(241)#,#Chr(242)#,#Chr(243)#,#Chr(244)#,#Chr(245)#,#Chr(246)#,#Chr(248)#,#Chr(249)#,#Chr(250)#,#Chr(251)#,#Chr(252)#,#Chr(253)#,#Chr(254)#,#Chr(255)#";
	var goodChars = "&amp;,&quot;,&iexcl;,&cent;,&pound;,&curren;,&yen;,&brvbar;,&sect;,&uml;,&copy;,&ordf;,&laquo;,&not;,&shy;,&reg;,&macr;,&deg;,&plusmn;,&sup2;,&sup3;,&acute;,&micro;,&para;,&middot;,&cedil;,&sup1;,&ordm;,&raquo;,&frac14;,&frac12;,&frac34;,&iquest;,&times;,&divide;,&Agrave;,&Aacute;,&Acirc;,&Atilde;,&Auml;,&Aring;,&AElig;,&Ccedil;,&Egrave;,&Eacute;,&Ecirc;,&Euml;,&Igrave;,&Iacute;,&Icirc;,&Iuml;,&ETH;,&Ntilde;,&Ograve;,&Oacute;,&Ocirc;,&Otilde;,&Ouml;,&Oslash;,&Ugrave;,&Uacute;,&Ucirc;,&Uuml;,&Yacute;,&THORN;,&szlig;,&agrave;,&aacute;,&acirc;,&atilde;,&auml;,&aring;,&aelig;,&ccedil;,&egrave;,&eacute;,&ecirc;,&euml;,&igrave;,&iacute;,&icirc;,&iuml;,&eth;,&ntilde;,&ograve;,&oacute;,&ocirc;,&otilde;,&ouml;,&oslash;,&ugrave;,&uacute;,&ucirc;,&uuml;,&yacute;,&thorn;,&yuml;,&##338;,&##339;,&##352;,&##353;,&##376;,&##710;,&##8211;,&##8212;,&##8216;,&##8217;,&##8218;,&##8220;,&##8221;,&##8222;,&##8224;,&##8225;,&##8240;,&##8249;,&##8250;,&##8364;,<sup><small>TM</small></sup>,&bull;";

	if (Val(Left(Server.ColdFusion.ProductVersion, 1)) LT 6) {
		// Pre-MX/Unicode matches
		badChars = "#badChars#,#Chr(140)#,#Chr(156)#,#Chr(138)#,#Chr(154)#,#Chr(159)#,#Chr(136)#,#Chr(150)#,#Chr(151)#,#Chr(145)#,#Chr(146)#,#Chr(130)#,#Chr(147)#,#Chr(148)#,#Chr(132)#,#Chr(134)#,#Chr(135)#,#Chr(137)#,#Chr(139)#,#Chr(155)#,#Chr(128)#,#Chr(153)#,#Chr(149)#";
	} else {
		// MX/Unicode matches
		badChars = "#badChars#,#Chr(338)#,#Chr(339)#,#Chr(352)#,#Chr(353)#,#Chr(376)#,#Chr(710)#,#Chr(8211)#,#Chr(8212)#,#Chr(8216)#,#Chr(8217)#,#Chr(8218)#,#Chr(8220)#,#Chr(8221)#,#Chr(8222)#,#Chr(8224)#,#Chr(8225)#,#Chr(8240)#,#Chr(8249)#,#Chr(8250)#,#Chr(8364)#,#Chr(8482)#,#Chr(8226)#";
	}

	// Return immediately if blank string
	if (NOT Len(Trim(string))) return string;
	
	// Do replacing
	return ReplaceList(string, badChars, goodChars);

}
</cfscript>

<cfscript>
/**
 * Converts the characters in a string to encoded special characters.
 * Rewritten by Raymond Camden
 * 
 * @param string 	 String to format. (Required)
 * @return Returns a string. 
 * @author Oblio (oleitch@locustcreek.com) 
 * @version 2, August 28, 2003 
 */
function HTMLTrans(string) {
	var slen = len(string);
	var encoded = "";

	while (slen) {
		encoded = encoded & "&##" & Asc(left(string,1)) & ";";
		string = mid(string,2,slen-1);
		slen=len(string);
	}
	return encoded;
}
</cfscript>

<!---
 Format a date as required by HTTP specifications
 
 @param theDate 	 A date to format. Defaults to Now(). (Optional)
 @return Returns a string. 
 @author Massimo Foti (massimo@massimocorner.com) 
 @version 1, January 2, 2004 
--->
<cffunction name="httpDate" output="true" returntype="numeric" hint="Format a date as required by HTTP specifications">
	<cfargument name="theDate" type="date" required="false" default="#Now()#" hint="Date to format, default to Now()">
	<cfset var returnDate="#DateFormat(arguments.theDate, 'ddd, dd mmm yyyy')# #TimeFormat(arguments.theDate, 'HH:mm:ss')# GMT">
	<cfreturn returnDate>
</cffunction>

<!---
 Takes a string and humanizes it, removing underscores and capitalizing each word.
 
 @param text 	 String to parse. (Required)
 @return Returns a string. 
 @author Christopher Warren (cwarren@imagetrend.com) 
 @version 1, July 23, 2007 
--->
<cffunction name="humanize" access="public" returntype="string" output="false">
    <cfargument name="text" type="string" required="true" />
    <cfset arguments.text= ucase(arguments.text)>
    <cfset arguments.text= replace(arguments.text,"_"," ","all")>
    <cfreturn reReplace(arguments.text,"([[:upper:]])([[:upper:]]*)","\1\L\2\E","all") />
</cffunction>

<cfscript>
/**
 * Indents all the lines of a string.
 * 
 * @param string 	 String to be modified. 
 * @param indentchar 	 Character to use for indenting. Defaults to tab character (Chr(9)). 
 * @param repeatcount 	 Positive integer to repeat indentchar. Defaults to 1. 
 * @return Returns a string. 
 * @author James Ang (james@vertexcs.com) 
 * @version 1, July 17, 2001 
 */
function Indent(str) {
	var chri = CHR(9); // indenting character. Defaults to horizontal tab
	var ncnt = 1; // strIndent = RepeatString(ichr, ncnt)
	var strcr = CHR(13);
	var strlf = CHR(10);
	var strcrlf = strcr & strlf;
	var strIndent = "";
	if (ArrayLen(Arguments) GT 1) {
		chri = Arguments[2];
		if (ArrayLen(Arguments) GT 2) {
			ncnt = Arguments[3];
		}
	}
	strIndent = RepeatString(chri, ncnt);
	return (strIndent & REReplace(str, "([#strcrlf#]+)([^#strcrlf#])", "\1#strIndent#\2", "ALL"));
}
</cfscript>

<cfscript>
/**
 * Turn 1 into 1st, 2 into 2nd, etc.
 * 
 * @param num 	 Number to format. (Required)
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, December 23, 2002 
 */
function IntegerRankFormat(number){
	//grab the last digit
	var lastDigit = right(number,1);
	//grab the last two digits
	var lastTwoDigits = right(number,2);
	//use numberFormat() to put in commas for number larger than 999
	number = numberFormat(number);
	//11, 12, and 13 are special cases, so deal with them
	switch(lastTwoDigits){
		case 11:{
			return number & "th";
		}
		case 12:{
			return number & "th";
		}
		case 13:{
			return number & "th";
		}
	}
	//append the correct suffix based on the last number
	switch(lastDigit){
		case 1:{
			return number & "st";
		}
		case 2:{
			return number & "nd";
		}
		case 3:{
			return number & "rd";
		}
		default:{
			return number & "th";
		}
	}
}
</cfscript>

<cfscript>
/**
 * Determines whether a string is 7bit
 * Rewritten by Ray Camden
 * 
 * @param text 	 String to check. (Required)
 * @return Returns a boolean. 
 * @author Vaughan Allan (vorn@__nospam__vorn.org) 
 * @version 1, August 28, 2003 
 */
function Is7bit(text) {
	if(REFind("[\x80-\xFF]",text)) return false;
	return true;	
}
</cfscript>

<cfscript>
/**
 * Checks that a number is a valid ABA routing number.
 * 
 * @param number 	 Number you want to validate as an ABA routing number. 
 * @return Returns a Boolean. 
 * @author Michael Osterman (mosterman@highspeed.com) 
 * @version 1, March 21, 2002 
 */
function isABA(number) {
	var j = 0;
	var cd = 0; //check-digit value
	var result = false;
	var modVal = 0; //compared to check-digit
	var weights = ArrayNew(1);
	
	ArraySet(weights, 1, 8, 0);
	
	//set the weights for the following loop
	weights[1] = 3;
	weights[2] = 7;
	weights[3] = 1;
	weights[4] = 3;
	weights[5] = 7;
	weights[6] = 1;
	weights[7] = 3;
	weights[8] = 7;
	
	cd = Right(number,1);
	
	for (i = 1; i lte 8; i=i+1) 
	{
		j = j + ((Mid(number,i,1))*weights[i]);
	}
	
	modVal = ((10 - (j mod 10)) mod 10);
	
	if (modVal eq cd)
	{
		result = true;
	}
	
	return result;
}
</cfscript>

<cfscript>
/**
 * This UDF confirms whether a string contains only letters.
 * 
 * @param str 	 String to check. (Required)
 * @return Returns a boolean. 
 * @author Takaki Saito (saito@softai.co.jp) 
 * @version 1, June 21, 2002 
 */
function IsAlphabet(str) {
    return not reFindNoCase("[^a-z\.[:space:]]",str);
}
</cfscript>

<cfscript>
/**
 * Checks if a string is alphanumeric
 * 
 * @param str 	 String you want to check. 
 * @return Returns a Boolean value. 
 * @author Marcus Raphelt (cflib@raphelt.de) 
 * @version 1, November 2, 2001 
 */
function IsAlphanumeric(str) {
  if (REFindNoCase("[^a-z0-9]", str) eq 0)
    return true;
  else
    return false;
}
</cfscript>

<cfscript>
/**
 * Returns TRUE if the string is a valid CF UUID.
 * 
 * @param str 	 String to be checked. (Required)
 * @return Returns a boolean. 
 * @author Jason Ellison (jgedev@hotmail.com) 
 * @version 1, November 24, 2003 
 */
function IsCFUUID(str) {  	
	return REFindNoCase("^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{16}$", str);
}
</cfscript>

<!---
 Checkes to see if a color is a valid 3 or 6 character hex color, or one of the ColdFusion safe color keywords.
 
 @param color 	 string of color to test (Required)
 @return returns a Boolean 
 @author Jon Hartmann (jon.hartmann@gmail.com) 
 @version 0, May 9, 2009 
--->
<cffunction name="IsColor" access="public" output="false" returntype="boolean">
    <cfargument name="color" type="string" required="true" />
        
    <cfset var local = structNew() />
    <cfset local.colorNames = "aqua,black,blue,fuchsia,gray,green,lime,maroon,navy,olive,purple,red,silver,teal,white,yellow" />
    <cfset local.regex = "^(##([\dA-F]{3}|[\dA-F]{6})|([\dA-F]{3}|[\dA-F]{6}))$" />
    <cfset local.returnValue = false />
        
    <cfif listFind(local.colorNames, arguments.color) OR arrayLen(REMatchNoCase(local.regex, arguments.color)) gt 0>
        <cfset local.returnValue = true />
    </cfif>
    
    <cfreturn local.returnValue />
</cffunction>

<cfscript>
/**
 * Returns TRUE if the string is a valid credit card number.
 * Modded by RCamden - Check for any non numeric and return false.
 * Modded by Author - fixed mastercard checking
 * Updated to use [:digit:] and allow spaces
 * Corrected nondigit check
 * 
 * @param ccNo 	 The credit card number. (Required)
 * @param cardType 	 One of: AMEX, DINERS, DISCOVER, MASTERCARD, VISA (Optional)
 * @return Returns a boolean. 
 * @author Nick de Voil (nick@devoil.com) 
 * @version 4, August 17, 2004 
 */
function IsCreditCard(ccNo)
{
	var rv = "";
	var str = "";
	var chk = 0;
	var ccln = 0;
	var strln = 0;
	var i = 1;

	if(reFind("[^[:digit:]]",ccNo)) return FALSE;
        ccNo = replace(ccNo," ","","ALL");
	rv = Reverse(ccNo);
	ccln = Len(ccNo);
	if(ccln lt 12) return FALSE;
	for(i = 1; i lte ccln;  i = i + 1) {
		if(i mod 2 eq 0) {
			str = str & Mid(rv, i, 1) * 2;
		} else {
			str = str & Mid(rv, i, 1);
		}
	}
	strln = Len(str);
	for(i = 1; i lte strln; i = i + 1) chk = chk + Mid(str, i, 1);
	if((chk neq 0) and (chk mod 10 eq 0)) {
		if(ArrayLen(Arguments) lt 2) return TRUE;
		switch(UCase(Arguments[2])) {
		case "AMEX":		if ((ccln eq 15) and (((Left(ccNo, 2) is "34")) or ((Left(ccNo, 2) is "37")))) return TRUE; break;
		case "DINERS":		if ((ccln eq 14) and (((Left(ccNo, 3) gte 300) and (Left(ccNo, 3) lte 305)) or (Left(ccNo, 2) is "36") or (Left(ccNo, 2) is "38"))) return TRUE; break;
		case "DISCOVER":	if ((ccln eq 16) and (Left(ccNo, 4) is "6011")) return TRUE; break;
		case "MASTERCARD":	if ((ccln eq 16) and (Left(ccNo, 2) gte 51) and (Left(ccNo, 2) lte 55)) return TRUE; break;
		case "VISA":		if (((ccln eq 13) or (ccln eq 16)) and (Left(ccNo, 1) is "4")) return TRUE; break;
		default: return TRUE;
		}
	}
	return FALSE;
}
</cfscript>

<cfscript>
/**
 * Tests passed value to see if it is a valid e-mail address (supports subdomain nesting and new top-level domains).
 * Update by David Kearns to support '
 * SBrown@xacting.com pointing out regex still wasn't accepting ' correctly.
 * Should support + gmail style addresses now.
 * More TLDs
 * Version 4 by P Farrel, supports limits on u/h
 * Added mobi
 * v6 more tlds
 * 
 * @param str 	 The string to check. (Required)
 * @return Returns a boolean. 
 * @author Jeff Guillaume (jeff@kazoomis.com) 
 * @version 7, May 8, 2009 
 */
function isEmail(str) {
    return (REFindNoCase("^['_a-z0-9-\+]+(\.['_a-z0-9-\+]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.(([a-z]{2,3})|(aero|asia|biz|cat|coop|info|museum|name|jobs|post|pro|tel|travel|mobi))$",
arguments.str) AND len(listGetAt(arguments.str, 1, "@")) LTE 64 AND
len(listGetAt(arguments.str, 2, "@")) LTE 255) IS 1;
}
</cfscript>

<cfscript>
/**
 * Returns TRUE if the string is a valid IP address.
 * 
 * @param string 	 String to be checked. 
 * @return Returns a boolean. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, July 17, 2001 
 */
function isIP(ip){
	var ii = 1;
	//make sure it is a '.' delimited list 4 long
	if(listlen(ip,".") is not 4) return false;

	//make sure each item is a number between 1 and 255
	for(ii = 1;ii lte 4;ii = ii + 1){
		if(not isnumeric(listgetat(ip,ii,".")) OR listgetat(ip,ii,".") GT 255 OR listgetat(ip,ii,".") LT 0)	return false;
	}
	//check for the special cases of 255.255.255.255 or 0.0.0.0, which is not really valid
	if(ip is "255.255.255.255" OR IP is "0.0.0.0") return false;
	return true;
}
</cfscript>

<cfscript>
/**
 * Checks to to see if value is a valid ISBN.
 * 
 * @param isbn 	 ISBN string to check. (Required)
 * @return Returns a boolean. 
 * @author Alex (axs@arbornet.org) 
 * @version 1, May 16, 2002 
 */
function IsISBN(isbn)  {
 	var total       = 0;
  	var test        = 0;
    var check_digit = 0;
    var i = 1;
	
    if (len(isbn) neq  10) return false;
	
	test = left(isbn,9);
	check_digit = right(isbn,1);
	
    if (NOT isnumeric(test)) return false;
	
    for ( i = 1; i lt 10; i=i+1) {
		total = total + (Mid(isbn, i, 1) * i);
    }

    test = total mod 11; 

	if (test eq 10) test = "X";
			
	if (test eq check_digit) return true;
	else return false;
}
</cfscript>

<cfscript>
/**
 * Checks is all elements of a list X is found in a list Y.
 * v2 by Raymond Camden
 * v3 idea by Bill King
 * v4 fix by Chris Phillips
 * 
 * @param l1 	 The first list. (Required)
 * @param l2 	 The second list. UDF checks to see if all of l1 is in l2. (Required)
 * @param delim1 	 List delimiter for l1. Defaults to a comma. (Optional)
 * @param delim2 	 List delimiter for l2. Defaults to a comma. (Optional)
 * @param matchany 	 If true, UDF returns true if at least one item in l1 exists in l2. Defaults to false. (Optional)
 * @return Returns a boolean. 
 * @author Daniel Chicayban (dbastos@math.utoledo.edu) 
 * @version 4, September 4, 2008 
 */
function isListInList(l1,l2) {
	var delim1 = ",";
	var delim2 = ",";
	var i = 1;
	var matchany = false;
	
	if(arrayLen(arguments) gte 3) delim1 = arguments[3];
	if(arrayLen(arguments) gte 4) delim2 = arguments[4];
	if(arrayLen(arguments) gte 5) matchany = arguments[5];
	
	for(i=1; i lte listLen(l1,delim1); i=i+1) {
		if(matchany and listFind(l2,listGetAt(l1,i,delim1),delim2)) return true;
		if(not matchany and not listFind(l2,listGetAt(l1,i,delim1),delim2)) return false;
	}
	return not matchany;
}
</cfscript>

<!---
 Checks to see if a string is all lower case characters
 b2 by Raymond Camden
 
 @param str 	 String to check. (Required)
 @return Returns a boolean. 
 @author Trevor Orr (fractorr@yahoo.com) 
 @version 2, April 9, 2007 
--->
<cffunction name="isLower" output="false" returntype="boolean">
	<cfargument name="str" type="string" required="true" />
	<cfreturn compare(arguments.str,lCase(arguments.str)) is 0>
</cffunction>

<cfscript>
/**
 * Returns true if the string is a MS SQL GUID.
 * Version 2 by Raymond Camden
 * 
 * @param str 	 String to check. (Required)
 * @return Returns a boolean. 
 * @author Michael Slatoff (Michael@Slatoff.com) 
 * @version 2, October 3, 2002 
 */
function IsMSSQLGUID(str) {
	return (reFindNoCase("[0-9a-f]{8,8}-[0-9a-f]{4,4}-[0-9a-f]{4,4}-[0-9a-f]{4,4}-[0-9a-f]{12,12}",str) is 1 and len(str) is 36);

}
</cfscript>

<cfscript>
/**
 * Checks if a list consists of numeric values only.
 * 
 * @param nList 	 List to check. 
 * @param delimiter 	 Delimiter for the list. Defaults to a comma. 
 * @return Returns a boolean. 
 * @author John J. Rice (john@johnjrice.com) 
 * @version 1, March 20, 2002 
 */
function isNumericList(nList) {
	var intIndex	= 0;
	var aryN		= arrayNew(1);
	var strDelim	= ",";

	/*	default list delimiter to a comma unless otherwise specified			*/
	if (arrayLen(arguments) gte 2){
		strDelim	= arguments[2];
	}
  
	/*	faster to work with arrays vs lists										*/
	aryN		= listToArray(nlist,strDelim);
	
	for (intIndex=1;intIndex LTE arrayLen(aryN);intIndex=incrementValue(intIndex)) {
		if (compare(val(aryN[intIndex]),aryN[intIndex])) {
			/*	hit a non-numeric list element, send the no-go back				*/
			return false;
		}
	}
	/*	made it through the list at this point, send the ok back				*/	
	return true;
}
</cfscript>

<!---
 Parses any string into iso-8859-1 codification.
 Raymond Camden modified it for bug fixes.
 
 @param string 	 String to parse. (Required)
 @return Returns a string. 
 @author Erick Rodriguez (tb.erick.rodriguez@gmail.com) 
 @version 1, January 10, 2007 
--->
<cffunction name="iso88591" access="private" returntype="string">
	<cfargument name="string" type="string" required="yes">
	<cfset var result = arguments.string>
	<cfset var x = "">
	<cfset var i = "">

	<cfscript>
	
	x = arraynew(1); 
	for(i=1;i lte 255;i = i + 1){
		x[i]=false;
	}
	
	x[34]="&quot;";
	x[38]="&amp;";
	x[160]="&nbsp;";
	x[161]="&iexcl;";
	x[162]="&cent;";
	x[163]="&pound;";
	x[164]="&curren;";
	x[165]="&yen;";
	x[166]="&brvbar;"; 
	x[167]="&sect;";
	x[168]="&uml;";
	x[169]="&copy;";
	x[170]="&ordf;";
	x[171]="&laquo;";
	x[172]="&not;";
	x[173]="&shy;";
	x[174]="&reg;";
	x[175]="&macr;";
	x[176]="&deg;";
	x[177]="&plusmn;";
	x[178]="&sup2;";
	x[179]="&sup3;";
	x[180]="&acute;";
	x[181]="&micro;";
	x[182]="&para;";
	x[183]="&middot;";
	x[184]="&cedil;";
	x[185]="&sup1;";
	x[186]="&ordm;";
	x[187]="&raquo;";
	x[188]="&frac14;";
	x[189]="&frac12;";
	x[190]="&frac34;";
	x[191]="&iquest;";
	x[192]="&Agrave;";
	x[193]="&Aacute;";
	x[194]="&Acirc;";
	x[195]="&Atilde;";
	x[196]="&Auml;";
	x[197]="&Aring;";
	x[198]="&AElig;";
	x[199]="&Ccedil;";
	x[200]="&Egrave;";
	x[201]="&Eacute;";
	x[202]="&Ecirc;";
	x[203]="&Euml;";
	x[204]="&Igrave;";
	x[205]="&Iacute;";
	x[206]="&Icirc;";
	x[207]="&Iuml;";
	x[208]="&ETH;";
	x[209]="&Ntilde;";
	x[210]="&Ograve;";
	x[211]="&Oacute;";
	x[212]="&Ocirc;";
	x[213]="&Otilde;";
	x[214]="&Ouml;";
	x[215]="&times;";
	x[216]="&Oslash;";
	x[217]="&Ugrave;";
	x[218]="&Uacute;";
	x[219]="&Ucirc;";
	x[220]="&Uuml;";
	x[221]="&Yacute;";
	x[222]="&THORN;";
	x[223]="&szlig;";
	x[224]="&agrave;";
	x[225]="&aacute;";
	x[226]="&acirc;";
	x[227]="&atilde;";
	x[228]="&auml;";
	x[229]="&aring;";
	x[230]="&aelig;";
	x[231]="&ccedil;";
	x[232]="&egrave;";
	x[233]="&eacute;";
	x[234]="&ecirc;";
	x[235]="&euml;";
	x[236]="&igrave;";
	x[237]="&iacute;";
	x[238]="&icirc;";
	x[239]="&iuml;";
	x[240]="&eth;";
	x[241]="&ntilde;";
	x[242]="&ograve;";
	x[243]="&oacute;";
	x[244]="&ocirc;";
	x[245]="&otilde;";
	x[246]="&ouml;";
	x[247]="&divide;";
	x[248]="&oslash;";
	x[249]="&ugrave;";
	x[250]="&uacute;";
	x[251]="&ucirc;";
	x[252]="&uuml;";
	x[253]="&yacute;";
	x[254]="&thorn;";
	x[255]="&yuml;";
	
	for(i=1;i lte 255;i=i+1) {
		if(x[i] neq false) result = replace(result,chr(i),x[i],"all");
	}
	
	</cfscript>
	<cfreturn result>
</cffunction>

<cfscript>
/**
 * Checks string to see if it is a pPalindrome.
 * Modified by Raymond Camden
 * 
 * @param string 	 The string to check. 
 * @return Returns a boolean. 
 * @author Douglas Williams (klenzade@i-55.com) 
 * @version 1, November 22, 2001 
 */
function isPalindrome(string) {
  var newstring = rereplacenocase(string, '[^a-z1-9]','', 'ALL');
  return newstring eq reverse(newstring);
}
</cfscript>

<cfscript>
/**
 * Checks if valid Belgium postal code.
 * 
 * @param str 	 String to check. (Required)
 * @return Returns a boolean. 
 * @author Peter J. Farrell (pjf@maestropublishing.com) 
 * @version 1, October 6, 2005 
 */
function isPostalCodeBE(str) {
	// Postal codes cannot start with 0
	return REFind("[1-9][[:digit:]]{3}", arguments.str) gte 1;
}
</cfscript>

<cfscript>
/**
 * Checks if postal code is format of Brazil.
 * 
 * @param str 	 The string to check. (Required)
 * @return Returns a boolean. 
 * @author Peter J. Farrell (pjf@maestropublishing.com) 
 * @version 1, October 6, 2005 
 */
function isPostalCodeBR(str) {
	return REFind("^[[:digit:]]{5}( |-)?[[:digit:]]{3}$", str) gte 1;
}
</cfscript>

<cfscript>
/**
 * Checks if valid postal code of Denmark.
 * 
 * @param str 	 String to check. (Required)
 * @return Returns a string. 
 * @author Peter J. Farrell (pjf@maestropublishing.com) 
 * @version 1, October 6, 2005 
 */
function isPostalCodeDK(str) {
	// The first numeric of the postal codes cannot start with 0
	return REFind("^[D-d][K-k]( |-)?[1-9]{1}[[:digit:]]{3}$", arguments.str) gte 1;
}
</cfscript>

<cfscript>
/**
 * Checks if valid Dutch postal code.
 * 
 * @param str 	 String to check. (Required)
 * @return Returns a boolean. 
 * @author Jorrit Janszen (jorrit@janszen.net) 
 * @version 1, October 23, 2005 
 */
function isPostalCodeNL (str) {
	//postal codes consists of 4 digits, folowed by one space and two alphas
	return reFind("[1-9][[:digit:]]{3}[ ]?[[:alpha:]]{2}", arguments.str) gte 1;
}
</cfscript>

<cfscript>
/**
 * Returns True if the specified value and verifying digit constitute a valid RUT (government company number used in Chile).
 * 
 * @param rut 	 RUT you want to verify. 
 * @return Returns a Boolean. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, January 9, 2002 
 */
function isrut(rut) {
  var dig=right(rut,1);
  var largo=0;
  var suma=0;
  var factor=2;
  var digito=0;
  var i=0;
  var valor="";
  rut=ReplaceList(rut, ".,-", "");
  rut=Left(Rut, Len(Rut)-1);
  if (isNumeric(rut)){
    largo=len(rut);
    for (i=largo;  i gte 1; i=i-1){
      if (factor gt 7) {
        factor=2;
      }
      suma = suma + factor * int(mid(rut,i,1));
      factor = factor + 1;
    }

    digito = 11 - (suma mod 11);
    switch(digito) {
      case 10: {
        valor = "K";
        break;
      }
      case 11: {
        valor = "0";
        break;
      }    
      default: {
        valor = digito;
        break;
      }
    }

    if (Ucase(valor) eq Ucase(dig)){
      return true;
    }
    else {
      return false;
    }
  }
  else {
    return false;
  }
}
</cfscript>

<cfscript>
/**
 * Checks passed value to see if it is a properly formatted U.S. social security number.
 * Cameron Childress found a bug in the right(str,4) line.
 * 
 * @param str 	 String you want to validate. (Required)
 * @return Returns a Boolean. 
 * @author Jeff Guillaume (jeff@kazoomis.com) 
 * @version 2, April 27, 2005 
 */
function IsSSN(str) {
  // these may actually be valid, but for business purposes they are not allowed
  var InvalidList = "111111111,222222222,333333333,444444444,555555555,666666666,777777777,888888888,999999999,123456789";
	
  // validation based on info from: http://www.ssa.gov/employer/ssnweb.htm
  if (REFind('^([0-9]{3}(-?)[0-9]{2}(-?)[0-9]{4})$', str)) {
    if (Val(Left(str, 3)) EQ 0) return FALSE;
    if (Val(Right(str, 4)) EQ 0) return FALSE;
    if (ListFind(InvalidList, REReplace(str, "[ -]", "", "ALL"))) return FALSE;
    // still here, so SSN is valid
    return True;
  }
  // return default
  return False;
	
}
</cfscript>

<cfscript>
/**
 * Returns true if all characters in a string are numeric.
 * Version 2 by Raymond Camden
 * 
 * @param str 	 Value to check. (Required)
 * @return Returns a boolean. 
 * @author Tomas Becklin (tomasbecklin@gmail.com) 
 * @version 2, August 18, 2005 
 */
function isTrueNumeric(str) {
	return reFind("[^0-9]", str) is 0;
}
</cfscript>

<!---
 Checks to see if a string is all upper case characters
 v2 by Raymond Camden
 
 @param str 	 String to check. (Required)
 @return Returns a boolean. 
 @author Trevor Orr (fractorr@yahoo.com) 
 @version 2, April 9, 2007 
--->
<cffunction name="isUpper" output="false" returntype="boolean">
	<cfargument name="str" type="string" required="true" />
	<cfreturn compare(arguments.str,uCase(arguments.str)) is 0>
</cffunction>

<cfscript>
/**
 * Checks to see if a submitted letter is Upper or Lower Case.
 * 
 * @param character 	 The character to check. (Required)
 * @return Returns either &quot;upper&quot;, &quot;lower&quot;, or &quot;Not Alpha&quot;. 
 * @author Larry Juncker (larry@aljnet.net) 
 * @version 1, November 20, 2005 
 */
function isUpperLower(character) {
	if(asc(character) gte 65 and asc(character) lte 90) return "upper";
	else if(asc(character) gte 97 and asc(character) lte 122) return "lower";
 	return "Not Alpha"; 
}
</cfscript>

<cfscript>
/**
 * A quick way to test if a string is a URL.
 * Regex by Gruber: http://daringfireball.net/2010/07/improved_regex_for_matching_urls
 * 
 * @param stringToCheck 	 The string to check. (Required)
 * @return Returns a boolean. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 2, August 5, 2010 
 */
function isURL(stringToCheck){
       var URLRegEx = "(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'"".,<>?«»“”‘’]))";
       return isValid("regex", stringToCheck, URLRegex);
}
</cfscript>

<cfscript>
/**
 * Simple Validation for Phone Number syntax.
 * version 2 by Ray Camden - added 7 digit support
 * version 3 by Tony Petruzzi Tony_Petruzzi@sheriff.org
 * 
 * @param valueIn 	 String to check. (Required)
 * @return Returns a boolean. 
 * @author Alberto Genty (agenty@houston.rr.com) 
 * @version 3, September 25, 2009 
 */
function IsValidPhone(valueIn) {
 	var re = "^(([0-9]{3}-)|\([0-9]{3}\) ?)?[0-9]{3}-[0-9]{4}$";
 	return	ReFindNoCase(re, valueIn);
}
</cfscript>

<cfscript>
/**
 * US Vehicle Identification Number (VIN) validation.
 * version 1.0 by Christopher Jordan
 * version 1.1 by RHPT, Peter Boughton &amp; Adam Cameron (original function rejected valid VINs)
 * 
 * @param v 	 VIN to validate (Required)
 * @return Returns a boolean. 
 * @author Christopher Jordan (cjordan@placs.net) 
 * @version 1, February 19, 2013 
 */
function isVIN(v) {
	var i = "";
	var d = "";
	var checkDigit = "";
	var sum = 0;
	var weights = [8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2];
	var transliterations = {
		a = 1,	b = 2, c = 3, d = 4, e = 5, f = 6,	g = 7, h = 8,
		j = 1,	k = 2, l = 3, m = 4, n = 5, 		p = 7,			r = 9,
				s = 2, t = 3, u = 4, v = 5, w = 6,	x = 7, y = 8,	z = 9
	};
	var vinRegex = "(?x)	## allow comments
		^					## from the start of the string
							## see http://en.wikipedia.org/wiki/Vehicle_Identification_Number for VIN spec
		[A-Z\d]{3}			## World Manufacturer Identifier (WMI)
		[A-Z\d]{5}			## Vehicle decription section (VDS)
		[\dX]				## Check digit
		[A-Z\d]				## Model year
		[A-Z\d]				## Plant
		\d{6}				## Sequence
		$					## to the end of the string
	";

	if (! REFindNoCase(vinRegex, arguments.v)) {
		return false;
	}

	for (i = 1; i <= len(arguments.v); i++) {
		d = mid(arguments.v, i, 1);

		if (! isNumeric(d)) {
			sum += transliterations[d] * weights[i];
		} else {
			sum += d * weights[i];
		}
	}

	checkDigit = sum % 11;

	if (checkDigit == 10) {
		checkDigit = "x";
	}
	return checkDigit == mid(arguments.v, 9, 1);
}
</cfscript>

<cfscript>
/**
 * Tests passed value to see if it is a properly formatted U.S. zip code.
 * 
 * @param str 	 String to be checked. (Required)
 * @return Returns a boolean. 
 * @author Jeff Guillaume (jeff@kazoomis.com) 
 * @version 1, May 8, 2002 
 */
function IsZipUS(str) {
	return REFind('^[[:digit:]]{5}(( |-)?[[:digit:]]{4})?$', str); 
}
</cfscript>

<cfscript>
/**
 * Tests passed value to see if it is a properly formatted Canadian zip code.
 * Peter J. Farrell (pjf@maestropublishing.com) Now checks if 1st digit if the FDA (Foward Delivery Area - 1st three digits of postal code) is one of the current 18 characters used by Canada Post as of April 2004 to signalfy a province or provincial area
 * 
 * @param str 	 String to be checked. (Required)
 * @return Returns a boolean. 
 * @author Jeff Guillaume (jeff@kazoomis.com) 
 * @version 4, July 15, 2005 
 */
function IsZipCA(str) {
 return REFind('^[A-CEG-NPR-TVXYa-ceg-npr-tvxy][[:digit:]][A-CEG-NPR-TVW-Za-ceg-npr-tvw-z]( |-)?[[:digit:]][A-CEG-NPR-TVW-Za-ceg-npr-tvw-z][[:digit:]]$', str);
}
</cfscript>

<cfscript>
/**
 * Tests passed value to see if it is a properly formatted Dutch zip code.
 * Thanks to Jeff Guillaume on who's UDF IsZip I based this UDF.
 * Version 2 by pjf@maestropublishing.com
 * 
 * @param str 	 String to be checked. (Required)
 * @return Returns a Boolean value. 
 * @author Martijn Verhoeven (MVerhoeven@Rhinofly.nl) 
 * @version 2, July 15, 2005 
 */
function IsZipNL(str) {
    /* All dutch zip codes contains four numbers and two letters  (NNNN AA) with an optional space for the regex. */
    /* Zips start at 1000 so if the first number is a 0 the zip is wrong. */
    return REFind("^[1-9][[:digit:]]{3}( )?[[:alpha:]]{2}$", arguments.str);
}
</cfscript>

<cfscript>
/**
 * Tests passed value to see if it is a properly formatted U.K. postcode (zip code).
 * v1 by Robert West
 * 
 * @param str 	 String to be checked. (Required)
 * @return Returns a Boolean. 
 * @author Duncan (duncan@duncancumming.co.uk) 
 * @version 2, October 30, 2008 
 */
function IsZipUK(str) {
return REFind("(GIR 0AA)|((([ABCDEFGHIJKLMNOPRSTUWYZ][0-9][0-9]?)|(([ABCDEFGHIJKLMNOPRSTUWYZ][ABCDEFGHKLMNOPQRSTUVWXY][0-9][0-9]?)|(([ABCDEFGHIJKLMNOPRSTUWYZ][0-9][ABCDEFGHJKSTUW])|([ABCDEFGHIJKLMNOPRSTUWYZ][ABCDEFGHKLMNOPQRSTUVWXY][0-9][ABEHMNPRVWXY])))) [0-9][ABDEFGHJLNPQRSTUWXYZ]{2})", str);
}
</cfscript>

<!---
 Compresses javascript code
 
 @param JScode 	 javascript code to compress (Required)
 @param bRem 	 Boolean flag to remove block comments (Optional)
 @return Returns a string. 
 @author Jose Alberto Guerra (cheveguerra@gmail.com) 
 @version 1, March 25, 2010 
--->
<cffunction name="jsCompressor" returntype="string" description="Compresses javascript code" output="false">
	<cfargument name="jscode" type="string" required="yes">
	<cfargument name="brem" type="boolean" required="no" default="true">
	<cfargument name="lrem" type="boolean" required="no" default="true">
	<cfargument name="spc" type="boolean" required="no" default="true">
	<cfargument name="ret" type="boolean" required="no" default="true">
	<cfset var linerem= "[^:]\/\/[^#chr(13)##chr(10)#]*">
	<cfset var blockrem1="/\*">
	<cfset var blockrem2="\*/">
	<cfset var blockrem="#chr(172)#[^#chr(172)#]*#chr(172)#">
	<cfset var spaces="[\s]*([\=|\{|\}|\(|\)|\;|[|\]|\+|\-|\n|\r]+)[\s]*">
	<cfset var retornos="[\r\n\f]*">
	<cfif brem>
		<cfset jscode = rereplacenocase(jscode,blockrem1,"#chr(172)#","all")>
		<cfset jscode = rereplacenocase(jscode,blockrem2,"#chr(172)#","all")>
		<cfset jscode = rereplacenocase(jscode,blockrem,"","all")>
	</cfif>
	<cfif lrem><cfset jscode = rereplacenocase(jscode,linerem,"","all")></cfif>
	<cfif spc><cfset jscode = rereplacenocase(jscode,spaces,"\1","all")></cfif>
	<cfif ret><cfset jscode = rereplacenocase(jscode,retornos,"","all")></cfif>
	<cfreturn jscode>
</cffunction>

<cfscript>
/**
 * Fixes an oversight in the jsstringformat() function
 * 
 * @param mystring 	 String to format. (Required)
 * @return Returns a string. 
 * @author Isaac Dealey (info@turnkey.to) 
 * @version 1, May 9, 2003 
 */
function jsFormat(mystring) {
	return Replace(jsstringformat(mystring),"/","\/","ALL"); 
}
</cfscript>

<!---
 DeSerialize JSON data into ColdFusion native objects (simple value, array, structure, query)
 
 @param arg 	 Serialized text to convert to objects. (Required)
 @return Returns data. 
 @author Jehiah Czebotar (jehiah@gmail.com) 
 @version 3, June 27, 2008 
--->
<cffunction name="jsondecode" access="remote" returntype="any" output="no"
		hint="Converts data frm JSON to CF format">
	<cfargument name="data" type="string" required="Yes" />
	
	<!--- DECLARE VARIABLES --->
	<cfset var ar = ArrayNew(1) />
	<cfset var st = StructNew() />
	<cfset var dataType = "" />
	<cfset var inQuotes = false />
	<cfset var startPos = 1 />
	<cfset var nestingLevel = 0 />
	<cfset var dataSize = 0 />
	<cfset var i = 1 />
	<cfset var skipIncrement = false />
	<cfset var j = 0 />
	<cfset var char = "" />
	<cfset var dataStr = "" />
	<cfset var structVal = "" />
	<cfset var structKey = "" />
	<cfset var colonPos = "" />
	<cfset var qRows = 0 />
	<cfset var qCol = "" />
	<cfset var qData = "" />
	<cfset var curCharIndex = "" />
	<cfset var curChar = "" />
	<cfset var result = "" />
	<cfset var unescapeVals = "\\,\"",\/,\b,\t,\n,\f,\r" />
	<cfset var unescapeToVals = "\,"",/,#Chr(8)#,#Chr(9)#,#Chr(10)#,#Chr(12)#,#Chr(13)#" />
	<cfset var unescapeVals2 = '\,",/,b,t,n,f,r' />
	<cfset var unescapetoVals2 = '\,",/,#Chr(8)#,#Chr(9)#,#Chr(10)#,#Chr(12)#,#Chr(13)#' />
	<cfset var dJSONString = "" />
	
	<cfset var _data = Trim(arguments.data) />
	
	<!--- NUMBER --->
	<cfif IsNumeric(_data)>
		<cfreturn _data />
	
	<!--- NULL --->
	<cfelseif _data EQ "null">
		<cfreturn "" />
	
	<!--- BOOLEAN --->
	<cfelseif ListFindNoCase("true,false", _data)>
		<cfreturn _data />
	
	<!--- EMPTY STRING --->
	<cfelseif _data EQ "'" OR _data EQ '""'>
		<cfreturn "" />
	
	<!--- STRING --->
	<cfelseif ReFind('^"[^\\"]*(?:\\.[^\\"]*)*"$', _data) EQ 1 OR ReFind("^'[^\\']*(?:\\.[^\\']*)*'$", _data) EQ 1>
		<cfset _data = mid(_data, 2, Len(_data)-2) />
		<!--- If there are any \b, \t, \n, \f, and \r, do extra processing
			(required because ReplaceList() won't work with those) --->
		<cfif Find("\b", _data) OR Find("\t", _data) OR Find("\n", _data) OR Find("\f", _data) OR Find("\r", _data)>
			<cfset curCharIndex = 0 />
			<cfset curChar =  ""/>
			<cfset dJSONString = createObject("java", "java.lang.StringBuffer").init("") />
			<cfloop condition="true">
				<cfset curCharIndex = curCharIndex + 1 />
				<cfif curCharIndex GT len(_data)>
					<cfbreak />
				<cfelse>
					<cfset curChar = mid(_data, curCharIndex, 1) />
					<cfif curChar EQ "\">
						<cfset curCharIndex = curCharIndex + 1 />
						<cfset curChar = mid(_data, curCharIndex,1) />
						<cfset pos = listFind(unescapeVals2, curChar) />
						<cfif pos>
							<cfset dJSONString.append(ListGetAt(unescapetoVals2, pos)) />
						<cfelse>
							<cfset dJSONString.append("\" & curChar) />
						</cfif>
					<cfelse>
						<cfset dJSONString.append(curChar) />
					</cfif>
				</cfif>
			</cfloop>
			
			<cfreturn dJSONString.toString() />
		<cfelse>
			<cfreturn ReplaceList(_data, unescapeVals, unescapeToVals) />
		</cfif>
	
	<!--- ARRAY, STRUCT, OR QUERY --->
	<cfelseif ( Left(_data, 1) EQ "[" AND Right(_data, 1) EQ "]" )
		OR ( Left(_data, 1) EQ "{" AND Right(_data, 1) EQ "}" )>
		
		<!--- Store the data type we're dealing with --->
		<cfif Left(_data, 1) EQ "[" AND Right(_data, 1) EQ "]">
			<cfset dataType = "array" />
		<cfelseif ReFindNoCase('^\{"recordcount":[0-9]+,"columnlist":"[^"]+","data":\{("[^"]+":\[[^]]*\],?)+\}\}$', _data, 0) EQ 1>
			<cfset dataType = "query" />
		<cfelse>
			<cfset dataType = "struct" />
		</cfif>
		
		<!--- Remove the brackets --->
		<cfset _data = Trim( Mid(_data, 2, Len(_data)-2) ) />
		
		<!--- Deal with empty array/struct --->
		<cfif Len(_data) EQ 0>
			<cfif dataType EQ "array">
				<cfreturn ar />
			<cfelse>
				<cfreturn st />
			</cfif>
		</cfif>
		
		<!--- Loop through the string characters --->
		<cfset dataSize = Len(_data) + 1 />
		<cfloop condition="#i# LTE #dataSize#">
			<cfset skipIncrement = false />
			<!--- Save current character --->
			<cfset char = Mid(_data, i, 1) />
			
			<!--- If char is a quote, switch the quote status --->
			<cfif char EQ '"'>
				<cfset inQuotes = NOT inQuotes />
			<!--- If char is escape character, skip the next character --->
			<cfelseif char EQ "\" AND inQuotes>
				<cfset i = i + 2 />
				<cfset skipIncrement = true />
			<!--- If char is a comma and is not in quotes, or if end of string, deal with data --->
			<cfelseif (char EQ "," AND NOT inQuotes AND nestingLevel EQ 0) OR i EQ Len(_data)+1>
				<cfset dataStr = Mid(_data, startPos, i-startPos) />
				
				<!--- If data type is array, append data to the array --->
				<cfif dataType EQ "array">
					<cfset arrayappend( ar, jsondecode(dataStr) ) />
				<!--- If data type is struct or query... --->
				<cfelseif dataType EQ "struct" OR dataType EQ "query">
					<cfset dataStr = Mid(_data, startPos, i-startPos) />
					<cfset colonPos = Find('":', dataStr) />
					<cfif colonPos>
						<cfset colonPos = colonPos + 1 />	
					<cfelse>
						<cfset colonPos = Find(":", dataStr) />	
					</cfif>
					<cfset structKey = Trim( Mid(dataStr, 1, colonPos-1) ) />
					
					<!--- If needed, remove quotes from keys --->
					<cfif Left(structKey, 1) EQ "'" OR Left(structKey, 1) EQ '"'>
						<cfset structKey = Mid( structKey, 2, Len(structKey)-2 ) />
					</cfif>
					
					<cfset structVal = Mid( dataStr, colonPos+1, Len(dataStr)-colonPos ) />
					
					<!--- If struct, add to the structure --->
					<cfif dataType EQ "struct">
						<cfset StructInsert( st, structKey, jsondecode(structVal) ) />
					
					<!--- If query, build the query --->
					<cfelse>
						<cfif structKey EQ "recordcount">
							<cfset qRows = jsondecode(structVal) />
						<cfelseif structKey EQ "columnlist">
							<cfset st = QueryNew( jsondecode(structVal) ) />
							<cfif qRows>
								<cfset QueryAddRow(st, qRows) />
							</cfif>
						<cfelseif structKey EQ "data">
							<cfset qData = jsondecode(structVal) />
							<cfset ar = StructKeyArray(qData) />
							<cfloop from="1" to="#ArrayLen(ar)#" index="j">
								<cfloop from="1" to="#st.recordcount#" index="qRows">
									<cfset qCol = ar[j] />
									<cfset QuerySetCell(st, qCol, qData[qCol][qRows], qRows) />
								</cfloop>
							</cfloop>
						</cfif>
					</cfif>
				</cfif>
				
				<cfset startPos = i + 1 />
			<!--- If starting a new array or struct, add to nesting level --->
			<cfelseif "{[" CONTAINS char AND NOT inQuotes>
				<cfset nestingLevel = nestingLevel + 1 />
			<!--- If ending an array or struct, subtract from nesting level --->
			<cfelseif "]}" CONTAINS char AND NOT inQuotes>
				<cfset nestingLevel = nestingLevel - 1 />
			</cfif>
			
			<cfif NOT skipIncrement>
				<cfset i = i + 1 />
			</cfif>
		</cfloop>
		
		<!--- Return appropriate value based on data type --->
		<cfif dataType EQ "array">
			<cfreturn ar />
		<cfelse>
			<cfreturn st />
		</cfif>
	
	<!--- INVALID JSON --->
	<cfelse>
		<cfthrow message="Invalid JSON" detail="The document you are trying to jsondecode is not in valid JSON format" />
	</cfif>
</cffunction>

<!---
 Serialize native ColdFusion objects into a JSON formated string.
 
 @param arg 	 The data to encode. (Required)
 @return Returns a string. 
 @author Jehiah Czebotar (jehiah@gmail.com) 
 @version 2, June 27, 2008 
--->
<cffunction name="jsonencode" access="remote" returntype="string" output="No"
		hint="Converts data from CF to JSON format">
	<cfargument name="data" type="any" required="Yes" />
	<cfargument name="queryFormat" type="string" required="No" default="query" /> <!-- query or array -->
	<cfargument name="queryKeyCase" type="string" required="No" default="lower" /> <!-- lower or upper -->
	<cfargument name="stringNumbers" type="boolean" required="No" default=false >
	<cfargument name="formatDates" type="boolean" required="No" default=false >
	<cfargument name="columnListFormat" type="string" required="No" default="string" > <!-- string or array -->
	
	<!--- VARIABLE DECLARATION --->
	<cfset var jsonString = "" />
	<cfset var tempVal = "" />
	<cfset var arKeys = "" />
	<cfset var colPos = 1 />
	<cfset var i = 1 />
	<cfset var column = ""/>
	<cfset var datakey = ""/>
	<cfset var recordcountkey = ""/>
	<cfset var columnlist = ""/>
	<cfset var columnlistkey = ""/>
	<cfset var dJSONString = "" />
	<cfset var escapeToVals = "\\,\"",\/,\b,\t,\n,\f,\r" />
	<cfset var escapeVals = "\,"",/,#Chr(8)#,#Chr(9)#,#Chr(10)#,#Chr(12)#,#Chr(13)#" />
	
	<cfset var _data = arguments.data />

	<!--- BOOLEAN --->
	<cfif IsBoolean(_data) AND NOT IsNumeric(_data) AND NOT ListFindNoCase("Yes,No", _data)>
		<cfreturn LCase(ToString(_data)) />
		
	<!--- NUMBER --->
	<cfelseif NOT stringNumbers AND IsNumeric(_data) AND NOT REFind("^0+[^\.]",_data)>
		<cfreturn ToString(_data) />
	
	<!--- DATE --->
	<cfelseif IsDate(_data) AND arguments.formatDates>
		<cfreturn '"#DateFormat(_data, "medium")# #TimeFormat(_data, "medium")#"' />
	
	<!--- STRING --->
	<cfelseif IsSimpleValue(_data)>
		<cfreturn '"' & ReplaceList(_data, escapeVals, escapeToVals) & '"' />
	
	<!--- ARRAY --->
	<cfelseif IsArray(_data)>
		<cfset dJSONString = createObject('java','java.lang.StringBuffer').init("") />
		<cfloop from="1" to="#ArrayLen(_data)#" index="i">
			<cfset tempVal = jsonencode( _data[i], arguments.queryFormat, arguments.queryKeyCase, arguments.stringNumbers, arguments.formatDates, arguments.columnListFormat ) />
			<cfif dJSONString.toString() EQ "">
				<cfset dJSONString.append(tempVal) />
			<cfelse>
				<cfset dJSONString.append("," & tempVal) />
			</cfif>
		</cfloop>
		
		<cfreturn "[" & dJSONString.toString() & "]" />
	
	<!--- STRUCT --->
	<cfelseif IsStruct(_data)>
		<cfset dJSONString = createObject('java','java.lang.StringBuffer').init("") />
		<cfset arKeys = StructKeyArray(_data) />
		<cfloop from="1" to="#ArrayLen(arKeys)#" index="i">
			<cfset tempVal = jsonencode( _data[ arKeys[i] ], arguments.queryFormat, arguments.queryKeyCase, arguments.stringNumbers, arguments.formatDates, arguments.columnListFormat ) />
			<cfif dJSONString.toString() EQ "">
				<cfset dJSONString.append('"' & arKeys[i] & '":' & tempVal) />
			<cfelse>
				<cfset dJSONString.append("," & '"' & arKeys[i] & '":' & tempVal) />
			</cfif>
		</cfloop>
		
		<cfreturn "{" & dJSONString.toString() & "}" />
	
	<!--- QUERY --->
	<cfelseif IsQuery(_data)>
		<cfset dJSONString = createObject('java','java.lang.StringBuffer').init("") />
		
		<!--- Add query meta data --->
		<cfif arguments.queryKeyCase EQ "lower">
			<cfset recordcountKey = "recordcount" />
			<cfset columnlistKey = "columnlist" />
			<cfset columnlist = LCase(_data.columnlist) />
			<cfset dataKey = "data" />
		<cfelse>
			<cfset recordcountKey = "RECORDCOUNT" />
			<cfset columnlistKey = "COLUMNLIST" />
			<cfset columnlist = _data.columnlist />
			<cfset dataKey = "data" />
		</cfif>
		
		<cfset dJSONString.append('"#recordcountKey#":' & _data.recordcount) />
		<cfif arguments.columnListFormat EQ "array">
			<cfset columnlist = "[" & ListQualify(columnlist, '"') & "]" />
			<cfset dJSONString.append(',"#columnlistKey#":' & columnlist) />
		<cfelse>
			<cfset dJSONString.append(',"#columnlistKey#":"' & columnlist & '"') />
		</cfif>
		<cfset dJSONString.append(',"#dataKey#":') />
		
		<!--- Make query a structure of arrays --->
		<cfif arguments.queryFormat EQ "query">
			<cfset dJSONString.append("{") />
			<cfset colPos = 1 />
			
			<cfloop list="#_data.columnlist#" delimiters="," index="column">
				<cfif colPos GT 1>
					<cfset dJSONString.append(",") />
				</cfif>
				<cfif arguments.queryKeyCase EQ "lower">
					<cfset column = LCase(column) />
				</cfif>
				<cfset dJSONString.append('"' & column & '":[') />
				
				<cfloop from="1" to="#_data.recordcount#" index="i">
					<!--- Get cell value; recurse to get proper format depending on string/number/boolean data type --->
					<cfset tempVal = jsonencode( _data[column][i], arguments.queryFormat, arguments.queryKeyCase, arguments.stringNumbers, arguments.formatDates, arguments.columnListFormat ) />
					
					<cfif i GT 1>
						<cfset dJSONString.append(",") />
					</cfif>
					<cfset dJSONString.append(tempVal) />
				</cfloop>
				
				<cfset dJSONString.append("]") />
				
				<cfset colPos = colPos + 1 />
			</cfloop>
			<cfset dJSONString.append("}") />
		<!--- Make query an array of structures --->
		<cfelse>
			<cfset dJSONString.append("[") />
			<cfloop query="_data">
				<cfif CurrentRow GT 1>
					<cfset dJSONString.append(",") />
				</cfif>
				<cfset dJSONString.append("{") />
				<cfset colPos = 1 />
				<cfloop list="#columnlist#" delimiters="," index="column">
					<cfset tempVal = jsonencode( _data[column][CurrentRow], arguments.queryFormat, arguments.queryKeyCase, arguments.stringNumbers, arguments.formatDates, arguments.columnListFormat ) />
					
					<cfif colPos GT 1>
						<cfset dJSONString.append(",") />
					</cfif>
					
					<cfif arguments.queryKeyCase EQ "lower">
						<cfset column = LCase(column) />
					</cfif>
					<cfset dJSONString.append('"' & column & '":' & tempVal) />
					
					<cfset colPos = colPos + 1 />
				</cfloop>
				<cfset dJSONString.append("}") />
			</cfloop>
			<cfset dJSONString.append("]") />
		</cfif>
		
		<!--- Wrap all query data into an object --->
		<cfreturn "{" & dJSONString.toString() & "}" />
	
	<!--- UNKNOWN OBJECT TYPE --->
	<cfelse>
		<cfreturn '"' & "unknown-obj" & '"' />
	</cfif>
</cffunction>

<cfscript>
/**
 * Replace javascript unicode strings with unicode strings.
 * 
 * @param str 	 String to modify. (Required)
 * @return Returns a string. 
 * @author Harry Klein (klein@contens.de) 
 * @version 1, August 31, 2004 
 */
function jsToUnicode(str){
	return ReReplaceNoCase(str,"\\([a-z0-9]{3})","&##\1;","all");
}
</cfscript>

<cfscript>
/**
 * Takes a string and scrambles the characters.
 * 
 * @param str 	 String you want to jumble. 
 * @return Returns a string. 
 * @author Brad Roberts (broberts@nxs.net) 
 * @version 1, December 16, 2001 
 */
function jumble(str) {
  var tempstring=""; 
  var temp=0;
  while (len(str) gt 0) {
    temp = randrange(1, len(str));
    tempstring = tempstring & mid(str, temp, 1);
    str = removechars(str, temp, 1);
  }
  return tempstring;
}
</cfscript>

<cfscript>
/**
 * Filters a list so that just numeric entries are returned.
 * v2 changes by James Moberg
 * 
 * @param nList 	 List to filter. (Required)
 * @param strDelim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 2, April 1, 2010 
 */
function justNumericList(nList) {
   var intIndex = 0;
   var aryN = arrayNew(1);
   var strDelim = ",";
   var result = arrayNew(1);
   if (arrayLen(arguments) gte 2) strDelim = arguments[2];
   aryN = listToArray(nlist,strDelim);
   for (intIndex=1;intIndex LTE arrayLen(aryN);intIndex=intIndex+1) {
    if (not compare(val(aryN[intIndex]),aryN[intIndex])) arrayAppend(result, aryN[intIndex]);
   }
   return arrayToList(result,strDelim);
}
</cfscript>

<cfscript>
/**
 * Takes a Language Name (i.e. English) and returns the ISO 669 Two-Letter Language Code (i.e. EN).
 * 
 * @param language 	 Language code. (Required)
 * @return Returns a string. 
 * @author Neil Robertson-Ravo (neil.robertson-ravo@csd.reedexpo.com) 
 * @version 1, August 6, 2004 
 */
function languageToCode(language) {
  var languages = "Afar,Abkhazian,Afrikaans,Amharic,Arabic,Assamese,Aymara,Azerbaijani,Bashkir,Byelorussian,Bulgarian,Bihari,Bislama,Bengali ,Bangla,Tibetan,Breton,Catalan,Corsican,Czech,Welsh,Danish,German,Bhutani,Greek,English,English (British),English (American),Esperanto,Spanish,Estonian,Basque,Persian,Finnish,Fiji,Faeroese,French,Frisian,Irish,Gaelic,Gaelic (Scots),Galician,Guarani,Gujarati,Hausa,Hindi,Croatian,Hungarian,Armenian,Interlingua,Interlingue,Inupiak,Indonesian,Icelandic,Italian,Hebrew,Japanese,Yiddish,Javanese,Georgian,Kazakh,Greenlandic,Cambodian,Kannada,Korean,Kashmiri,Kurdish,Kirghiz,Latin,Lingala,Laothian,Lithuanian,Latvian ,Lettish,Malagasy,Maori,Macedonian,Malayalam,Mongolian,Moldavian,Marathi,Malay,Maltese,Burmese,Nauru,Nepali,Dutch,Norwegian,Occitan,Oromo,Afan,Oriya,Punjabi,Polish,Pashto ,Pushto,Portuguese,Quechua,Rhaeto-Romance,Kirundi,Romanian,Russian,Kinyarwanda,Sanskrit,Sindhi,Sangro,Serbo-Croatian,Singhalese,Slovak,Slovenian,Samoan,Shona,Somali,Albanian,Serbian,Siswati,Sesotho,Sudanese,Swedish,Swahili,Tamil,Tegulu,Tajik,Thai,Tigrinya,Turkmen,Tagalog,Setswana,Tonga,Turkish,Tsonga,Tatar,Twi,Ukrainian,Urdu,Uzbek,Vietnamese,Volapuk,Wolof,Xhosa,Yoruba,Chinese,Zulu";
  
  var lCode ="AA,AB,AF,AM,AR,AS,AY,AZ,BA,BE,BG,BH,BI,BN,BN,BO,BR,CA,CO,CS,CY,DA,DE,DZ,EL,EN,EN,EN,EO,ES,ET,EU,FA,FI,FJ,FO,FR,FY,GA,GD,GD,GL,GN,GU,HA,HI,HR,HU,HY,IA,IE,IK,IN,IS,IT,IW,JA,JI,JW,KA,KK,KL,KM,KN,KO,KS,KU,KY,LA,LN,LO,LT,LV,LV,MG,MI,MK,ML,MN,MO,MR,MS,MT,MY,NA,NE,NL,NO,OC,OM,OM,OR,PA,PL,PS,PS,PT,QU,RM,RN,RO,RU,RW,SA,SD,SG,SH,SI,SK,SL,SM,SN,SO,SQ,SR,SS,ST,SU,SV,SW,TA,TE,TG,TH,TI,TK,TL,TN,TO,TR,TS,TT,TW,UK,UR,UZ,VI,VO,WO,XH,YO,ZH,ZU";

  if(listFindNoCase(languages,language))
	return listGetAt(lCode,listFindNoCase(languages,language));
}
</cfscript>

<!---
 Returns the index position of the last matching character in a string.
 v2 rewrite by Raymond Camden
 
 @param targetString 	 String to check. (Required)
 @param lastChar 	 Character to look for. (Required)
 @return Returns a number. 
 @author Chris Douglas (chrisgdouglas@gmail.com) 
 @version 2, August 16, 2008 
--->
<cffunction name="lastIndexOf" returntype="numeric" output="no">
	<cfargument name="targetString" type="string" required="yes">
	<cfargument name="lastChar" type="string" required="yes">
  
	<cfif find(lastChar, arguments.targetString)>
		<cfreturn len(arguments.targetString) - find(lastChar,reverse(arguments.targetString))>  
	<cfelse>
		<cfreturn 0>
	</cfif>
	
</cffunction>

<cfscript>
/**
 * Adds zero and negative support to the length parameter of left().
 * 
 * @param string 	 The string to modify. 
 * @param length 	 The length to use. 
 * @return Returns a string. 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 1, February 24, 2002 
 */
function left2( string, length )
{
  if( length GT 0 )
    return left( string, length );
  else if( length LT 0 )
    return left( string, len( string ) + length );
  else return "";
}
</cfscript>

<!---
 leftDotDot turns &quot;This is a nice day&quot; into &quot;This is a nic..&quot;
 
 @param str 	 String to use (Required)
 @param l 	 length to use (Optional)
 @return Returns a string 
 @author Peter Coppinger (peter@digital-crew.com) 
 @version 0, May 9, 2009 
--->
<cffunction name="leftDotDot" output="no" returntype="string">
	<cfargument name="str" type="string" required="yes">
	<cfargument name="l" type="numeric" required="no" default="80">
	
	<cfset var result = str>
	
	<cfif Len( str ) GT l>
		<cfset result = Left( Trim(str), l-2 ) & "...">
	</cfif>
	
	<cfreturn result>
	
</cffunction>

<cfscript>
/**
 * Computes the Levenshtein distance between two strings.
 * 
 * @param s 	 First string. (Required)
 * @param t 	 Second string. (Required)
 * @return Returns a number. 
 * @author Nicholas Zographos (nicholas@nezen.net) 
 * @version 1, March 15, 2004 
 */
function levDistance(s,t) {
	var d = ArrayNew(2);
	var i = 1;
	var j = 1;
	var s_i = "A";
	var t_j = "A";
	var cost = 0;
	
	var n = len(s)+1;
	var m = len(t)+1;
	
	d[n][m]=0;
	
	if (n is 1) {
		return m;
	}
	
	if (m is 1) {
		return n;
	}
	
	 for (i = 1; i lte n; i=i+1) {
      d[i][1] = i-1;
    }

    for (j = 1; j lte m; j=j+1) {
      d[1][j] = j-1;
    }
	
	for (i = 2; i lte n; i=i+1) {
      s_i = Mid(s,i-1,1);

	  for (j = 2; j lte m; j=j+1) {
      	t_j = Mid(t,j-1,1);

		if (s_i is t_j) {
          cost = 0;
        }
        else {
          cost = 1;
        }
		d[i][j] = min(d[i-1][j]+1, d[i][j-1]+1);
		d[i][j] = min(d[i][j], d[i-1][j-1] + cost);
      }
    }
	
    return d[n][m];
}
</cfscript>

<cfscript>
/**
 * Converts a list into a QueryString. Allows an &quot;Exclude List&quot; as well.
 * 
 * @param fields 	 List of variables to loop over. (Required)
 * @param excluded 	 Variables to ignore. (Optional)
 * @param delim 	 Delimiter to use. Default is the comma. (Optional)
 * @return Returns a string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, September 20, 2004 
 */
function List2UrlToken(fields){
	// Set Local Variables
	var token="";
	var excluded="";
	var delim=",";
	var i = 1;
	var tmpObj = "";
	
	if(arrayLen(arguments) gte 2) excluded = arguments[2];
	if(arrayLen(arguments) gte 3) delim = arguments[3];
	
	// Begin Processing
	for(i=1;i LTE listlen(fields,delim);i=i+1){
		if(not ListFind(excluded,listgetat(fields,i,delim))){
			tmpObj=listgetat(fields,i,delim);
			if(len(token)) token="#token#&#tmpObj#=#urlEncodedFormat(evaluate(tmpObj))#"; 
			else token="#tmpObj#=#URLEncodedFormat(evaluate(tmpObj))#"; 
		}
	}
	return token;
}
</cfscript>

<cfscript>
/**
 * Returns a list as an &quot;English language&quot; list.
 * 
 * @param list 	 List to format. (Required)
 * @param delimiter 	 Delimiter to use. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Deanna Schneider (deanna.schneider@ces.uwex.edu) 
 * @version 2, July 7, 2003 
 */
function listAddAnd(list) {
  var i = 1;
  var delimiter = ',';
  var returnValue = '';
  if(ArrayLen(arguments) GTE 2)
    delimiter = arguments[2];
  list = ListToArray(list, delimiter);
  if(arrayLen(list) eq 1) return list[1];
  if(arrayLen(list) eq 2) return list[1] & ' and ' & list[2];

  for(i = 1; i LTE ArrayLen(list); i = i + 1)
  if (i LTE (Arraylen(list) - 1)) returnValue = returnValue & list[i] & ', ';
  else returnValue = returnValue &   ' and ' & list[i];
  return returnValue;
}
</cfscript>

<cfscript>
/**
 * Returns a list of all elements that are both in list LST1 and in list LST2
 * v0.9 by Giriraj Kishor Govil
 * v1.0 by Adam Cameron (added support for delimiters and case-sensitivity; used clearer argument &amp; variable names; improved logic slightly)
 * 
 * @param list1 	 First list to AND (Required)
 * @param list2 	 Second list to AND (Required)
 * @param delimiter 	 Delimiter lists use (Optional)
 * @param caseSensitive 	 Whether AND operation should be case-sensitive (Optional)
 * @return A list which is the result of ANDing list1 and list2 
 * @author Giriraj Kishor Govil (giriraj.govil@gmail.com) 
 * @version 1.0, March 10, 2013 
 */
string function listAnd(required string list1, required string list2, string delimiter=",", boolean caseSensitive=false){
	// exit early if poss
	
	// are the lists the same (given casing requirements)
	if (
		(caseSensitive && !compare(list1,list2))
		||
		(!caseSensitive && !compareNoCase(list1,list2))
	){
		return list1;
	}

	// if either is empty, the AND of them will be empty
	if (list1 == "" || list2 == ""){
		return "";	
	}

	list2 = delimiter & list2 & delimiter;	// just makes it easier to do the find operation if all elements are wrapped in delimiters
	if (!caseSensitive){
		list2 = ucase(list2);
	}

	var result = {};
	for (var element in listToArray(list1, delimiter)){
		var item = delimiter & element & delimiter;
		if (!caseSensitive){
			item = ucase(item);
		}
		if (find(item, list2)){
			result[element] = "";
		}
	}
	return structKeyList(result, delimiter);
}
</cfscript>

<cfscript>
/**
 * Appends one list to another, with a maximum list length specified, and replaces any overlapping values.
 * 
 * @param list1 	 The original list. (Required)
 * @param list2 	 The list to append. (Required)
 * @param length 	 The max list length allowed for the new list. (Required)
 * @param delimiters 	 List delimiters. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Kit Brandner (kit.brandner@serebra.com) 
 * @version 1, August 10, 2007 
 */
function listAppendAndReplace( list1, list2, length) {
	var delimiters = ",";
	var pos = length;
	var returnList = list1;
	if (arguments.length ge 4 and len(trim(arguments[4])) gt 0) delimiters = trim(arguments[4]);
	for ( ; pos ge (length - listLen(list2, delimiters)) ; pos = pos - 1) {
		if (listLen(list1, delimiters) gt pos)	returnList = listDeleteAt(returnList, pos + 1, delimiters);
	}
	if (left(list2, 1) eq delimiters) list2 = right(list2, len(list2) - 1);
	returnList = trim(returnList) & iif(right(returnList, 1) neq delimiters and (len(trim(list2)) gt 0 and len(trim(returnList)) gt 0), de(delimiters), de("")) & trim(list2);
	return returnList;
}
</cfscript>

<!---
 Compares one list against another to find the elements in the first list that don't exist in the second list.
 v2 mod by Scott Coldwell
 
 @param List1 	 Full list of delimited values. (Required)
 @param List2 	 Delimited list of values you want to compare to List1. (Required)
 @param Delim1 	 Delimiter used for List1.  Default is the comma. (Optional)
 @param Delim2 	 Delimiter used for List2.  Default is the comma. (Optional)
 @param Delim3 	 Delimiter to use for the list returned by the function.  Default is the comma. (Optional)
 @return Returns a delimited list of values. 
 @author Rob Brooks-Bilson (rbils@amkor.com) 
 @version 2, June 25, 2009 
--->
<cffunction name="listCompare" output="false" returnType="string">
       <cfargument name="list1" type="string" required="true" />
       <cfargument name="list2" type="string" required="true" />
       <cfargument name="delim1" type="string" required="false" default="," />
       <cfargument name="delim2" type="string" required="false" default="," />
       <cfargument name="delim3" type="string" required="false" default="," />

       <cfset var list1Array = ListToArray(arguments.List1,Delim1) />
       <cfset var list2Array = ListToArray(arguments.List2,Delim2) />

       <!--- Remove the subset List2 from List1 to get the diff --->
       <cfset list1Array.removeAll(list2Array) />

       <!--- Return in list format --->
       <cfreturn ArrayToList(list1Array, Delim3) />
</cffunction>

<cfscript>
/**
 * Determines if a list consists of consecutive integers, regardless or order.
 * 
 * @param lsIncoming 	 List to check. (Required)
 * @param strDelimiter 	 Delimiter for the list. Defaults to a comma. (Optional)
 * @return Returns a boolean. 
 * @author Teri Stewart (terilynnstewart@hotmail.com) 
 * @version 1, May 9, 2003 
 */
function ListContainsConsecutiveInt(lsIncoming){
  var arrSorted=ArrayNew(1);
  var i=0;
  var strDelimiter=",";

 //default list delimiter to a comma unless otherwise specified
 if(ArrayLen(arguments) gte 2){
  strDelimiter=arguments[2];
 }
  //change list to array for faster processing
  arrSorted=ListToArray(lsIncoming,strDelimiter);
  //make sure all array elements are numeric and itegers
  for(i=1; i lte ArrayLen(arrSorted); i=i+1){
    if(not isNumeric(arrSorted[i]) or round(arrSorted[i]) is not arrSorted[i]){
      return false;
    }
  }
  //sort the array
  arraySort(arrSorted,"numeric");
  //loop sorted array
  for(i=0; i lt ArrayLen(arrSorted); i=i+1){
    //see if item at array position i+1 equals the first array element + i
    if(arrSorted[i+1] neq arrSorted[1]+i){
      return false;
      break;
    }
  }
  return true;
}
</cfscript>

<cfscript>
/**
 * Determines number of list items that begin with the strToMatch.
 * v2 edits by RCamden
 * 
 * @param listIn 	 List of values. (Required)
 * @param strToMatch 	 String to search for in the beginning of each list item. (Optional)
 * @param delimeter 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a number. 
 * @author Tony Felice (sites@breckcomm.com) 
 * @version 2, January 6, 2009 
 */
function listCountItemSimilar(listIn,strToMatch){
	var delim = ",";
	var count = 0;
	var xz = "";
	
	if(arrayLen(arguments) gt 2) delim = arguments[3];
	for(xz=1;xz<=listLen(listIn,delim);xz=xz+1) {
		count = count + findNoCase(strToMatch,left(listGetAt(listIn,xz,delim),len(strToMatch)));									
	}
	return count;
}
</cfscript>

<cfscript>
/**
 * Count the number of occurences of items from one list to another list.
 * Missing var statement fixed by Raymond Camden.
 * 
 * @param lst1 	 The first list. (Required)
 * @param lst2 	 The second list. (Required)
 * @return Returns a number. 
 * @author Trevor Orr (fractorr@yahoo.com) 
 * @version 1, April 7, 2006 
 */
function listCountListInList(lst1, lst2) {
	var delim   = ",";
	var cnt 	= 0;
	var pos 	= 0;
	var item    = "";
	
	if (arrayLen(arguments) gt 2) delim = arguments[3];
		
	for(item=1; item LTE ListLen(lst2); item = item + 1) {
		pos = listFindNoCase(lst1, ListGetAt(lst2, item));
		if(pos) cnt = cnt + 1;
	}
	
	return cnt;
}
</cfscript>

<cfscript>
/**
 * Counts the number of list elements that contain a given substring.
 * 
 * @param lst 	 List to search. (Required)
 * @param str 	 Substring to search for. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a number. 
 * @author John King (arocheking@yahoo.com) 
 * @version 1, June 3, 2003 
 */
function ListCountSubstring(lst, str) {
  var pos = 1;
  var count = 0;
  var newlst = "";
  var delim = ",";

  if(arrayLen(arguments) gte 3) delim = arguments[3];

  newlst = lst; //list to work on
  while(pos neq 0){
    pos = listContainsNoCase(newlst, str, delim);
    if (pos neq 0){ 
      newlst = listDeleteAt(newlst,pos,delim);
      count = count + 1;
    }
  }
  return count;
}
</cfscript>

<cfscript>
/**
 * Count unique items in a list. (Case-sensitive)
 * 
 * @param lst 	 List to parse. (Required)
 * @return Returns a number. 
 * @author Al Everett (everett.al@gmail.com) 
 * @version 1, November 14, 2007 
 */
function listCountUnique(lst) {
  var i         = 0;
  var delim     = ",";
  var countList = "";
  var lstArray  = "";

  if (arrayLen(arguments) gt 1) delim = arguments[2];
	
  lstArray = listToArray(lst,delim);
	
  for (i = 1; i LTE arrayLen(lstArray); i = i + 1) {
    if (listFind(countList,lstArray[i],delim) eq 0) {
      countList=listAppend(countList,lstArray[i]);
    }
  }

  return listLen(countList);
}
</cfscript>

<cfscript>
/**
 * Count unique items in a list. (Case-insensitive)
 * 
 * @param lst 	 List to parse. (Required)
 * @return Returns a number. 
 * @author Al Everett (everett.al@gmail.com) 
 * @version 1, November 14, 2007 
 */
function listCountUniqueNoCase(lst) {
  var i         = 0;
  var delim     = ",";
  var countList = "";
  var lstArray  = "";

  if (arrayLen(arguments) gt 1) delim = arguments[2];
	
  lstArray = listToArray(lst,delim);
	
  for (i = 1; i LTE arrayLen(lstArray); i = i + 1) {
    if (listFindNoCase(countList,lstArray[i],delim) eq 0) {
      countList=listAppend(countList,lstArray[i]);
    }
  }

  return listLen(countList);
}
</cfscript>

<cfscript>
/**
 * Delete items from a list.
 * 
 * @param variable 	 An item, or a list of items, to remove from the list. (Required)
 * @param qs 	 The actual list to parse. Can be blank. (Optional)
 * @return Returns a string. 
 * @author Alessandro Chisari (ruchizzy@hotmail.com) 
 * @version 1, May 17, 2006 
 */
function listdelete(variable){
        //var to hold the final string
        var string = "";
        //vars for use in the loop, so we don't have to evaluate lists and arrays more than once
        var ii = 1;
        var thisVar = "";
        var thisIndex = "";
        var array = "";
        var qs = "";
        if(arrayLen(arguments) GT 1)
                qs = arguments[2];
        //put the query string into an array for easier looping
        array = listToArray(qs,",");            
        //now, loop over the array and rebuild the string
        for(ii = 1; ii lte arrayLen(array); ii = ii + 1){
                thisIndex = array[ii];
                thisVar = thisIndex;
                //if this is the var, edit it to the value, otherwise, just append
                if(not listFindnocase(variable,thisVar))
                        string = listAppend(string,thisIndex,",");
        }
        //return the string
        return string;
}
</cfscript>

<cfscript>
/**
 * Case-sensitive function for removing duplicate entries in a list.
 * Based on dedupe by Raymond Camden
 * 
 * @param list 	 The list to be modified. (Required)
 * @return Returns a list. 
 * @author Jeff Howden (cflib@jeffhowden.com) 
 * @version 1, July 2, 2008 
 */
function ListDeleteDuplicates(list) {
  var i = 1;
  var delimiter = ',';
  var returnValue = '';
  if(ArrayLen(arguments) GTE 2)
    delimiter = arguments[2];
  list = ListToArray(list, delimiter);
  for(i = 1; i LTE ArrayLen(list); i = i + 1)
    if(NOT ListFind(returnValue, list[i], delimiter))
      returnValue = ListAppend(returnValue, list[i], delimiter);
  return returnValue;
}
</cfscript>

<cfscript>
/**
 * Case-insensitive function for removing duplicate entries in a list.
 * Based on dedupe by Raymond Camden
 * 
 * @param list 	 List to be modified. (Required)
 * @return Returns a list. 
 * @author Jeff Howden (cflib@jeffhowden.com) 
 * @version 1, July 2, 2008 
 */
function ListDeleteDuplicatesNoCase(list) {
  var i = 1;
  var delimiter = ',';
  var returnValue = '';
  if(ArrayLen(arguments) GTE 2)
    delimiter = arguments[2];
  list = ListToArray(list, delimiter);
  for(i = 1; i LTE ArrayLen(list); i = i + 1)
    if(NOT ListFindNoCase(returnValue, list[i], delimiter))
      returnValue = ListAppend(returnValue, list[i], delimiter);
  return returnValue;
}
</cfscript>

<cfscript>
/**
 * Deletes the n leftmost elements from the specified list.
 * Modified by RCamden
 * 
 * @param list 	 The list to modify. 
 * @param numElements 	 The number of elements to delete from the left hand side. 
 * @param delimiter 	 The delimiter to use. Defaults to a comma. 
 * @return Returns a string. 
 * @author Shaun Ambrose (shaun.ambrose@arcorsys.com) 
 * @version 1, April 24, 2002 
 */
function ListDeleteLeft(list, numElements) {
	var i=0;
	var delimiter=",";
	
	if (Arraylen(arguments) gt 2) {
		delimiter=arguments[3];
	}
		
	if (numElements gt ListLen(list, delimiter)) return "";
	
	for (i=1; i lte numElements; i=i+1) {
		list=listDeleteAt(list, 1, delimiter);
	}
	return list;
}
</cfscript>

<cfscript>
/**
 * Deletes n elements starting at the specified start position.
 * Modified by RCamden
 * 
 * @param list 	 The list to modify. 
 * @param startPos 	 The starting position. 
 * @param numElements 	 Number of items to delete, including item at startPos. 
 * @param delimiter 	 The delimiter to use. Defaults to a comma. 
 * @return Returns a string. 
 * @author Shaun Ambrose (shaun.ambrose@arcorsys.com) 
 * @version 1, April 24, 2002 
 */
function ListDeleteMid(list, startPos, numElements) {
	var i=0;
	var delimiter=",";
	var finish=startPos+numElements-1;

	if (Arraylen(arguments) gt 3) {
		delimiter=arguments[4];
	}
	if (finish gt ListLen(list, delimiter)) {
    	finish = listLen(list,delimiter);
  	}
	for (i=startPos; i lte finish; i=i+1) {
		list=listDeleteAt(list, startpos, delimiter);
	}
	return list;
}
</cfscript>

<cfscript>
/**
 * This function deletes a range of items from a list.
 * 
 * @param list 	 The list to modify. 
 * @param from 	 The position to begin deleting. 
 * @param to 	 The position to stop deleting.  
 * @param delimiter 	 The delimiter to use. Defaults to a comma. 
 * @return Returns a string. 
 * @author Shaun Ambrose (shaun.ambrose@arcorsys.com) 
 * @version 1, April 24, 2002 
 */
function ListDeleteRange(list, from, to) {
	var delimiter = ",";
	var i = from;
		
	if(arrayLen(arguments) gt 3) {
		delimiter = arguments[4];
	}
	
	if(to gt listLen(list,delimiter)) to = listLen(delimiter);
	
	for(; i lte to; i=i+1) {	
		list=listDeleteAt(list, from, delimiter);
	}

	return list;
}
</cfscript>

<cfscript>
/**
 * Deletes the n rightmost elements from the specified list.
 * Modified by RCamden
 * 
 * @param list 	 The list to modify. 
 * @param numElements 	 The number of elements to delete. 
 * @param delimiter 	 The delimiter to use. Defaults to a comma. 
 * @return Returns a string. 
 * @author Shaun Ambrose (shaun.ambrose@arcorsys.com) 
 * @version 1, April 24, 2002 
 */
function ListDeleteRight(list, numElements) {
	var i=0;
	var delimiter=",";
	
	if (Arraylen(arguments) gt 2) {
		delimiter=arguments[3];
	}
	
	if (numElements gt ListLen(list, delimiter)) return "";
	
	for (i=1; i lte numElements; i=i+1) {
		list=listDeleteAt(list, listLen(list, delimiter), delimiter);
	}
	return list;
}
</cfscript>

<cfscript>
/**
 * Used to remove qualifieers from a delimited list.
 * 
 * @param lst 	 List to dequalify. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Mike Gillespie (mike@striking.com) 
 * @version 1, July 28, 2005 
 */
function listDeQualify(lst) {
	// the chr()s are the MS single and double quotes
	var qualifiers="',"",#chr(145)#,#chr(146)#,#chr(147)#,#chr(148)#,#chr(8220)#,#chr(8221)#,#chr(8216)#,#chr(8217)#";
	var workList="";
	var delim=",";
	var listElement="";
	var firstChar="";
	var lastChar="";
	var i = 1;
	
	// if delim specified...
	if (arraylen(arguments) eq 2) delim=arguments[2];

	// loop the list, pull the first and last char from each element to evaluate
	for (;i lte listlen(lst,delim);i=i+1) {
		listElement=trim(listgetat(lst,i,delim));
		firstChar=left(ListElement,1);
		lastChar=Right(ListElement,1);
		
		if (listFindNoCase(qualifiers,firstChar) ) {ListElement=right(ListElement,len(ListElement)-1);}
		if (listFindNoCase(qualifiers,lastChar) ) {ListElement=left(ListElement,len(ListElement)-1);}
		workList=listappend(workList,listElement,delim);
	}
	return workList;
}
</cfscript>

<cfscript>
/**
 * Compares two lists and returns the elements that do not appear in both lists.
Returns a list that contains the elementsrest between list1 and list2
 * 
 * @param list1 	 First list to compare (Required)
 * @param list2 	 Second list to compare (Required)
 * @param delimiters 	 Delimiter for all lists.  Defualt is comma. (Optional)
 * @return Returns a string. 
 * @author Ivan Rodriguez (wantez015@hotmail.com) 
 * @version 1, June 26, 2002 
 */
function ListDiff(list1,list2)	{
  var delimiters	= ",";
  var listReturn = "";
  var position = 1;

  // default list delimiter to a comma unless otherwise specified	
  if (arrayLen(arguments) gte 3){
    delimiters	= arguments[3];
  }
		
  //checking list1
  for(position = 1; position LTE ListLen(list1,delimiters); position = position + 1) {
    value = ListGetAt(list1, position , delimiters );
    if (ListFindNoCase(list2, value , delimiters ) EQ 0)
      listReturn = ListAppend(listReturn, value , delimiters );
    }
		
    //checking list2
    for(position = 1; position LTE ListLen(list2,delimiters); position = position + 1)	{
      value = ListGetAt(list2, position , delimiters );
      if (ListFindNoCase(list1, value , delimiters ) EQ 0)
        listReturn = ListAppend(listReturn, value , delimiters );
  }
  return listReturn;
}
</cfscript>

<cfscript>
/**
 * Compares two lists and returns the elements that are unique for each list.
 * Added var statements.
 * 
 * @param list1 	 The first list. (Required)
 * @param list2 	 The second list. (Required)
 * @param delimiters 	 Delimiter for both lists. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Anonymous (anonymous@gmail.com) 
 * @version 1, October 4, 2007 
 */
function ListDiffDup(list1,list2)	{
  var delimiters	= ",";
  var listReturn = "";
  
  // Use two temporary lists.
  var temp1 = list1;
  var temp2 = list2;
  
  var i = 1;
  var pos = 1;

  // default list delimiter to a comma unless otherwise specified
  if (arrayLen(arguments) gte 3){
    delimiters	= arguments[3];
  }


	// Loop over the first list, eliminate all duplicate elements from the temp2 list.
  for (i=1; i lte ListLen(list1,delimiters); i=i+1) {
  	pos = ListFindNoCase(temp2,ListGetAt(list1,i,delimiters),delimiters);
	if (pos neq 0) {
		temp2 = ListDeleteAt(temp2,pos,delimiters);
	}
  }

	// Loop over the second list, eliminate all duplicate elements from the temp1 list.
  for (i=1; i lte ListLen(list2,delimiters); i=i+1) {
  	pos = ListFindNoCase(temp1,ListGetAt(list2,i,delimiters),delimiters);
	if (pos neq 0) {
		temp1 = ListDeleteAt(temp1,pos,delimiters);
	}
  }

  // Append all distinct elements from the first list to the return list
  for (i=1; i lte ListLen(temp1,delimiters); i=i+1) {
  	listReturn = ListAppend(listReturn,ListGetAt(temp1,i,delimiters),delimiters);
  }
		
  // Append all distinct elements from the second list to the return list.
  for (i=1; i lte ListLen(temp2,delimiters); i=i+1) {
  	listReturn = ListAppend(listReturn,ListGetAt(temp2,i,delimiters),delimiters);
  }

  return listReturn;
}
</cfscript>

<cfscript>
/**
 * Prepends a string to every item in a list.
 * Version 2 by Raymond Camden
 * 
 * @param list 	 List to modify. (Required)
 * @param string 	 String to prepend. (Required)
 * @param delim 	 Delimiter. Defaults to a comma. (Optional)
 * @return Returns a list. 
 * @author SHUM Ting-hin (gene_shum@iclp.com.hk) 
 * @version 2, September 21, 2004 
 */
function listElementPrepend(list,string) {
	var delim = ",";
	var i = "";
	
	if(arrayLen(arguments) gte 3) delim = arguments[3];
	
	for(i=1; i lte listLen(list); i=i+1) {
		list = listSetAt(list, i, string & listGetAt(list,i));
	}
	
	return list;
}
</cfscript>

<cfscript>
/**
 * This function will return the item with the most occurances in a list.
 * V2 by Raymond Camden
 * 
 * @param list 	 The list to check. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Qasim Rasheed (qasimrasheed@hotmail.com) 
 * @version 2, February 23, 2005 
 */
function listFindMaxOccurance(list){
	var i = "";
	var delim = ",";
	var maxitem = "";
	var maxcount = 0;
	var thisItem = "";
	if(arrayLen(arguments) gte 2) delim = arguments[2];
		
	for(i=1;i lte listLen(list,delim );i=i+1) {
		thisItem = listGetAt(list,i,delim);
		if(listValueCount(list,thisItem,delim) gt maxcount) {
			maxcount = listValueCount(list,thisItem,delim);
			maxitem = thisItem;
		}
	}
	return maxitem;
}
</cfscript>

<cfscript>
/**
 * Find missing integers in a list of consequential numbers.
 * 
 * @param list 	 List to check. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Giampaolo Bellavite (giampaolo@bellavite.com) 
 * @version 1, July 20, 2005 
 */
function listFindMissing(list) {
  var delim=","; // list delimiter
  var arrToSearch=""; 
  var i=0;
  var j=0;    
  var returnList="";
  if(arrayLen(arguments) GTE 2) delim = arguments[2];
  arrToSearch=listToArray(list,delim);
  for(i=ArrayMin(arrToSearch);i LTE arrayMax(arrToSearch);i=i+1)
    for(j=1;j LTE arrayLen(arrToSearch);j=j+1) 
      if(arrToSearch[j] EQ i)  break;
      else 
        if (j EQ arrayLen(arrToSearch))
          returnList = listAppend(returnList,i,delim);
  return returnList;
}
</cfscript>

<!---
 returns true if one of the values in the values list is found in the list.
 
 @param list 	 List of to search. (Required)
 @param values 	 List of values to search for. (Required)
 @param delimiters 	 List delimiter. Defaults to a comma. (Optional)
 @return Returns a boolean. 
 @author Sam Curren (telegramsam@byu.edu) 
 @version 1, August 5, 2005 
--->
<cffunction name="listFindOneOf" output="false" returntype="boolean">
	<cfargument name="list" type="string" required="yes"/>
	<cfargument name="values" type="string" required="yes"/>
	<cfargument name="delimiters" type="string" required="no" default=","/>
	<cfset var value = 0/>
	<cfloop list="#arguments.values#" index="value" delimiters="#arguments.delimiters#">
		<cfif ListFind(arguments.list, value, arguments.delimiters)>
			<cfreturn true />
		</cfif>
	</cfloop>
	<cfreturn false />
</cffunction>

<cfscript>
/**
 * Finds a value in one list and returns the matching string at the same index in another list.
 * 
 * @param string 	 List to parse. (Required)
 * @param listToMatch 	 List of terms to match. (Required)
 * @param listToReplace 	 Matching list of words to use as replacements. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author BenJamin Prater (bprater@bluefoxlabs.com) 
 * @version 1, August 4, 2005 
 */
function listFindReplace(string, listToMatch, listToReplace) {
	var index = "";
	var delim = ",";
	
	if(arrayLen(arguments) gte 4) delim = arguments[4];
	
	index = listFind(listToMatch, string, delim);
	
	if(index neq 0) return listGetAt(listToReplace, index, delim);
	else return string;
}
</cfscript>

<cfscript>
/**
 * Fixes a list by replacing null entries.
 * This is a modified version of the ListFix UDF 
 * written by Raymond Camden. It is significantly
 * faster when parsing larger strings with nulls.
 * Version 2 was by Patrick McElhaney (pmcelhaney@amcity.com)
 * 
 * @param list 	 The list to parse. (Required)
 * @param delimiter 	 The delimiter to use. Defaults to a comma. (Optional)
 * @param null 	 Null string to insert. Defaults to "NULL". (Optional)
 * @return Returns a list. 
 * @author Steven Van Gemert (svg2@placs.net) 
 * @version 3, July 31, 2004 
 */
function listFix(list) {
var delim = ",";
  var null = "NULL";
  var special_char_list      = "\,+,*,?,.,[,],^,$,(,),{,},|,-";
  var esc_special_char_list  = "\\,\+,\*,\?,\.,\[,\],\^,\$,\(,\),\{,\},\|,\-";
  var i = "";
       
  if(arrayLen(arguments) gt 1) delim = arguments[2];
  if(arrayLen(arguments) gt 2) null = arguments[3];

  if(findnocase(left(list, 1),delim)) list = null & list;
  if(findnocase(right(list,1),delim)) list = list & null;

  i = len(delim) - 1;
  while(i GTE 1){
	delim = mid(delim,1,i) & "_Separator_" & mid(delim,i+1,len(delim) - (i));
	i = i - 1;
  }

  delim = ReplaceList(delim, special_char_list, esc_special_char_list);
  delim = Replace(delim, "_Separator_", "|", "ALL");

  list = rereplace(list, "(" & delim & ")(" & delim & ")", "\1" & null & "\2", "ALL");
  list = rereplace(list, "(" & delim & ")(" & delim & ")", "\1" & null & "\2", "ALL");
	  
  return list;
}
</cfscript>

<cfscript>
/**
 * Adds formatting to list elements, for displaying lists in a more readable fashion.
 * 
 * @param theList 	 The list to modify. (Required)
 * @param beginStr 	 The string to prepend to each list element. (Required)
 * @param endStr 	 The string to append to each list element. (Required)
 * @param theDelim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function ListFormatted(theList, beginStr, endStr) {
	var theDelim = ",";
	if(ArrayLen(Arguments) GTE 4) theDelim = Arguments[4];

	return beginStr & Replace(theList, theDelim, endStr & beginStr, "ALL") & endStr;
}
</cfscript>

<cfscript>
/**
 * ListFromDateRange returns a list of dates given a starting and ending date.
 * 
 * @param date1 	 First date to use. (Required)
 * @param date2 	 Second date to use. (Required)
 * @param thisDelimiter 	 List delimiter to use for result. Defaults to a comma. (Optional)
 * @return Returns a list. 
 * @author Christopher Jordan (cjordan@placs.net) 
 * @version 1, February 13, 2006 
 */
function listFromDateRange (date1,date2) {
	var i 				= 0;
	var numberOfDays	= 0;
	var thisDate	 	= "";
	var theList			= "";
	var temp			= "";
	var thisDelimiter	= ",";

	if(arraylen(arguments) eq 3) thisDelimiter = trim(arguments[3]);
	
	if (date1 GT date2) {
		temp	= date1;
		date1	= date2;
		date2	= temp;
	}

	numberOfDays = dateDiff("d",date1,date2);
	
	for(i = 0; i lte NumberOfDays; i = i + 1){
		thisDate = dateAdd("d",i,date1);
		theList = listAppend(theList,thisDate,thisDelimiter);
	}
	
	return theList;
}
</cfscript>

<cfscript>
/**
 * Get specific list element of list where empty strings are counted as elements.
 * 
 * @param list 	 List to parse. (Required)
 * @param position 	 Position to retrieve. (Required)
 * @param delimiters 	 List delimiters. Only one character allow. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Tom Litt (tom@oxbowbooks.com) 
 * @version 1, September 29, 2003 
 */
function ListGetAtIncNulls(list,position) {
	// Set up. Test for third parameter.
	var delimiter = ",";
	var ReturnedString = "";
	var lengthOfList = 0;
	var LenOfReturned = 0;
	var FirstDelimPosition = 0;
	var PreDelimPlace = 0;
	var PostDelimPlace = 0;
	var loop = 0;
	
	if(ArrayLen(Arguments) GT 2) delimiter = left(arguments[3],1);

	position = Val(position);
				
	// We need to know the number of elements in our list [including nulls!]
	lengthOfList = val(len(list) - len(replace(list,delimiter,"","ALL")) + 1);
	
	// We will have various chunks of different condition logic, depending on 
	// List length, and where in the list we are requesting. There is some overlap
	// possible (e.g. in a list of length 1) so we are using IsReturnSetYet, to 
	// avoid running unnecessary code in these cases.

	// List is too short, return ""
	if(lengthOfList lt position) return ""; 	

	// List has only one element, e.g. no delimiters. Return entire string.
	if(lengthOfList eq 1) return list; 
	
	if(lengthOfList eq position) {
		// We are returning the last list element
		// This is all the characters to the right of the last delimiter
		lenOfReturned = find(delimiter,reverse(list)) - 1;
		// If the last character is not a delimiter, we have something to return
		if(lenOfReturned) return right(list,LenOfReturned);
		// If the last character is a delimiter, the last string is ""
		else return "";
	}
		
	if(position eq 1) {
		// We can snoop out the first element as quickly as we did with the last
		FirstDelimPosition = find(delimiter,list);
		if(FirstDelimPosition GT 1) return left(list,FirstDelimPosition-1);
		// First character is a delimiter, so first element is the empty string
		else return "";
	}

	// We are returning a middle list element
	// The nth list element is sandwiched between the n-1th 
	// delimiter and the nth delimiter.
	// First we must find where those delimiters are...
	// We will call them 'predelim' and 'postdelim'				
	if(lengthOfList gt position) {
	
		// If position is 1, this loop will not be looped over
		for(loop=1;loop lte position-1;loop=loop+1) { PreDelimPlace = Find(delimiter,list,PreDelimPlace+1); }
		PostDelimPlace= Find(delimiter,list,PreDelimPlace+1);
		// As a result of previous if statements it should not be possible 
		// for PreDelimPlace and PostDelimPlace to be either 0 or Len(list).
		// But they could be next to each other.
		if(PostDelimPlace-PreDelimPlace EQ 1) return "";
		else return mid(list,PreDelimPlace+1,PostDelimPlace-PreDelimPlace-1);
	}
					
}
</cfscript>

<cfscript>
/**
 * Returns a list of distinct values from a passed-in list.
 * 
 * @param theList 	 The list. (Required)
 * @param delimiter 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Dave Carabetta (dcarabetta@gmail.com) 
 * @version 1, February 24, 2005 
 */
function listGetDistinctValues(theList) {
	var distinctValues = "";
	var totalValues = 0;
	var i = 0;
	var currentElement = "";
	var delimiter = ",";
	
	// If the user specifies their own delimiter, use that one instead
	if (arrayLen(arguments) GT 1) delimiter = arguments[2];
	
	totalValues = listLen( theList, delimiter );
	
	// Loops over each element in the original list and appends the current
	// element if it does not already exist in the distinct values list
	for (i=1; i LTE totalValues; i=i+1) {
		currentElement = listGetAt(theList, i, delimiter);
		if (not listFind(distinctValues, currentElement, delimiter) ) {
			distinctValues = listAppend(distinctValues, currentElement, delimiter);
		}
	}
	
	return distinctValues;
}
</cfscript>

<cfscript>
/**
 * Returns a list with a specified factor of list elements from the passed list .
 * 
 * @param list 	 List to parse. (Required)
 * @param factorOf 	 Specifies how many items to skip before getting an item. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Sudhir Duddella (skduddella@hotmail.com) 
 * @version 1, March 6, 2003 
 */
function ListgetMultipleOf(List,factorOf){
	var delim = ",";
	var result = "";
	var i = 1;
	
	if (factorOf lte 0) return result;
	if (ArrayLen(arguments) gt 2) delim = arguments[3];
			
	for (i=1;i lte ListLen(List,delim); i = i+1) {
		if (i mod factorOf eq 0) result = ListAppend(result,ListGetAt(List,i,delim),delim);
	}
		
	return result;
}
</cfscript>

<cfscript>
/**
 * Returns a random selection from a comma delimited list.
 * Modified by Raymond Camden
 * 
 * @param List 	 The list to grab a random element from. (Required)
 * @param Delimiter 	 The list delimiter. Defaults to a comma. (Optional)
 * @return Returns a random element from the list. 
 * @author Brad Breaux (bbreaux@blipz.com) 
 * @version 2, March 12, 2004 
 */
function ListGetRandom(instring) {
	var delim = ",";
	var rnum = 0;
	var r = '';
 	if(ArrayLen(Arguments) GTE 2) delim = Arguments[2];
   	if(listlen(instring) gt 0) {
		rnum = randrange(1,listlen(instring,delim));
    		r = listgetat(instring,rnum,delim);
	}
	return r;
 }
</cfscript>

<cfscript>
/**
 * Returns true if list has duplicate elements.
 * 
 * @param list 	 The list to check. (Required)
 * @param delim 	 List delimer. Defaults to a comma. (Optional)
 * @param caseCheck 	 Determines if checking should be case-sensitive. Defaults to false. (Optional)
 * @return Returns a boolean. 
 * @author Mike Gillespie (mike@striking.com) 
 * @version 1, May 11, 2004 
 */
function listHasDupes(list) {
	var arr=arraynew(1);
	var caseCheck=false;
	var delim=",";
	var i = 1;
	
	if (arrayLen(arguments) gt 1) delim = arguments[2];	
	if (arrayLen(arguments) gt 2) CaseCheck=Arguments[3];
	
	if(not caseCheck) list = lcase(list);
	
	arr=listToArray(list,delim);
	
	for (;i lte arraylen(arr);i=i+1 ) {
		if (listValueCount(list,arr[i],delim) gt 1) return true;
	}
	return false;
}
</cfscript>

<cfscript>
/**
 * Returns elements in list1 that are found in list2.
 * Based on ListCompare by Rob Brooks-Bilson (rbils@amkor.com)
 * 
 * @param List1 	 Full list of delimited values.  
 * @param List2 	 Delimited list of values you want to compare to List1.  
 * @param Delim1 	 Delimiter used for List1.  Default is the comma.  
 * @param Delim2 	 Delimiter used for List2.  Default is the comma.  
 * @param Delim3 	 Delimiter to use for the list returned by the function.  Default is the comma.  
 * @return Returns a delimited list of values. 
 * @author Michael Slatoff (michael@slatoff.com) 
 * @version 1, August 20, 2001 
 */
function ListInCommon(List1, List2)
{
  var TempList = "";
  var Delim1 = ",";
  var Delim2 = ",";
  var Delim3 = ",";
  var i = 0;
  // Handle optional arguments
  switch(ArrayLen(arguments)) {
    case 3:
      {
        Delim1 = Arguments[3];
        break;
      }
    case 4:
      {
        Delim1 = Arguments[3];
        Delim2 = Arguments[4];
        break;
      }
    case 5:
      {
        Delim1 = Arguments[3];
        Delim2 = Arguments[4];          
        Delim3 = Arguments[5];
        break;
      }        
  } 
   /* Loop through the second list, checking for the values from the first list.
    * Add any elements from the second list that are found in the first list to the
    * temporary list
    */  
  for (i=1; i LTE ListLen(List2, "#Delim2#"); i=i+1) {
    if (ListFindNoCase(List1, ListGetAt(List2, i, "#Delim2#"), "#Delim1#")){
     TempList = ListAppend(TempList, ListGetAt(List2, i, "#Delim2#"), "#Delim3#");
    }
  }
  Return TempList;
}
</cfscript>

<cfscript>
/**
 * Determines whether any list items begin with the strToMatch.
 * v2 by RCamden
 * 
 * @param listIn 	 List of values. (Required)
 * @param strToMatch 	 String to search for in the beginning of each list item. (Required)
 * @param delimeter 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a boolean. 
 * @author Tony Felice (sites@breckcomm.com) 
 * @version 2, January 6, 2009 
 */
function listIsItemSimilar(listIn,strToMatch){
	var delim = ",";
	var count = 0;
	var xz = "";
	
	if(arrayLen(arguments) gt 2) delim = arguments[3];
	for(xz=1;xz<=listLen(listIn,delim);xz=xz+1){
		if(findNoCase(strToMatch,left(listGetAt(listIn,xz,delim),len(strToMatch)))) return true;							
	}
	return false;
}
</cfscript>

<cfscript>
/**
 * Juxtaposes two lists together in an &quot;every other value&quot; method.
 * Minor modifications by Rob Brooks-Bilson (rbils@amkor.com)
 * 
 * @param List1 	 First list of delimited values. (Required)
 * @param List2 	 Second list of delimited values. (Required)
 * @param Delim1 	 Delimiter used for List1.  Default is the comma. (Optional)
 * @param Delim2 	 Delimiter used for List2.  Default is the comma. (Optional)
 * @param Delim3 	 Delimiter to use for the list returned by the function.  Default is the comma. (Optional)
 * @return Returns a string (delimited list of values). 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, September 20, 2004 
 */
function ListJuxt(list1,list2)
{
  var i=1;
  var newList="";
  var delim1=",";
  var delim2 = ",";
  var delim3 = ",";
  switch(ArrayLen(arguments)) {
    case 3:
      {
        delim1 = Arguments[3];
        break;
      }
    case 4:
      {
        delim1 = Arguments[3];
        delim2 = Arguments[4];
        break;
      }
    case 5:
      {
        delim1 = Arguments[3];
        delim2 = Arguments[4];          
        delim3 = Arguments[5];
        break;
      }        
  }

  for(i=1;i lte Max(ListLen(list1, delim1),ListLen(list2, delim2));i=i+1){
    if(i lte ListLen(list1, delim1)){
      newList=ListAppend(newList,ListGetAt(list1,i,delim1),delim3);
    }
    else{
      newList=ListAppend(newList,"",delim3);
    }
    if(i lte ListLen(list2, delim2)){
      newList=ListAppend(newList,ListGetAt(list2,i,delim2),delim3);
    }
    else{
      newList=ListAppend(newList,"",delim3);
    }
  }
  return newList;
}
</cfscript>

<cfscript>
/**
 * A Left() function for lists.  Returns the n leftmost elements from the specified list.
 * 
 * @param list 	 List you want to return the n leftmost elements from. 
 * @param numElements 	 Number of leftmost elements you want returned. 
 * @param delimiter 	 Delimiter for the list.  Default is the comma. 
 * @return Returns a string, 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, April 24, 2002 
 */
function ListLeft(list, numElements){
  var tempList="";
  var i=0;
  var delimiter=",";
  if (ArrayLen(arguments) gt 2){
    delimiter = arguments[3];
  }
  if (numElements gte ListLen(list, delimiter)){
    return list;
  }
  for (i=1; i LTE numElements; i=i+1){
    tempList=ListAppend(tempList, ListGetAt(list, i, delimiter), delimiter);
  }
  return tempList;
}
</cfscript>

<cfscript>
/**
 * Length of list including empty elements.
 * 
 * @param list 	 List to parse. (Required)
 * @param delimiters 	 List delimiters. Only one character allow.  Defaults to a comma. (Optional)
 * @return Returns a number. 
 * @author Tom Litt (tom@oxbowbooks.com) 
 * @version 1, September 29, 2003 
 */
function listLenIncNulls(list) {
	var delimiter = ",";
	if(arrayLen(Arguments) GT 1) delimiter = left(arguments[3],1);
	return val(len(list) - len(replace(list,delimiter,"","ALL")) + 1);
}
</cfscript>

<cfscript>
/**
 * Returns the first occurrence of the longest item  in  a list.
 * 
 * @param list 	 The list to parse. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returrns a string. 
 * @author Joseph Flanigan (joseph@switch-box.org) 
 * @version 1, September 21, 2004 
 */
function listLongestItem(list){
	var delim = ","; 
	var item = "";
	var i = 0;
	
	if(arrayLen(arguments) EQ 2) delim = arguments[2];
	for(i = 1 ; i lte listLen(list,delim); i = i + 1 )  {
		if (len(listGetAt(list,i,delim)) gt len(item)) item = listGetAt(list,i,delim); 
	}
	return item; 
}
</cfscript>

<cfscript>
/**
 * Applies simple evaluations to every element in a list.
 * 
 * @param theList 	 The list to work with. (Required)
 * @param theEval 	 The evaluation to execute. (Required)
 * @param theDelim 	 Delimiter to use. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function ListLoop(theList, theEval) {
	var i             = 0;
	var theList_len   = 0;
	var x             = "";

	var theDelim      = ",";
	if(ArrayLen(Arguments) GTE 3) theDelim = Arguments[3];

	theList_len   = ListLen(theList, theDelim);

	for (i=1; i LTE theList_len; i=i+1) {
		x = ListGetAt(theList, i, theDelim);
		theList = ListSetAt(theList, i, Evaluate(theEval), theDelim);
	}

	return theList;
}
</cfscript>

<cfscript>
/**
 * ListMax returns the greatest value in a list.
 * 
 * @param list 	 List to use. (Required)
 * @return Returns a number. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, December 23, 2002 
 */
function ListMax(list){
	var delim = ",";
	if(arrayLen(arguments) gte 2) delim = arguments[2];
	return arrayMax(listToArray(list,delim));
}
</cfscript>

<cfscript>
/**
 * Checks a list of dates for the maximum date.
 * v2 by Steven Van Gemert
 * 
 * @param dtList 	 List to check. (Required)
 * @param delim 	 List delimeter. Defaults to a comma. (Optional)
 * @return Returns a date if at least one found, or returns an empty string. 
 * @author Ann Terrell (ann@landuseoregon.com) 
 * @version 2, January 16, 2007 
 */
function listMaxDate(ThisDateList) {
	var ThisDelimiter = ",";
	var ThisDateListLength = "";
	var ThisMaxDate = "";
	var i = "";
  
	if(ArrayLen(Arguments) GTE 2) ThisDelimiter = Arguments[2];
  
	ThisDateListLength = ListLen(ThisDateList, ThisDelimiter);
	ThisMaxDate = ListFirst(ThisDateList, ThisDelimiter);
  
	for (i=1; i LTE ThisDateListLength; i=i+1){
		if(DateCompare(ThisMaxDate,  ListGetAt(ThisDateList, i, ThisDelimiter)) IS -1) {
			ThisMaxDate = ListGetAt(ThisDateList, i, ThisDelimiter);
		}
	}
  
	return ThisMaxDate;
}
</cfscript>

<cfscript>
/**
 * A Mid() function for lists.  Returns n elements starting at the specified start position.
 * 3/25/02: Removed a line of extraneous code.
 * 4/11/02: Fixed problem with going past end of list.
 * 
 * @param list 	 List you want to return the elements from. 
 * @param startPos 	 Starting position in the list to begin returning from. 
 * @param numElements 	 Number of elements you want returned. 
 * @param delimiter 	 Delimiter for the list.  Default is the comma. 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.1, April 11, 2002 
 */
function ListMid(list, startPos, numElements){
  var tempList="";
  var i=0;
  var delimiter=",";
  var finish = startPos+numElements;
  if (ArrayLen(arguments) gt 3)
    delimiter = arguments[4];
  if (startPos+numElements gt ListLen(list, delimiter))
    finish = ListLen(list, delimiter)+1;
  for (i=startPos; i LT finish; i=i+1){
    tempList=ListAppend(tempList, ListGetAt(list, i, delimiter), delimiter);
  }
  return tempList;
}
</cfscript>

<cfscript>
/**
 * ListMin returns the smallest value in a list.
 * 
 * @param list 	 The list to check. (Required)
 * @param delim 	 List delimeter. Defaults to a comma. (Optional)
 * @return Returns a number. 
 * @author Steven Van Gemert (svg@placs.net) 
 * @version 1, January 20, 2006 
 */
function listMin(list){
	var delim = ",";
	if(arrayLen(arguments) gte 2) delim = arguments[2];
	return arrayMin(listToArray(list,delim));
}
</cfscript>

<cfscript>
/**
 * Checks a list of dates for the minimum date.
 * v2 by Steven Van Gemert
 * 
 * @param dtList 	 List to search. (Required)
 * @param delim 	 Delimiter to use. Defaults to a comma. (Optional)
 * @return Returns a date. 
 * @author Ann Terrell (ann@landuseoregon.com) 
 * @version 2, January 16, 2007 
 */
function listMinDate(ThisDateList) {
	var ThisDelimiter = ",";
	var ThisDateListLength = "";
	var ThisMinDate = "";
	var i = "";
  
	if(arrayLen(arguments) GTE 2) ThisDelimiter = Arguments[2];

	ThisDateListLength = ListLen(ThisDateList, ThisDelimiter);
	ThisMinDate = ListFirst(ThisDateList, ThisDelimiter);
  
	for (i=1; i LTE ThisDateListLength; i=i+1){
 		if(DateCompare(ListGetAt(ThisDateList, i, ThisDelimiter), ThisMinDate) IS -1) {
			ThisMinDate = ListGetAt(ThisDateList, i, ThisDelimiter);
	   	}
	  }
  
	return ThisMinDate;
}
</cfscript>

<cfscript>
/**
 * Creates a list from the passed arguments, skipping empty elements.
 * 
 * @return Returns a list. 
 * @author Samuel Neff (sam@serndesign.com) 
 * @version 1, January 12, 2004 
 */
function listNew() {
	var arr = arrayNew(1);
	var i = 1;

	for(;i lte arrayLen(arguments);i=i+1) {
		if(arguments[i] neq "") arr[arrayLen(arr)+1] = arguments[i];
	}
	
	return arrayToList(arr);
}
</cfscript>

<cfscript>
/**
 * Given the current list item, returns the next item within a list of unique values.
 * Mods by RCamden to make current_pos see if it was equal to OR greater than list lenth, plus original code didn't use custom delim for the listlen check.
 * 
 * @param currentItem 	 The current item in the list. (Required)
 * @param theList 	 The list to examine. (Required)
 * @param theDelim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, October 10, 2002 
 */
function ListNext(currentItem, theList){
	var current_pos   = 0;
	var theDelim      = ",";

	if(ArrayLen(Arguments) GTE 3) theDelim = Arguments[3];

	current_pos = ListFind(theList, currentItem, theDelim);

	if(current_pos eq ListLen(theList, theDelim)) return ListFirst(theList, theDelim) ;
	else return ListGetAt(theList, current_pos+1, theDelim);
}
</cfscript>

<cfscript>
/**
 * Applys padding to each element in a list.
 * 
 * @param list 	 List to apply the padding to. 
 * @param char 	 Character to use as the padding. 
 * @param strLen 	 Length to pad each list item out to.  No padding will be applied oif the length of the list item is greater than or equal to strLen. 
 * @param delimiter 	 Delimiter for the list.  Default is the comma. 
 * @return Returns a list. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, December 7, 2001 
 */
function ListPad(list, char, strLen)
{
  Var PaddedList = "";
  Var PadLen = 0;
  Var Delimiter = ",";
  Var i=0;
  if (ArrayLen(arguments) gt 3){
    Delimiter = arguments[4];
  }
  for (i=1; i LTE ListLen(list, delimiter); i=i+1){
    PadLen = strLen-Len(ListGetAt(list, i, delimiter));
    if (PadLen GTE 0){
		  PaddedList = ListAppend(PaddedList, RepeatString(char, PadLen) & ListGetAt(list, i, delimiter), delimiter);
    }
    else {
      PaddedList = ListAppend(PaddedList, ListGetAt(list, i, delimiter), delimiter);
    }
  }
  Return PaddedList;
}
</cfscript>

<cfscript>
/**
 * Parse a list of values with the specified function.
 * 
 * @param list 	 List to use. (Required)
 * @param funcitonName 	 The UDF. (Required)
 * @param delimiters 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a list. 
 * @author Kit Brandner (orchaen@gmail.com) 
 * @version 1, February 3, 2006 
 */
function listParseWithFunction(list,functionName) {
	var delimiters = ",";
	var returnList = "";
	var i = "";
	if(arrayLen(Arguments) gt 2) delimiters = Arguments[2];

	for(i=1;i lte listLen(list, delimiters); i=i+1) returnList = listAppend(returnList, functionName(listGetAt(list, i)), delimiters);
	return returnList;
}
</cfscript>

<cfscript>
/**
 * Returns specified number of random list elements without repeats.
 * 
 * @param theList 	 Delimited list of values. (Required)
 * @param numElements 	 Number of list elements to retrieve. (Required)
 * @param theDelim 	 Delimiter used to separate list elements.  The default is the comma. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, July 10, 2002 
 */
function ListRandomElements(theList, numElements) {
	var theDelim     = ",";
	var final_list   = "";
	var x            = 0;
	var random_i     = 0;
	var random_val   = 0;

	if(ArrayLen(Arguments) GTE 3) theDelim = Arguments[3];

	if(numElements GT ListLen(theList, theDelim)) {
		numElements = ListLen(theList, theDelim);
	}

	// Build the new list "scratching off" the randomly selected elements from the original list in order to avoid repeats
	for(x=1; x LTE numElements; x=x+1){
		random_i        = RandRange(1, ListLen(theList));    // pick a random list element index from the remaining elements
		random_val      = ListGetAt(theList, random_i);      // get the corresponding list element's value
		theList         = ListDeleteAt(theList, random_i);   // delete the used element from the list

		final_list      = ListAppend(final_list, random_val , theDelim);
	}

	return(final_list);
}
</cfscript>

<cfscript>
/**
 * Filters a target list, given a list of regex filters.
 * v1.0 by Jamie Jackson
 * 
 * @param targetList 	 List to filter (Required)
 * @param regexList 	 List of regular expressions to filter with (Required)
 * @param mode 	 Whether to INCLUDE (default) or EXCLUDE regex matches (Optional)
 * @return A filtered list 
 * @author Jamie Jackson (jamiejaxon@gmail.com) 
 * @version 1.0, March 10, 2013 
 */
string function listReFilterNoCase(
	required string targetList,
	required string regexList,
	string mode = "include"
) {
	if ( !listFindNoCase("include,exclude", arguments.mode) ) {
		throw (
			message="mode (if specified), must be either 'include' or 'exclude'"
		);
	}
	
	var target = 0;
	var regex = 0;
	var i = 0;
	
	var targetAry = listToArray(arguments.targetList);
	var regexAry = listToArray(arguments.regexList);
	var filteredAry = [];

	
	if ( arguments.mode is "include" ) {
		for ( target in targetAry ) { // loop targets
			for ( regex in regexAry ) { // loop regexes
				if ( reFindNoCase(regex, target) ) { // match found
					// build up the array
					arrayAppend(filteredAry, target);
					break; // already matched, don't continue
				}
			}
		}
	} else { // mode is "exclude"
		filteredAry = targetAry;
		/* loop backward through target array, so that when we delete an
		** element, it won't shift the array indexes around */
		for ( i=arrayLen(targetAry); i gt 0; i-- ) { // loop targets
			for ( regex in regexAry ) {
				if ( reFindNoCase(regex, targetAry[i]) ) {
					// whittle away at the array
					arrayDeleteAt(filteredAry, i);
					break; // already matched, don't continue
				}
			}
		}
	}
	
	return arrayToList(filteredAry);
	
}
</cfscript>

<cfscript>
/**
 * Searches a given list for a given regexp and returns the index number of the first item found.
 * 
 * @param list 	 The list to search. (Required)
 * @param regexp 	 The regular expression to use. (Required)
 * @param delimiter 	 The list delimiter, defaults to a comma. (Optional)
 * @return Returns a number. 
 * @author Tony Kenny (tony@kenny.net) 
 * @version 1, May 26, 2003 
 */
function ListReFindNoCase(list, regexp) {
	var i = 1;
	var delimiter = ",";
	
	if(arrayLen(arguments) gte 3) delimiter = arguments[3];

	for (i=1; i le listLen(list, delimiter); i=i+1) {
		if ( ReFindNoCase(regexp, listGetAt(list, i, delimiter)) ) 	return i;
	}
	
	return 0;
}
</cfscript>

<cfscript>
/**
 * Removes values from a list by string pattern.
 * Mods by RCamden
 * 
 * @param list 	 The list to modify. (Required)
 * @param str 	 The string to look for. (Required)
 * @param mode 	 If true, removes matches. If false, keeps matches. The default is true. (Optional)
 * @param delim 	 The delimiter to use. Default is comma. (Optional)
 * @return Returns a string. 
 * @author Markus Schneebeli (markus.schneebeli@inm.ch) 
 * @version 2, June 21, 2002 
 */
function ListRemoveByString(list, str) {
	var i = listLen(list);
	var mode = true;
	var delim = ",";
	
	if(arrayLen(arguments) gte 3) mode = arguments[3];
	if(arrayLen(arguments) gte 4) delim = arguments[4];
	
	for (i=ListLen(list, delim); i gte 1 ; i=i-1) {
		if(  (mode and findNoCase(str,listGetAt(list,i,delim))) or (not mode and not findNoCase(str,listGetAt(list,i,delim)))) list = listDeleteAt(list,i,delim);
	}
	return list;
}
</cfscript>

<cfscript>
/**
 * Remove duplicates from a list.
 * 
 * @param lst 	 List to parse. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Keith Gaughan (keith@digital-crew.com) 
 * @version 1, August 22, 2005 
 */
function listRemoveDuplicates(lst) {
    var i       = 0;
    var delim   = ",";
    var asArray = "";
    var set     = StructNew();

    if (ArrayLen(arguments) gt 1) delim = arguments[2];

    asArray = ListToArray(lst, delim);
    for (i = 1; i LTE ArrayLen(asArray); i = i + 1) set[asArray[i]] = "";

    return structKeyList(set, delim);
}
</cfscript>

<cfscript>
/**
 * Removes second list from first list, accepting an optional delimiter and whether to remove one or all list items.
 * 
 * @param list1 	 List to parse. (Required)
 * @param list2 	 List of items to remove. (Required)
 * @param delimiters 	 Delimiter. Defaults to a comma. (Optional)
 * @param scope 	 One or all. If one, removes one instance of the item from list2. All if otherwise. Defaults to one. (Optional)
 * @return Returns a string. 
 * @author Ann Terrell (ann@landuseoregon.com) 
 * @version 2, May 10, 2005 
 */
function ListRemoveList(list1,list2)	{
  var delimiters	= ",";
  var removeall = false;
  var listReturn = list1;
  var position = 1;

  // default list delimiter to a comma unless otherwise specified
  if (arrayLen(arguments) gte 3) delimiters=arguments[3];

  // default removal pattern is remove one of each item in list2
  if (arrayLen(arguments) eq 4 and  arguments[4] eq "all") removeall=true;
  
  //checking list1
  for(position = 1; position LTE ListLen(list2,delimiters); position = position + 1) {
    value = ListGetAt(list2, position , delimiters );
	 
	if (removeall) {
   		while (ListFindNoCase(listReturn, value , delimiters ) NEQ 0)
	      	listReturn = ListDeleteAt(listReturn, ListFindNoCase(listReturn, value , delimiters ) , delimiters );
		}
	else {
			if (ListFindNoCase(listReturn, value , delimiters ) NEQ 0)
      		listReturn = ListDeleteAt(listReturn, ListFindNoCase(listReturn, value , delimiters ) , delimiters );
		}
    }
		
  return listReturn;
}
</cfscript>

<cfscript>
/**
 * Removes null entries from lists.
 * 
 * @param list 	 List to parse. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Craig Fisher (craig@altainteractive.com) 
 * @version 1, May 26, 2003 
 */
function ListRemoveNulls(list) {
  var delim = ",";
       
  if(arrayLen(arguments) gt 1) delim = arguments[2];
  while (Find(delim & delim, list) GT 0){
      list = replace(list, delim & delim, delim, "ALL");
  }
  
  if (left(list, 1) eq delim) list = right(list, Len(list) - 1);
  if (right(list, 1) eq delim) list = Left(list, Len(list) - 1);
  return list;
}
</cfscript>

<cfscript>
/**
 * Same functionality as CF stock listRest but faster, at least on CFMX 7.01
 * 
 * @param orgList 	 Original list. (Required)
 * @param listDel 	 List delimiter. Defaults to a comma. (Optional)
 * @return returns a string. 
 * @author Tom Kitta (tom@tomkitta.com) 
 * @version 1, January 3, 2007 
 */
function ListRest2(orgList) {
	var listDel = ',';
	if(arrayLen(arguments) gte 2) listDel = arguments[2];
	if (len(orgList) gt 0) return listDeleteAt(orgList,1,listDel);
	return "";
}
</cfscript>

<cfscript>
/**
 * Same functionality as CF ListRest starting from right instead of left.
 * 
 * @param orgList 	 Original list. (Required)
 * @param listDel 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Antoine Gattolliat (antoine@igloo.be) 
 * @version 1, December 6, 2009 
 */
function ListRestRight(orgList) {
	var listDel = ',';
	if(arrayLen(arguments) gte 2) listDel = arguments[2];
	if (len(orgList) gt 0) return listDeleteAt(orgList,ListLen(orgList,listDel),listDel);
	return "";
}
</cfscript>

<cfscript>
/**
 * Searches a list for case- sensitive Duplicates and returns a list of the duplicate items or an empty string if no dupes are found.
 * 
 * @param list 	 List to parse. (Required)
 * @param delimiter 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Gerald Guido (Gerald.Guido@gmail.com) 
 * @version 0, October 18, 2008 
 */
function ListReturnDuplicates(list) {
	var i = 1;
	var delimiter = ',';
	var returnValue1 = '';
	var tmpList = list;

	if(arrayLen(arguments) GTE 2) delimiter = arguments[2];
	list = ListToArray(list, delimiter);
	for(i = 1; i LTE ArrayLen(list); i = i + 1) if(ListValueCount(tmpList, list[i]) GT 1 and not listFind(returnValue1,list[i],delimiter)) returnValue1 = ListAppend(returnValue1, list[i], delimiter);

	return returnValue1;
}
</cfscript>

<cfscript>
/**
 * Searches a list for case-INsensitive duplicates and returns a list of the duplicate items or an empty string if no dupes are found.
 * 
 * @param list 	 List to parse. (Required)
 * @param delimiter 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Gerald Guido (Gerald.Guido@gmail.com) 
 * @version 0, October 18, 2008 
 */
function ListReturnDuplicatesNoCase(list) {
	var i = 1;
	var delimiter = ',';
	var returnValue1 = '';
	var tmpList = list;

	if(arrayLen(arguments) GTE 2) delimiter = arguments[2];
	list = ListToArray(list, delimiter);
	for(i = 1; i LTE ArrayLen(list); i = i + 1) if(ListValueCountNoCase(tmpList, list[i]) GT 1 and not listFindNoCase(returnValue1,list[i],delimiter)) returnValue1 = ListAppend(returnValue1, list[i], delimiter);

	return returnValue1;
}
</cfscript>

<cfscript>
/**
 * Reverses a list.
 * Modified by RCamden to use var scope
 * 
 * @param list 	 List to be modified. 
 * @param delimiter 	 Delimiter for the list. Defaults to a comma. 
 * @return Returns a list. 
 * @author Stephen Milligan (spike@spike.org.uk) 
 * @version 2, July 17, 2001 
 */
function ListReverse(list) {

	var newlist = "";
	var i = 0;
	var delims = "";
	var thisindex = "";
	var thisitem = "";
	
	var argc = ArrayLen(arguments);
	if (argc EQ 1) {
		ArrayAppend(arguments,',');
	}
	delims = arguments[2];
	while (i LT listlen(list,delims))
	{	
	thisindex = listlen(list,delims)-i;
	thisitem = listgetat(list,thisindex,delims);
    newlist = listappend(newlist,thisitem,delims);
    i = i +1;
	}
 return newlist;
}
</cfscript>

<cfscript>
/**
 * A Right() function for lists.  Returns the n rightmost elements from the specified list.
 * 
 * @param list 	 List you want to return the n rightmost elements from. 
 * @param numElements 	 Number of rightmost elements you want returned. 
 * @param delimiter 	 Delimiter for the list.  Default is the comma. 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, April 24, 2002 
 */
function ListRight(list, numElements){
  var tempList="";
  var i=0;
  var delimiter=",";
  var totalLen=0;
  if (ArrayLen(arguments) gt 2){
    delimiter = arguments[3];
  }
  if (numElements gt ListLen(list, delimiter)){
    return list;
  }
  totalLen=ListLen(list, delimiter);
  for (i=(totalLen-numElements)+1; i LTE totalLen; i=i+1){
    tempList=ListAppend(tempList, ListGetAt(list, i, delimiter), delimiter);
  }
  return tempList;
}
</cfscript>

<cfscript>
/**
 * Tells whether two lists have entirely distinct elements
 * 
 * @param list1 	 The first list (Required)
 * @param list2 	 The second list (Required)
 * @param delim1 	 The delimiter of the first list (default is comma) (Optional)
 * @param delim2 	 The delimiter of the second list (default is comma) (Optional)
 * @return boolean 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, June 25, 2003 
 */
function listsAreDistinct(list1,list2){
	var delim1 = ",";
	var delim2 = ",";
	var ii = 0;
	var array = "";
	//deal with the optional delimiter arguments
	switch(arrayLen(arguments)) {
		case 3:
		{
			delim1 = arguments[3];
			break;
		}
		case 4:
		{
			delim1 = arguments[3];
			delim2 = arguments[4];
			break;
		}
	}
	//make list1 into an array for easy looping
	array = listToArray(list1,delim1);
	//loop through list1 checking for any matches in list2
	for(ii = 1; ii LTE arrayLen(array); ii = ii + 1){
		//if this element exists in list 2, return false
		if(listFindNoCase(list2,array[ii],delim2))
			return false;
	}
	//if we've gotten this far, the lists are distinct
	return true;
}
</cfscript>

<cfscript>
/**
 * Sorts a list by the length of its elements.
 * 
 * @param list 	 The list to sort. (Required)
 * @param sortDir 	 Direction of sort. Default is "asc." (Optional)
 * @param delimiters 	 List delimiter. Default is a comma. (Optional)
 * @return Returns a string. 
 * @author Rob Baxter (rob@microjuris.com) 
 * @version 1, April 30, 2003 
 */
function ListSortByLen(ListToSort) {
	var SortOrder = "asc";
	var Delimiters = ",";
	var ListIsSorted = "no";
	var ListLen = ListLen(ListToSort, Delimiters);
	var CurListItem = "";
	var NextListItem = "";

	if (ArrayLen(Arguments) gt 1) SortOrder = Arguments[2];
	
	if (ArrayLen(Arguments) gt 2) Delimiters = Arguments[3];
		
	while (Not ListIsSorted) {
		ListIsSorted = "yes";
		for (N = 1; N+1 lte ListLen; N=N+1) {
			CurListItem = ListGetAt(ListToSort, N, Delimiters);
			NextListItem = ListGetAt(ListToSort, N+1, Delimiters);
			
			if( (sortOrder is "asc" and len(curListItem) gt len(nextListItem)) or (sortOrder is "desc" and len(curListItem) lt len(nextListItem))) {
				listToSort = listSetAt(listToSort,n,nextListItem,delimiters);
				listToSort = listSetAt(listToSort,n+1,curListItem,delimiters);
				ListIsSorted = "no";
			}
		}
	}
	return ListToSort;
}
</cfscript>

<!---
 A split function for lists, splitting the original list into lists of n array elements.
 Rewritten by Raymond Camden
 Output delimiter mod by Jules Gravinese (webveteran.com), December 2009
 
 @param inList 	 The list to split. (Required)
 @param numGet 	 Number of items per array element. (Required)
 @param inDelimiter 	 List delimiter. Defaults to a comma. (Optional)
 @param outDelimiter 	 Output list delimiter, defaults to comma (Optional)
 @return Returns an array of lists. 
 @author Ryan Thompson-Jewell (ryan@thompson-jewell.com) 
 @version 3, March 11, 2010 
--->
<cffunction name="listSplit" output="no" returnType="array" description="
	* A split function for lists, splitting the original list into lists of n array elements.
	* Rewritten by Raymond Camden
	* Output delimiter mod by Jules Gravinese (webveteran.com), December 2009
	*
	* @author  Ryan Thompson-Jewell (ryan@thompson-jewell.com)
	* @version 2, September 24, 2002
">
	<cfargument name="inList"       default=""  hint="The list to split">
	<cfargument name="numGet"       default="1" hint="Number of items per array alement">
	<cfargument name="inDelimiter"  default="," hint="Input delimiter">
	<cfargument name="outDelimiter" default="," hint="Output delimiter">

    <cfscript>
    var aResult=arraynew(1);

    if(numGet gte listLen(inList,inDelimiter)) {
        aResult[1] = inList;
        return aResult;
    }
    aResult[1] = "";
    while(listLen(inList,inDelimiter)) {
        aResult[arrayLen(aResult)] = listAppend(aResult[arrayLen(aResult)],listFirst(inList,inDelimiter), outDelimiter);
        inList = listRest(inList,inDelimiter);
        if(listLen(aResult[arrayLen(aresult)],outDelimiter) is numGet and len(inList)) aResult[arrayLen(aResult)+1] = "";
    }
    return aResult;
    </cfscript>
</cffunction>

<cfscript>
/**
 * Swaps two elements in a list.
 * 
 * @param list 	 The list to modify. (Required)
 * @param positionA 	 The first position to swap. (Required)
 * @param positionB 	 The second position to swap. (Required)
 * @param delims 	 The delimiter to use. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Rob Baxter (rob@microjuris.com) 
 * @version 1, June 21, 2002 
 */
function ListSwap(list, PositionA, PositionB)
{
	var elementA = "";
	var elementB = "";
	var Delims = ",";

	if (ArrayLen(Arguments) gt 3)
		Delims = Arguments[4];
			
	if (PositionA gt ListLen(list) Or PositionB gt ListLen(list) Or PositionA lt 1 or PositionB lt 1)
		return list;	
	
	elementA = ListGetAt(list, PositionA, Delims);
	elementB = ListGetAt(list, PositionB, Delims);
	
	//do the swap
	list = ListSetAt(list, PositionA, elementB, Delims);
	list = ListSetAt(list, PositionB, elementA, Delims); 

	return list;
}
</cfscript>

<cfscript>
/**
 * Returns the list which was passed in after having trimmed each list item.
 * 
 * @param ThisList 	 List to trim. (Required)
 * @param ThisDelimiter 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Christopher Jordan (cjordan@placs.net) 
 * @version 1, May 8, 2006 
 */
function listTrim(ThisList) {
	var i = 0;
	var ThisDelimiter = ",";
	var ThisListItem = "";
	var ThisTrimmedList = "";
		
	// check for passed delimiter
	if(ArrayLen(Arguments) EQ 2){
		ThisDelimiter = Arguments[2];
	}
	for(i = 1; i LTE ListLen(ThisList,ThisDelimiter); i = i + 1){
		ThisListItem	= Trim(ListGetAt(ThisList,i,ThisDelimiter));
		ThisTrimmedList = ListAppend(ThisTrimmedList,ThisListItem,ThisDelimiter);
	}
	return ThisTrimmedList;
}
</cfscript>

<cfscript>
/**
 * Combines two lists, automatically removing duplicate values and returning a sorted list.
 * 
 * @param List1 	 First list of delimited values. 
 * @param List2 	 Second list of delimited values. 
 * @param Delim1 	 Delimiter used for List1.  Default is the comma. 
 * @param Delim2 	 Delimiter used for List2.  Default is the comma. 
 * @param Delim3 	 Delimiter to use for the list returned by the function.  Default is the comma. 
 * @param SortType 	 Type of sort:  Text or Numeric.  The default is Text. 
 * @param SortOrder 	 Asc for ascending, DESC for descending.  Default is Asc 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, November 14, 2001 
 */
function ListUnion(List1, List2)
{
  var TempList = "";
  var CombinedList = "";  
  Var SortType="text";
  Var SortOrder="asc";
  var Delim1 = ",";
  var Delim2 = ",";
  var Delim3 = ",";
  var i = 0;
  // Handle optional arguments
  switch(ArrayLen(arguments)) {
    case 3:
      {
        Delim1    = Arguments[3];
        break;
      }
    case 4:
      {
        Delim1    = Arguments[3];
        Delim2    = Arguments[4];        
        break;
      }
    case 5:
      {
        Delim1    = Arguments[3];
        Delim2    = Arguments[4];        
        Delim3    = Arguments[5];  
        break;
      }       
    case 6:
      {
        Delim1    = Arguments[3];
        Delim2    = Arguments[4];        
        Delim3    = Arguments[5];  
        SortType  = Arguments[6];
        break;
      }       
    case 7:
      {
        Delim1    = Arguments[3];
        Delim2    = Arguments[4];        
        Delim3    = Arguments[5];  
        SortType  = Arguments[6];
        SortOrder = Arguments[7];
        break;
      }                    
  } 
  
  // Combine list 1 and list 2 with the proper delimiter
  CombinedList = ListChangeDelims(List1, Delim3, Delim1) & Delim3 &  ListChangeDelims(List2, Delim3, Delim2);
  // Strip duplicates if indicated
  for (i=1; i LTE ListLen(CombinedList, Delim3); i=i+1) {
    if (NOT ListFindNoCase(TempList, ListGetAt(CombinedList, i, Delim3), Delim3)){
     TempList = ListAppend(TempList, ListGetAt(CombinedList, i, Delim3), Delim3);
    }
  }
  Return ListSort(TempList, SortType, SortOrder, Delim3);
}
</cfscript>

<cfscript>
/**
 * Returns a comma delimited list filled with the positive intergers from the specified range.
 * Minor modifications by Rob Brooks-Bilson (rbils@amkor.com)
 * 
 * @param min 	 Minimum positive integer of range. 
 * @param max 	 Maximum positive integer  of range. 
 * @param delimiter 	 Delimiter for the list of returned values.  Default is the comma. 
 * @return Returns a string (delimited list). 
 * @author Brad Breaux (bbreaux@blipz.com) 
 * @version 1, August 27, 2001 
 */
function ListValueRange(min,max)
{
  Var cnt=0;
  Var outstring="";
  Var delimiter=",";
  if (ArrayLen(arguments) eq 3){
    Delimiter = arguments[3];
  }
  for(cnt=min;cnt lte max;cnt=cnt+1){
    if (cnt eq 1){
      outstring=""&cnt;
    }
    else{
      outstring=""&outstring&","&cnt;
    }
  }
  return outstring;
}
</cfscript>

<cfscript>
/**
 * Performs venn type operations on two lists.
 * 
 * @param listA 	 The first list. (Required)
 * @param listB 	 The second list. (Required)
 * @param returnListType 	 Return list type. Values can be: AandB, AorB, AnotB, BnotA  (Required)
 * @param listADelimiter 	 List A delimiter. Defaults to a comma. (Optional)
 * @param listBDelimiter 	 List B delimiter. Defaults to a comma. (Optional)
 * @param returnListDelimiter 	 Return list delimiter. Defaults to a comma. (Optional)
 * @return Returns a list. 
 * @author Christopher Jordan (cjordan@placs.net) 
 * @version 1, February 14, 2006 
 */
function listVenn(ListA,ListB,ReturnListType){
	var i					= "";
	var ThisListItem		= "";
	var ListADelimeter		= ",";
	var ListBDelimeter		= ",";
	var ReturnListDelimeter	= ",";
	var ReturnList			= "";
	var TempListA			= ListA;
	var TempListB			= ListB;
	
	
	// Handle optional arguments
	switch(ArrayLen(arguments)) {
		case 4:
		{
			ListADelimeter	= Arguments[4];
			break;
		}
		case 5:
		{
			ListADelimeter		= Arguments[4];
			ListBDelimeter		= Arguments[5];        
			break;
		}       
		case 6:
		{
			ListADelimeter		= Arguments[4];
			ListBDelimeter		= Arguments[5];        
			ReturnListDelimeter = Arguments[6];
			break;
		}
 		}
	// change delimeters on both lists to match
	// couldn't get listchangedelims to work, otherwise I'd have used that.
	ListA = "";
	ListB = "";
	for (i = 1; i lte listlen(TempListA,ListADelimeter); i = i + 1){
		ThisListItem = listgetat(TempListA,i,ListADelimeter);
		ListA = ListAppend(ListA,ThisListItem,ReturnListDelimeter);
	}
	for (i = 1; i lte listlen(TempListB,ListBDelimeter); i = i + 1){
		ThisListItem = listgetat(TempListB,i,ListBDelimeter);
		ListB = ListAppend(ListB,ThisListItem,ReturnListDelimeter);
	}

	// A and B (aka Intersection)
	if (ReturnListType eq "AandB"){
		for(i = 1; i lte listlen(ListA,ReturnListDelimeter); i = i + 1){
			ThisListItem = listgetat(ListA,i,ReturnListDelimeter);
			if (ListFindNoCase(ListB,thisListItem,ReturnListDelimeter)){
				ReturnList = ListAppend(ReturnList,ThisListItem,ReturnListDelimeter);
			}
		}
	}
	// A or B (aka Union)
	else if(ReturnListType eq "AorB"){
		ReturnList = ListA;
		ReturnList = ListAppend(ReturnList,ListB,ReturnListDelimeter);
		
	}
	// A not B
	else if (ReturnListType eq "AnotB"){
		for(i = 1; i lte listlen(ListA,ReturnListDelimeter); i = i + 1){
			ThisListItem = listgetat(ListA,i,ReturnListDelimeter);
			if (not ListFindNoCase(ListB,thisListItem,ReturnListDelimeter)){
				ReturnList = ListAppend(ReturnList,ThisListItem,ReturnListDelimeter);
			}
		}
	}
	// B not A
	else if (ReturnListType eq "BnotA"){
		for(i = 1; i lte listlen(ListB,ReturnListDelimeter); i = i + 1){
			ThisListItem = listgetat(ListB,i,ReturnListDelimeter);
			if (not ListFindNoCase(ListA,thisListItem,ReturnListDelimeter)){
				ReturnList = ListAppend(ReturnList,ThisListItem,ReturnListDelimeter);
			}
		}
	}
	return ReturnList;
}
</cfscript>

<cfscript>
/**
 * Return an array from a list with null values.
 * v2 mod by Marc, fixes a list with a null in front
 * 
 * @param parsedList 	 List to parse. (Required)
 * @param delim 	 List delimeter. Defaults to a comma. (Optional)
 * @return Returns an array. 
 * @author Andy Jarrett (udf@thebluefrogcompany.net) 
 * @version 2, July 20, 2009 
 */
function listWithNullsToArray(parsedList) {
	var delim = ",";
	if((left(trim(parsedList),1)) EQ delim) parsedList = "null" & parsedList;
	if(arrayLen(arguments) gt 1) delim = arguments[2];
	while(find(delim&delim,parsedList)) parsedList = replace(parsedList,delim&delim,delim & "NULL" & delim,"ALL");
	if(right(parsedList,1) eq delim){
		parsedList = listAppend(parsedList,"NULL",delim);
	}
	return listToArray(parsedList,delim);
}
</cfscript>

<cfscript>
/**
 * Wraps a list every n elements.
 * 
 * @param lst 	 The list to modify. (Required)
 * @param length 	 The place to do insertions. (Required)
 * @param br 	 String to insert. Detauls to a break tag. (Optional)
 * @param delimiter 	 The delimiter to use. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Tony Brandner (tony@brandners.com) 
 * @version 1, July 15, 2013 
 */
function ListWrap(lst, lngth) {
	var newList=lst;
	var br="<br>";
	var delimiter=",";
        var i = lngth;
	// check for optional arguments
	if(ArrayLen(arguments) eq 3) {
		br = arguments[3];
	} else if (ArrayLen(arguments) EQ 4) {
		br = arguments[3];
		delimiter = arguments[4];
	}
	// loop through list
	for (i=lngth; i LE ListLen(lst,delimiter); i=i+lngth) {
		if (ListLen(lst, delimiter) GT i) {
			// append the break string to the next element
			newList = ListSetAt(newList, i+1, br & ListGetAt(lst, i+1, delimiter), delimiter);
		}
	}
	return newList;
}
</cfscript>

<cfscript>
/**
 * Same as built-in LJUSTIFY, but allows optional parameter character to pad with.
 * version 1.0 by Al Everett
 * 
 * @param string 	 A string to justify within the specified field length (Required)
 * @param length 	 The length of the field within which to justify the string (Required)
 * @param padChar 	 Character to use for padding (Optional)
 * @return Returns a string, left-justified and padded to the specified field length 
 * @author Al Everett (everett.al@gmail.com) 
 * @version 0, September 16, 2012 
 */
function ljustify2(string,length) {
	var padChar = " ";
	if (arrayLen(arguments) GT 2) {
		padChar=left(arguments[3],1);
	}
		
	return arguments.string & repeatString(padChar,max(0,arguments.length - len(arguments.string)));
}
</cfscript>

<cfscript>
/**
 * Returns the localized version of a day of the week.
 * Original idea + code from Ben Forta
 * 
 * @param day_of_week 	 The day of the week. 
 * @param locale 	 Locale to use. Defaults to current locale. 
 * @return Returns a string. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, July 17, 2001 
 */
function LSDayOfWeekAsString(day_of_week) {
	//create arbitrary date
	VAR d=CreateDate(2000, 6, 1);
	VAR dow = DayOfWeek(d);
	VAR oldlocale = "";
	VAR tempstr = "";

	if(dow neq day_of_week) d = dateAdd("d",day_of_week-dow,d);

	if(ArrayLen(Arguments) eq 2) {
		oldLocale = setLocale(arguments[2]);
		tempstr = LSDateFormat(d,"dddd");
		setLocale(oldLocale);
	} else {
		tempstr = LSDateFormat(d,"dddd");
	}
	return tempstr;
}
</cfscript>

<cfscript>
/**
 * Returns the localized version of a month.
 * Original code + idea from Ben Forta
 * 
 * @param month_number 	 The month number. 
 * @param locale 	 Locale to use. Defaults to current locale. 
 * @return Returns a string. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, July 17, 2001 
 */
function LSMonthAsString(month_number) {
	VAR d=CreateDate(2000, month_number, 1);
	VAR oldlocale = "";
	VAR tempstr = "";
	if(ArrayLen(Arguments) eq 2) {
		oldLocale = setLocale(arguments[2]);
		tempstr = LSDateFormat(d,"mmmm");
		setLocale(oldLocale);
	} else {
		tempstr = LSDateFormat(d,"mmmm");
	}
	return tempstr;
}
</cfscript>

<cfscript>
/**
 * Cleanly converts typewriter quotes to typographer's quotes.
 * 
 * @param txt 	 Text to format. (Required)
 * @return Returns a string. 
 * @author Keith Gaughan (kmgaughan@eircom.net) 
 * @version 1, May 1, 2006 
 */
function magicQuote(txt) {
    // Left quotes
    txt = REReplace(txt, "(^|[ " & Chr(9) & Chr(10) & Chr(13) & "'])""", "\1&##8220;", "ALL");
    txt = REReplace(txt, "(^|[ " & Chr(9) & Chr(10) & Chr(13) & "]|&##8220;)'",  "\1&##8216;", "ALL");

    // Right quotes
    txt = Replace(txt, """",        "&##8221;",  "ALL");
    txt = Replace(txt, "'&##8220;", "'&##8221;", "ALL");
    txt = Replace(txt, "'",         "&##8217;",  "ALL");

    return txt;
}
</cfscript>

<cfscript>
/**
 * Limit a string's output to the desired length.
 * 
 * @param string 	 The string to modify. 
 * @param length 	 The max length to use. 
 * @return Returns a string. 
 * @author John Reed (johnreed1972@yahoo.com.au) 
 * @version 1, February 24, 2002 
 */
function maxLength(string, length) {
	var padding = 3;
	var tmp = "...";	
		
	if ( len(string) gte length )
		return removeChars(trim(string), length, len(string) - padding) & tmp;
	else return string;
}
</cfscript>

<cfscript>
/**
 * Takes an array or struct of basic values and returns and HTML-formatted string.
 * 
 * @param emData 	 Struct or array of strings. (Required)
 * @param beginString 	 String to place before each stirng in emData. (Optional)
 * @param endString 	 String to place after each stirng in emData. (Optional)
 * @return Returns a string. 
 * @author Will Vautrain (vautrain@yahoo.com) 
 * @version 1, May 2, 2002 
 */
function MessageListDisplay(emData) {
	
	var returnStr = "";
	var beginStr = "<p style=""color : red;"">";
	var endStr = "</p>";
	var s = ArrayNew(1);
	var i = 1;
	
	if (ArrayLen(Arguments) gt 1) {
	
		beginStr = Arguments[2];	
	}
	
	if (ArrayLen(Arguments) gt 2) {
	
		endStr = Arguments[3];	
	}
	
	if (IsArray(emData) and not ArrayIsEmpty(emData)) {

		i = 1;
		while (i lte ArrayLen(emData)) {
			returnStr = returnStr & beginStr & emData[i] & endStr;
			i = i + 1;
			
		}
	} 
	
	if (IsStruct(emData) and not StructIsEmpty(emData)) {

		s = StructKeyArray(emData);
		i = 1;
		while (i lte ArrayLen(s)) {
			returnStr = returnStr & beginStr & StructFind(emData, s[i]) & endStr;
			i = i + 1;
		}
	}
	
	return returnStr;
}
</cfscript>

<cfscript>
/**
 * Limits a string from the center inserting &quot;...&quot;
 * 
 * @param sString 	 string to use (Required)
 * @param nLimit 	 max length of string to use (Required)
 * @return Returns a string 
 * @author Joshua Rountree (joshua@remote-app.com) 
 * @version 0, May 9, 2009 
 */
function midLimit(sString,nLimit) {
	var nLength = Len(sString);
	var nPercent = nLimit/nLength;
	var nStart = Round(nLimit * .5);
	var nRemoveCount = (nLength - nLimit);
	var sResult = "";
	
	if(nLength GT nLimit) {
		sResult = RemoveChars(sString,nStart,nRemoveCount+3);
		sResult = Insert("...",sResult,nStart-1);
	} else {
		sResult = sString;
	}
	
	return sResult;
}
</cfscript>

<cfscript>
/**
 * Midstring: Return the middle part of a string between a specified start substring and a specified end substring.
 * 
 * @param string 	 The string to check. 
 * @param from 	 The initial string to use as a delimiter. 
 * @param to 	 The ending string to use as a delimiter. 
 * @return Returns the string between the delimiters. 
 * @author Andrew Cripps (andrew@cripps.net) 
 * @version 1, December 3, 2001 
 */
function midstring(string,from) {
	var start="";
	var end="";
	var lenstart="";
	var to=from;
	
	if(arrayLen(arguments) gte 3) to = arguments[3];
	
	start = refind(from,string);
	end = refind(to,string,len(from)+start);
	lenstart = len(from);
	return mid(string,start+lenstart,max(end-start-lenstart,0));
	
}
</cfscript>

<!---
 Converts an entire string to namecase (JARED RYPKA-HAUER becomes Jared Rypka-Hauer).
 
 @param string 	 String to format. (Required)
 @return Returns a string. 
 @author Jared Rypka-Hauer (jared@web-relevant.com) 
 @version 2, January 1, 2006 
--->
<cffunction name="nameCase" access="public" returntype="string" output="false">
    <cfargument name="name" type="string" required="true" />
    <cfset arguments.name = ucase(arguments.name)>
    <cfreturn reReplace(arguments.name,"([[:upper:]])([[:upper:]]*)","\1\L\2\E","all") />
</cffunction>

<!---
 Replaces dirty words with pattern.
 
 @param body 	 String to check. (Required)
 @param replaceType 	 If ALL, all characters are replaced. If FL, only the middle characters are replaced. Defaults to ALL. (Optional)
 @param repeatValue 	 String to use for replacement when replaceType is FL. Defaults to * (Optional)
 @param naughtyList 	 Default list of curse words. (Optional)
 @param replaceString 	 Used for replacements when replaceType is ALL. (Optional)
 @return Returns a string. 
 @author Chris Wigginton (c_wigginton@yahoo.com) 
 @version 1, November 30, 2004 
--->
<cffunction name="naughtyFilter"  returntype="string" hint="Replaces unmentionables with gobbledegook">
	<cfargument name="body" type="string" required="yes" hint="Contains text to filter">
	<cfargument name="replaceType" default="all" hint="ALL - all characters, FL - only the middle bits are replaced">
	<cfargument name="repeatValue" default="*" hint="Character to repeat for replaced dirty characters">
	<cfargument name="naughtyList" default="mother fucker,cocksucker,shit,piss,fuck,cunt,tits" hint="George Carlin's original 7 dirty words, not in his original order, but the longest listed first">
	<cfargument name="replaceString" default="!@##$%^&*()!@##$%^&*()!@##$%^&*" hint="A replace string for ALL method, length must be at least as long as the longest dirty word">
	<cfset var naughtyWord = "">
	<cfset var replacement = "">

	<cfloop list="#Arguments.naughtyList#" index="naughtyWord" delimiters=",">
		<cfswitch expression="#UCase(Arguments.replaceType)#">
			<cfcase value="FL">
				<cfif Len(naughtyWord) GTE 3>
					<cfset replacement = Left(naughtyWord,1) & RepeatString(Arguments.repeatValue,Len(naughtyWord) - 2) & Right(naughtyWord,1)>
				<cfelse>
					<cfset replacement = RepeatString(Arguments.repeatValue,Len(naughtyWord))>
				</cfif>	
			</cfcase>
			<cfdefaultcase>
					<cfset replacement = Left(Arguments.replaceString,Len(naughtyWord))>
			</cfdefaultcase>

		</cfswitch>
		<cfset Arguments.body = REReplaceNoCase(Arguments.body,naughtyWord,replacement, "ALL")>
	</cfloop>
	<cfreturn Arguments.body>
</cffunction>

<cfscript>
/**
 * Remove duplicate values from a list.
 * 
 * @param str 	 List to parse. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Tony Bentley (tony@tonybentley.com) 
 * @version 1, May 30, 2010 
 */
function nodupslist(str){
	var delim = ",";
	if(arrayLen(arguments) is 2) delim = arguments[2];
	return arrayToList(createObject("java","java.util.HashSet").init(ListToArray(str,delim)).ToArray(),delim);
}
</cfscript>

<cfscript>
/**
 * Returns a number converted into a string (i.e. 1 becomes &quot;One&quot;).
 * Added catch for number=0. Thanks to Lucas for finding it.
 * 
 * @param number 	 The number to translate. (Required)
 * @return Returns a string. 
 * @author Ben Forta (ben@forta.com) 
 * @version 2, August 20, 2002 
 */
function NumberAsString(number)
{
   VAR Result="";          // Generated result
   VAR Str1="";            // Temp string
   VAR Str2="";            // Temp string
   VAR n=number;           // Working copy
   VAR Billions=0;
   VAR Millions=0;
   VAR Thousands=0;
   VAR Hundreds=0;
   VAR Tens=0;
   VAR Ones=0;
   VAR Point=0;
   VAR HaveValue=0;        // Flag needed to know if to process "0"

   // Initialize strings
   // Strings are "externalized" to simplify
   // changing text or translating
   if (NOT IsDefined("REQUEST.Strs"))
   {
      REQUEST.Strs=StructNew();
      REQUEST.Strs.space=" ";
      REQUEST.Strs.and="and";
      REQUEST.Strs.point="Point";
      REQUEST.Strs.n0="Zero";
      REQUEST.Strs.n1="One";
      REQUEST.Strs.n2="Two";
      REQUEST.Strs.n3="Three";
      REQUEST.Strs.n4="Four";
      REQUEST.Strs.n5="Five";
      REQUEST.Strs.n6="Six";
      REQUEST.Strs.n7="Seven";
      REQUEST.Strs.n8="Eight";
      REQUEST.Strs.n9="Nine";
      REQUEST.Strs.n10="Ten";
      REQUEST.Strs.n11="Eleven";
      REQUEST.Strs.n12="Twelve";
      REQUEST.Strs.n13="Thirteen";
      REQUEST.Strs.n14="Fourteen";
      REQUEST.Strs.n15="Fifteen";
      REQUEST.Strs.n16="Sixteen";
      REQUEST.Strs.n17="Seventeen";
      REQUEST.Strs.n18="Eighteen";
      REQUEST.Strs.n19="Nineteen";
      REQUEST.Strs.n20="Twenty";
      REQUEST.Strs.n30="Thirty";
      REQUEST.Strs.n40="Forty";
      REQUEST.Strs.n50="Fifty";
      REQUEST.Strs.n60="Sixty";
      REQUEST.Strs.n70="Seventy";
      REQUEST.Strs.n80="Eighty";
      REQUEST.Strs.n90="Ninety";
      REQUEST.Strs.n100="Hundred";
      REQUEST.Strs.nK="Thousand";
      REQUEST.Strs.nM="Million";
      REQUEST.Strs.nB="Billion";
   }
   
   // Save strings to an array once to improve performance
   if (NOT IsDefined("REQUEST.StrsA"))
   {
      // Arrays start at 1, to 1 contains 0
      // 2 contains 1, and so on
      REQUEST.StrsA=ArrayNew(1);
      ArrayResize(REQUEST.StrsA, 91);
      REQUEST.StrsA[1]=REQUEST.Strs.n0;
      REQUEST.StrsA[2]=REQUEST.Strs.n1;
      REQUEST.StrsA[3]=REQUEST.Strs.n2;
      REQUEST.StrsA[4]=REQUEST.Strs.n3;
      REQUEST.StrsA[5]=REQUEST.Strs.n4;
      REQUEST.StrsA[6]=REQUEST.Strs.n5;
      REQUEST.StrsA[7]=REQUEST.Strs.n6;
      REQUEST.StrsA[8]=REQUEST.Strs.n7;
      REQUEST.StrsA[9]=REQUEST.Strs.n8;
      REQUEST.StrsA[10]=REQUEST.Strs.n9;
      REQUEST.StrsA[11]=REQUEST.Strs.n10;
      REQUEST.StrsA[12]=REQUEST.Strs.n11;
      REQUEST.StrsA[13]=REQUEST.Strs.n12;
      REQUEST.StrsA[14]=REQUEST.Strs.n13;
      REQUEST.StrsA[15]=REQUEST.Strs.n14;
      REQUEST.StrsA[16]=REQUEST.Strs.n15;
      REQUEST.StrsA[17]=REQUEST.Strs.n16;
      REQUEST.StrsA[18]=REQUEST.Strs.n17;
      REQUEST.StrsA[19]=REQUEST.Strs.n18;
      REQUEST.StrsA[20]=REQUEST.Strs.n19;
      REQUEST.StrsA[21]=REQUEST.Strs.n20;
      REQUEST.StrsA[31]=REQUEST.Strs.n30;
      REQUEST.StrsA[41]=REQUEST.Strs.n40;
      REQUEST.StrsA[51]=REQUEST.Strs.n50;
      REQUEST.StrsA[61]=REQUEST.Strs.n60;
      REQUEST.StrsA[71]=REQUEST.Strs.n70;
      REQUEST.StrsA[81]=REQUEST.Strs.n80;
      REQUEST.StrsA[91]=REQUEST.Strs.n90;
   }

   //zero shortcut
   if(number is 0) return "Zero";

   // How many billions?
   // Note: This is US billion (10^9) and not
   // UK billion (10^12), the latter is greater
   // than the maximum value of a CF integer and
   // cannot be supported.
   Billions=n\1000000000;
   if (Billions)
   {
      n=n-(1000000000*Billions);
      Str1=NumberAsString(Billions)&REQUEST.Strs.space&REQUEST.Strs.nB;
      if (Len(Result))
         Result=Result&REQUEST.Strs.space;
      Result=Result&Str1;
      Str1="";
      HaveValue=1;
   }

   // How many millions?
   Millions=n\1000000;
   if (Millions)
   {
      n=n-(1000000*Millions);
      Str1=NumberAsString(Millions)&REQUEST.Strs.space&REQUEST.Strs.nM;
      if (Len(Result))
         Result=Result&REQUEST.Strs.space;
      Result=Result&Str1;
      Str1="";
      HaveValue=1;
   }

   // How many thousands?
   Thousands=n\1000;
   if (Thousands)
   {
      n=n-(1000*Thousands);
      Str1=NumberAsString(Thousands)&REQUEST.Strs.space&REQUEST.Strs.nK;
      if (Len(Result))
         Result=Result&REQUEST.Strs.space;
      Result=Result&Str1;
      Str1="";
      HaveValue=1;
   }

   // How many hundreds?
   Hundreds=n\100;
   if (Hundreds)
   {
      n=n-(100*Hundreds);
      Str1=NumberAsString(Hundreds)&REQUEST.Strs.space&REQUEST.Strs.n100;
      if (Len(Result))
         Result=Result&REQUEST.Strs.space;
      Result=Result&Str1;
      Str1="";
      HaveValue=1;
   }   

   // How many tens?
   Tens=n\10;
   if (Tens)
      n=n-(10*Tens);
    
   // How many ones?
   Ones=n\1;
   if (Ones)
      n=n-(Ones);
   
   // Anything after the decimal point?
   if (Find(".", number))
      Point=Val(ListLast(number, "."));
   
   // If 1-9
   Str1="";
   if (Tens IS 0)
   {
      if (Ones IS 0)
      {
         if (NOT HaveValue)
            Str1=REQUEST.StrsA[0];
      }
      else
         // 1 is in 2, 2 is in 3, etc
         Str1=REQUEST.StrsA[Ones+1];
   }
   else if (Tens IS 1)
   // If 10-19
   {
      // 10 is in 11, 11 is in 12, etc
      Str1=REQUEST.StrsA[Ones+11];
   }
   else
   {
      // 20 is in 21, 30 is in 31, etc
      Str1=REQUEST.StrsA[(Tens*10)+1];
      
      // Get "ones" portion
      if (Ones)
         Str2=NumberAsString(Ones);
      Str1=Str1&REQUEST.Strs.space&Str2;
   }
   
   // Build result   
   if (Len(Str1))
   {
      if (Len(Result))
         Result=Result&REQUEST.Strs.space&REQUEST.Strs.and&REQUEST.Strs.space;
      Result=Result&Str1;
   }

   // Is there a decimal point to get?
   if (Point)
   {
      Str2=NumberAsString(Point);
      Result=Result&REQUEST.Strs.space&REQUEST.Strs.point&REQUEST.Strs.space&Str2;
   }
    
   return Result;
}
</cfscript>

<cfscript>
/**
 * Strips all non-numeric characters from a string.
 * Modified by RCamden to use one line of code.
 * 
 * @param str 	 String to format. (Required)
 * @return Returns a string. 
 * @author Mindframe, Inc. (info@mindframe.com) 
 * @version 1, September 6, 2002 
 */
function NumbersOnly(str) {
	return reReplace(str,"[^[:digit:]]","","all");
}
</cfscript>

<cfscript>
/**
 * Removes all non-essential formatting from a number.
 * 
 * @param inStr 	 String to format. (Required)
 * @param default_value 	 Used if the formatted string is empty. Defaults to inStr. (Optional)
 * @return Returns a number or string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, December 23, 2002 
 */
function NumberUnFormat(inStr) {
	var outNum = 0;
	var default_value = inStr;

	if(ArrayLen(Arguments) GTE 2) default_value = Arguments[2];

	outNum = REReplace(inStr,"[^0-9\.\-]",'','ALL');
	if (Len(outNum) LT 1) {
		outNum = default_value;
	}

	return outNum;
}
</cfscript>

<cfscript>
/**
 * This function is to be used, to sort a list that has numeric and text values.
 * 
 * @param list 	 List to sort. (Required)
 * @return Returns a string. 
 * @author Matt (Coldfusion@spiraldev.com) 
 * @version 1, January 12, 2004 
 */
function numTextListSort(list) {
	var numArray=arrayNew(1);
	var textArray=arrayNew(1);
	var mg = 1;
	var data = "";
	
	//convert to array for speed
	data = listToArray(list);
	
	//loop through the list passed to the function
	for(;mg lte arrayLen(data);mg=mg+1){
		//if the value at this position of the list is numeric put it in the numList List
		if(isNumeric(data[mg])) numArray[arrayLen(numArray)+1] = data[mg];
		//else put it in the textList List
		else textArray[arrayLen(textArray)+1] = data[mg];
	}
	
	//sort the numList
	arraySort(numArray,"numeric");
	//sort the textList
	arraySort(textArray,"text");
	//put together
	for(mg=1;mg lte arrayLen(textArray);mg=mg+1) {
		numArray[arrayLen(numArray)+1] = textArray[mg];
	}
	
	//return the mainList
	return arrayToList(numArray);
	
}
</cfscript>

<cfscript>
/**
 * Reorders a list to the order of another, placing elements from the complete list not found in the second at the end of the reordered list.
 * 
 * @param list1 	 Initial list. (Required)
 * @param list2 	 List to use for ordering. (Required)
 * @param delim1 	 Delimiter for list1. Defaults to comma. (Optional)
 * @param delim2 	 Delimiter for list2. Defaults to comma. (Optional)
 * @param delim3 	 Delimiter to use for returned list. Defaults to comma. (Optional)
 * @return Returns a list. 
 * @author Erik Madsen (emadsenus@yahoo.com) 
 * @version 2, October 3, 2002 
 */
function OrderListByList(List1, List2) {
 	var ExtraList = "";
	var ResultList = "";
  	var Delim1 = ",";
  	var Delim2 = ",";
  	var Delim3 = ",";
  	var i = 0;
	var j = 0;
	var o = 1;
	var o2 = 1;
	
	// Handle optional arguments
	switch(ArrayLen(arguments)) {
	  case 3:
	    {
	      Delim1 = Arguments[3];
	      break;
	    }
	  case 4:
	    {
	      Delim1 = Arguments[3];
	      Delim2 = Arguments[4];
	      break;
	    }
	  case 5:
	    {
	      Delim1 = Arguments[3];
	      Delim2 = Arguments[4];          
	      Delim3 = Arguments[5];
	      break;
	    }        
	}
	for (i=1; i LTE ListLen(List2, "#Delim2#"); i=i+1)
	{
		 if (ListFindNoCase(List1, ListGetAt(List2, i, "#Delim2#"), "#Delim1#")){
		 	for(o=1; o LTE ListValueCount(List1, ListGetAt(List2, i, "#Delim2#") , "#Delim1#"); o=o+1){
		 		ResultList = ListAppend(ResultList, ListGetAt(List2, i, "#Delim2#"), "#Delim3#");
			}
		 }
	}
	for (j=1; j LTE ListLen(List1, "#Delim1#"); j=j+1)
	{
		 if (not ListFindNoCase(ResultList, ListGetAt(List1, j, "#Delim1#"), "#Delim3#")){
		 	for(o2=1; o2 LTE ListValueCount(List1, ListGetAt(List1, j, "#Delim1#") , "#Delim1#"); o2=o2+1){
		 		ResultList = ListAppend(ResultList, ListGetAt(List1, j, "#Delim1#"), "#Delim3#");
			}
		 }
	}
	Return ResultList;
 }
</cfscript>

<cfscript>
/**
 * Translates a 10 digit Australian telephone/facsimile number (either in STD or Toll Free format) into an Australian formatted telephone number.
 * 
 * @param phoneNumber 	 Number to format. (Required)
 * @return Returns a string. 
 * @author Peter Tilbrook (peter@coldgen.com) 
 * @version 1, February 26, 2004 
 */
function OzFormatTelephone(PhoneNumber) {
    if (not isNumeric(PhoneNumber)) return "";
	if (left(PhoneNumber,1) eq 0) return "(" & left(PhoneNumber, 2) & ")&nbsp;" & mid(PhoneNumber, 4, 4) & "-" & right(PhoneNumber, 4);
	else if (left(PhoneNumber,1) neq 0) return left(PhoneNumber, 4) & "-" & mid(PhoneNumber, 3, 3) & "-" & right(PhoneNumber, 3);
	return "";
}
</cfscript>

<cfscript>
/**
 * Checks a phone number for Australian format.
 * 
 * @param phoneNumber 	 The phone number to check. (Required)
 * @return Return a boolean. 
 * @author Gary Crouch (gc@anatex.net) 
 * @version 1, July 27, 2005 
 */
function ozPhoneFormatPlus(phoneNumber){
	//REGX to find chrs thats are not numbers or <spaces>
	var re = "[^0-9\.[:space:]]";
	//Allowed 2nd numbers in an Ausie Phone number starting in zero
	var allowedNumbers = "2,3,4,5,7,8";
	//2nd digit in the string
	var current2ndNumber = mid( replace( trim(phoneNumber), " ", "" ), 2, 1 );

	//Numbers and spaces are ok
	if(reFindNoCase(re, trim(phoneNumber))) return false;
	
	//Remove spaces and count len must be less than or equal 10
	if(len( replace( trim(phoneNumber), " ", "" ) ) gt 10) return false;
	
	//If the number starts with a zero then it must have a 2,3,4,7,8 as the next digit
	if (left ( replace( trim(phoneNumber), " ", "" ), 1 ) eq 0 and not listFind( allowedNumbers, current2ndNumber ) ) return false;
	
	//If we got here then we must be ok
	return true;
}
</cfscript>

<cfscript>
/**
 * Basic padding function that allows user to decide which side of the submitted string that the characters should be added to (via L or R).
 * 
 * @param string 	 String to pad. (Required)
 * @param char 	 Character to use as pad. (Required)
 * @param number 	 Number of characters to pad. (Required)
 * @param charD 	 Direction to pad. Should be "L" (left) or "R" (right). Defaults to R. (Optional)
 * @return Returns a string. 
 * @author Ron Gambill (rgambill@hotmail.com) 
 * @version 1, May 9, 2003 
 */
function padDirection(string,char,number) {
   // set up variables
   var strLen = len(string);
   var padLen = number - strLen;
   var returnValue = string;
   var charD = "R";

   if(arrayLen(arguments) gte 4) charD = arguments[4]; 
   if (strLen gte number) return string;
   
   if (charD eq "R") return string & RepeatString(char, padLen);
   else return RepeatString(char, padLen) & string;
}
</cfscript>

<cfscript>
/**
 * Pads a string with n characters.  Padding is from the left.
 * 
 * @param string 	 String you want to pad. 
 * @param char 	 Character to use as the padding. 
 * @param count 	 Number of characters to pad the string with. 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, August 16, 2001 
 */
function PadString(string, char, count)
{
  var Padding = RepeatString(char, count);
  return Padding & string;
}
</cfscript>

<cfscript>
/**
 * Pads a string to a length of n characters.  Padding is from the left.
 * Based on the UDF PadString() by Rob Brooks-Bilson (rbils@amkor.com).
 * 
 * @param string 	 String you want to pad. (Required)
 * @param char 	 Character to use as the padding. (Required)
 * @param count 	 Total number of characters to pad the string out to. (Required)
 * @return Returns a string. 
 * @author Stephen Rittler (scrittler@etechsolutions.com) 
 * @version 1, June 18, 2002 
 */
function PadStringToLen(string, char, count)
{
  var strLen = len(string);
  var padLen = count - strLen;
  if (padLen lte 0) {
    return string;
  }
  else {
    return RepeatString(char, padLen) & string;
  }
}
</cfscript>

<cfscript>
/**
 * An &quot;enhanced&quot; version of ParagraphFormat.
 * Added replacement of tab with nonbreaking space char, idea by Mark R Andrachek.
 * Rewrite and multiOS support by Nathan Dintenfas.
 * 
 * @param string 	 The string to format. (Required)
 * @return Returns a string. 
 * @author Ben Forta (ben@forta.com) 
 * @version 3, June 26, 2002 
 */
function ParagraphFormat2(str) {
	//first make Windows style into Unix style
	str = replace(str,chr(13)&chr(10),chr(10),"ALL");
	//now make Macintosh style into Unix style
	str = replace(str,chr(13),chr(10),"ALL");
	//now fix tabs
	str = replace(str,chr(9),"&nbsp;&nbsp;&nbsp;","ALL");
	//now return the text formatted in HTML
	return replace(str,chr(10),"<br />","ALL");
}
</cfscript>

<cfscript>
/**
 * Convert a text with many lines into a html list.
 * 
 * @param text 	 Text to format. (Required)
 * @return Returns a string. 
 * @author Tony Monast (merkel_@hotmail.com) 
 * @version 1, May 10, 2005 
 */
function paragraphToList(text) { 
	var thelist = "";
	var i = 1;
	text = trim(text);
	for(i=1; i lte listLen(text,chr(13));i=i+1) thelist = thelist & "<li>" & ListGetAt(text,i,chr(13)) & "</li>";
	if(len(thelist) GT 0) {  
		thelist = "<ul>" & thelist & "</ul>";
		return thelist ;
	} else return "";
}
</cfscript>

<cfscript>
/**
 * Parses a CMS (SNV or CVS) revision string into a usable variable.
 * 
 * @param cmsRevision 	 Version string. (Required)
 * @return Returns a number. 
 * @author Peter J. Farrell (pjf@maestropublishing.com) 
 * @version 1, March 1, 2006 
 */
function parseCMSRevision(cmsRevision) {
	return listGetAt(arguments.cmsRevision, 2, " ");
}
</cfscript>

<cfscript>
/**
 * Parse out the first set of numbers in a string.
 * 
 * @param string 	 String to parse. (Required)
 * @return Returns a string. 
 * @author Marco G. Williams (email@marcogwilliams.com) 
 * @version 1, May 22, 2003 
 */
function parseInt(String){
	var NewString = "";
	var i = 1;

	for(i=1; i lt Len(String); i = i + 1) {
		if( isNumeric( mid(String,i,1) ) ) { newString = val( mid( String,i,Len(String) ) ); break;}
	}
	return NewString;
}
</cfscript>

<cfscript>
/**
 * Parses subjects returned by CFPOP.
 * 
 * @param subject 	 Subject string to parse. (Required)
 * @return Returns a structure. 
 * @author Axel Glorieux (axel@misterbuzz.com) 
 * @version 1, September 27, 2002 
 */
function parsepopsubject(subj){
	var re = "=\?([^?]+)\?([BbQq])\?([^?]+)\?=";
	var re2 ="=([[:xdigit:]]{2})";
	var tmp = refind(re,subj,1,true);
	var obj = structnew();
	var type = "";
	var start = 1;
	var eos = false;
	var tmp2 = "";
	var newch = "";
	if (arraylen(tmp.pos) NEQ 4){
		obj.subject = subj;
		obj.encoding = "";
		return obj;
	}
	obj.encoding = mid(subj,tmp.pos[2],tmp.len[2]);
	obj.subject = mid(subj,tmp.pos[4],tmp.len[4]);
	type = mid(subj,tmp.pos[3],tmp.len[3]);
	switch (type){
		case "b":{
			obj.subject = tostring(tobinary(obj.subject));
			break;
		}
		case "q":{
			while (NOT eos){
				obj.subject = replace(obj.subject,"_"," ","ALL");
				tmp2 = refind(re2,obj.subject,start,true);
				if (tmp2.pos[1]){
					newch = chr(inputbasen(mid(obj.subject,tmp2.pos[2],tmp2.len[2]),16));
					obj.subject = removechars(obj.subject,tmp2.pos[1],tmp2.len[1]);
					obj.subject = insert(newch,obj.subject,tmp2.pos[1]-1);
					start = tmp2.pos[2];
				}
				else {
					eos = true;
				}
			}
			break;
		}
	}
	return obj;
}
</cfscript>

<!---
 Converts a string of text from Quoted-Printable format to UTF-8.
 
 @param text 	 String to parse. (Required)
 @return Returns a string. 
 @author Isaac Dealey (info@turnkey.to) 
 @version 1, January 10, 2007 
--->
<cffunction name="parseQuotedPrintable" output="false">
	<cfargument name="text" type="string" required="true">
	<cfset var crlf = chr(13) & chr(10)>
	<cfset var char = "">
	<cfset var x = 0>
	
	<cfset text = ListToArray(crlf & text,"=")>
	<cfloop index="x" from="1" to="#arrayLen(text)#">
		<cfset char = left(text[x],2)>
		<cfset text[x] = removechars(text[x],1,2)>
		<cfif char is not crlf>
			<cfset text[x] = CHR(InputBaseN(char, 16)) & text[x]>
		</cfif>
	</cfloop>
	
	<cfreturn ArrayToList(text,"")>
</cffunction>

<cfscript>
/**
 * Parses a Url and returns a struct with keys defining the information in the Uri.
 * 
 * @param sURL 	 String to parse. (Required)
 * @return Returns a struct. 
 * @author Dan G. Switzer, II (dswitzer@pengoworks.com) 
 * @version 1, January 10, 2007 
 */
function parseUrl(sUrl){
	// var to hold the final structure
	var stUrlInfo = structNew();
	// vars for use in the loop, so we don't have to evaluate lists and arrays more than once
	var i = 1;
	var sKeyPair = "";
	var sKey = "";
	var sValue = "";
	var aQSPairs = "";
	var sPath = "";
	/*
		from: http://www.ietf.org/rfc/rfc2396.txt

		^((([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*)))?
		 123            4  5          6       7  8        9 A

			scheme    = $3
			authority = $5
			path      = $6
			query     = $8
			fragment  = $10 (A)
	*/
	var sUriRegEx = "^(([^:/?##]+):)?(//([^/?##]*))?([^?##]*)(\?([^##]*))?(##(.*))?";
	/*
		separates the authority into user info, domain and port

		^((([^@:]+)(:([^@]+))?@)?([^:]*)?(:(.*)))?
		 123       4 5           6       7 8

			username  = $3
			password  = $5
			domain    = $6
			port      = $8
	*/
	var sAuthRegEx = "^(([^@:]+)(:([^@]+))?@)?([^:]*)?(:(.*))?";
	/*
		separates the path into segments & parameters

		((/?[^;/]+)(;([^/]+))?)
		12         3 4

			segment     = $1
			path        = $2
			parameters  = $4
	*/
	var sSegRegEx = "(/?[^;/]+)(;([^/]+))?";

	// parse the url looking for info
	var stUriInfo = reFindNoCase(sUriRegEx, sUrl, 1, true);
	// this is for the authority section
	var stAuthInfo = "";
	// this is for the segments in the path
	var stSegInfo = "";

	// create empty keys
	stUrlInfo["scheme"] = "";
	stUrlInfo["authority"] = "";
	stUrlInfo["path"] = "";
	stUrlInfo["directory"] = "";
	stUrlInfo["file"] = "";
	stUrlInfo["query"] = "";
	stUrlInfo["fragment"] = "";
	stUrlInfo["domain"] = "";
	stUrlInfo["port"] = "";
	stUrlInfo["username"] = "";
	stUrlInfo["password"] = "";
	stUrlInfo["params"] = structNew();

	// get the scheme
	if( stUriInfo.len[3] gt 0 ) stUrlInfo["scheme"] = mid(sUrl, stUriInfo.pos[3], stUriInfo.len[3]);
	// get the authority
	if( stUriInfo.len[5] gt 0 ) stUrlInfo["authority"] = mid(sUrl, stUriInfo.pos[5], stUriInfo.len[5]);
	// get the path
	if( stUriInfo.len[6] gt 0 ) stUrlInfo["path"] = mid(sUrl, stUriInfo.pos[6], stUriInfo.len[6]);
	// get the path
	if( stUriInfo.len[8] gt 0 ) stUrlInfo["query"] = mid(sUrl, stUriInfo.pos[8], stUriInfo.len[8]);
	// get the fragment
	if( stUriInfo.len[10] gt 0 ) stUrlInfo["fragment"] = mid(sUrl, stUriInfo.pos[10], stUriInfo.len[10]);

	// break authority into user info, domain and ports
	if( len(stUrlInfo["authority"]) gt 0 ){
		// parse the authority looking for info
		stAuthInfo = reFindNoCase(sAuthRegEx, stUrlInfo["authority"], 1, true);

		// get the domain
		if( stAuthInfo.len[6] gt 0 ) stUrlInfo["domain"] = mid(stUrlInfo["authority"], stAuthInfo.pos[6], stAuthInfo.len[6]);
		// get the port
		if( stAuthInfo.len[8] gt 0 ) stUrlInfo["port"] = mid(stUrlInfo["authority"], stAuthInfo.pos[8], stAuthInfo.len[8]);
		// get the username
		if( stAuthInfo.len[3] gt 0 ) stUrlInfo["username"] = mid(stUrlInfo["authority"], stAuthInfo.pos[3], stAuthInfo.len[3]);
		// get the password
		if( stAuthInfo.len[5] gt 0 ) stUrlInfo["password"] = mid(stUrlInfo["authority"], stAuthInfo.pos[5], stAuthInfo.len[5]);
	}

	// the query string in struct form
	stUrlInfo["params"]["segment"] = structNew();

	// if the path contains any parameters, we need to parse them out
	if( find(";", stUrlInfo["path"]) gt 0 ){
		// this is for the segments in the path
		stSegInfo = reFindNoCase(sSegRegEx, stUrlInfo["path"], 1, true);

		// loop through all the segments and build the strings
		while( stSegInfo.pos[1] gt 0 ){
			// build the path, excluding parameters
			sPath = sPath & mid(stUrlInfo["path"], stSegInfo.pos[2], stSegInfo.len[2]);

			// if there are some parameters in this segment, add them to the struct
			if( stSegInfo.len[4] gt 0 ){

				// put the parameters into an array for easier looping
				aQSPairs = listToArray(mid(stUrlInfo["path"], stSegInfo.pos[4], stSegInfo.len[4]), ";");

				// now, loop over the array and build the struct
				for( i=1; i lte arrayLen(aQSPairs); i=i+1 ){
					sKeyPair = aQSPairs[i]; // current pair
					sKey = listFirst(sKeyPair, "="); // current key
					// make sure there are 2 keys
					if( listLen(sKeyPair, "=") gt 1){
						sValue = urlDecode(listLast(sKeyPair, "=")); // current value
					} else {
						sValue = ""; // set blank value
					}
					// check if key already added to struct
					if( structKeyExists(stUrlInfo["params"]["segment"], sKey) ) stUrlInfo["params"]["segment"][sKey] = listAppend(stUrlInfo["params"]["segment"][sKey], sValue); // add value to list
					else structInsert(stUrlInfo["params"]["segment"], sKey, sValue); // add new key/value pair
				}
			}

			// get the ending position
			i = stSegInfo.pos[1] + stSegInfo.len[1];

			// get the next segment
			stSegInfo = reFindNoCase(sSegRegEx, stUrlInfo["path"], i, true);
		}

	} else {
		// set the current path
		sPath = stUrlInfo["path"];
	}

	// get the file name
	stUrlInfo["file"] = getFileFromPath(sPath);
	// get the directory path by removing the file name
	if( len(stUrlInfo["file"]) gt 0 ){
		stUrlInfo["directory"] = replace(sPath, stUrlInfo["file"], "", "one");
	} else {
		stUrlInfo["directory"] = sPath;
	}

	// the query string in struct form
	stUrlInfo["params"]["url"] = structNew();

	// if query info was supplied, break it into a struct
	if( len(stUrlInfo["query"]) gt 0 ){
		// put the query string into an array for easier looping
		aQSPairs = listToArray(stUrlInfo["query"], "&");

		// now, loop over the array and build the struct
		for( i=1; i lte arrayLen(aQSPairs); i=i+1 ){
			sKeyPair = aQSPairs[i]; // current pair
			sKey = listFirst(sKeyPair, "="); // current key
			// make sure there are 2 keys
			if( listLen(sKeyPair, "=") gt 1){
				sValue = urlDecode(listLast(sKeyPair, "=")); // current value
			} else {
				sValue = ""; // set blank value
			}
			// check if key already added to struct
			if( structKeyExists(stUrlInfo["params"]["url"], sKey) ) stUrlInfo["params"]["url"][sKey] = listAppend(stUrlInfo["params"]["url"][sKey], sValue); // add value to list
			else structInsert(stUrlInfo["params"]["url"], sKey, sValue); // add new key/value pair
		}
	}

	// return the struct
	return stUrlInfo;
}
</cfscript>

<cfscript>
/**
 * An alternative way to retreive data from a URL.
 * 
 * @param listType 	 Defines how the URL vars are encoded. Values are either "linear" (index.cfm/foo/1/goo/2) or "staggered" (foo/goo/1/2). Default is linear. (Optional)
 * @param strParamDelimiter 	 What character is used to split values. (Optional)
 * @return Returns either a struct of data or an error string. 
 * @author Zac Belado (zac@bayleaf.com) 
 * @version 1, July 14, 2005 
 */
function parseURLData() {
        
        var strListType = "";
        var strParamDelimiter = "";
        var strPathInfo = "";
        var thisLen  = 0;
        var URLLen = 0;
        var URLData = "";
        var evenNumberOfParams = true;
        var containsDelim = 0;
        var paramList = "";
        var paramStruct = structNew();
        var offset = 0;

        // get the listType if one was provided
        if (arrayLen(arguments) eq 1) {
        
            strListType = arguments[1];

        } else If(arrayLen(arguments) eq 2) {
        
            strListType = arguments[1];
            strParamDelimiter = arguments[2];
            
        }
        
        // see if we can user the listType arg
        if (trim(strListType) neq "" AND NOT isNumeric(strListType) ) {
            strListType = strListType;
        } else {
            strListType = "linear";
        }
        
        // see if we can user the listType arg
        if (trim(strParamDelimiter) neq "" AND NOT isNumeric(strParamDelimiter) ) {
            if (len(strParamDelimiter) eq 1) {
                strParamDelimiter = strParamDelimiter;
            } else {
                strParamDelimiter = "/";
            }
        } else {
            strParamDelimiter = "/";
        }
        
        // default back to "linear" if the list type isn't staggered or linear
        if (strListType neq "linear" AND strListType neq "staggered") {
            strListType = "linear";
        }

        // get the path info from either path_info or request_uri
        if (isDefined("CGI.path_info")) {
            strPathInfo = CGI.path_info;
        } else {
            strPathInfo = CGI.request_uri;
        }

        thisLen = len(CGI.script_name);
        URLLen =  len(strPathInfo);
        
        if (URLLen eq 0) return paramStruct;

        //URLData = right(strPathInfo, URLLen - thisLen - 1);
		urlData = strPathInfo;
        // make sure there is the required data
        containsDelim = Find(strParamDelimiter, URLData);
        
        if (containsDelim) {
        
            // it does so make a list and read them in
            paramList = listChangeDelims(URLData, ",", strParamDelimiter);
            paramLimit = listLen(paramList);
            
            // trim the list if its got an odd number of items
            if ( NOT (int(paramLimit/2) eq (paramLimit/2))) {
                evenNumberOfParams = false;
            }

            if (strListType eq "linear") {
                
                // check to make sure that there are an even number of params
                if (NOT evenNumberOfParams) {
                    // cut the last entry off as this list has an odd number of elements
                    paramList = listDeleteAt(paramList, paramLimit);
                    paramLimit = paramLimit - 1;
                }
                
                // param and param data are in pairs
                for ( i = 1; i lte paramLimit; i = i + 2) {
                    structInsert (paramStruct, listGetAt(paramList, i), listGetAt(paramList, i+1));
                }
                
            } else {
                
                // staggered which means the params are listed then the param data
                offset = paramLimit / 2;

                // check to make sure that there are an even number of params
                if (NOT evenNumberOfParams) {
                   offset = fix(paramLimit / 2);
                   paramList = listDeleteAt(paramList, offset + 1);
                }

                 for ( i = 1; i lte offset; i = i + 1) {
                    structInsert (paramStruct, listGetAt(paramList, i), listGetAt(paramList, i + offset));
                }
                
            }
            
            // return a copy of the struct and clear the local version
            return structCopy(paramStruct);
            
        } 
    }
</cfscript>

<cfscript>
/**
 * Allows you to specify the mask you want added to your phone number.
 * v2 - code optimized by Ray Camden
 * v3.01 
 * v3.02 added code for single digit phone numbers from John Whish   
 * v4 make a default format - by James Moberg
 * 
 * @param varInput 	 Phone number to be formatted. (Required)
 * @param varMask 	 Mask to use for formatting. x represents a digit. Defaults to (xxx) xxx-xxxx (Optional)
 * @return Returns a string. 
 * @author Derrick Rapley (adrapley@rapleyzone.com) 
 * @version 4, February 11, 2011 
 */
function phoneFormat(varInput) {
       var curPosition = "";
       var i = "";
       var varMask = "(xxx) xxx-xxxx";
       var newFormat = "";
       var startpattern = "";
   if (arrayLen(arguments) gte 2){ varMask = arguments[2]; }
       newFormat = trim(ReReplace(varInput, "[^[:digit:]]", "", "all"));
       startpattern = ReReplace(ListFirst(varMask, "- "), "[^x]", "", "all");
       if (Len(newFormat) gte Len(startpattern)) {
               varInput = trim(varInput);
               newFormat = " " & reReplace(varInput,"[^[:digit:]]","","all");
               newFormat = reverse(newFormat);
               varmask = reverse(varmask);
               for (i=1; i lte len(trim(varmask)); i=i+1) {
                       curPosition = mid(varMask,i,1);
                       if(curPosition neq "x") newFormat = insert(curPosition,newFormat, i-1) & " ";
               }
               newFormat = reverse(newFormat);
               varmask = reverse(varmask);
       }
       return trim(newFormat);
}
</cfscript>

<cfscript>
/**
 * Very simple function to display either the plural or singular form for a numeric that is passed in.
 * 
 * @param quantity 	 Quantity. (Required)
 * @param singular 	 Singular version of the string. (Required)
 * @param plural 	 Plural version of the string. (Required)
 * @return Returns a string. 
 * @author Tony Felice, Ken Fricklas (sites@breckcomm.com; ken@breckcomm.com) 
 * @version 1, February 18, 2004 
 */
function pluralize(quantity, singular, plural){
	return IIF(quantity EQ 1, DE(singular), DE(plural));
}
</cfscript>

<!---
 Returns the most popular words in a query column and their count.
 Version 2 mods by Raymond Camden
 
 @param qQuery 	 The query to inspect. (Required)
 @param targetCol 	 The column to inspect. (Required)
 @param returnCount 	 Number of top words to return. Defaults to 10. (Optional)
 @param ignoreWords 	 Words to ignore. Defaults to: I,me,the,and,if,but,not,as,a,an,for,of,this,on,to,is (Optional)
 @return Returns a query. 
 @author C. Hatton Humphrey (hat@guardian-web.com) 
 @version 2, August 12, 2005 
--->
<cffunction name="popularWords" returntype="query" output="No">
	<cfargument name="qQuery" type="query" required="true">
	<cfargument name="targetCol" type="string" required="true">
	<cfargument name="returnCount" type="numeric" required="false" default="10">
	<cfargument name="ignoreWords" type="string" required="false" default="I,me,the,and,if,but,not,as,a,an,for,of,this,on,to,is">

	<cfset var thisRow = "">
	<cfset var thisLine = "">
	<cfset var thisWord = "">
	<cfset var wordData = structNew()>
	<cfset var qFinalResults = "">
	
	<!--- Create a query to contain the results, prime it so that loops
	don't fail since we can't INSERT or UPDATE using QoQ --->
	<cfset var qResults = queryNew("word,times")>

	<!--- Begin the looping, go through the query to check --->
	<cfloop from="1" to="#arguments.qQuery.RecordCount#" index="thisRow">
		<!--- Ease of use; set a "nickname" for the current line --->
		<cfset thisLine = arguments.qQuery[targetcol][thisRow]>

 		<!--- Loop through the line treating it as a list --->
 		<cfloop list="#thisLine#" delimiters=" " index="thisWord">
   
			<!--- Test for the words that we need to ignore (include all one-letter words) --->
	 		<cfif not listFindNoCase(arguments.ignoreWords, thisWord) and len(trim(thisWord)) gt 1>
		  		<cfif not structKeyExists(wordData, thisWord)>
						<cfset wordData[thisWord] = 0>
				</cfif>
				<cfset wordData[thisWord] = wordData[thisWord] + 1>
			</cfif>

	   </cfloop>
	</cfloop>

	<cfloop item="thisWord" collection="#wordData#">
		<cfset queryAddRow(qResults)>
		<cfset querySetCell(qResults, "word", thisWord)>
		<cfset querySetCell(qResults, "times", wordData[thisWord])>
	</cfloop>
	
	<!--- We've built our query, now use QoQ to get the "top 10" by count --->
	<cfquery name="qFinalResults" dbtype="query" maxrows="#arguments.returnCount#">
	select word, times
	from qresults
	order by times desc
	</cfquery>
	
	<cfreturn qFinalResults>
</cffunction>

<cfscript>
/**
 * Emulates the preg_match function in PHP for returning a regex match along with any backreferences.
 * 
 * @param regex 	 Regular expression. (Required)
 * @param str 	 String to search. (Required)
 * @return Returns an array. 
 * @author Aaron Eisenberger (aaron@x-clothing.com) 
 * @version 1, February 15, 2004 
 */
function preg_match(regex,str) {
	var results = arraynew(1);
	var match = "";
	var x = 1;
	if (REFind(regex, str, 1)) { 
		match = REFind(regex, str, 1, TRUE); 
		for (x = 1; x lte arrayLen(match.pos); x = x + 1) {
			if(match.len[x])
				results[x] = mid(str, match.pos[x], match.len[x]);
			else
				results[x] = '';
		}
	}
	return results;
}
</cfscript>

<cfscript>
/**
 * Emulates the preg_match_all function in PHP for returning all regex matches along with their backreferences.
 * 
 * @param regex 	 Regular expression. (Required)
 * @param str 	 String to search. (Required)
 * @return Returns an array. 
 * @author Aaron Eisenberger (aaron@x-clothing.com) 
 * @version 1, February 15, 2004 
 */
function preg_match_all(regex,str) {
	var results = arraynew(2);
	var pos = 1;
	var loop = 1;
	var match = "";
	var x= 1;
	
	while (REFind(regex, str, pos)) { 
		match = REFind(regex, str, pos, TRUE); 
		for (x = 1; x lte arrayLen(match.pos); x = x + 1) {
			if(match.len[x])
				results[x][loop] = mid(str, match.pos[x], match.len[x]);
			else
				results[x][loop] = '';
		}
		pos = match.pos[1] + match.len[1];
		loop = loop + 1;
	}
	return results;
}
</cfscript>

<cfscript>
/**
 * Checks the strength of a user supplied password.
 * 
 * @param pwString 	 String to check. (Required)
 * @return Returns a struct. 
 * @author charlie griefer (charlie@griefer.com) 
 * @version 1, October 14, 2008 
 */
function pwStrength(pwString) {
	var retStruct = structNew();

	retStruct.originalString	= arguments.pwString;
	retStruct.originalLength	= len(arguments.pwString);
	retStruct.numericVals		= len(rereplace(pwString, '[^0-9]', '', 'all'));
	retStruct.alphas			= len(rereplaceNoCase(pwString, '[^a-z]', '', 'all'));
	retStruct.alphaUppers		= len(rereplace(pwString, '[^A-Z]', '', 'all'));
	retStruct.alphaLowers		= len(rereplace(pwString, '[^a-z]', '', 'all'));
	retStruct.badChars			= len(rereplace(pwString, '[\w]', '', 'all'));
	
	return retStruct;
}
</cfscript>

<cfscript>
/**
 * Takes a selected column of data from a query and converts it into a list.
 * 
 * @param qry 	 Query to use. (Required)
 * @param column 	 Column to use. (Required)
 * @param delim 	 Delimiter. Defaults to a comma. (Optional)
 * @return Returns a list. 
 * @author Randy Johnson (randy@cfedge.com) 
 * @version 1, January 4, 2007 
 */
function queryColumnToList(qry, column) {
	var theList = "";
	var counter = "";
	var num_rows = arguments.qry.recordcount;
	var delim = ",";
	if(arrayLen(arguments) gte 3) delim = arguments[3];
	for (counter=1; counter lte num_rows; counter=counter+1) theList = listAppend(theList, arguments.qry[arguments.column][counter],delim);
	return theList;
}
</cfscript>

<cfscript>
/**
 * Changes a var in a query string.
 * 
 * @param name 	 The name of the name/value pair you want to modify. (Required)
 * @param value 	 The new value for the name/value pair you want to modify. (Required)
 * @param qs 	 Query string to modify. Defaults to CGI.QUERY_STRING. (Optional)
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 2, September 5, 2002 
 */
function QueryStringChangeVar(variable,value){
	//var to hold the final string
	var string = "";
	//vars for use in the loop, so we don't have to evaluate lists and arrays more than once
	var ii = 1;
	var thisVar = "";
	var thisIndex = "";
	var array = "";
	var changedIt = 0;
	//if there is a third argument, use that as the query string, otherwise default to cgi.query_string
	var qs = cgi.query_string;
	if(arrayLen(arguments) GT 2)
		qs = arguments[3];

	//put the query string into an array for easier looping
	array = listToArray(qs,"&");
	//now, loop over the array and rebuild the string
	for(ii = 1; ii lte arrayLen(array); ii = ii + 1){
		thisIndex = array[ii];
		thisVar = listFirst(thisIndex,"=");
		//if this is the var, edit it to the value, otherwise, just append
		if(thisVar is variable){
			string = listAppend(string,thisVar & "=" & value,"&");
			changedIt = 1;
		}
		else{
			string = listAppend(string,thisIndex,"&");
		}
	}
	//if it was not changed, add it!
	if(NOT changedIt)
		string = listAppend(string,variable & "=" & value,"&");
	//return the string
	return string;
}
</cfscript>

<cfscript>
/**
 * Deletes a var from a query string.
 * Idea for multiple args from Michael Stephenson (michael.stephenson@adtran.com)
 * 
 * @param variable 	 A variable, or a list of variables, to delete from the query string. 
 * @param qs 	 Query string to modify. Defaults to CGI.QUERY_STRING. 
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1.1, February 24, 2002 
 */
function queryStringDeleteVar(variable){
	//var to hold the final string
	var string = "";
	//vars for use in the loop, so we don't have to evaluate lists and arrays more than once
	var ii = 1;
	var thisVar = "";
	var thisIndex = "";
	var array = "";
	//if there is a second argument, use that as the query string, otherwise default to cgi.query_string
	var qs = cgi.query_string;
	if(arrayLen(arguments) GT 1)
		qs = arguments[2];
	//put the query string into an array for easier looping
	array = listToArray(qs,"&");		
	//now, loop over the array and rebuild the string
	for(ii = 1; ii lte arrayLen(array); ii = ii + 1){
		thisIndex = array[ii];
		thisVar = listFirst(thisIndex,"=");
		//if this is the var, edit it to the value, otherwise, just append
		if(not listFind(variable,thisVar))
			string = listAppend(string,thisIndex,"&");
	}
	//return the string
	return string;
}
</cfscript>

<cfscript>
/**
 * Gets the value of a variable in a query string.
 * 
 * @param query_string 	 The query string to examine. (Required)
 * @param this_var_name 	 The variable to look for. (Required)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@hotmail.com) 
 * @version 1, August 1, 2005 
 */
function queryStringGetVar(querystring, this_var_name){
	var re_found_struct = "";
	querystring = trim(querystring);
	
	re_found_struct = REFindNoCase("(^|[\?|&])#this_var_name#=([^\&]*)", querystring, 1, "true");
	// = re_found_struct.len & re_found_struct.pos
	
	if(arrayLen(re_found_struct.pos) gte 3) {
		if (re_found_struct.pos[3] GT 0) return urlDecode(mid(querystring, re_found_struct.pos[3], re_found_struct.len[3]));
		else return "";
	} else return "";
}
</cfscript>

<cfscript>
/**
 * Convert the query into a CSV format using Java StringBuffer Class.
 * 
 * @param query 	 The query to convert. (Required)
 * @param headers 	 A list of headers to use for the first row of the CSV string. Defaults to all the columns. (Optional)
 * @param cols 	 The columns from the query to transform. Defaults to all the columns. (Optional)
 * @return Returns a string. 
 * @author Qasim Rasheed (qasimrasheed@hotmail.com) 
 * @version 1, March 23, 2005 
 */
function QueryToCSV2(query){
	var csv = createobject( 'java', 'java.lang.StringBuffer');
	var i = 1;
	var j = 1;
	var cols = "";
	var headers = "";
	var endOfLine = chr(13) & chr(10);
	if (arraylen(arguments) gte 2) headers = arguments[2];
	if (arraylen(arguments) gte 3) cols = arguments[3];
	if (not len( trim( cols ) ) ) cols = query.columnlist;
	if (not len( trim( headers ) ) ) headers = cols;
	headers = listtoarray( headers );
	cols = listtoarray( cols );
	
	for (i = 1; i lte arraylen( headers ); i = i + 1)
		csv.append( '"' & headers[i] & '",' );
	csv.append( endOfLine );
	
	for (i = 1; i lte query.recordcount; i= i + 1){
		for (j = 1; j lte arraylen( cols ); j=j + 1){
			if (isNumeric( query[cols[j]][i] ) )
				csv.append( query[cols[j]][i] & ',' );
			else
				csv.append( '"' & query[cols[j]][i] & '",' );
			
		}
		csv.append( endOfLine );
	}
	return csv.toString();
}
</cfscript>

<cfscript>
/**
 * Creates a list of select-field option tags from the provided query.
 * 
 * @param theQuery 	 The query to use. (Required)
 * @param ValueField 	 The field to use for the value of the drop downs. (Required)
 * @param DisplayField 	 The field to use for the display of the drop downs. Defaults to ValueField. (Optional)
 * @param Selected 	 The selected value. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function QueryToSelectOptions(theQuery, ValueField) {
	var out_string  = "";
	var row         = 1;
	var CR          = chr(13);
	var DisplayField = ValueField;
	var Selected    = "";
	
	if(ArrayLen(Arguments) gte 3) DisplayField = Arguments[3];
	
	if(ArrayLen(Arguments) GTE 4) Selected = Arguments[4];

	for(row=1; row LTE theQuery.recordCount; row=row+1){
		if ((Selected NEQ "") and (theQuery[DisplayField][row] EQ Selected)) {
			out_string  = out_string & "<option value=""#Replace(theQuery[ValueField][row], """", "&quot;", "ALL")#"" selected>#ReplaceList(theQuery[DisplayField][row], "<,>", "&lt;,&gt;")#</option>#CR#";
		} else {
			out_string  = out_string & "<option value=""#Replace(theQuery[ValueField][row], """", "&quot;", "ALL")#"">#ReplaceList(theQuery[DisplayField][row], "<,>", "&lt;,&gt;")#</option>#CR#";
		}
	}

	return out_string;
}
</cfscript>

<cfscript>
/**
 * Converts elements in a quoted list to an array.
 * 
 * @param theList 	 The list to parse. (Required)
 * @return Returns an array. 
 * @author Anthony Cooper (ant@outsrc.co.uk) 
 * @version 1, January 3, 2007 
 */
function quotedListToArray(theList) {
	var items = arrayNew( 1 );
	var i = 1;
	var start = 1;
	var search = structNew();
	var quoteChar = """";

	while(start LT len(theList)) {
		search = reFind('(\#quoteChar#.*?\#quoteChar#)|([0-9\.]*)', theList, start, true );
			
		if (arrayLen(search.LEN) gt 1) {
			items[i] = mid(theList, search.POS[1], (search.LEN[1])); //Extract string
			items[i] = reReplace(items[i], '^\#quoteChar#|\#quoteChar#$', "", "All" );	 //Remove double quote character
			start = search.POS[1] + search.LEN[1] + 1;
			i = i + 1;
		}
		else {
			start = Len( theList );
		}
	}
		
	return items;	
}
</cfscript>

<!---
 I generate a randomized string of desired length.
 
 @param theString 	 string of text to randomize (Required)
 @param theLength 	 length of random string to create (Required)
 @return returns a string 
 @author Stephen Withington (steve@stephenwithington.com) 
 @version 0, May 9, 2009 
--->
<cffunction name="RandomizeString" returntype="string" output="false" access="public" 
			hint="pass me a string and desired length and i'll randomize it for you.">
	<cfargument name="theString" type="string" required="true" default="0123456789ABCDEF" />
	<cfargument name="theLength" type="numeric" required="true" default="32" />
	<cfset var randomizedString = "" />
	<cfset var theIndex = "" />

	<cfloop index="theIndex" from="1" to="#val(arguments.theLength)#" step="1">
		<cfset randomizedString = randomizedString & mid(arguments.theString, rand()*len(arguments.theString)+1, 1) />
	</cfloop>
	<cfreturn randomizedString />	
</cffunction>

<cfscript>
/**
 * Returns a randomly generated string using the specified character sets and length(s)
 * 
 * @param strLen 	 Either a number of a list of numbers representing the range in size of the returned string. (Required)
 * @param charset 	 A string describing the type of random string. Can contain: alpha, numeric, and upper. (Required)
 * @return Returns a string. 
 * @author Bobby Hartsfield (bobby@acoderslife.com) 
 * @version 2, April 2, 2007 
 */
function randStr(strLen, charSet) {
	var usableChars = "";
	var charSets = arrayNew(1);
	var tmpStr = "";	
	var newStr = "";
	var i = 0;
	var thisCharPos = 0;
	var thisChar = "";
	
	charSets[1] = '48,57';	// 0-9
	charSets[2] = '65,90';	// A-Z
	charSets[3] = '97,122';	// a=z
	
	if (findnocase('alpha', charSet)) { usableChars = listappend(usableChars, 3); }
	
	if (findnocase('numeric', charSet)) { usableChars = listappend(usableChars, 1); }
	
	if (findnocase('upper', charSet)) { usableChars = listappend(usableChars, 2); }
	
	if (len(usableChars) is 0) { usableChars = '1,2,3'; }

	if(listlen(strLen) gt 1 and listfirst(strLen) lt listlast(strLen)) { strLen = randrange(listfirst(strLen), listlast(strLen)); }
	else if (val(strLen) is 0) { strLen = 8; }
	
	
	while (len(tmpStr) LE strLen-1)
	{
		thisSet = listFirst(usableChars);
		usableChars = listdeleteat(usableChars, 1);
		usableChars = listappend(usableChars, thisSet);
	
		tmpStr = tmpStr & chr(randrange(listfirst(charSets[thisSet]), listlast(charSets[thisSet])));
	}
	
	for (i=1; i lte strLen; i=i+1)
	{
		thisCharPos = randrange(1, len(tmpStr));
		thisChar = mid(tmpStr, thisCharPos, 1);
		tmpStr = removeChars(tmPStr, thisCharPos, 1);
		newstr = newstr & thisChar;
	}
	
	return newStr;
}
</cfscript>

<cfscript>
/**
 * Returns a random string of the specified length of either alpha, numeric or mixed-alpha-numeric characters.
 * v2, support for lower case
 * v3 - more streamlined code
 * 
 * @param Type 	 Type of random string to create. (Required)
 * @param Length 	 Length of random string to create. (Required)
 * @return Returns a string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 2, November 4, 2003 
 */
function randString(type,ct){
 var i=1;
 var randStr="";
 var randNum="";
 var useList="";
 var alpha="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z";
 var secure="!,@,$,%,&,*,-,_,=,+,?,~";
 for(i=1;i LTE ct;i=i+1){  
  if(type is "alpha"){
   randNum=RandRange(1,52);
   useList=alpha;
  }else if(type is "alphanum"){
   randNum=RandRange(1,62);
   useList="#alpha#,0,1,2,3,4,5,6,7,8,9";
  }else if(type is "secure"){
   randNum=RandRange(1,73);
   useList="#alpha#,0,1,2,3,4,5,6,7,8,9,#secure#";
  }else{
   randNum=RandRange(1,10);
   useList="0,1,2,3,4,5,6,7,8,9";
  }
  
  randStr="#randStr##ListGetAt(useList,randNum)#";
 }
 return randStr;
}
</cfscript>

<cfscript>
/**
 * Create a java.util.regex.Pattern in a CF-friendly way.
 * 
 * @param flags 	 List or an array of valid Java Regex pattern flags: 'CANON_EQ', 'CASE_INSENSITIVE', 'COMMENTS', 'DOTALL', 'LITERAL', 'MULTILINE', 'UNICODE_CASE', 'UNIX_LINES' (Optional)
 * @return Returns a Java object. 
 * @author Henry Ho (henryho167@gmail.com) 
 * @version 1, May 30, 2011 
 */
function reCompile(required String regex, flags) {
	var pattern = createObject("java","java.util.regex.Pattern");
		
	if (isNull(flags))
		local.compiled = pattern.compile(regex);
	else {
		if (isSimpleValue(flags))
			flags = listToArray(flags);
	
		var flagInt = 0;
			
		for (local.flagName in flags)
			flagInt += pattern[flagName];
			
		local.compiled = pattern.compile(regex, javacast("int", flagInt));
	}
		
	return local.compiled;
}
</cfscript>

<cfscript>
/**
 * Creates an easy reccord pagination indicator.
 * 
 * @param rowsPerPage 	 Number of rows per page. (Required)
 * @param currentPage 	 Current page. (Required)
 * @param recordCount 	 Total number of rows. (Required)
 * @return Returns a string. 
 * @author Tony Felice (sites@breckcomm.com) 
 * @version 0, January 20, 2009 
 */
function recordsInView(rowsPerPage,currentPage,recordCount){
	var first = "";
	var last = "";
	var output = "";
	if(currentPage eq 1){
		first = 1;
	}else{
		first = rowsPerPage*(currentPage - 1)+1;
	}
	if(rowsPerPage - ((currentPage*rowsPerPage) - recordCount) gt rowsPerPage){
		last = currentPage*rowsPerPage;
	}else{
		last = recordCount;
	}		
	
	if(first lt last){
		output = first & " to " & last & " of " & recordCount;
	}else if (first eq recordCount){
		output = first & " of " & recordCount;
	}else if (first gt recordCount){
		output = recordCount & " of " & recordCount;
	}
	return output;
}
</cfscript>

<cfscript>
/**
 * Escapes all regular expression &quot;special characters&quot; in a string with &quot;\&quot;.
 * 
 * @param theString 	 The string to format. (Required)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function REEscape(theString){
	var special_char_list      = "\,+,*,?,.,[,],^,$,(,),{,},|,-";
	var esc_special_char_list  = "\\,\+,\*,\?,\.,\[,\],\^,\$,\(,\),\{,\},\|,\-";
	return ReplaceList(theString, special_char_list, esc_special_char_list);
}
</cfscript>

<!---
 Finds all occurences of a regex in a string.
 
 @param regExpression 	 The regular expression to test with (Required)
 @param string 	 String to search. (Required)
 @param start 	 Starting position. Defaults to 1. (Optional)
 @param caseSensitive 	 Whether or not to use case sensitive matching.  Defaults to false. (Optional)
 @return Returns an array of structs. 
 @author Raymond Selzer (raymond@kingcommedia.com) 
 @version 1, October 11, 2011 
--->
<cffunction name="reFindAll" output="yes" returntype="array">
	<cfargument name="regExpression" type="string" required="yes">
    <cfargument name="string" type="string" required="yes">
    <cfargument name="start" type="numeric" required="no" default="1">
    <cfargument name="caseSensitive" type="boolean" required="no" default="false">
    
    <cfset var result = arrayNew(1)>
    <cfset var matches = ''>
    
    <cfif caseSensitive>
    	<cfset matches = refind(regExpression,string,start,true)>
    <cfelse>
    	<cfset matches = refindnocase(regExpression,string,start,true)>
    </cfif>
    
    <cfloop condition="#matches.len[1]# neq 0">
    	
        <cfset result[arraylen(result) + 1] = matches> 
        <cfset start = matches.pos[1] + matches.len[1]>
        
        <cfif caseSensitive>
			<cfset matches = refind(regExpression,string,start,true)>
        <cfelse>
            <cfset matches = refindnocase(regExpression,string,start,true)>
        </cfif>
        
    </cfloop>
    
    <cfreturn result>
</cffunction>

<!---
 Returns all the matches (case insensitive) of a regular expression within a string. This is simular to reGet(), but more closely matches the result set of reFind.
 
 @param regex 	 Regular expression. (Required)
 @param text 	 String to search. (Required)
 @return Returns an array. 
 @author Ben Forta (ben@forta.com) 
 @version 1, November 17, 2003 
--->
<cffunction name="reFindNoCaseAll" output="true" returnType="struct">
   <cfargument name="regex" type="string" required="yes">
   <cfargument name="text" type="string" required="yes">

   <!--- Define local variables --->	
   <cfset var results=structNew()>
   <cfset var pos=1>
   <cfset var subex="">
   <cfset var done=false>
	
   <!--- Initialize results structure --->
   <cfset results.len=arraynew(1)>
   <cfset results.pos=arraynew(1)>

   <!--- Loop through text --->
   <cfloop condition="not done">

      <!--- Perform search --->
      <cfset subex=reFindNoCase(arguments.regex, arguments.text, pos, true)>
      <!--- Anything matched? --->
      <cfif subex.len[1] is 0>
         <!--- Nothing found, outta here --->
         <cfset done=true>
      <cfelse>
         <!--- Got one, add to arrays --->
         <cfset arrayappend(results.len, subex.len[1])>
         <cfset arrayappend(results.pos, subex.pos[1])>
         <!--- Reposition start point --->
         <cfset pos=subex.pos[1]+subex.len[1]>
      </cfif>
   </cfloop>

   <!--- If no matches, add 0 to both arrays --->
   <cfif arraylen(results.len) is 0>
      <cfset arrayappend(results.len, 0)>
      <cfset arrayappend(results.pos, 0)>
   </cfif>

   <!--- and return results --->
   <cfreturn results>
</cffunction>

<cfscript>
/**
 * Returns all the matches of a regex from a string.
 * Bug fix by  Ruben Pueyo (ruben.pueyo@soltecgroup.com)
 * 
 * @param str 	 The string to search. (Required)
 * @param regex 	 The regular expression to search for. (Required)
 * @return Returns an array. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 2, June 6, 2003 
 */
function REGet(str,regex) {
	var results = arrayNew(1);
	var test = REFind(regex,str,1,1);
	var pos = test.pos[1];
	var oldpos = 1;
	while(pos gt 0) {
		arrayAppend(results,mid(str,pos,test.len[1]));
		oldpos = pos+test.len[1];
		test = REFind(regex,str,oldpos,1);
		pos = test.pos[1];
	}
	return results;
}
</cfscript>

<cfscript>
/**
 * When given a list of values, returns a list of element locations that match a given regular expression.
 * 
 * @param reg_expr 	 The regular expression for the search. (Required)
 * @param tlist 	 The list. (Required)
 * @param delims 	 List delimeter. Defaults to a comma. (Optional)
 * @return Returns a list of matches. 
 * @author Robert Munn (robert.munn@alumni.tufts.edu) 
 * @version 1, October 19, 2004 
 */
function REListFindNoCaseMultiple(reg_expr,tlist){
 	var results="";
	var expr_location = 0;
	var i = 1;
	var delims = ",";
	
	if(arrayLen(arguments) gt 2) delims = arguments[3];
	
	for(; i lte listlen(tlist,delims); i=i+1){
	    expr_location = REFindNoCase(reg_expr,listgetat(tlist,i,delims));
	    if(expr_location gt 0) results=listappend(results,i);
	}    		
	return results;
}
</cfscript>

<cfscript>
/**
 * Provides the CF8 ReMatch functionality in MX6/MX7
 * 
 * @param RegEx 	 regular expression for which to search (Required)
 * @param Txt 	 search string (Required)
 * @return Returns an array 
 * @author John Bartlett (jbartlett@strangejourney.net) 
 * @version 0, May 9, 2009 
 */
function ReMatch(RegEx,Txt)
{
	var MatchList=ArrayNew(1);
	var tmp="";
	var Done=0;
	var StartPos=1;
	Arguments.Txt=Arguments.Txt & " ";

	while (NOT Done) {
		tmp=ReFind(Arguments.RegEx,Arguments.Txt,StartPos,"true");
		if (tmp.Pos[1] EQ "0") {
			Done=1;
		} else {
			MatchList[ArrayLen(MatchList) + 1]=Mid(Arguments.Txt,tmp.Pos[1],tmp.Len[1]);
			StartPos=tmp.Pos[1] + Tmp.Len[1];
		}
	}
	return MatchList;
}
</cfscript>

<cfscript>
/**
 * Provides the CF8 ReMatchNoCase functionality in MX6/MX7
 * 
 * @param RegEx 	 Regular expression for which to search (Required)
 * @param txt 	 search string (Required)
 * @return Returns an array 
 * @author John Bartlett (jbartlett@strangejourney.net) 
 * @version 0, May 9, 2009 
 */
function ReMatchNoCase(RegEx,Txt)
{
	var MatchList=ArrayNew(1);
	var tmp="";
	var Done=0;
	var StartPos=1;
	Arguments.Txt=Arguments.Txt & " ";

	while (NOT Done) {
		tmp=ReFindNoCase(Arguments.RegEx,Arguments.Txt,StartPos,"true");
		if (tmp.Pos[1] EQ "0") {
			Done=1;
		} else {
			MatchList[ArrayLen(MatchList) + 1]=Mid(Arguments.Txt,tmp.Pos[1],tmp.Len[1]);
			StartPos=tmp.Pos[1] + Tmp.Len[1];
		}
	}
	return MatchList;
}
</cfscript>

<cfscript>
/**
 * strips all graph characters (spaces, tabs, line breaks) off the end of a string.
 * Version 2 by Raymond Camden
 * 
 * @param str 	 String to parse. (Required)
 * @return Returns a string. 
 * @author Nick Giovanni (ngiovanni@gmail.com) 
 * @version 2, March 6, 2010 
 */
function removeEndSpaces(str) {
	return reReplace(str,"\s*$","","all");
 }
</cfscript>

<cfscript>
/**
 * Removes All HTML from a string removing tags, script blocks, style blocks, and replacing special character code.
 * 
 * @param source 	 String to format. (Required)
 * @return Returns a string. 
 * @author Scott Bennett (scott@coldfusionguy.com) 
 * @version 1, November 14, 2007 
 */
function removeHTML(source){
	
	// Remove all spaces becuase browsers ignore them
	var result = ReReplace(trim(source), "[[:space:]]{2,}", " ","ALL");
	
	// Remove the header
	result = ReReplace(result, "<[[:space:]]*head.*?>.*?</head>","", "ALL");
	
	// remove all scripts
	result = ReReplace(result, "<[[:space:]]*script.*?>.*?</script>","", "ALL");
	
	// remove all styles
	result = ReReplace(result, "<[[:space:]]*style.*?>.*?</style>","", "ALL");
	
	// insert tabs in spaces of <td> tags
	result = ReReplace(result, "<[[:space:]]*td.*?>","	", "ALL");
	
	// insert line breaks in places of <BR> and <LI> tags
	result = ReReplace(result, "<[[:space:]]*br[[:space:]]*>",chr(13), "ALL");
	result = ReReplace(result, "<[[:space:]]*li[[:space:]]*>",chr(13), "ALL");
	
	// insert line paragraphs (double line breaks) in place
	// if <P>, <DIV> and <TR> tags
	result = ReReplace(result, "<[[:space:]]*div.*?>",chr(13), "ALL");
	result = ReReplace(result, "<[[:space:]]*tr.*?>",chr(13), "ALL");
	result = ReReplace(result, "<[[:space:]]*p.*?>",chr(13), "ALL");
	
	// Remove remaining tags like <a>, links, images,
	// comments etc - anything thats enclosed inside < >
	result = ReReplace(result, "<.*?>","", "ALL");
	
	// replace special characters:
	result = ReReplace(result, "&nbsp;"," ", "ALL");
	result = ReReplace(result, "&bull;"," * ", "ALL");    
	result = ReReplace(result, "&lsaquo;","<", "ALL");        
	result = ReReplace(result, "&rsaquo;",">", "ALL");        
	result = ReReplace(result, "&trade;","(tm)", "ALL");        
	result = ReReplace(result, "&frasl;","/", "ALL");        
	result = ReReplace(result, "&lt;","<", "ALL");        
	result = ReReplace(result, "&gt;",">", "ALL");        
	result = ReReplace(result, "&copy;","(c)", "ALL");        
	result = ReReplace(result, "&reg;","(r)", "ALL");    
	
	// Remove all others. More special character conversions
	// can be added above if needed
	result = ReReplace(result, "&(.{2,6});", "", "ALL");    
	
	// Thats it.
	return result;

}
</cfscript>

<cfscript>
/**
 * Strips links and closing link tags from a string.
 * Version 2 by Raymond Camden
 * 
 * @param str 	 String to parse. (Required)
 * @return Returns a string. 
 * @author Jen Wright (jen@jenw.net) 
 * @version 2, August 11, 2005 
 */
function removeLinks(str) {
	str = reReplace(str, "<[[:space:]]*[aA].*?>(.*?)<[[:space:]]*/[[:space:]]*a[[:space:]]*>","\1","all");
	return str;	
}
</cfscript>

<cfscript>
/**
 * Remove null element and dangel delimiter from the list
 * 
 * @param lst 	 list to remove null elements and dangling delimiter (Required)
 * @param delim 	 list delimiter, defaults to comma "," (Optional)
 * @return Returns a string. 
 * @author Bharat Patel (bharat@isummation.com) 
 * @version 0, March 7, 2010 
 */
function removeNullAndDangleDelimFromList(lst){
	var listDelim=",";
	if (arraylen(arguments) gt 1)
		listDelim=arguments[2];
	return ArrayToList(ListToArray(arguments.lst,listDelim));
}
</cfscript>

<cfscript>
/**
 * Replaces oldSubString with newSubString from a specified starting position.
 * 
 * @param theString 	 The string to modify. (Required)
 * @param oldSubString 	 The substring to replace. (Required)
 * @param newSubString 	 The substring to use as a replacement. (Required)
 * @param startIndex 	 Where to start replacing in the string. (Required)
 * @param theScope 	 Number of replacements to make. Default is "ONE". Value can be "ONE" or "ALL." (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function ReplaceAt(theString, oldSubString, newSubString, startIndex){
	var targetString  = "";
	var preString     = "";

	var theScope      = "ONE";
	if(ArrayLen(Arguments) GTE 5) theScope    = Arguments[5];

	if (startIndex LTE Len(theString)) {
		targetString = Right(theString, Len(theString)-startIndex+1);
		if (startIndex GT 1) preString = Left(theString, startIndex-1);
		return preString & Replace(targetString, oldSubString, newSubString, theScope);
	} else {
		return theString;
	}
}
</cfscript>

<cfscript>
/**
 * Replaces oldSubString with newSubString from a specified starting position while ignoring case.
 * 
 * @param theString 	 The string to modify. (Required)
 * @param oldSubString 	  The substring to replace. (Required)
 * @param newSubString 	 The substring to use as a replacement. (Required)
 * @param startIndex 	 Where to start replacing in the string. (Required)
 * @param theScope 	  Number of replacements to make. Default is "ONE". Value can be "ONE" or "ALL." (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function ReplaceAtNoCase(theString, oldSubString, newSubString, startIndex){
	var targetString  = "";
	var preString     = "";

	var theScope      = "ONE";
	if(ArrayLen(Arguments) GTE 5) theScope    = Arguments[5];

	if (startIndex LTE Len(theString)) {
		targetString = Right(theString, Len(theString)-startIndex+1);
		if (startIndex GT 1) preString = Left(theString, startIndex-1);
		return preString & ReplaceNoCase(targetString, oldSubString, newSubString, theScope);
	} else {
		return theString;
	}
}
</cfscript>

<cfscript>
/**
 * Replaces variable placeholders with values of said variables.
 * 
 * @param thisField 	 The string to check. (Required)
 * @param identifier 	 The string used as a variable identifier. (Required)
 * @param query 	 Query to retrive data from. (Optional)
 * @return Returns a string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, September 20, 2004 
 */
// Replaces variable placeholders with variable values.
function RePlaceHolders(thisField,identifier){
	var start=1;
	var st="";
	var end="";
	var temp="";
	var tempVar="";
        var query = "";
	if (ArrayLen(arguments) EQ 3) {
		query="#arguments[3]#.";
	}
	for(i=1;i lte Len(thisField);i=i+1){
		st=#Find(identifier,thisField,start)#;
		if(st gt 0){
			end=#Find(identifier,thisField,st+1)#+1;
			ct=end-st;
			temp=Mid(thisField,st,ct);
			tempVar=evaluate("###query##ReplaceNoCase(temp,identifier,"","ALL")###");
			thisField=ReplaceNoCase(thisField,temp,tempVar,"ALL");
			if(Len(temp) gt Len(tempVar)){
				end=end-(Len(temp)-Len(tempVar));
			}else{
				end=end+(Len(tempVar)-Len(temp));
			}
			start=end+1;
		}
	}
	return thisField;
}
</cfscript>

<cfscript>
/**
 * Replaces the last occurrence of a substring in a string
 * 
 * @param string 	 List to parse. (Required)
 * @param substring1 	 Substring to search for. (Required)
 * @param substring2 	 String to use for a replacement. (Required)
 * @return Returns a string. 
 * @author John Whish (john.whish@crisp-ebusiness.com) 
 * @version 0, June 11, 2009 
 */
function replaceLast(string, substring1, substring2) {
	return Reverse(Reverse(arguments.string).replaceFirst(Reverse(arguments.substring1),Reverse(arguments.substring2)));
}
</cfscript>

<cfscript>
/**
 * Replace all occurences of elements in list one with elements in list two. Case insensitive version of ReplaceList.
 * Modified by Raymond Camden
 * 
 * @param str 	 The string to modify. 
 * @param list1 	 The list of terms to search for. 
 * @param list2 	 The list of corresponding items to use as replacements. 
 * @return Returns a modified list. 
 * @author Matthew Walker (matthew@electricsheep.co.nz) 
 * @version 2, December 11, 2001 
 */
function ReplaceListNoCase(str,list1,list2) {
	var i = 1;
	var newval = "";
	for(; i lte listLen(list1); i=i+1) {
		if(i gt listLen(list2)) newval = "";
		else newval = listGetAt(list2,i);
		str = ReplaceNoCase(str,listGetAt(list1,i),newval,"all");		
	}
	return str;
}
</cfscript>

<!---
 Replaces all special characters in a string of text.
 
 @param textString 	 String to have special characters replaced (Required)
 @param replaceTheseChars 	 Characters to be replaced (Optional)
 @param replaceWithChar 	 Character to replace special characters with. Defaults to chr(0). (Optional)
 @return Returns a string. 
 @author David Long (dlong@cagedata.com) 
 @version 1, January 4, 2012 
--->
<cffunction name="replaceSpecialChars" access="public" output="false" returntype="String">
	<cfargument name="textString" type="String" hint="String to have special characters replaced">
	<!--- If you would not like to remove spaces take the number 32 out of the list.--->
	<cfargument name="replaceTheseChars" type="String" default="32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,58,59,60,61,62,63,64,91,92,93,94,95,96,123,124,126" required="false" hint="Characters to be replaced">
	<cfargument name="replaceWithChar" type="String" default="#chr(0)#" required="no" hint="Character to replace special characters with.">
	<cfscript>
		var returnString = ARGUMENTS.textString;
		var i = 1;
		
		for(i=1; i <= listLen(ARGUMENTS.replaceTheseChars,','); i++){
			returnString = replace(returnString,chr(listGetAt(ARGUMENTS.replaceTheseChars,i)),ARGUMENTS.replaceWithChar,'all');
		}
	</cfscript>
	
	<cfreturn returnString />
</cffunction>

<!---
 Returns string, with occurence of structure key names replaced by structure values.
 
 @param argString 	 String to parse. (Required)
 @param argStruct 	 Structure to use for values. (Required)
 @param argStartSymbol 	 Symbol used to denote beginning of token. Defaults to { (Optional)
 @param argEndSymbol 	 Symbol used to denote end of token. Defaults to }. (Optional)
 @return Returns a string. 
 @author Rodion Bykov (rodionbykov@rodionbykov.com) 
 @version 1, May 30, 2011 
--->
<cffunction name="replaceStructNoCase" returntype="string">
	<cfargument name="argString" type="string" required="true" />
	<cfargument name="argStruct" type="struct" required="true" />
	<cfargument name="argStartSymbol" type="string" required="false" default="{" />
	<cfargument name="argEndSymbol" type="string" required="false" default="}" />
	
	<cfset var result = "" />
	<cfset var i = "" />
	
	<cfset result = arguments.argString />
	
	<cfloop collection="#arguments.argStruct#" item="i">
		<cfset result = replaceNoCase( result, arguments.argStartSymbol & i & arguments.argEndSymbol, StructFind(arguments.argStruct, i), "all" ) />
	</cfloop>
	
	<cfreturn result />
</cffunction>

<cfscript>
/**
 * Replaces a regular expression with newSubString from a specified starting position.
 * 
 * @param theString 	 The string to format. (Required)
 * @param regExpression 	 The regular expression to look for. (Required)
 * @param newSubString 	 The string to use as a replacement. (Required)
 * @param startIndex 	 Where to begin replacing. (Required)
 * @param theScope 	 pe   Number of replacements to make. Default is "ONE". Value can be "ONE" or "ALL." (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function REReplaceAt(theString, regExpression, newSubString, startIndex){
	var targetString  = "";
	var preString     = "";

	var theScope      = "ONE";
	if(ArrayLen(Arguments) GTE 5) theScope    = Arguments[5];

	if (startIndex LTE Len(theString)) {
		targetString = Right(theString, Len(theString)-startIndex+1);
		if (startIndex GT 1) preString = Left(theString, startIndex-1);
		return preString & REReplace(targetString, regExpression, newSubString, theScope);
	} else {
		return theString;
	}
}
</cfscript>

<cfscript>
/**
 * Replaces a regular expression with newSubString from a specified starting position while ignoring case.
 * 
 * @param theString 	 The string to format. (Required)
 * @param regExpression 	 The regular expression to look for. (Required)
 * @param newSubString 	 The string to use as a replacement. (Required)
 * @param startIndex 	 Where to begin replacing. (Required)
 * @param theScope 	 pe   Number of replacements to make. Default is "ONE". Value can be "ONE" or "ALL." (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function REReplaceAtNoCase(theString, regExpression, newSubString, startIndex){
	var targetString  = "";
	var preString     = "";

	var theScope      = "ONE";
	if(ArrayLen(Arguments) GTE 5) theScope    = Arguments[5];

	if (startIndex LTE Len(theString)) {
		targetString = Right(theString, Len(theString)-startIndex+1);
		if (startIndex GT 1) preString = Left(theString, startIndex-1);
		return preString & REReplaceNoCase(targetString, regExpression, newSubString, theScope);
	} else {
		return theString;
	}
}
</cfscript>

<cfscript>
/**
 * RE replace a list list of regular expression with a list of string.
 * 
 * @param str 	 String to parse. (Required)
 * @param oldList 	 List of regular expressions. (Required)
 * @param newList 	 List of replacements. (Required)
 * @return Returns a string. 
 * @author Tuyen Tran (tuyen.k.tran@gmail.com) 
 * @version 1, May 17, 2007 
 */
function REReplaceList(str, oldList, newList) {
	var i = 1;
	for (i=1; i lte listLen(oldlist); i=i+1) {
		str = REReplace(str, listGetAt(oldList, i), listGetAt(newList, i), "all");
	}
	return str;
}
</cfscript>

<cfscript>
/**
 * Splits a string into arrays based on a regex.
 * Fix for missing end item by Thomas Muck (tommuck@basic-drumbeat.com)
 * 
 * @param str 	 The string to search. 
 * @param regex 	 The regular expression to split on. 
 * @return Returns an array. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 2, January 29, 2002 
 */
function RESplit(str,regex) {
	var results = arrayNew(1);
	var test = REFind(regex,str,1,1);
	var pos = test.pos[1];
	var oldpos = 1;
	if(not pos) results[1] = str;
	while(pos gt 0) {
		arrayAppend(results,mid(str,oldpos,pos-oldpos));
		oldpos = pos+test.len[1];
		test = REFind(regex,str,oldpos+1,1);
		pos = test.pos[1];
	}
        //Thanks to Thomas Muck
        if(len(str) GT oldpos) arrayappend(results,right(str,len(str)-oldpos + 1));
	return results;
}
</cfscript>

<cfscript>
/**
 * Returns the last index of an occurrence of a substring in a string from a specified starting position.
 * Big update by Shawn Seley (shawnse@aol.com) -
 * UDF was not accepting third arg for start pos 
 * and was returning results off by one.
 * Modified by RCamden, added var, fixed bug where if no match it return len of str
 * 
 * @param Substr 	 Substring to look for. 
 * @param String 	 String to search. 
 * @param SPos 	 Starting position. 
 * @return Returns the last position where a match is found, or 0 if no match is found. 
 * @author Charles Naumer (cmn@v-works.com) 
 * @version 2, February 14, 2002 
 */
function RFind(substr,str) {
  var rsubstr  = reverse(substr);
  var rstr     = "";
  var i        = len(str);
  var rcnt     = 0;

  if(arrayLen(arguments) gt 2 and arguments[3] gt 0 and arguments[3] lte len(str)) i = len(str) - arguments[3] + 1;

  rstr = reverse(Right(str, i));
  rcnt = find(rsubstr, rstr);

  if(not rcnt) return 0;
  return len(str)-rcnt-len(substr)+2;
}
</cfscript>

<cfscript>
/**
 * Returns the last index (case insensitive) of an occurrence of a substring in a string from a specified starting position.
 * Big update by Shawn Seley (shawnse@aol.com) -
 * UDF was not accepting third arg for start pos 
 * and was returning results off by one.
 * 
 * @param Substr 	 Substring to look for. 
 * @param String 	 String to search. 
 * @param Spos 	 Starting position. 
 * @return Returns the last position where a match is found, or 0 if no match is found. 
 * @author Charles Naumer (cmn@v-works.com) 
 * @version 2, February 14, 2002 
 */
function RFindNoCase(substr,str) {
  var rsubstr  = reverse(substr);
  var rstr     = "";
  var i        = len(str);
  var rcnt     = 0;

  if(arrayLen(arguments) gt 2 and arguments[3] gt 0 and arguments[3] lte len(str)) i = len(str) - arguments[3] + 1;

  rstr = reverse(Right(str, i));
  rcnt = findNoCase(rsubstr, rstr);

  if(not rcnt) return 0;
  return len(str)-rcnt-len(substr)+2;
}
</cfscript>

<cfscript>
/**
 * Returns a rich text format unicode string, suitable for keyword replacement in rtf documents.
 * 
 * @param str 	 String to format. (Required)
 * @return Returns a string. 
 * @author Sierra Bufe (sierra@brighterfusion.com) 
 * @version 1, September 1, 2005 
 */
function richTextUnicodeFormat(str) {
	var u = "";
	var i = 1;
	var ch = "";
	
	for (;i lte Len(str);i=i+1) {
		ch = Mid(str, i, 1);
		u = u & "\u" & Asc(ch) & " ~";
	}
	return u;
}
</cfscript>

<cfscript>
/**
 * Adds zero and negative support to the length parameter of right().
 * 
 * @param string 	 The string to modify. 
 * @param length 	 The length to use. 
 * @return Returns a string. 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 1, February 24, 2002 
 */
function right2( string, length )
{
  if( length GT 0 )
    return right( string, length );
  else if( length LT 0 )
    return right( string, len( string ) + length );
  else return "";
}
</cfscript>

<cfscript>
/**
 * Converts a number to Roman numerals.
 * 
 * @param DecIn 	 Number you want converted to Roman numerals. 
 * @return Returns a string. 
 * @author Brian Kallion (brian@kallion.net) 
 * @version 1, January 29, 2002 
 */
function RomanFormat(DecIn) {

/* declare variables */
var RomOut = ""; // string to be returned
var RomList = "M,D,C,L,X,V,I"; // list of roman numerals
var DecList = "1000,500,100,50,10,5,1"; // list of equivalents to roman numerals

/* variables used in looping */
var i = 1;
var j = 1; 

/* implement the subtraction rule by converting the in strings to the out strings later */
var RomReplaceInList = "DCCCC,CCCC,LXXXX,XXXX,VIIII,IIII";
var RomReplaceOutList = "CM,CD,XC,XL,IX,IV";

/* convert lists to arrays for easier access */
var RomArray = ListToArray(RomList);
var DecArray = ListToArray(DecList);
var RomReplaceInArray = ListToArray(RomReplaceInList);
var RomReplaceOutArray = ListToArray(RomReplaceOutList);

/* hack off the decimal part of the incoming argument */
DecIn = int(DecIn);

/* generate the raw Roman string */
i = 1;
while (DecIn GT 0) {
	if (DecIn - DecArray[i] GTE 0) {
		DecIn = DecIn - DecArray[i];
		RomOut = RomOut & RomArray[i];
		} else {
		i = i + 1;
	}
}

/* apply the subtraction rule to the raw Roman string */
for (j = 1; j LTE ArrayLen(RomReplaceInArray); j = j + 1) {
	RomOut = Replace(RomOut, RomReplaceInArray[j], RomReplaceOutArray[j]);
}

return RomOut;
}
</cfscript>

<cfscript>
/**
 * Converts Roman numerals to decimal.
 * v2 fix by for non standard things like IIX, fix done by Gary Funk
 * 
 * @param input 	 Roman number input. (Required)
 * @return Returns a number. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 2, February 4, 2010 
 */
function romantodec(input) {
	var romans = {};
	var result = 0;
	var pos = 1;
	var char = "";
	var thisSum = "";
	var nextchar = "";
	var subSum = 0;
		
	romans["I"] = 1;
	romans["V"] = 5;
	romans["X"] = 10;
	romans["L"] = 50;
	romans["C"] = 100;
	romans["D"] = 500;
	romans["M"] = 1000;

	while(pos lte len(input)) {
		char = mid(input, pos, 1);
		subSum += romans[char];
		if(pos != len(input)) {
			nextchar = mid(input, pos + 1, 1);
			if(romans[char] == romans[nextchar]) {
				pos++;
			} else if(romans[char] < romans[nextchar]) {
				result = result + romans[nextchar] - subSum;
				subSum = 0;
				pos += 2;
			} else {
				result = result + subSum;
				subSum = 0;
				pos++;
			}
		} else {
			result = result + subSum;
			pos++;
		}
	}    
	return result;
}
</cfscript>

<cfscript>
/**
 * Removes potentially nasty HTML text.
 * Version 2 by Lena Aleksandrova - changes include fixing a bug w/ arguments and use of REreplace where REreplaceNoCase should have been used.
 * version 4 fix by Javier Julio - when a bad event is removed, remove the arg too, ie, remove onclick=&quot;foo&quot;, not just onclick.
 * 
 * @param text 	 String to be modified. (Required)
 * @param strip 	 Boolean value (defaults to false) that determines if HTML should be stripped or just escaped out. (Optional)
 * @param badTags 	 A list of bad tags. Has a long default list. Consult source. (Optional)
 * @param badEvents 	 A list of bad HTML events. Has a long default list. Consult source. (Optional)
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 4, October 16, 2006 
 */
function safetext(text) {
	//default mode is "escape"
	var mode = "escape";
	//the things to strip out (badTags are HTML tags to strip and badEvents are intra-tag stuff to kill)
	//you can change this list to suit your needs
	var badTags = "SCRIPT,OBJECT,APPLET,EMBED,FORM,LAYER,ILAYER,FRAME,IFRAME,FRAMESET,PARAM,META";
	var badEvents = "onClick,onDblClick,onKeyDown,onKeyPress,onKeyUp,onMouseDown,onMouseOut,onMouseUp,onMouseOver,onBlur,onChange,onFocus,onSelect,javascript:";
	var stripperRE = "";
	
	//set up variable to parse and while we're at it trim white space 
	var theText = trim(text);
	//find the first open bracket to start parsing
	var obracket = find("<",theText);		
	//var for badTag
	var badTag = "";
	//var for the next start in the parse loop
	var nextStart = "";
	//if there is more than one argument and the second argument is boolean TRUE, we are stripping
	if(arraylen(arguments) GT 1 AND isBoolean(arguments[2]) AND arguments[2]) mode = "strip";
	if(arraylen(arguments) GT 2 and len(arguments[3])) badTags = arguments[3];
	if(arraylen(arguments) GT 3 and len(arguments[4])) badEvents = arguments[4];
	//the regular expression used to stip tags
	stripperRE = "</?(" & listChangeDelims(badTags,"|") & ")[^>]*>";	
	//Deal with "smart quotes" and other "special" chars from MS Word
	theText = replaceList(theText,chr(8216) & "," & chr(8217) & "," & chr(8220) & "," & chr(8221) & "," & chr(8212) & "," & chr(8213) & "," & chr(8230),"',',"","",--,--,...");
	//if escaping, run through the code bracket by bracket and escape the bad tags.
	if(mode is "escape"){
		//go until no more open brackets to find
		while(obracket){
			//find the next instance of one of the bad tags
			badTag = REFindNoCase(stripperRE,theText,obracket,1);
			//if a bad tag is found, escape it
			if(badTag.pos[1]){
				theText = replace(theText,mid(TheText,badtag.pos[1],badtag.len[1]),HTMLEditFormat(mid(TheText,badtag.pos[1],badtag.len[1])),"ALL");
				nextStart = badTag.pos[1] + badTag.len[1];
			}
			//if no bad tag is found, move on
			else{
				nextStart = obracket + 1;
			}
			//find the next open bracket
			obracket = find("<",theText,nextStart);
		}
	}
	//if not escaping, assume stripping
	else{
		theText = REReplaceNoCase(theText,stripperRE,"","ALL");
	}
	//now kill the bad "events" (intra tag text)
	theText = REReplaceNoCase(theText,'(#ListChangeDelims(badEvents,"|")#)[^ >]*',"","ALL");
	//return theText
	return theText;
}
</cfscript>

<cfscript>
/**
 * Scramail takes a string as an argument and changes the characters in the email to their ascii equivelents to hide the email address from spam bots.
 * v1.0 by Deva Nando
 * v1.1 by Steve Sobol (fixed bug when processing multiple email addresses)
 * 
 * @param str 	 String to parse. (Required)
 * @return Returns a string. 
 * @author Deva Nando (d.nando@gmail.com) 
 * @version 1.1, August 6, 2013 
 */
function scramailNew(str) {
	var emailregex = "(['_a-z0-9-]+(\.['_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.(([a-z]{2,3})|(aero|coop|info|museum|name)))";
	var i = 1;
	var email = "";
	var ascMail = "";
	var marker = 1;
	var matches = "";

	matches = reFindNoCase(emailregex, str, marker, true);
	while (matches.len[1] gt 0) {
		email = mid(str, matches.pos[1], matches.len[1]);
		for (i=1; i LTE len(email); i=i+1) {
			ascMail = ascMail & "&##" & asc(mid(email,i,1)) & ";";
		}
		str = replace(str,email,ascmail,"all");
		marker = matches.pos[1] + matches.len[1];
		matches = reFindNoCase(emailregex, str, marker, true);
		ascmail = "";
	}
	return str;
}
</cfscript>

<cfscript>
/**
 * Creates easy pagination output ie: &lt; 1|2|3|4|5 ... |101|102|103|104|105 &gt;
 * 
 * @param uri 	 Target URI. (Required)
 * @param uriPageVar 	 queryString var that indicates page. (Required)
 * @param totalPages 	 Total number of pages available. (Required)
 * @param currentPage 	 Current page. (Required)
 * @param activeClass 	 The CSS class used for the current page. (Required)
 * @param separator 	 String used between page navigation items. (Required)
 * @param balanceEllipsisAt 	 Numeric location of the ellipsis when nav is truncated (Required)
 * @param showFirstLast 	 Boolean value that determines whether to show or hide the first page/last page links. (Required)
 * @param showPrevNext 	 Boolean value to determines whether to show/hide the prev/next links. (Optional)
 * @return Returns a string. 
 * @author Tony Felice (sites@breckcomm.com) 
 * @version 0, April 7, 2009 
 */
function showPagination(uri,uriPageVar,totalPages,currentPage,activeClass,separator,balanceEllipsisAt,showFirstLast,showPrevNext){
		var output = "";
		var beginAt = 1;
		var resumeAt = 0;
		var moveFirst ="&laquo;";
		var moveLast ="&raquo;";
		var moveNext ="&gt;";
		var movePrev ="&lt;";
		var i = "";
		
		var args = ArrayLen(arguments); 
		if(balanceEllipsisAt lt totalPages/2){
			beginAt = (currentPage - balanceEllipsisAt) + 2;
			if(beginAt lt 1) beginAt = 1;
			resumeAt = totalPages - balanceEllipsisAt;
		}
		
		if(showFirstLast eq 1 and currentPage gt balanceEllipsisAt-1){
			output = output & "<a href=""" & uri & "?" & uriPageVar & "=1"""">" & moveFirst & "</a> ";
		}
		if(showPrevNext eq 1 and currentPage neq 1){
			output = output & "<a href=""" & uri & "?" & uriPageVar & "=" & currentPage-1 & """>" & movePrev & "</a> ";
		}
		for(i = 1;i lte totalPages;i=i+1){				
			if((i gte beginAt AND i lte (balanceEllipsisAt+beginAt-1)) OR (i gt resumeAt)){		
				if(i gt beginAt OR beginAt gte totalPages-(balanceEllipsisAt-1)){
					output = output & separator;
				}
				output = output & "<a href=""" & uri & "?" & uriPageVar & "=" & i & """";
				if(i eq currentPage){
					output = output & "class=""" & activeClass & """";
				}
				output = output & ">" & i & "</a>";
			}else if(i eq resumeAt){
				output = output & " ... ";
			}			
		}
		if(showPrevNext eq 1 and currentPage neq totalPages){
			output = output & " <a href=""" & uri & "?" & uriPageVar & "=" & currentPage+1 & """>" & moveNext & "</a> ";
		}
		if(showFirstLast eq 1 and currentPage neq totalPages){
			output = output & " <a href=""" & uri & "?" & uriPageVar & "=" & totalPages & """>" & moveLast & "</a> ";
		}
		return output;
	}
</cfscript>

<cfscript>
/**
 * Returns amount signed and dollar formatted.
 * 
 * @param amount 	 Amount to be formatted. 
 * @return Returns a string. 
 * @author David Grant (david@insite.net) 
 * @version 1, September 13, 2001 
 */
function signedDollarFormat(amount) {
	var sign = "";
	if (amount gt 0) sign = "+";
	else if (amount lt 0) sign = "-";
	amount = sign & dollarFormat(amount);
	return reReplace(amount,"\(|\)","","ALL"); //get rid of parenthesis
}
</cfscript>

<cfscript>
/**
 * Strips characters that cause line wrap when exporting.
 * 
 * @param s 	 String to modify. (Required)
 * @return Returns a string. 
 * @author James Moberg (james@ssmedia.com) 
 * @version 0, December 13, 2010 
 */
function singleLine(s){
	s = replacelist(s, "#chr(9)#,#chr(10)#,#chr(12)#,#chr(13)#,#chr(160)#", " , , , , ");
	return trim(reReplace(s, "[[:space:]]{2,}", " ", "all"));
}
</cfscript>

<!---
 Converts a string into a pretty URL safe slug
 
 @param str 	 String to modify. (Required)
 @param spacer 	 Character used for spaces. Defaults to -. (Optional)
 @return Returns a string. 
 @author Michael Haggerty (mike@mikehaggerty.net) 
 @version 1, June 11, 2009 
--->
<cffunction name="sluggify" output="false" returnType="string">
	<cfargument name="str">
	<cfargument name="spacer" default="-">
	
	<cfset var ret = "" />
	
	<cfset str = lCase(trim(str)) />
	<cfset str = reReplace(str, "[^a-z0-9-]", "#spacer#", "all") />
	<cfset ret = reReplace(str, "#spacer#+", "#spacer#", "all") />
	
	<cfif left(ret, 1) eq "#spacer#">
		<cfset ret = right(ret, len(ret)-1) />
	</cfif>
	<cfif right(ret, 1) eq "#spacer#">
		<cfset ret = left(ret, len(ret)-1) />
	</cfif>
	
	<cfreturn ret />
</cffunction>

<!---
 Formats a string to simulate the small-caps style without using the css font-variant attribute.
 v1.0 by Joshua Siok
 
 @param inputText 	 String to format (Required)
 @param largerClassName 	 CSS class to use for larger caps (Optional)
 @return A string wrapped with CSS to emulate font-variant:small-caps 
 @author Joshua Siok (Joshua.Siok@gmail.com) 
 @version 1, July 18, 2013 
--->
<cffunction name="smallCaps" returntype="string" access="public" output="false" description="Styles and returns text.">
	<cfargument name="inputText" type="string" required="true">
	<cfargument name="largerClassName" type="string" required="false" default="SCLarger">
	<cfset inputText = ucase(trim(inputText))>
	<cfset var prefixText = '<span class="#largerClassName#">'>
	<cfset var suffixtext = '</span>'>
	<cfset var outputText = prefixText><!--- ALWAYS START WITH A LARGE LETTER--->
	<cfset var insertSuffixAfterNextChar = true><!--- THIS WILL TELLS OUR LOOP WHEN TO INSERT THE SUFFIXTEXT--->
	<cfset var i = 0>
		
	<!--- WE'RE GOING LOOP THROUGH AND WRAP THE FIRST LETTER OF EACH WORD IN A SPAN CLASS BLOCK---->
	<cfloop from="1" to="#len(inputText)#" index="i">
		<cfset var currentChar = Mid(inputText,i,1)>
		<cfset outputText = outputText & currentChar>
		<cfif insertSuffixAfterNextChar>
        	<cfset outputText = outputText & SuffixText>
        	<cfset insertSuffixAfterNextChar = false><!---NOT TO INSERT THE SUFFIXTEXT NEXT TIME--->
        </cfif>	
		<cfif currentChar EQ " ">
			<cfset outputText = outputText & prefixText><!--- ALWAYS ADD THE PREFIXTEXT AFTER A SPACE--->
			<cfset insertSuffixAfterNextChar = true><!--- THIS WILL TELLS OUR LOOP TO INSERT THE SUFFIXTEXT--->
		</cfif>
    </cfloop>	
	<cfreturn outputText>
</cffunction>

<cfscript>
/**
 * Returns the Soundex of a string.
 * Version 2 by Andrew Northcutt (andrewn@edgeinformation.com)
 * 
 * @param string 	 String to be modified. (Required)
 * @return Returns a string. 
 * @author Ben Forta (ben@forta.com) 
 * @version 2, September 23, 2004 
 */
function Soundex(string) {
  var WorkString=UCase(string);
  var NumList="";
  var NumListTemp="";
  var Num="";
  var FirstChar="";
  var Result="";
  var i = 1; //our loop iterator

  // Eliminate all non A-Z chars
  WorkString=REReplace(WorkString,"[^A-Z]","","ALL");

  // Save 1st character
  FirstChar=Left(WorkString,1);

  // Loop through string
  for (i=1; i LTE Len(WorkString); i=i+1) {
    // Init var each time around
    Num="";
    // Convert each character to numbers 1-6
    // AN: 8 is used for exceptions concerning the w and h characters
    // AN: See: 'http://www.archives.gov/research_room/genealogy/census/soundex.html' for more info
    // 9 is used as place-holder for chars to be ignored
    switch (Mid(WorkString,i,1)) {
      case "B":
      case "F":
      case "P":
      case "V": Num=1;
                break;
      case "C":
      case "G":
      case "J":
      case "K":
      case "Q":
      case "S":
      case "X":
      case "Z": Num=2;
                break;
      case "D":
      case "T": Num=3;
                break;
      case "L": Num=4;
                break;
      case "M":
      case "N": Num=5;
                break;

      case "R": Num=6;
                break;
      case "H":
      case "W": Num=8;
                break;
      //A,E,I,O,U,Y?
      default: Num=9;
               break;
    }
    // Append to list
    NumList=ListAppend(NumList,Num);
  }

  // Next get rid of any side-by-side dupes
  NumListTemp=ListFirst(NumList);
  for (i=2; i LTE ListLen(NumList); i=i+1) {
    // Append only if not same as previous char
    if (ListGetAt(NumList, i) NEQ ListGetAt(NumList, i-1))
      NumListTemp=ListAppend(NumListTemp, ListGetAt(NumList, i));
  }
  NumList=NumListTemp;

  // And finally, build soundex
  Result=FirstChar;

  // Append the chars, if not 9 (excluded)
  for (i=2; i LTE ListLen(NumList); i=i+1) {
    if ((ListGetAt(NumList, i) EQ 8) AND (i LT ListLen(NumList))) {
      if (ListGetAt(NumList,i-1) EQ ListGetAt(NumList,i+1))
        i = i+1;
    }
    else if (ListGetAt(NumList, i) NEQ 9)
      Result=Result&ListGetAt(NumList, i);
  }

  // If too long, truncate
  if (Len(Result) GT 4)
    Result=Left(Result, 4);
  // If too short, pad
  else if (Len(Result) LT 4)
    Result=Result&RepeatString("0", 4-Len(Result));

  return Result;
}
</cfscript>

<cfscript>
/**
 * Returns the difference between the SOUNDEX values of two strings
 * 
 * @param str1 	 First string. (Required)
 * @param str2 	 Second string. (Required)
 * @return Returns a number. 
 * @author Benjamin Pate / Steve Bianco (benjamin@pate.org) 
 * @version 1, May 26, 2003 
 */
/**
 * Returns the difference between the SOUNDEX values of two
 * strings as an integer from 0-4. 0=No match, 4=Exact match.
 *
 * Note: Requires SOUNDEX UDF from Ben Forta
 *
 * @param str1	First string to be compared
 * @param str2	Second string to be compared
 * @return returns a number from 0 to 4
 * @author Benjamin Pate B525 P300 (benjamin@pate.org)
 * @author Steven Bianco S315 B520 (steventbianco@yahoo.com)
 * @version 1, April 17, 2003
 */

function SoundexDifference(str1, str2)
{
	var temp1 = Soundex(str1);
	var temp2 = Soundex(str2);

	var i = 0;
	var result = 0;
	
	for (i = 1 ; i LTE 4 ; i = i + 1)
	{
		if (MID(temp1, i, 1) IS MID(temp2, i , 1))
		{
			result = result + 1;
		}
	}
	return result;
}
</cfscript>

<cfscript>
/**
 * Returns a string with a space before each capital letter.
 * 
 * @param text 	 String to modify. (Required)
 * @return Returns a string. 
 * @author Mark W. Breneman (Mark@vividmedia.com) 
 * @version 1, September 20, 2002 
 */
function SpaceCap(text) {
  return REReplace(text, "([.^[:upper:]])", " \1","all");
}
</cfscript>

<cfscript>
/**
 * Splits a string according to another string or multiple delimiters.
 * 
 * @param str 	 String to split. (Required)
 * @param splitstr 	 String to split on. Defaults to a comma. (Optional)
 * @param treatsplitstrasstr 	 If false, splitstr is treated as multiple delimiters, not one string. (Optional)
 * @return Returns an array. 
 * @author Steven Van Gemert (svg2@placs.net) 
 * @version 3, February 12, 2005 
 */
function split(str) {
	var results = arrayNew(1);
	var splitstr = ",";
	var treatsplitstrasstr = true;
	var special_char_list      = "\,+,*,?,.,[,],^,$,(,),{,},|,-";
	var esc_special_char_list  = "\\,\+,\*,\?,\.,\[,\],\^,\$,\(,\),\{,\},\|,\-";	
	var regex = ",";
	var test = "";
	var pos = 0;
	var oldpos = 1;

	if(ArrayLen(arguments) GTE 2){
		splitstr = arguments[2]; //If a split string was passed, then use it.
	}
	
	regex = ReplaceList(splitstr, special_char_list, esc_special_char_list);
	
	if(ArrayLen(arguments) GTE 3 and isboolean(arguments[3])){
		treatsplitstrasstr = arguments[3]; //If a split string method was passed, then use it.
		if(not treatsplitstrasstr){
			pos = len(splitstr) - 1;
			while(pos GTE 1){
				splitstr = mid(splitstr,1,pos) & "_Separator_" & mid(splitstr,pos+1,len(splitstr) - (pos));
				pos = pos - 1;
			}
			splitstr = ReplaceList(splitstr, special_char_list, esc_special_char_list);
			splitstr = Replace(splitstr, "_Separator_", "|", "ALL");
			regex = splitstr;
		}
	}
	test = REFind(regex,str,1,1);
	pos = test.pos[1];

	if(not pos){
		arrayAppend(results,str);
		return results;
	}

	while(pos gt 0) {
		arrayAppend(results,mid(str,oldpos,pos-oldpos));
		oldpos = pos+test.len[1];
		test = REFind(regex,str,oldpos,1);
		pos = test.pos[1];
	}
	//Thanks to Thomas Muck
	if(len(str) gte oldpos) arrayappend(results,right(str,len(str)-oldpos + 1));

	if(len(str) lt oldpos) arrayappend(results,"");

	return results;
}
</cfscript>

<cfscript>
/**
 * Split list into two lists of about equal length.
 * RCamden added variable delim and clean up of trailing delim
 * 
 * @param orgList 	 Original list. (Required)
 * @param listDel 	 List delimeter. Defaults to a comma. (Optional)
 * @return Returns a sturct. 
 * @author Tom Kitta (tom@tomkitta.com) 
 * @version 2, August 1, 2006 
 */
function splitList(orgList) {
	var ret = structNew();
	var listDel = ",";
	var i = 0;
	var listLen = "";
	var midPoint = "";
	
	if(arrayLen(arguments) gte 2) listDel = arguments[2];
	
	listLength = listLen(orgList,listDel);
	midPoint = round(listLength/2);

	ret.part1 = "";
	ret.part2 = orgList;

	for (i=1;i lte midPoint;i=i+1) ret.part2 = ListDeleteAt(ret.part2,1, listDel);
	if (listLength gt 0) ret.part1 = left(arguments.orgList,len(arguments.orgList) - Len(ret.part2));
	
	if(right(ret.part1,1) is listDel) ret.part1 = left(ret.part1, len(ret.part1)-1);
	return ret;
}
</cfscript>

<!---
 splitMX converts a string or a list to an array using another string, or a multiple characters as a delimiter/
 
 @param list 	 String to parse. (Required)
 @param delimiters 	 A string to act as the splitter for the result. (Required)
 @return Returns an array. 
 @author Larry C. Lyons (larryclyons@gmail.com) 
 @version 0, January 6, 2009 
--->
<cffunction name="splitMX" output="false" access="public" returntype="array" hint="I use the java.lang.String object split method to convert a list to an array">
	<cfargument name="list" type="string" required="true" displayname="list" hint="I am the list to be converted to an array" />
	<cfargument name="delimiters" type="string" required="true" displayname="delimiters" hint="I contain the delimiters separating the list items" />
	<cfset var results = arrayNew(1) />
	<!--- if there are no delimiters return a single item array otherwise use .split() to convert the list to an array --->
	<cfif len(arguments.delimiters)>
		<cfset results = arguments.list.split(arguments.delimiters) />
	<cfelse>
		<cfset arrayAppend(results,arguments.list) />
	</cfif>
	<cfreturn results />
</cffunction>

<cfscript>
/**
 * Splits a URL into it's URL, QueryString, and Anchor parts.
 * 
 * @param inUrl 	 URL to parse. (Required)
 * @return Returns a struct. 
 * @author Samuel Neff (sam@serndesign.com) 
 * @version 1, January 12, 2004 
 */
function splitUrl(inUrl) {
	var s = inUrl;
	var refUrl = "";
	var refQS = "";
	var refAnchor = "";
	var st = structNew();
	var i = find("?", s);
	
	if (i) {
		refUrl = left(s, i-1);
		refQS = mid(s, i+1, 99999);
		i = find("##", refQS);
		if (i) {
			refAnchor = mid(refQS, i+1, 99999);
			refQS = left(refQS, i-1);
		} else {
		refAnchor = "";
		}
	} else {	
		i = find("##", s);
		if (i) {
			refUrl = left(s, i-1);
			refAnchor = mid(s, i+1, 99999);
		} else {
			refUrl = s;
		}
	}
	
	st.url = refUrl;
	st.queryString = refQS;
	st.anchor = refAnchor;
	
	return st;
}
</cfscript>

<cfscript>
/**
 * Strip pattern-matching wildcards from a string appearing in a SQL Server query.
 * 
 * @param string 	 String to format. (Required)
 * @return Returns a string. 
 * @author Matthew Walker (matthew@cabbagetree.co.nz) 
 * @version 1, August 15, 2002 
 */
function SQLServerPatternMatchingFormat(string) {
	return ReplaceList(string, "[,%,_", "[[],[%],[_]");
}
</cfscript>

<cfscript>
/**
 * Takes a full State name (i.e. California) and returns the two letter abbreviation (i.e. CA).
 * 
 * @param state 	 The state to convert. 
 * @return Returns a string. 
 * @author Sivan Leoni (sleoni@leoniz.com) 
 * @version 1, January 7, 2002 
 */
function StateToAbbr(State) {
  var states = "ALABAMA,ALASKA,AMERICAN
SAMOA,ARIZONA,ARKANSAS,CALIFORNIA,COLORADO,CONNECTICUT,DELAWARE,DISTRICT
OF COLUMBIA,FEDERATED STATES OF
MICRONESIA,FLORIDA,GEORGIA,GUAM,HAWAII,IDAHO,ILLINOIS,INDIANA,IOWA,KANSA
S,KENTUCKY,LOUISIANA,MAINE,MARSHALL
ISLANDS,MARYLAND,MASSACHUSETTS,MICHIGAN,MINNESOTA,MISSISSIPPI,MISSOURI,M
ONTANA,NEBRASKA,NEVADA,NEW HAMPSHIRE,NEW JERSEY,NEW MEXICO,NEW
YORK,NORTH CAROLINA,NORTH DAKOTA,NORTHERN MARIANA
ISLANDS,OHIO,OKLAHOMA,OREGON,PALAU,PENNSYLVANIA,PUERTO RICO,RHODE
ISLAND,SOUTH CAROLINA,SOUTH DAKOTA,TENNESSEE,TEXAS,UTAH,VERMONT,VIRGIN
ISLANDS,VIRGINIA,WASHINGTON,WEST VIRGINIA,WISCONSIN,WYOMING";
  var abbr =
"AL,AK,AS,AZ,AR,CA,CO,CT,DE,DC,FM,FL,GA,GU,HI,ID,IL,IN,IA,KS,KY,LA,ME,MH
,MD,MA,MI,MN,MS,MO,MT,NE,NV,NH,NJ,NM,NY,NC,ND,MP,OH,OK,OR,PW,PA,PR,RI,SC
,SD,TN,TX,UT,VT,VI,VA,WA,WV,WI,WY";
  if(listFindNoCase(states,State))
	State=listGetAt(abbr,listFindNoCase(states,state));
  return State;
}
</cfscript>

<!---
 Turn a string into an array of lines.
 
 @param inString 	 The string to parse. (Required)
 @return Returns an array. 
 @author Massimo Foti (massimo@massimocorner.com) 
 @version 1, August 15, 2005 
--->
<cffunction name="string2linesArray" output="false" returntype="array" hint="Turn a string into an array of lines, using java.io.BufferedReader to maximize performances">
	<cfargument name="inString" type="string" required="yes" hint="Incoming string">
	<cfscript>
	var linesArray = ArrayNew(1);
	var jReader = createObject("java","java.io.StringReader").init(arguments.inString);
	var jBuffer = createObject("java","java.io.BufferedReader").init(jReader);
	var line = jBuffer.readLine();	
	</cfscript>
	<cftry>
	<!--- 
	Unlike Java, CFML has no notion of null, but this is quite a special case. 
	Whenever readLine() reach the end of the file, it return a Java null, 
	as soon as the BufferedReader return null, ColdFusion "erase" the line variable, making it undefined. 
	Here we leverage this somewhat weird behavior by using it as test condition for the loop
	 --->
		<cfloop condition="#IsDefined("line")#">
			<cfset ArrayAppend(linesArray, line)>
			<cfset line=jBuffer.readLine()>
		</cfloop>
		<cfset jBuffer.close()>
		<cfcatch type="any">
			<!--- Something went wrong; we better close the stream anyway, just to be safe and leave no garbage behind --->
			<cfset jBuffer.close()>
			<cfthrow message="string2linesArray: Failed to read lines from string" type="string2linesArray">
		</cfcatch>
	</cftry>
	<cfreturn linesArray>
</cffunction>

<cfscript>
/**
 * Converts a string to a list using the specified delimter (defaults to comma). Returns a list.
 * 
 * @param s 	 String to modify. (Required)
 * @param delim 	 Delimiter to use for new list. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, May 26, 2005 
 */
function string2List(s){
	var i=0;
	var l="";
	var delim=",";
	
	if(arrayLen(arguments) gt 2) delim = arguments[3];
	
	for(i=1;i lte Len(s);i=i+1) l = listAppend(l,mid(s,i,1),delim);

	return l;
}
</cfscript>

<cfscript>
/**
 * Returns matched substrings and subexpressions from a string based on a regular expression pattern
 * v1.0 by Adam Cameron
 * 
 * @param pattern 	 A regular expression to match. (Required)
 * @param string 	 A string to find matches in. (Required)
 * @param all 	 Whether to match one (default) or all matches. (Optional)
 * @param start 	 The position in the string to start looking for matches. (Optional)
 * @param caseSensitive 	 Whether to do a case-sensitive or case-insensitive (default) match. (Optional)
 * @return An array of structs, similar to reFind() when set to return subexpressions. 
 * @author Adam Cameron (adamcameroncoldfusion@gmail.com) 
 * @version 1.0, September 29, 2012 
 */
array function stringFind(required string pattern, required string string, boolean all=false, numeric start=1, boolean caseSensitive=false){
	var result	= [];
	var matches	= [];
	var i		= 0;
	var match	= "";

	do {
		if (caseSensitive){
			matches = reFind(pattern, string, start, true);
		}else{
			matches = reFindNoCase(pattern, string, start, true);
		}
		// if we have a match, we need to extract the matched strings too
		if (matches.pos[1]){
			matches.string = [];
			for (i=1; i <= arrayLen(matches.pos); i++){
				if (matches.len[i]){
					match = mid(string, matches.pos[i], matches.len[i]);
				}else{
					match = "";
				}
				arrayAppend(matches.string, match);
			}
			arrayAppend(result, matches);
			// if we were only after one match: we're done...
			if (!all){
				break;
			}
			// ... otherwise shimmy along to after this match, ready to look for the next one
			start = matches.pos[1] + matches.len[1];
		}
	} while(matches.pos[1]);
	return result;
}
</cfscript>

<cfscript>
/**
 * Formats a string similarly to how NumberFormat formats a number.
 * 
 * @param str 	 String to format. (Required)
 * @param msk 	 Mask to use. (Required)
 * @return Returns a string. 
 * @author Joshua Miller (jmiller@garrisonenterprises.net) 
 * @version 1, August 10, 2007 
 */
function stringFormat(str,msk){
	var i=0;
	var c=1;
	var r="";
	for(i=1;i LTE Len(msk);i=i+1){
		if(Find("X",mid(msk,i,1)) GT 0){
			if(c LTE Len(str)){
				r = r & mid(str,c,1);
				c = c + 1;
			}else{
				r = r & " ";
			}
		}else{
			r = r & mid(msk,i,1);
		}
	}
	return r;
}
</cfscript>

<cfscript>
/**
 * Python Style String Splicing
 * See http://docs.python.org/3.1/tutorial/introduction.html#strings for basics.
 * 
 * @param string 	 String to splice (Required)
 * @param p 	 pattern to splice (Required)
 * @return Returns a string. 
 * @author Eric Twilegar (eric.twilegar@gmail.com) 
 * @version 0, March 17, 2010 
 */
function StringSplice(string, p)
{
// used later for length to cut out.
var c = 0;
var p1="";
var p2="";
// likely going to use length.
var l = len(string);


// TODO: Add better check for properly formatted Pattern P

// if no : then a single number.
if ( not FindNoCase(":",p) ) 
{
c = val(p);
	if ( c GTE 0 ) 
	{
		return Mid(string,c,1);
	}
	else  
	{
		return Mid(string,l+c+1,1);
	}

}


// If the user omits this pads the left or write of the string so that GetToken functions. 
//Faster parse probably better. 
if ( Left(p, 1) IS ":") p = " " & p;
if ( Right(p, 1) IS ":") p = p & " ";

// P1 is token on left of : if any 
// p2 is token on right of : if any.
p1 = GetToken(p,1,":");
p2 = GetToken(p,2,":");


// if not length of p1 it is 1. CF is one based.
if ( val(p1) IS 0 ) p1 = 1;
// if not length then p2 is the length of the string + 1...since CF is 1 based.
if ( val(p2) IS 0 ) p2 = l + 1;

// if less then 0 then p2 actually should be set to l - abs(p2)
if ( p2 LT 0 ) p2 = l + p2 + 1;

if ( p1 LT 0 ) return ""; // Error condition.
if ( p1 GT p2 ) return ""; // Error condition.

// since mid takes a start count not start and end like a proper language...convert.
c = p2 - p1;

return Mid(string,p1,c);
}
</cfscript>

<cfscript>
/**
 * Turns a string to an array of 'count' character chunks.
 * 
 * @param string 	 String to parse. (Required)
 * @param count 	 Number of characters per array index. (Required)
 * @return Returns an array. 
 * @author Aidan Whitehall (aidan@thenetprofits.co.uk) 
 * @version 1, June 12, 2003 
 */
function stringToArray(string, count) {
   var array = arrayNew(1);
   
   while (len(string)) {
      arrayAppend(array, left(string, min(count, len(string))));
      
      if ((len(string) / count) gt 1) string = right(string, len(string) - count);
      else string = "";
   }

   return array;
}
</cfscript>

<cfscript>
/**
 * Counterpart to HexToString - converts an ASCII string to hexadecimal.
 * 
 * @param str 	 String to convert to hex. (Required)
 * @return Returns a string. 
 * @author Chris Dary (umbrae@gmail.com) 
 * @version 1, May 8, 2006 
 */
function stringToHex(str) {
	var hex = "";
	var i = 0;
	for(i=1;i lte len(str);i=i+1) {
		hex = hex & right("0" & formatBaseN(asc(mid(str,i,1)),16),2);
	}
	return hex;
}
</cfscript>

<cfscript>
/**
 * Strips all characters from a string except the ones that you want to keep.
 * 
 * @param strSource 	 The string to strip. (Required)
 * @param strKeep 	 List of  characters to keep. (Required)
 * @param beCS 	 Boolean that determines if the match should be case sensitive. Default is true. (Optional)
 * @return Returns a string. 
 * @author Scott Jibben (scott@jibben.com) 
 * @version 1, July 2, 2002 
 */
function stripAllBut(str,strip) {
	var badList = "\";
	var okList = "\\";
	var bCS = true;

	if(arrayLen(arguments) gte 3) bCS = arguments[3];

	strip = replaceList(strip,badList,okList);
	
	if(bCS) return rereplace(str,"[^#strip#]","","all");
	else return rereplaceNoCase(str,"[^#strip#]","","all");
}
</cfscript>

<cfscript>
/**
 * A function that will strip out all anchors in text that has been passed as an argument.
 * Version 2 by Raymond Camden
 * 
 * @param str 	 String to strip anchors from. (Required)
 * @return Returns a string. 
 * @author Brian Brown (vonbrownz@hotmail.com) 
 * @version 2, November 1, 2002 
 */
function stripAnchors(str) {
	var temp = reReplaceNoCase(str,"<[[:space:]]*a[[:space:]]+[^>]*>","","all");
	return reReplaceNoCase(temp,"<[[:space:]]*/a[[:space:]]*>","","all");
}
</cfscript>

<cfscript>
/**
 * Removes ASCII character codes from the string.
 * 
 * @param string 	 String to be modified. (Required)
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 2, December 10, 2002 
 */
function StripAscii(str)
{
  return REReplace(str, "&(##[0-9]{1,3}|[[:alpha:]]*[[:alnum:]]+);", "", "ALL");
}
</cfscript>

<cfscript>
/**
 * Removes all characters in a string between two characters.
 * 
 * @param strString 	 String to modify. (Required)
 * @param strFirstChar 	 Character to begin removal. (Required)
 * @param strLastChar 	 Character to end removal. (Required)
 * @param strScope 	 ALL or ONE. Signifies how many replacements to make. Default is ALL. (Optional)
 * @return Returns a string. 
 * @author Neal Barnett (nealb@800wine.com) 
 * @version 1, June 21, 2002 
 */
function StripBlock(strString,strFirstChar,strLastChar) 
{
	// Special Chars - Don't include ] (end-bracket) since it must be the
	// first character within brackets [ ] in the regular expression
	var strSpecialChars = "+*?.[^$(){}|\&##-";
	
	// Default to replace all blocks in string unless they passed a scope
	var strScope = "ALL";  
	if (ArrayLen(Arguments) gt 3)
	  	strScope = Arguments[4];
		
	// Escape the start and end chars if they're special
	if (FindNoCase(strFirstChar,strSpecialChars)) 
		strFirstChar = "\" & strFirstChar;
	if (FindNoCase(strLastChar,strSpecialChars)) 
		strLastChar = "\" & strLastChar;

	return REReplaceNoCase(strString,strFirstChar & "[^" & strLastChar & "]*" & strLastChar,"","#strScope#");
}
</cfscript>

<cfscript>
/**
 * This tag removes all font tags from a string.
 * 
 * @param str 	 String to format. (Required)
 * @return Returns a string. 
 * @author Dave Shuck (dshuck@gmail.com) 
 * @version 1, January 10, 2006 
 */
function stripFont(str) {
	//remove the open font tag
	var returnStr = reReplaceNoCase(str,"(<font)[^>]*>","","all");
	//remove the close font tag
	returnStr = replaceNoCase(returnStr,"</font>","","all");
	//return the stripped string
	return returnStr;
}
</cfscript>

<cfscript>
/**
 * Removes HTML from the string.
 * v2 - Mod by Steve Bryant to find trailing, half done HTML.        
 * v4 mod by James Moberg - empties out script/style blocks
 * 
 * @param string 	 String to be modified. (Required)
 * @return Returns a string. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 4, October 4, 2010 
 */
function stripHTML(str) {
	str = reReplaceNoCase(str, "<*style.*?>(.*?)</style>","","all");
	str = reReplaceNoCase(str, "<*script.*?>(.*?)</script>","","all");

	str = reReplaceNoCase(str, "<.*?>","","all");
	//get partial html in front
	str = reReplaceNoCase(str, "^.*?>","");
	//get partial html at end
	str = reReplaceNoCase(str, "<.*$","");
	return trim(str);
}
</cfscript>

<cfscript>
/**
 * Strips leading zero's from a string or number.
 * 
 * @param Num 	 Number or string to be modified. 
 * @return Returns a string. 
 * @author Critter Gewlas (critter@cfresume.org) 
 * @version 1, September 13, 2001 
 */
function StripLZero(s) {
	return REReplace(s,"^0","","ALL");
}
</cfscript>

<cfscript>
/**
 * Strips doublequotes from the beginning and end of a string.
 * 
 * @param string 	 String to modify. (Required)
 * @return Returns a string. 
 * @author Pete Ruckelshaus (pruckelshaus@gmail.com) 
 * @version 0, December 13, 2010 
 */
function stripOuterQuotes(string) {
	if (left(string, 1) EQ """") {
		string = right(string, len(string) -1);
	}
	if (right(string, 1) EQ """") {
		string = left(string, len(string) -1);
	}
	return string;
}
</cfscript>

<cfscript>
/**
 * Strip xml-like tags from a string when they are within or not within a list of tags.
 * 
 * @param stripmode 	 A string, disallow or allow. Specifies if the list of tags in the mytags attribute is a list of tags to allow or disallow. (Required)
 * @param mytags 	 List of tags to either allow or disallow. (Required)
 * @param mystring 	 The string to check. (Required)
 * @param findonly 	 Boolean value. If true, returns the first match. If false, all instances are replaced. (Optional)
 * @return Returns either a string or the first instance of a match. 
 * @author Isaac Dealey (info@turnkey.to) 
 * @version 2, September 22, 2004 
 */
function stripTags(stripmode,mytags,mystring) {
	var spanquotes = "([^"">]*""[^""]*"")*";
	var spanstart = "[[:space:]]*/?[[:space:]]*";
	var endstring = "[^>$]*?(>|$)";
	var x = 1;
	var currenttag = structNew();
	var subex = "";
	var findonly = false;
	var cfversion = iif(structKeyExists(GetFunctionList(),"getPageContext"), 6, 5);
	var backref = "\\1"; // this backreference works in cf 5 but not cf mx
	var rexlimit = len(mystring);

	if (arraylen(arguments) gt 3) { findonly = arguments[4]; }
	if (cfversion gt 5) { backref = "\#backref#"; } // fix backreference for mx and later cf versions
	else { rexlimit = 19000; } // limit regular expression searches to 19000 characters to support CF 5 regex character limit

	if (len(trim(mystring))) {
		// initialize defaults for examining this string
		currenttag.pos = ListToArray("0");
		currenttag.len = ListToArray("0");

		mytags = ArrayToList(ListToArray(mytags)); // remove any empty items in the list
		if (len(trim(mytags))) {
			// turn the comma delimited list of tags with * as a wildcard into a regular expression
			mytags = REReplace(mytags,"[[:space:]]","","ALL");
			mytags = REReplace(mytags,"([[:punct:]])",backref,"ALL");
			mytags = Replace(mytags,"\*","[^$>[:space:]]*","ALL");
			mytags = Replace(mytags,"\,","[$>[:space:]]|","ALL");
			mytags = "#mytags#[$>[:space:]]";
		} else { mytags = "$"; } // set the tag list to end of string to evaluate the "allow nothing" condition

		// loop over the string
		for (x = 1; x gt 0 and x lt len(mystring); x = x + currenttag.pos[1] + currenttag.len[1] -1)
		{ 
			// find the next tag within rexlimit characters of the starting point
			currenttag = REFind("<#spanquotes##endstring#",mid(mystring,x,rexlimit),1,true); 
			if (currenttag.pos[1])
			{ 
				// if a tag was found, compare it to the regular expression
				subex = mid(mystring,x + currenttag.pos[1] -1,currenttag.len[1]); 
				if (stripmode is "allow" XOR REFindNoCase("^<#spanstart#(#mytags#)",subex,1,false) eq 1)
				{
					if (findonly) { return subex; } // return invalid tag as an error message
					else { // remove the invalid tag from the string
						myString = RemoveChars(myString,x + currenttag.pos[1] -1,currenttag.len[1]);
						currenttag.len[1] = 0; // set the length of the tag string found to zero because it was removed
					}
				}
			}
			// no tag was found within rexlimit characters
			// move to the next block of rexlimit characters -- CF 5 regex limitation
			else { currenttag.pos[1] = rexlimit; }
		}
	}
	if (findonly) { return ""; } // return an empty string indicating no invalid tags found
	else { return mystring; } // return the new string discluding any invalid tags
}
</cfscript>

<cfscript>
/**
 * The function deletes non-needed characters (ie. http://)
 * 
 * @param URL 	 URL to strip 
 * @return Returns a string. 
 * @author Steven Ketterman (beans@pghsonicweb.com) 
 * @version 1, September 6, 2001 
 */
function StripUrl(UrltoStrip)
{
  Var oldurl = UrltoStrip;
  
  if(oldurl CONTAINS 'http://www.'){
  	oldurl = ReplaceNoCase(oldurl, 'http://www.', '');
  }
  if(oldurl CONTAINS 'http://'){
  	oldurl = ReplaceNoCase(oldurl, 'http://', '');
  }
  if(oldurl CONTAINS 'www.'){
  	oldurl = ReplaceNoCase(oldurl, 'www.', '');
  }
  
  oldurl = ListFirst(oldurl, '/');
  Return OldUrl;
}
</cfscript>

<cfscript>
/**
 * Strips the cfid/cftoken information from a string.
 * Updated: Jason Bartholme
 * added jsession variables
 * 
 * @param x 	 String to modify. (Required)
 * @return Returns a string. 
 * @author David Grant (x@seizethedave.com) 
 * @version 1, February 23, 2009 
 */
function stripURLToken (x) {
return REReplace(x, "(\?|&)([Cc][Ff][Ii][Dd]|[Cc][Ff][Tt][Oo][Kk][Ee][Nn]|[Jj][Ss][Ee][Ss][Ss][Ii][Oo][Nn][Ii][Dd])=[\s\S]+", "", "ALL");
}
</cfscript>

<cfscript>
/**
 * Returns as a binary object the chr by chr XOR of two given strings for length of shortest of the two.
 * 
 * @param str1 	 First string. (Required)
 * @param str2 	 Second string. (Required)
 * @return Returns a binary string. 
 * @author Peter Day (JWVPICBHZCOX@spammotel.com) 
 * @version 1, December 1, 2006 
 */
function strXOR(str1,str2) {
	var theXOR="";
	var minLen=min(len(str1),len(str2)); 
	var i=1;
	
	for (; i le minLen; i=i+1 ) {
		theXOR = theXOR & rJustify(formatbaseN(bitXor(asc(mid(str1,i,1)),asc(mid(str2,i,1))),"16"),2);
	}
	
	theXOR=binaryDecode(replaceNoCase(theXOR," ","0","all"),"hex");
	return theXOR;
}
</cfscript>

<cfscript>
/**
 * Create a simple submit button by providing name, value, class, width, and onClick.
 * 
 * @param name 	 The name of the submit button. 
 * @param value 	 The value of the submit button. 
 * @param class 	 The CSS class to use. 
 * @param width 	 Width of the submit button. 
 * @param onClick 	 JavaScript function to call when the button is clicked. 
 * @return Returns a string. 
 * @author Jesse Monson (jesse@ixstudios.com) 
 * @version 1, April 24, 2002 
 */
function submitButton(name,value) {
	var class="";
    var width="";
	var onClick="";
	
	if (arrayLen(arguments) gte 3) {class = " class=""#arguments[3]#""";}
	if (arrayLen(arguments) gte 4) {width = " width=""#arguments[4]#"" style=""width:#arguments[4]#px""";}
	if (arrayLen(arguments) gte 5) {onClick = " onClick=""#arguments[5]#""";}	
	return "<input type=""submit"" name=""#name#"" value=""#value#""#width##class##onClick#>";
}
</cfscript>

<cfscript>
/**
 * Returns the substring of a string. It mimics the behaviour of the homonymous php function so it permits negative indexes too.
 * 
 * @param buf 	 The string to parse. (Required)
 * @param start 	 The start position index. If negative, counts from the right side. (Required)
 * @param length 	 Number of characters to return. If not passed, returns from start to end (if positive start value). (Optional)
 * @return Returns a string. 
 * @author Rudi Roselli Pettazzi (rhodion@tiscalinet.it) 
 * @version 2, July 2, 2002 
 */
function SubStr(buf, start) {
    // third argument (optional)
    var length = 0;
    var sz = 0;
		
    sz = len(buf);
    
    if (arrayLen(arguments) EQ 2) {

		if (start GT 0) {
		    length = sz;
		} else if (start LT 0) {
		    length = sz + start;
		    start = 1;
		}
	
    } else {
    
		length = Arguments[3];
		if (start GT 0) {
		    if (length LT 0)   length = 1+sz+length-start;
		} else if (start LT 0) {
		    if (length LT 0) length = length-start;
		    start = 1+sz+start;
		    
		}
    } 
    
    if (isNumeric(start) AND isNumeric(length) AND start GT 0 AND length GT 0) return mid(buf, start, length);
    else return "";
}
</cfscript>

<cfscript>
/**
 * Function to strip HTML tags, with options to preserve certain tags.
 * v2 by Ray Camden, fix to closing tag
 * 
 * @param str 	 String to manipulate. (Required)
 * @param action 	 Strip or preserve. Default is strip. (Optional)
 * @param tagList 	 Tags to strip or perserve. (Optional)
 * @return Returns a string. 
 * @author Rick Root (rick@webworksllc.com) 
 * @version 2, July 2, 2008 
 */
function tagStripper(str) {
	var i = 1;
	var action = 'strip';
	var tagList = '';
	var tag = '';
	
	if (ArrayLen(arguments) gt 1 and lcase(arguments[2]) eq 'preserve') {
		action = 'preserve';
	}
	if (ArrayLen(arguments) gt 2) tagList = arguments[3];

	if (trim(lcase(action)) eq "preserve") {
		// strip only those tags in the tagList argument
		for (i=1;i lte listlen(tagList); i = i + 1) {
			tag = listGetAt(tagList,i);
			str = REReplaceNoCase(str,"</?#tag#.*?>","","ALL");
		}
	} else {
		// strip all, except those in the tagList argument
		// if there are exclusions, mark them with NOSTRIP
		if (tagList neq "") {
			for (i=1;i lte listlen(tagList); i = i + 1) {
				tag = listGetAt(tagList,i);
				str = REReplaceNoCase(str,"<(/?#tag#.*?)>","___TEMP___NOSTRIP___\1___TEMP___ENDNOSTRIP___","ALL");
			}
		}
		// strip all remaining tsgs.  This does NOT strip comments
		str = reReplaceNoCase(str,"</{0,1}[A-Z].*?>","","ALL");
		// convert unstripped back to normal
		str = replace(str,"___TEMP___NOSTRIP___","<","ALL");
		str = replace(str,"___TEMP___ENDNOSTRIP___",">","ALL");
	}
	
	return str;	
}
</cfscript>

<cfscript>
/**
 * Returns default value if primary value is empty.
 * Based on ValueOrSpace by David Grant (david@insite.net)
 * 
 * @param thisValue 	 Value to check. (Required)
 * @param defaultValue 	 Value to use if thisValue is empty. Defaults to a non-breaking space. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, April 29, 2003 
 */
function ThisOrThat(thisValue) {
	var defaultValue = "&nbsp;";
	if(arrayLen(arguments) gte 2) defaultValue = arguments[2];
	if (Len(Trim(thisValue)) LT 1) return defaultValue;
	return thisValue;
}
</cfscript>

<cfscript>
/**
 * Title cases all elements in a list.
 * 
 * @param list 	 List to modify. (Required)
 * @param delimiters 	 Delimiters to use. Defaults to a space. (Optional)
 * @return Returns a string. 
 * @author Adrian Lynch (adrian.l@thoughtbubble.net) 
 * @version 1, November 3, 2003 
 */
function TitleCaseList( list, delimiters ) {

	var returnString = "";
	var isFirstLetter = true;
	
	// Loop through each character in list
	for ( i = 1; i LTE Len( list ); i = i + 1 ) {
	
		// Check if character is a delimiter
		if ( Find( Mid(list, i, 1 ), delimiters, 1 ) ) {
			
			//	Add character to variable returnString unchanged
			returnString = returnString & Mid(list, i, 1 );
			isFirstLetter = true;
				
		} else {
		
			if ( isFirstLetter ) {
			
				// Uppercase
			 	returnString = returnString & UCase(Mid(list, i, 1 ) );
				isFirstLetter = false;
					
			} else {
				
				// Lowercase
				returnString = returnString & LCase(Mid(list, i, 1 ) );
				
			}
			
		}
		
	}
	
	return returnString;
}
</cfscript>

<cfscript>
/**
 * I convert anything to boolean
 * version 0.1 by Steve Withington
 * version 1.0 by Adam Cameron: simplifying logic
 * 
 * @param arg 	 Any value (Optional)
 * @return Returns a boolean: true if arg was a boolean and true, otherwise false 
 * @author Steve Withington (stephenwithington@gmail.com) 
 * @version 1, August 26, 2012 
 */
public boolean function toBoolean(any arg='') {
	return isBoolean(arg) && arg ? true : false;
}
</cfscript>

<!---
 enhanced version of friendlyURL that also replaces diacritics with plausible ascii substitutes
 
 @param str 	 string to convert (Required)
 @return Returns a string. 
 @author Chris Carey (ccarey@fi.net.au) 
 @version 1, August 5, 2011 
--->
<cffunction name="toFriendlURL" returntype="string" output="false" access="public">
	<cfargument name="str" type="string" required="true" hint="string to convert">
	
	<cfscript>	
		var i=1;
		var length = 0;
		var replacement = "";
		var diacritics = [
			["#CHR(225)##CHR(224)##CHR(226)##CHR(229)##CHR(227)##CHR(228)#", "a"],			
			["#CHR(230)#", "ae"],
			["#CHR(231)#", "c"],
			["#CHR(233)##CHR(232)##CHR(234)##CHR(235)#", "e"],			
			["#CHR(237)##CHR(236)##CHR(238)##CHR(239)#", "i"],			
			["#CHR(241)#", "n"],
			["#CHR(243)##CHR(242)##CHR(244)##CHR(248)##CHR(245)##CHR(246)#", "o"],		
			["#CHR(223)#", "B"],
			["#CHR(250)##CHR(249)##CHR(251)##CHR(252)#", "u"],
			["#CHR(255)#", "y"],
			["#CHR(193)##CHR(192)##CHR(194)##CHR(197)##CHR(195)##CHR(196)#", "A"],			
			["#CHR(198)#", "AE"],
			["#CHR(199)#", "C"],
			["#CHR(201)##CHR(200)##CHR(202)##CHR(203)#", "E"],			
			["#CHR(205)##CHR(204)##CHR(206)##CHR(207)#", "I"],			
			["#CHR(209)#", "N"],
			["#CHR(211)##CHR(210)##CHR(212)##CHR(216)##CHR(213)##CHR(214)#", "O"],			
			["#CHR(218)##CHR(217)##CHR(219)##CHR(220)#", "U"]		
		];
		
		// replace diacritics with plausible ascii substitutes
		length = ArrayLen(diacritics);
		for(i=1;i<=length; i++){		
			str = ReReplace(str, "[#diacritics[i][1]#]", diacritics[i][2], "all");
		}
		
		// make it all lower case
		str = trim(LCASE(str));
		// replace consecutive spaces and dashes and underscores with a single dash
		str = ReReplace(str, '[\s\-_]+', '-', 'all');
		// remove dashes at the beginning or end of the string
		str = ReReplace(str, '(^\-+)|(\-+$)', '', 'all');
		// replace ampersand with and
		str = ReReplace(str, '&', 'and', 'all');
		str = ReReplace(str, '&.*?;', '', 'all');
		str = ReReplace(str, '&', 'and', 'all');
		// remove any remaining non-word chars
		str = ReReplace(str, "[^a-zA-Z0-9\-]", "", "all");
		
		return str;
	</cfscript>
</cffunction>

<cfscript>
/**
 * Convert an Access hyperlink field to text.
 * 
 * @param str 	 String to parse. (Required)
 * @return Returns a string. 
 * @author Kurtis D. Leatham (KDL@KomputerMan.com) 
 * @version 0, June 25, 2008 
 */
function trimAccessHyperlink(str) {
    var endTag = "";
    var extract = "";
    str = trim(str);    
    endTag = findNoCase("##", str);
    if (endTag gt 0) {
        endTag = endTag - 1;
        extract = left(str, endTag);
    } else {
        extract = str;
    }
    return trim(extract);
}
</cfscript>

<cfscript>
/**
 * Like Trim() except it also works on html.
 * 
 * @param str 	 String to format. (Required)
 * @return Returns a string. 
 * @author Kenric L. Ashe (cflib.org@kenric.com) 
 * @version 1, November 14, 2007 
 */
function trimHTML(str) {
	var htmlList = "<p>,</p>,<br>,<br/>,<br />,&nbsp;";
	var x = 0; var H = ""; var looping = 1;
	while (looping) {
		looping = 0;
		str = Trim(str);
		for (x=1; x lte ListLen(htmlList); x=x+1) {
			H = ListGetAt(htmlList, x);
			if (Left(str, Len(H)) is H) {str = Right(str, Len(str) - Len(H)); looping = 1;}
			if (Right(str, Len(H)) is H) {str = Left(str, Len(str) - Len(H)); looping = 1;}
		}
	}
	return str;
}
</cfscript>

<!---
 Trim traling zeros from a numeric field.
 Version 2 by Raymond Camden
 
 @param varToTrim 	 Number to trim. (Required)
 @return Returns a number. 
 @author Praveen Mittal (praveen@smeng.com) 
 @version 2, August 26, 2005 
--->
<cffunction name="TrimZero" output="false" returnType="string">
	<cfargument name="varToTrim" type="numeric">
	
	<cfreturn arguments.varToTrim + 0>
</cffunction>

<cfscript>
/**
 * I trim leading and trailing zeros off of a decimal number.
 * version 1.0 by Alan McCollough
 * 
 * @param num 	 String to trim zeros from (Required)
 * @return A string with leading and trailing zeros removed 
 * @author Alan McCollough (amccollough@anthc.org) 
 * @version 1, August 26, 2012 
 */
function trimZeros(num){	
	if(val(num) == 0){
		return "0";
	} else if (num < 1) {
		return "." & listLast(num + 0,".");	
	} else {
		return num + 0;		
	} 	
}
</cfscript>

<cfscript>
/**
 * Converts Boolean values to either True or False.
 * 
 * @param exp 	 value (expression) you want converted to True/False. 
 * @author Rob Brooks-Bilson and Raymond Camden (rbils@amkor.com, ray@camdenfamily.com) 
 * @version 1, January 29, 2002 
 */
function TrueFalseFormat(exp){
  if (exp) return True;
  return False;
}
</cfscript>

<cfscript>
/**
 * Converts hashtags, mentions, and embedded URLs to clickable links.
 * 
 * @param tweet 	 String to parse. (Required)
 * @return Returns a string. 
 * @author John Venable (johnnykrisma@gmail.com) 
 * @version 1, December 15, 2012 
 */
function twitterify(tweet) {
    tweet = rereplacenocase(tweet, '(^|[\n ])([\w]+?://[\w]+[^ \"\n\r\t< ]*)', '\1<a href="\2" target="_blank">\2</a>', 'ALL');
    tweet = rereplacenocase(tweet, '(^|[\n ])((www|ftp)\.[^ \"\t\n\r< ]*)','\1<a href="http://\2" target="_blank">\2</a>','ALL');
    tweet = rereplacenocase(tweet, '##(\w+)', '<a class="tweet-hashtag" href="http://search.twitter.com/search?q=\1" target="_blank">##\1</a>', 'ALL');
    tweet = rereplacenocase(tweet, '@(\w+)', '<a class="tweet-mention" href="http://twitter.com/\1">@\1</a>', 'ALL');
		
    return tweet;
}
</cfscript>

<cfscript>
/**
 * Returns a string with all words capitalized with special non english characters.
 * 
 * @param str 	 The string to format. (Required)
 * @return Returns a string. 
 * @author Ivan Rodriguez (ivan.rodriguez@de-net.net) 
 * @version 1, May 14, 2002 
 */
function UCaseAll(str){
	var newstr = "";
	var list1 ="�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,";
	var list2 = "�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�,�";

	newstr = Ucase(str);
	newstr = ReplaceList(newstr,list1,list2);
	return newstr;
}
</cfscript>

<!---
 Decompresses a binary or (base64|hex|uu) encoded string using the gzip algorithm; returns a string.
 
 @param text 	 Compressed string to decompress. (Required)
 @return Returns a string. 
 @author Oblio Leitch (oleitch@locustcreek.com) 
 @version 1, November 14, 2007 
--->
<cffunction name="ungzip"
	returntype="any"
	displayname="ungzip"
	hint="decompresses a binary|(base64|hex|uu) using the gzip algorithm; returns string"
	output="no">
	<!---
		Acknowledgements:
		Christian Cantrell, byte array for CF
		 - http://weblogs.macromedia.com/cantrell/archives/2004/01/byte_arrays_and_1.cfm
	--->
	<cfscript>
		var bufferSize=8192;
		var byteArray = createObject("java","java.lang.reflect.Array").newInstance(createObject("java","java.lang.Byte").TYPE,bufferSize);
		var decompressOutputStream=createObject("java","java.io.ByteArrayOutputStream").init();
		var input=0;
		var decompressInputStream=0;
		var l=0;
		if(not isBinary(arguments[1]) and arrayLen(arguments) is 1) return;
		if(arrayLen(arguments) gt 1){
			input=binaryDecode(arguments[1],arguments[2]);
		}else{
			input=arguments[1];
		}
		decompressInputStream=createObject("java","java.util.zip.GZIPInputStream").init(createObject("java","java.io.ByteArrayInputStream").init(input));
		l=decompressInputStream.read(byteArray,0,bufferSize);

		while (l gt -1){
			decompressOutputStream.write(byteArray,0,l);
			l=decompressInputStream.read(byteArray,0,bufferSize);
		}
		decompressInputStream.close();
		decompressOutputStream.close();

		return decompressOutputStream.toString();
	</cfscript>
</cffunction>

<cfscript>
/**
 * Convert Unicode chars to Cyrillic DOS  8-bit char.
 * 
 * @param str 	 String to convert. (Required)
 * @return Returns a string. 
 * @author Namchin (namchin@gmail.com) 
 * @version 1, August 23, 2005 
 */
function unicodeToCyrillicDos(str) {
	var result="";
	var dos = "1026,1027,8218,1107,8222,8230,8224,8225,8364,8240,1033,8249,1034,1036,1035,1039,1106,8216,8217,8220,8221,8226,8211,8212,0,8482,1113,8250,1114,1116,1115,1119,160,1038,1118,1032,164,1168,166,167,1025,169,1028,171,172,173,174,1031,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087";
	var i=0;
	for (i=1; i LTE len(str); i=i+1) {
		if ((Asc(mid(str, i, 1)) gt 1040) and (Asc(mid(str, i, 1)) lt 1103) and Asc(mid(str, i, 1)) neq 1064)
			result = result & Chr(ListGetAt(dos,Asc(mid(str, i, 1))-1039));
		else if (Asc(mid(str, i, 1)) eq 1064) result = result & Chr(1064);//65533
		else if (Asc(mid(str, i, 1)) eq 1025) result = result & Chr(1088);
		else if (Asc(mid(str, i, 1)) eq 1105) result = result & Chr(1089);
		else if (Asc(mid(str, i, 1)) eq 1028 or Asc(mid(str, i, 1)) eq 1256) result = result & Chr(1090);
		else if (Asc(mid(str, i, 1)) eq 1108 or Asc(mid(str, i, 1)) eq 1257) result = result & Chr(1091);
		else if (Asc(mid(str, i, 1)) eq 1111 or Asc(mid(str, i, 1)) eq 1198) result = result & Chr(1092);
		else if (Asc(mid(str, i, 1)) eq 1031 or Asc(mid(str, i, 1)) eq 1199) result = result & Chr(1093);
		else result = result & mid(str, i, 1);
	}
	return result;
}
</cfscript>

<cfscript>
/**
 * Replace html unicode strings with strings in javascript format.
 * 
 * @param str 	 String to modify. (Required)
 * @return Returns a string. 
 * @author Harry Klein (klein@contens.de) 
 * @version 1, August 31, 2004 
 */
function unicodeToJS(str){
	str = JSStringFormat(str);
	return ReReplaceNoCase(str,"&##([a-z0-9]{3});","\\1","all");
}
</cfscript>

<cfscript>
/**
 * Un-indents strings but preserves formatting
 * 
 * @param str 	 String to be modified (Required)
 * @return returns a string 
 * @author Nathan Strutz (strutz@gmail.com) 
 * @version 0, March 7, 2009 
 */
function unIndent(str) {
	var lines = str.split("\n");
	var i = 0;
	var minSpaceDist = 9999;
	var newStr = "";

	for(i=1; i lte arrayLen(lines); i=i+1) {
		if (len(trim(lines[i]))) {
			minSpaceDist = max( min(minSpaceDist, reFind("[\S]",lines[i])-1), 0);
		}
	}

	for(i=1; i lte arrayLen(lines); i=i+1) {
		newStr = newStr & removeChars(lines[i], 1, minSpaceDist) & chr(10);
	}
	return newStr;
}
</cfscript>

<cfscript>
/**
 * Calculates a UPC-A check digit.
 * 
 * @param upc 	 11 digit UPC-A code (Required)
 * @return Returns a numeric value. 
 * @author Pete Jacoby (cf@subnova.net) 
 * @version 1, June 15, 2002 
 */
function UPCCheckDigit(upc){
var odd = 0;
var even = 0;
var total = 0;

if (NOT IsNumeric(upc) OR Len(upc) NEQ 11)
	return(-1);

for (i=1; i LT 12; i=i+1){
		if (i MOD 2)
			odd=odd+Mid(upc, i, 1);
		else
			even=even+Mid(upc, i, 1);
	}

total=(odd*3)+even;
total=total mod 10;

if (total eq 0)
	return 0;
else
	return(10-total);
}
</cfscript>

<!---
 Upper cases the first letter of a string.
 Phil Arnold (philip.r.j.arnold@googlemail.com
 
 @param name 	 String to capitalize the first letter of (Required)
 @return Returns a string. 
 @author Brian Meloche (brianmeloche@gmail.com) 
 @version 0, March 17, 2010 
--->
<cffunction name="upperFirst" access="public" returntype="string" output="false" hint="I convert the first letter of a string to upper case, while leaving the rest of the string alone.">
		<cfargument name="name" type="string" required="true">
		<cfreturn uCase(left(arguments.name,1)) & right(arguments.name,len(arguments.name)-1)>
</cffunction>

<cfscript>
/**
 * Encodes a string to base64 format, then urlEncodes the result so that it works when used as part of a URL string.
 * 
 * @param str 	 String to format. (Required)
 * @return Returns a string. 
 * @author Alan McCollough (amccollough@anmc.org) 
 * @version 1, August 10, 2007 
 */
function urlBase64Encode(str){
	
	/* encodes a string to base64 format,
	then urlEncodes the result so that it
	works when used as part of a URL string */
	
	var result = "";
	
	/* convert string to base64 format */
	result = toBase64(str);
	
	/* urlEncode to convert base64 chars that do not work when rendered in a URL 
	Note that this uses the single-argument format to work with earlier versions of CF. */
	result = urlEncodedFormat(result);
	
	return result;
};
</cfscript>

<!---
 Converts a camel-case or underscored var name to plain text.
 v2 mods by RCamden
 
 @param str 	 String to parse. (Required)
 @return Returns a string. 
 @author Tony Felice (sites@breckcomm.com) 
 @version 2, January 6, 2009 
--->
function varNameToText(str) {
	var words = "";
	var i = "";
	var output="";

	str = reReplace(str,"([.^[:upper:]])", " \1","all");
	str = reReplace(str,"([.^_])", " ","all");
	words = ListToArray(str, " ");	
	for(i=1; i LTE (ArrayLen(Words)); i=i+1){
		words[i] = ucase(mid(words[i],1, 1)) & mid(words[i],2, len(words[i])-1);
	}
	output = arrayToList(words, " ");		
	return output;
}

<cfscript>
/**
 * Converts a list of variable names to a Flash safe string to pass into a Flash movie.
 * 
 * @param varList 	 A list of variable names, not the values themselves. (Required)
 * @param loadVar 	 A variable to append to tell Flash the variables are loaded. (Required)
 * @param delim 	 Optional delimiter. Defaults to a comma. (Optional)
 * @return Returns a Flash safe string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, September 20, 2004 
 */
function vars2Flash(varList,loadVar){
	var i=1;
	var argc = ArrayLen(arguments);
	var outputString="";
        var delim = "";

	if (argc EQ 2) {
		ArrayAppend(arguments,',');
	}
	delim = arguments[3];
	for(i=1;i lte ListLen(varList);i=i+1){
		outputString="#outputString#&#ListGetAt(varList,i,delim)#=#evaluate(ListGetAt(varList,i,delim))#";
	}
	return "#outputstring#&#loadVar#=yes";
}
</cfscript>

<cfscript>
/**
 * Creates a verity &quot;safe&quot; search string.
 * Version 2 rewritten by Raymond Camden
 * Version 3 - made \ into \\ thanks to user comment
 * Version 4 - Fixed bugs identified by John Salonich II (21 JAN 2003), Neal Todd (06 FEB 04), Jeremy Halliwell (01 APR 03). Also added fix for curly brackets, comma, funny quote and plus.
 * v5 bug fixed by Dominic OConnor
 * v6 fix by Mark, when we remove bad chars, replace with space, not nothing
 * 
 * @param input 	 String to Verity clean. (Required)
 * @return Returns a string. 
 * @author Simon Potter (spotter@redbanner.com) 
 * @version 6, April 24, 2009 
 */
function verityClean(input) {
	//Value to return after cleaning
	var cleanText = trim(input);
	// List of special characters to remove
	var reBadChars = "\\|@|#chr(34)#|'|<|>|\(|\)|!|=|\[|\]|\{|\}|\#chr(44)#|`|\#chr(43)#";
	// List of words to watch for
	var arProblemWords = "and,or,not";	
	var x = 1;
	var y = 1;
	var temp = "";
	
	//=-=-=-=-=-=-=-=-=-=-=-=-=-=
	//Turn list into arrays for the loop
	//=-=-=-=-=-=-=-=-=-=-=-=-=-=
	arProblemWords = ListToArray(arProblemWords);	
	
	//=-=-=-=-=-=-=-=-
	// Strip double spaces 
	//=-=-=-=-=-=-=-=-
	cleanText = reReplace(cleanText," {2,}"," ","all");

	//=-=-=-=-=-=-=-=-=-
	// Strip bad characters 
	//=-=-=-=-=-=-=-=-=
	cleanText = reReplace(cleanText,reBadChars," ","all");
	
	//=-=-=-=-=-=-=-=-
	// Clean up sequences of space characters
	//=-=-=-=-=-=-=-=-
	cleanText = reReplace(cleanText,"[[:space:]]+"," ","all");

	//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	// Remove dupes and start/end bad words
	//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	for (x = 1; x lte arraylen(arProblemWords); x = x + 1) {
	
		//remove dupes
		cleanText = trim(reReplace(cleanText,"(#arProblemWords[x]#[[:space:]]+){2,}","","all"));

		//remove arProblemWord[x] + any of the others
		temp = arProblemWords[x] & "[[:space:]]+(";
		for(y = 1; y lte arrayLen(arProblemWords); y=y+1) {
			if(x neq y) {
				temp = temp & arProblemWords[y] & "[[:space:]]+|";
			}
		}
		//remove last |
		temp = left(temp, len(temp)-1);
		//add closing )
		temp = temp & ")";
		cleanText = trim(reReplace(cleanText,temp,"","all"));
		
		//remove from beginning 
		if(
			findNoCase(arProblemWords[x],cleanText) is 1 and 
			reFind("[[:space:]]+",mid(cleanText,len(arProblemWords[x])+1,1)) and 
			mid(cleanText,1,3) NEQ "not"
		) cleanText = trim(right(cleantext,len(cleantext) - len(arProblemWords[x])));
		
		if(
			findNoCase(arProblemWords[x],cleanText) gt 0 and 
			len(cleanText) eq len(arProblemWords[x])
		) cleanText = "";
		
		//remove from end
        if(
            findNoCase(arProblemWords[x],cleanText) gt 0 and
            findNoCase(arProblemWords[x],cleanText,len(cleanText) - len(arProblemWords[x])) is (len(cleanText) - len(arProblemWords[x]) + 1)
            and
            reFind("[[:space:]]+",mid(cleanText,len(cleanText) - len(arProblemWords[x]),1))
        ) cleanText = trim(left(cleanText, len(cleanText) - len(arProblemWords[x])));					
	}	
	
	// Return the cleaned value
	return cleanText;
}
</cfscript>

<cfscript>
/**
 * Takes a verity &quot;score&quot; value and returns a formatted percentage.
 * 
 * @param num 	 Verity score. (Required)
 * @return Returns a string. 
 * @author Howard Owens (howens@insidevc.com) 
 * @version 1, August 10, 2003 
 */
function verityPercentage(num){
	var outNum = '';
	var leftDigit=ListFirst(num, '.');
	var rightDigits=Left(ListGetAt(num, 2, '.'), 2);
	
	if (right(rightDigits, 2) GTE 5) rightDigits = rightDigits+1;

	if (leftDigit gte 1) outNum='100' & '%';
	else outNum=RightDigits & '%';
	
	return outNum;
}
</cfscript>

<cfscript>
/**
 * Take a string, make it appear vertically.
 * 
 * @param text 	 Text to modify. (Required)
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, August 14, 2002 
 */
function VerticalText(text){
	//build an array of the characters in the string
	var arrText = arrayNew(1);
	//a variable for looping
	var ii = 1;
	//the len of the string
	var textLen = len(text);
	//resize the array the length of the string
	arrayResize(arrText,textLen);
	//loop through the length of the string, building the array
	for(ii = 1; ii LTE textLen; ii = ii + 1){
		arrText[ii] = mid(text,ii,1);
	}
	return arrayToList(arrText,"<br />");
}
</cfscript>

<cfscript>
/**
 * Returns a WAP safe string.
 * Update by anthony petruzzi
 * 
 * @param string 	 The string to format. 
 * @return Returns a string. 
 * @author Ben Forta (ben@forta.com) 
 * @version 2, April 24, 2002 
 */
function WAPSafe(string) {
        string = Replace(string, "&", "&amp;", "ALL");
	return Replace(string, "$", "$$", "ALL");
}
</cfscript>

<cfscript>
/**
 * Returns the number of occurances of a word in a string.
 * Minor edit by Raymond Camden
 * 
 * @param word 	 The word to count. (Required)
 * @param string 	 The string to check. (Required)
 * @return Returns the number of times the word appears. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 2, September 20, 2004 
 */
function WordInstance(word,string){
	var i=0;
	var start=1;
	var j = 1;
	var tmp = "";
	
	string = " " & string & " ";
	for(j=1;j lte Len(string);j=j+1){
		tmp=REFindNoCase("[^a-zA-Z]+#word#[^a-zA-Z]+",string,start);
		if(tmp gt 0){
			i=i+1;
			start=tmp+Len(word);
		}else{
			start=start+1;
		}
	}
	return i;
}
</cfscript>

<cfscript>
/**
 * Wraps a chunk of text at a given character count.
 * Note that this function needs to be renamed if you are going to use it on a CF MX 6.1 server since 6.1 now has a native wrap() function (that serves a different purpose).
 * 
 * @param str 	 The string to format. (Required)
 * @param maxline 	 Length of each line, defaults to 40. (Optional)
 * @param br 	 The newline string. Defaults to &lt;br&gt;. (Optional)
 * @param breaklongwords 	 Boolean to break words longer than maxline. Defaults to true. (Optional)
 * @return Returns a string. 
 * @author Dave Pomerance (dpomerance@mos.org) 
 * @version 2, August 19, 2003 
 */
function Wrap(str) {
	var maxline = 40;
	var br = "<br>";
	var breaklongwords = 1;
	var filetype = "pc";
	var eol = chr(13) & chr(10);
	var lineofstr = "";
	var returnstr = "";
	var pos = "";

	//check optional args
	if(ArrayLen(arguments) eq 2) {
		maxline = arguments[2];
	} 
	else if(ArrayLen(arguments) eq 3) {
		maxline = arguments[2];
		br = arguments[3];
	}
	else if(ArrayLen(arguments) eq 4) {
		maxline = arguments[2];
		br = arguments[3];
		breaklongwords = arguments[4];
	}

	// determine file type
	if (find(chr(10), str)) {
		if (find(chr(13), str)) {
			filetype = "pc";
			eol = chr(13) & chr(10);
		} else {
			filetype = "unix";
			eol = chr(10);
		}
	} else if (find(chr(13), str)) {
		filetype = "mac";
		eol = chr(13);
	}

	// add space due to CF "feature" of ignoring list elements of length 0
	str = replace(str, eol, " #chr(13)#", "ALL") & " ";
	
	for (i=1; i lte listlen(str, chr(13)); i=i+1) {
		lineofstr = listgetat(str, i, chr(13));
		if (lineofstr eq " ") {
			returnstr = returnstr & br;
			lineofstr = "";
		} else {
			// remove the space
			lineofstr = left(lineofstr, len(lineofstr)-1);
		}
		while (len(lineofstr) gt 0) {
			// determine wrap point
			if (len(lineofstr) lte maxline) pos = len(lineofstr);
			else {
				pos = maxline - find(" ", reverse(left(lineofstr, maxline))) + 1;
				if (pos gt maxline) {
					if (breaklongwords) pos = maxline;
					else {
						pos = find(" ", lineofstr, 1);
						if (pos eq 0) pos = len(lineofstr);
					}
				}
			}
			// add line to returnstr
			returnstr = returnstr & left(lineofstr, pos) & br;
			// remove line from lineofstr
			lineofstr = removechars(lineofstr, 1, pos);
		}
	}

	return returnstr;
}
</cfscript>

<cfscript>
/**
 * Produces a Calendar for a given month and year.
 * 
 * @param curMonth 	 The month to display. 
 * @param curYear 	 The year to display. 
 * @param height 	 Height of the table cells. Defaults to 40. 
 * @param width 	 Width of the table cells. Defaults to 60. 
 * @param titleStyle 	 Style to apply to title row. 
 * @param numberStyle 	 Style to apply to days of the month. 
 * @return Returns a string. 
 * @author William Steiner (williams@hkusa.com) 
 * @version 1, April 12, 2002 
 */
function createCalendar(curMonth,curYear) {
	var outString = "";
	var firstDay = CreateDate(curYear, curMonth, 1);
	var firstDayDigit = DayOfWeek(FirstDay);
	var i = 1;
	var h = 1;
	var height = 40;
	var width = 60;
	var titleStyle = "";
	var numberStyle = "";

	if(arrayLen(arguments) gte 3) height = arguments[3];
	if(arrayLen(arguments) gte 4) width = arguments[4];	    
	if(arrayLen(arguments) gte 5) titleStyle = arguments[5];
	if(arrayLen(arguments) gte 6) numberStyle = arguments[6];
	
	outString = "<table border='1'><tr><td align=center colspan='7'  ";
	if(len(titleStyle)) outString = outString & "class='#titleStyle#'";
	outString = outString & ">#DateFormat(firstDay, 'mmmm')#</td></tr>";
	
	// if it isn't sunday, then we need to if space over to start on the corrent day of week
	if (firstDayDigit neq 1) {
		for (h=1; h lt DayOfWeek(FirstDay); h = h+1) {
			outString = outString & "<td>&nbsp;</td>";
		}
	}
	
	// loop thru all the dates in this month
	for (i=1; i lte DaysInMonth(firstDay); i = i+1) {
		//is it Sunday? if so start new row.
		if (DayOfWeek(CreateDate(curYear, curMonth, i)) eq 1) {
			outString = outString & "<tr>";
		}
		// insert a day
		outString = outString & "<td align='left' valign='top' width='#width#px' ";
		if(len(numberStyle)) outString = outString & "class='#numberStyle#' ";
		outString = outString & "height='#height#'>#i#<br></td> ";
		// is it the last day of the month?  if so, fill row with blanks.
		if (i eq DaysInMonth(firstDay)) {
			for (h=1; h lte (7-DayOfWeek(CreateDate(curYear, curMonth, i))); h = h+1) {
				outString = outString & "<td>&nbsp;</td>";
			}
		}
		if (DayOfWeek(CreateDate(curYear, curMonth, i)) eq 7){
			outString = outString & "</tr>";
		}
	}
	outString=outString & "</table>";
	return outString;
}
</cfscript>

<cfscript>
/**
 * Returns a XHTML compliant string wrapped with properly formatted paragraph tags.
 * 
 * @param string 	 String you want XHTML formatted. (Required)
 * @param attributeString 	 Optional attributes to assign to all opening paragraph tags (i.e. style=""font-family: tahoma""). (Optional)
 * @return Returns a string. 
 * @author Jeff Howden (cflib@jeffhowden.com) 
 * @version 1, July 2, 2008 
 */
function XHTMLParagraphFormat(string)
{
  var attributeString = '';
  var returnValue = '';
  if(ArrayLen(arguments) GTE 2) attributeString = ' ' & arguments[2];
  if(Len(Trim(string)))
    returnValue = '<p' & attributeString & '>' & Replace(string, Chr(13) & Chr(10), '</p>' & Chr(13) & Chr(10) & '<p' & attributeString & '>', 'ALL') & '</p>';
  return returnValue;
}
</cfscript>

<cfscript>
/**
 * Similar to xmlFormat() but replaces all characters not on the &quot;good&quot; list as opposed to characters specifically on the &quot;bad&quot; list.
 * 
 * @param inString 	 String to format. (Required)
 * @return Returns a string. 
 * @author Samuel Neff (sam@serndesign.com) 
 * @version 1, January 12, 2004 
 */
function xmlFormat2(inString) {
   
   var goodChars = "!@##$%^*()0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~[]{};:,./?\| -_=+#chr(13)##chr(10)##chr(9)#";
   var i = 1;
   var c = "";     
   var s = "";
   
   for (i=1; i LTE len(inString); i=i+1) {
      
      c = mid(inString, i, 1);
      
      if (find(c, goodChars)) {
         s = s & c;
      } else {
         s = s & "&##" & asc(c) & ";";
      }
   }
   
   return s;
}
</cfscript>

<cfscript>
/**
 * Properly performs substring functionality on XML-Formatted strings.
 * 
 * @param inString 	 String to parse. (Required)
 * @param start 	 Starting position for substring. (Required)
 * @param count 	 Length of returned string. (Required)
 * @return Returns a string. 
 * @author Adam Mihlfried (adam@emscharts.com) 
 * @version 1, May 29, 2007 
 */
function xmlFormatMid(inString, start, count) {
   
   var lowStr = "";
   var retStr = "";
   var tmpStr = "";
   var reversed = "";
   var revpos = 0;
   var realpos = 0;
   var realendpos = 0;
   //Convert high ascii characters to their low ascii equivalents
   lowStr = Replace(inString, Chr(8211), Chr(45), "ALL");
   lowStr = Replace(lowStr, Chr(8212), Chr(45), "ALL");
   lowStr = Replace(lowStr, Chr(8216), Chr(39), "ALL");
   lowStr = Replace(lowStr, Chr(8217), Chr(39), "ALL");
   lowStr = Replace(lowStr, Chr(8220), Chr(34), "ALL");
   lowStr = Replace(lowStr, Chr(8221), Chr(34), "ALL");
   retStr = XmlFormat(mid(trim(lowStr), start, count));
   //if string is longer than mid intended then XmlFormat converted/added extra chars.
   if (len(retStr) gt count) {
   //find position of last ampersand if too long
  
   reversed = reverse(retStr);
   revpos = find("&", reversed);
  
   //length of string - reversed position (characters from right) 
   realpos = len(retStr) - revpos + 1;
   
   //new tmpStr is the substring of previous mid from 1 to position BEFORE ampersand
   tmpStr = mid(retStr,1,realpos-1); 
  
    realendpos = find(";",retStr,realpos);
    
   //if length of new string is zero, then string began with & and we should include symbol
    //as long as count under length of special symbol
   if (len(tmpStr) eq 0 and count gt realendpos-realpos) 
    retStr =  mid(retStr,1,count);
    //if tmpStr + symbol length less than count, then we can use
   else if ( len(tmpStr) + (realendpos - realpos + 1) lte count)
      retStr = mid(retStr, 1, count);
   else
    retStr = tmpStr;
   }
   
   return trim(retStr);
}
</cfscript>

<cfscript>
/**
 * Formats an XML document for readability.
 * update by Fabio Serra to CR code
 * 
 * @param XmlDoc 	 XML document. (Required)
 * @return Returns a string. 
 * @author Steve Bryant (steve@bryantwebconsulting.com) 
 * @version 2, March 20, 2006 
 */
function xmlHumanReadable(XmlDoc) {
	var elem = "";
	var result = "";
	var tab = "	";
	var att = "";
	var i = 0;
	var temp = "";
	var cr = createObject("java","java.lang.System").getProperty("line.separator");
	
	if ( isXmlDoc(XmlDoc) ) {
		elem = XmlDoc.XmlRoot;//If this is an XML Document, use the root element
	} else if ( IsXmlElem(XmlDoc) ) {
		elem = XmlDoc;//If this is an XML Document, use it as-as
	} else if ( NOT isXmlDoc(XmlDoc) ) {
		XmlDoc = XmlParse(XmlDoc);//Otherwise, try to parse it as an XML string
		elem = XmlDoc.XmlRoot;//Then use the root of the resulting document
	}
	//Now we are just working with an XML element
	result = "<#elem.XmlName#";//start with the element name
	if ( StructKeyExists(elem,"XmlAttributes") ) {//Add any attributes
		for ( att in elem.XmlAttributes ) {
			result = '#result# #att#="#XmlFormat(elem.XmlAttributes[att])#"';
		}
	}
	if ( Len(elem.XmlText) OR (StructKeyExists(elem,"XmlChildren") AND ArrayLen(elem.XmlChildren)) ) {
		result = "#result#>#cr#";//Add a carriage return for text/nested elements
		if ( Len(Trim(elem.XmlText)) ) {//Add any text in this element
			result = "#result##tab##XmlFormat(Trim(elem.XmlText))##cr#";
		}
		if ( StructKeyExists(elem,"XmlChildren") AND ArrayLen(elem.XmlChildren) ) {
			for ( i=1; i lte ArrayLen(elem.XmlChildren); i=i+1 ) {
				temp = Trim(XmlHumanReadable(elem.XmlChildren[i]));
				temp = "#tab##ReplaceNoCase(trim(temp), cr, "#cr##tab#", "ALL")#";//indent
				result = "#result##temp##cr#";
			}//Add each nested-element (indented) by using recursive call
		}
		result = "#result#</#elem.XmlName#>";//Close element
	} else {
		result = "#result# />";//self-close if the element doesn't contain anything
	}
	
	return result;
}
</cfscript>

<cfscript>
/**
 * Extends XMLFormat to include stripping non-printable characters.
 * 
 * @param str 	 The string to format. (Required)
 * @return Returns a string. 
 * @author Mark Knox (mark@3pss.com) 
 * @version 1, June 27, 2002 
 */
function XMLSafe(str) {
  return XMLFormat(REReplace(str, "[^[:print:]]", "", "ALL"));
}
</cfscript>

<!---
 Replacement for XmlFormat that also replaces all special characters.
 
 @param txt 	 String to format. (Required)
 @return Returns a string. 
 @author David Hammond (dave@modernsignal.com) 
 @version 0, July 12, 2009 
--->
<cffunction name="XmlSafeText" hint="Replaces all characters that would break an xml file." returnType="string" output="false">		
	<cfargument name="txt" type="string" required="true">
	<cfset var chars = "">
	<cfset var replaced = "">
	<cfset var i = "">
	
	<!--- Use XmlFormat function first --->
	<cfset txt = XmlFormat(txt)>
	<!--- Get all other characters to replace. ---> 
	<cfset chars = REMatch("[^[:ascii:]]",txt)>
	<!--- Loop through characters and do replace. Maintain a list of characters already replaced to avoid duplicate work. --->
	<cfloop index="i" from="1" to="#ArrayLen(chars)#">
		<cfif listFind(replaced,chars[i]) is 0>
			<cfset txt = Replace(txt,chars[i],"&##" & asc(chars[i]) & ";","all")>
			<cfset replaced = ListAppend(replaced,chars[i])>
		</cfif>
	</cfloop>
	<cfreturn txt>
</cffunction>

<cfscript>
/**
 * UN-escapes the five forbidden characters in XML data.
 * 
 * @param string 	 String to format. (Required)
 * @return Returns a string. 
 * @author Kreig Zimmerman (kkz@foureyes.com) 
 * @version 1, November 15, 2002 
 */
function XMLUnFormat(string) {
	var resultString=string;
	resultString=ReplaceNoCase(resultString,"&apos;","'","ALL");
	resultString=ReplaceNoCase(resultString,"&quot;","""","ALL");
	resultString=ReplaceNoCase(resultString,"&lt;","<","ALL");
	resultString=ReplaceNoCase(resultString,"&gt;",">","ALL");
	resultString=ReplaceNoCase(resultString,"&amp;","&","ALL");
	return resultString;
}
</cfscript>








</cfcomponent>