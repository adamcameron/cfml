<!---
import java.util.*;
import java.lang.reflect.*;
 --->

<cfcomponent output="false" hint="Uses Java reflection to extract information from an object instance.  This is a CF version of ClassViewer.class">
	<cfsetting enablecfoutputonly="true">

	<cfset variables.nl			= createObject("java", "java.lang.System").getProperty("line.separator")>
	<cfset variables.oModifier	= createObject("java", "java.lang.reflect.Modifier")>
	<cfset variables.oClass		= createObject("java", "java.lang.Class")>


	<cffunction name="viewClassByName" access="public" returntype="string" output="false">
		<cfargument name="name" required="true" type="string">
		<cfreturn viewClass(Class.forName(arguments.name))>
	</cffunction>


	<cffunction name="viewObject" access="public" returntype="string" output="false">
		<cfargument name="obj" required="true" type="any">

		<cfscript>
			try {	// java
				return viewClass(arguments.obj.getClass());
			} catch (any e){	// CF boilerplate.  Not happy about this
				return viewClass(variables.oClass.forName("coldfusion.runtime.TemplateProxy"));
			}
		</cfscript>
	</cffunction>


	<cffunction name="viewClass" access="public" returntype="string" output="false">
		<cfargument name="c" required="true" type="any">

		<cfscript>
			var sOut			= "";
			var superClass		= false;
			var iIndent			= 1;
			var aInterfaces		= arguments.c.getInterfaces();
			var aConstructors	= arguments.c.getConstructors();
			var aMethods		= arguments.c.getMethods();
			var aFields			= arguments.c.getFields();
			var i				= 0;
		</cfscript>
		<cfsavecontent variable="sOut">
			<cfscript>
			writeOutput("#variables.oModifier.toString(arguments.c.getModifiers())# class #arguments.c.getName()##nl#");

			superClass = variables.oClass.forName(arguments.c.getName()).getSuperClass();

			while (isDefined("superClass")){
				writeOutput('<span style="padding-left: #iIndent#em;">extends #superClass.getName()#</span>#nl#');
				superClass = variables.oClass.forName(superClass.getName()).getSuperClass();
				iIndent = iIndent + 1;
			}



			if (arrayLen(aInterfaces)){
				writeOutput(" implements ");
				for (i=1; i le arrayLen(aInterfaces); i=i+1){
					if (i gt 1) writeOutput(", ");
	                writeOutput(aInterfaces[i].getName());
				}
				writeOutput(nl);
			}
			writeOutput("{#nl# /*** CONSTRUCTORS ***/#nl#");
			for (i=1; i le arrayLen(aConstructors); i=i+1){
				writeOutput("#viewConstructor(aConstructors[i])##nl##nl#");
			}
			writeOutput("#nl# /*** METHODS ***/#nl#");
			for (i=1; i le arrayLen(aMethods); i=i+1){
				 writeOutput(viewMethod(aMethods[i]));
				 writeOutput("#nl##nl#");
			}
			writeOutput("#nl# /*** FIELDS ***/#nl#");
			for (i=1; i le arrayLen(aFields); i=i+1){
				  writeOutput("#variables.oModifier.toString(aFields[i].getModifiers())# #aFields[i].getType().getName()# #aFields[i].getName()##nl#");
			}
			writeOutput("#nl#");
			</cfscript>
		</cfsavecontent>
		<cfreturn trim(sOut)>
	</cffunction>


	<cffunction name="viewMethod" returntype="string" access="public" output="false">
		<cfargument name="m" type="any" required="true">
		<cfscript>
			var sOut	= "";
			var aParams = arguments.m.getParameterTypes();
			var i		= 0;
			var aExc	= arguments.m.getExceptionTypes();
		</cfscript>
		<cfsavecontent variable="sOut">
			<cfscript>
				writeOutput("#variables.oModifier.toString(arguments.m.getModifiers())# #arguments.m.getReturnType().getName()# #arguments.m.getName()# (");
				for (i=1; i le arrayLen(aParams); i=i+1){
					if (i gt 1) writeOutput(", ");
					writeOutput(aParams[i].getName());
				}
				writeOutput(")");
				if (arrayLen(aExc)){
					writeOutput("#nl# throws ");
					for (i=1; i le arrayLen(aExc); i=i+1){
						if (i gt 1) writeOutput(", ");
						writeOutput(aExc[i].getName());
					}
				}
			</cfscript>
		</cfsavecontent>
		<cfreturn trim(sOut)>
	</cffunction>


	<cffunction name="viewConstructor" returntype="string" access="public" output="false">
		<cfargument name="c" type="any" required="true">
		<cfscript>
			var sOut	= "";
			var aParams = arguments.c.getParameterTypes();
			var i		= 0;
		</cfscript>
		<cfsavecontent variable="sOut">
			<cfscript>
				writeOutput("#variables.oModifier.toString(arguments.c.getModifiers())# #arguments.c.getName()# (");
				for (i=1; i le arrayLen(aParams); i=i+1){
					if (i gt 1) writeOutput(", ");
					writeOutput(aParams[i].getName());
				}
				writeOutput(")");
			</cfscript>
		</cfsavecontent>
		<cfreturn trim(sOut)>
	</cffunction>


</cfcomponent>
