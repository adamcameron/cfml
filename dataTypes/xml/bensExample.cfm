<cfset xmlActresses = XmlNew()>
 
<cfset xmlRoot = XmlElemNew(xmlActresses, "", "actresses" )>

<cfset xmlActresses.xmlRoot = xmlRoot>
 
 
<cfset xmlActress = XmlElemNew( xmlActresses, "", "actress" )>

<cfset xmlActress.XmlAttributes.Name = "Maria Bello">
<cfset xmlActress.XmlAttributes.HowSexy = "Too Sexy">

<cfset ArrayAppend(xmlRoot.XmlChildren, xmlActress)>
 
 
<cfset xmlActress.XmlAttributes.BirthDay = "18 April, 1967">
<cfset xmlActress.XmlAttributes.Hair = "Blonde">

<cfset xmlActresses.Actresses.Actress.XmlAttributes.Eyes = "Brown">
<cfset xmlActresses.Actresses.Actress.XmlAttributes.Smile = "Sly">

<cfdump var="#xmlActress#" label="xmlActress Node">
<cfdump var="#xmlActresses#" labe="xmlActressed DOM"/>