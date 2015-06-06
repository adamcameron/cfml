<!---
/** 
* Copyright 2003 massimocorner.com
* tmt_java_regexp ColdFusion Component 
* A collection of UDFs that act as wrappers around native Java regular rxpressions from the java.util.regex package. 
  They use Java syntax for regular expressions; compared to CFML native functions they also support lookbehind and inline modifiers. 
  For additional info check Sun documentation and the following books:
  http://www.oreilly.com/catalog/regex2/
  http://www.oreilly.com/catalog/regexppr/
  It is strongly suggested to only use the following methods: regExpTest(), regExpReplace(), regExpMatches and regExpExec(). 
  Use the other methods only if you are familiar with the java.util.regex package or need to work at a lower level in order to optimise performances.
  Require ColdFusion 6.1 or above
* @output      supressed 
* @author      Massimo Foti (massimo@massimocorner.com)
* @version     1.1, 2003-12-23
 */
  --->

<cfcomponent output="false" hint="A collection of UDFs that act as wrappers around native Java regular rxpressions from the java.util.regex package. 
  They use Java syntax for regular expressions; compared to CFML native functions they also support lookbehind and inline modifiers. 
  For additional info check Sun documentation and the following books:
  http://www.oreilly.com/catalog/regex2/
  http://www.oreilly.com/catalog/regexppr/
  It is strongly suggested to only use the following methods: regExpTest(), regExpReplace(), regExpMatches and regExpExec(). 
  Use the other methods only if you are familiar with the java.util.regex package or need to work at a lower level in order to optimise performances.
  Require ColdFusion 6.1 or above">

	<!--- Ensure this file gets compiled using iso-8859-1 charset --->
	<cfprocessingdirective pageencoding="iso-8859-1">  
	
	<!---
	/** 
	* Compiles the given regular expression literal into a Java pattern object
	* @access      public
	* @output      suppressed 
	* @param       regExp (string)               Required. The regular expression string literal to be compiled
	* @exception   tmt_jRegExp
	 */
	  --->
	<cffunction access="public" name="jPatternCompile" output="false" hint="Compiles the given regular expression literal into a Java pattern object">
		<cfargument name="regExp" type="string" required="yes" hint="The regular expression string literal to be compiled">
		<cfset var jPattern="">
		<cftry>
			<cfset jPattern=CreateObject("java","java.util.regex.Pattern").compile(arguments.regExp)>
			<cfcatch type="Any">
				<!--- Something weird happened, it may be a malfomed/unrecognized expression or anything else --->
				<cfthrow message="Failed to compile RegExp. #cfcatch.message#" type="tmt_jRegExp">
			</cfcatch>
		</cftry>
		<cfreturn jPattern>
	</cffunction>

	<!---
	/** 
	* Search the target string attached to the matcher and returns the results as an array, 
	  where the first element contains the whole match and any subsequent element contains matches from capturing groups
	* @access      public
	* @output      suppressed 
	* @param       jMatcher                      Required. The Java Pattern object. Call jMatcherInstance() to create one
	* @param       returnStruct (boolean)        Optional. Default to false. By default matches are returned as strings, set this to true in order to get a structure that contains three elements: 
				   string (matched string), start (index of the first character matched), end (index of the last character matched)
	* @return      array
	 */
	  --->
	<cffunction access="public" name="jMatcherExec" output="false" returntype="array" hint="Search the target string attached to the matcher and returns the results as an array, 
  where the first element contains the whole match and any subsequent element contains matches from capturing groups">
		<cfargument name="jMatcher" required="yes" hint="The Java Pattern object. Call jMatcherInstance() to create one">
		<cfargument name="returnStruct" type="boolean" required="no" default="false" hint="By default matches are returned as strings, set this to true in order to get a structure that contains three elements: 
	string (matched string), start (index of the first character matched), end (index of the last character matched)">
		<cfset var matchesArray=ArrayNew(1)>
		<cfset var matchStruct="">
		<cfset validateMatcher(arguments.jMatcher)>
		<cfset arguments.jMatcher.reset()>
		<cfif arguments.jMatcher.find()>
			<cfloop index="i" from="0" to="#arguments.jMatcher.groupCount()#">
				<cfif NOT arguments.returnStruct>
					<!--- Return only the strings --->
					<cfset ArrayAppend(matchesArray, arguments.jMatcher.group(JavaCast("int",i)))>
					<cfelse>
					<!--- Return structures containing additional info --->
					<cfset matchStruct=StructNew()>
					<cfset matchStruct["string"]=arguments.jMatcher.group(JavaCast("int",i))>
					<cfset matchStruct["start"]=arguments.jMatcher.start(JavaCast("int",i))>
					<cfset matchStruct["end"]=arguments.jMatcher.end(JavaCast("int",i))>
					<cfset ArrayAppend(matchesArray, matchStruct)>
				</cfif>
			</cfloop>
		</cfif>
		<cfset arguments.jMatcher.reset()>
		<cfreturn matchesArray>
	</cffunction>
	
	<!---
	/** 
	* Create a Java Matcher object for a target string out of a regular expression. 
	  Please note, matcher objects are not threaf-safe because they hold internal state between method invocations
	* @access      public
	* @output      suppressed 
	* @param       regExp (string)               Required. The regular expression string literal
	* @param       targetString (string)         Required. The target string
	 */
	  --->
	<cffunction access="public" name="jMatcherInstance" output="false" hint="Create a Java Matcher object for a target string out of a regular expression. 
  Please note, matcher objects are not threaf-safe because they hold internal state between method invocations">
		<cfargument name="regExp" type="string" required="yes" hint="The regular expression string literal">
		<cfargument name="targetString" type="string" required="yes" hint="The target string">
		<!--- Compile the pattern and create a matcher out of it --->
		<cfreturn jPatternCompile(arguments.regExp).matcher(arguments.targetString)>
	</cffunction>
	
	<!--- 
	/** 
	* Search a string using a regular expression and returns all matching subsequences as an array
	* @access      public
	* @output      suppressed 
	* @param       jMatcher                      Required. The Java Pattern object. Call jMatcherInstance() to create one
	* @param       returnStruct (boolean)        Optional. Default to false. By default matches are returned as strings, set this to true in order to get a structure that contains three elements: 
				   string (matched string), start (index of the first character matched), end (index of the last character matched), sub (array of matches from capturing groups)
	* @return      array
	 */
	  --->
	<cffunction access="public" name="jMatcherMatches" output="false" returntype="array" hint="Search a string using a regular expression and returns all matching subsequences as an array">
		<cfargument name="jMatcher" required="yes" hint="The Java Pattern object. Call jMatcherInstance() to create one">
		<cfargument name="returnStruct" type="boolean" required="no" default="false" hint="By default matches are returned as strings, set this to true in order to get a structure that contains three elements: 
	string (matched string), start (index of the first character matched), end (index of the last character matched), sub (array of matches from capturing groups)">
		<cfset var i=0>
		<cfset var matchesArray=ArrayNew(1)>
		<cfset var matchStruct="">
		<cfset validateMatcher(arguments.jMatcher)>
		<cfset arguments.jMatcher.reset()>
		<cfscript>
		while(jMatcher.find()){
			if(NOT arguments.returnStruct){
				ArrayAppend(matchesArray, jMatcher.group());
			}
			else{
				matchStruct=StructNew();
				matchStruct["string"]=jMatcher.group();
				matchStruct["start"]=jMatcher.start();
				matchStruct["end"]=jMatcher.end();
				matchStruct["sub"]=ArrayNew(1);
				for(i; i LT jMatcher.groupCount(); i=i+1){
					ArrayAppend(matchStruct["sub"], jMatcher.group(JavaCast("int",i)));
				}
				i=0;
				ArrayAppend(matchesArray, matchStruct);
			}
		}
		</cfscript>
		<cfset arguments.jMatcher.reset()>
		<cfreturn matchesArray>
	</cffunction>
	
	<!---
	/** 
	* Replace matching subsequences of the target string attached to the matcher object with the given replacement string
	* @access      public
	* @output      suppressed 
	* @param       jMatcher                      Required. The Java Pattern object. Call jMatcherInstance() to create one
	* @param       replacement (string)          Required. The replacement string
	* @param       all (boolean)                 Optional. Default to false. By default only the first subsequence is replaced, set this to true to replace every subsequence
	* @return      string
	 */
	  --->
	<cffunction access="public" name="jMatcherReplace" output="false" returntype="string" hint="Replace matching subsequences of the target string attached to the matcher object with the given replacement string">
		<cfargument name="jMatcher" required="yes" hint="The Java Pattern object. Call jMatcherInstance() to create one">
		<cfargument name="replacement" type="string" required="yes" hint="The replacement string">
		<cfargument name="all" type="boolean" required="no" default="false" hint="By default only the first subsequence is replaced, set this to true to replace every subsequence">
		<cfset validateMatcher(arguments.jMatcher)>
		<cfset arguments.jMatcher.reset()>
		<cfif NOT arguments.all>
			<cfreturn arguments.jMatcher.replaceFirst(arguments.replacement)>
			<cfelse>
			<cfreturn arguments.jMatcher.replaceAll(arguments.replacement)>
		</cfif>
		<cfset arguments.jMatcher.reset()>
	</cffunction>
	
	<!---
	/** 
	* Search a string using a regular expression and returns the results as an array, 
	  where the first element contains the whole match and any subsequent element contains matches from capturing groups
	* @access      public
	* @output      suppressed 
	* @param       regExp (string)               Required. The regular expression string literal
	* @param       targetString (string)         Required. The target string
	* @param       returnStruct (boolean)        Optional. Default to false. By default matches are returned as strings, set this to true in order to get a structure that contains three elements: 
				   string (matched string), start (index of the first character matched), end (index of the last character matched)
	* @return      array
	 */
	  --->
	<cffunction access="public" name="regExpExec" output="false" returntype="array" hint="Search a string using a regular expression and returns the results as an array, 
  where the first element contains the whole match and any subsequent element contains matches from capturing groups">
		<cfargument name="regExp" type="string" required="yes" hint="The regular expression string literal">
		<cfargument name="targetString" type="string" required="yes" hint="The target string">
		<cfargument name="returnStruct" type="boolean" required="no" default="false" hint="By default matches are returned as strings, set this to true in order to get a structure that contains three elements: 
	string (matched string), start (index of the first character matched), end (index of the last character matched)">
		<cfset var jMatcher=jMatcherInstance(arguments.regExp, arguments.targetString)>
		<cfreturn jMatcherExec(jMatcher, arguments.returnStruct)>
	</cffunction>
	
	<!--- 
	/** 
	* Search a string using a regular expression and returns all matching subsequences as an array
	* @access      public
	* @output      suppressed 
	* @param       targetString (string)         Required. The target string
	* @param       regExp (string)               Required. The regular expression string literal
	* @param       returnStruct (boolean)        Optional. Default to false. By default matches are returned as strings, set this to true in order to get a structure that contains three elements: 
				   string (matched string), start (index of the first character matched), end (index of the last character matched), sub (array of matches from capturing groups)
	* @return      array
	 */
	  --->
	<cffunction access="public" name="regExpMatches" output="false" returntype="array" hint="Search a string using a regular expression and returns all matching subsequences as an array">
		<cfargument name="regExp" type="string" required="yes" hint="The regular expression string literal">
		<cfargument name="targetString" type="string" required="yes" hint="The target string">
		<cfargument name="returnStruct" type="boolean" required="no" default="false" hint="By default matches are returned as strings, set this to true in order to get a structure that contains three elements: 
	string (matched string), start (index of the first character matched), end (index of the last character matched), sub (array of matches from capturing groups)">
		<cfset var jMatcher=jMatcherInstance(arguments.regExp, arguments.targetString)>
		<cfreturn jMatcherMatches(jMatcher, arguments.returnStruct)>
	</cffunction>
	
	<!---
	/** 
	* Searches a string using a regular expression and replace matching subsequences with the given replacement string
	* @access      public
	* @output      suppressed 
	* @param       regExp (string)               Required. The regular expression string literal
	* @param       targetString (string)         Required. The target string
	* @param       replacement (string)          Required. The replacement string
	* @param       all (boolean)                 Optional. Default to false. By default only the first subsequence is replaced, set this to true to replace every subsequence
	* @return      string
	 */
	  --->
	<cffunction access="public" name="regExpReplace" output="false" returntype="string" hint="Searches a string using a regular expression and replace matching subsequences with the given replacement string">
		<cfargument name="regExp" type="string" required="yes" hint="The regular expression string literal">
		<cfargument name="targetString" type="string" required="yes" hint="The target string">
		<cfargument name="replacement" type="string" required="yes" hint="The replacement string">
		<cfargument name="all" type="boolean" required="no" default="false" hint="By default only the first subsequence is replaced, set this to true to replace every subsequence">
		<cfset var returnString=arguments.targetString>
		<cfset var jMatcher=jMatcherInstance(arguments.regExp, arguments.targetString)>
		<cfset returnString=jMatcherReplace(jMatcher, arguments.replacement, arguments.all)>
		<cfset jMatcher.reset()>
		<cfreturn returnString>
	</cffunction>
	
	<!---
	/** 
	* Returns a boolean to indicate whether the regular expression matches anything in the target string
	* @access      public
	* @output      suppressed 
	* @param       regExp (string)               Required. The regular expression string literal
	* @param       targetString (string)         Required. The target string
	* @return      boolean
	 */
	  --->
	<cffunction access="public" name="regExpTest" output="false" returntype="boolean" hint="Returns a boolean to indicate whether the regular expression matches anything in the target string">
		<cfargument name="regExp" type="string" required="yes" hint="The regular expression string literal">
		<cfargument name="targetString" type="string" required="yes" hint="The target string">
		<cfset var matchFund=false>
		<cfset var jMatcher=jMatcherInstance(arguments.regExp, arguments.targetString)>
		<cfset matchFund=jMatcher.find()>
		<cfset jMatcher.reset()>
		<cfreturn matchFund>
	</cffunction>
	
	<!---
	/** 
	* Check to be sure the argument is a valid Java Matcher
	* @access      private
	* @output      suppressed 
	* @param       jMatcher                      Required. The Java Pattern object. Call jMatcherInstance() to create one
	* @exception   tmt_jRegExp
	* @return      boolean
	 */
	  --->
	<cffunction access="private" name="validateMatcher" output="false" returntype="boolean" hint="Check to be sure the argument is a valid Java Matcher">
		<cfargument name="jMatcher" required="yes" hint="The Java Pattern object. Call jMatcherInstance() to create one">
		<!--- Check the argument class name --->
		<cfif arguments.jMatcher.getClass().getName() NEQ "java.util.regex.Matcher">
			<cfthrow message="Invalid argument, you must use a Java Matcher object" type="tmt_jRegExp">
		</cfif>
		<cfreturn 1>
	</cffunction>
	
	<!---
	/** 
	* Check to be sure the argument is a valid Java Pattern
	* @access      private
	* @output      suppressed 
	* @param       jPattern                      Required. The Java Pattern object. Can call jPatternCompile() to create one
	* @exception   tmt_jRegExp
	* @return      boolean
	 */
	  --->
	<cffunction access="private" name="validatePattern" output="false" returntype="boolean" hint="Check to be sure the argument is a valid Java Pattern">
		<cfargument name="jPattern" required="yes" hint="The Java Pattern object. Can call jPatternCompile() to create one">
		<!--- Check the argument class name --->
		<cfif arguments.jPattern.getClass().getName() NEQ "java.util.regex.Pattern">
			<cfthrow message="Invalid argument, you must use a Java Pattern object" type="tmt_jRegExp">
		</cfif>
		<cfreturn 1>
	</cffunction>
	
</cfcomponent>
