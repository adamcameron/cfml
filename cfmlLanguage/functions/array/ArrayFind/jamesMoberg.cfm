<h1>Test ColdFusion Array, Struct & List: Creation, Querying &amp; Looping</h1>
<cfsetting requestTimeout="65000">
<CFPARAM name="URL.size" type="integer" default="0">
<CFOUTPUT><form action="#CGI.Script_Name#" method="get">
Iterations: <input type="text" name="size" value="<CFIF VAL(URL.Size)>#VAL(URL.size)#</CFIF>" size=5> <input type="submit" value="Test">
</form></CFOUTPUT>
<CFIF NOT VAL(URL.Size)><CFABORT></CFIF>

<CFSILENT>
<CFSET Stats = {A={itemType="Array", create=0, query=0, queryVector=0, loop=0}, S={itemType="Struct", create=0, query=0, loop=0}, L={itemType="List", create=0, query=0, loop=0}, H={itemType="LinkedHashMap (case-sensitive ordered struct)", create=0, query=0, loop=0}}>

<CFSET A = ArrayNew(1)>
<CFSET S = StructNew()>
<CFSET L = "">
<CFSET H = CreateObject("java", "java.util.LinkedHashMap").init()>

<!--- Create --->
<CFLOOP FROM="1" TO="#VAL(URL.Size)#" INDEX="this">
	<CFSET U = createUuid()>
	<CFSET Start = GetTickCount()>
		<CFSET ArrayAppend(A, U)>
	<CFSET Stats["A"].Create = Stats["A"].Create + (GetTickCount() - Start)>
	<CFSET Start = GetTickCount()>
		<CFSET S[U]="">
	<CFSET Stats["S"].Create = Stats["S"].Create + (GetTickCount() - Start)>
	<CFSET Start = GetTickCount()>
		<CFSET L = ListAppend(L, U)>
	<CFSET Stats["L"].Create = Stats["L"].Create + (GetTickCount() - Start)>
	<CFSET Start = GetTickCount()>
		<CFSET H[U]="">
	<CFSET Stats["H"].Create = Stats["H"].Create + (GetTickCount() - Start)>
</CFLOOP>

<!--- Query (if exists) --->
<CFLOOP ARRAY="#A#" INDEX="this">
	<CFSET U = This>
	<CFSET Start = GetTickCount()>
		<CFSET Temp = ArrayFind(A, U)>
	<CFSET Stats["A"].query = Stats["A"].query + (GetTickCount() - Start)>
	<CFSET Start = GetTickCount()>
		<!---<CFSET Temp = A.indexOf(U)+1>--->
	<CFSET Stats["A"].queryVector = Stats["A"].queryVector + (GetTickCount() - Start)>
	<CFSET Start = GetTickCount()>
		<CFSET Temp = StructKeyExists(S, U)>
	<CFSET Stats["S"].query = Stats["S"].query + (GetTickCount() - Start)>
	<CFSET Start = GetTickCount()>
		<CFSET Temp = StructKeyExists(H, U)>
	<CFSET Stats["H"].query = Stats["H"].query + (GetTickCount() - Start)>
	<CFSET Start = GetTickCount()>
		<CFSET Temp = ListFind(L, U)>
	<CFSET Stats["L"].query = Stats["L"].query + (GetTickCount() - Start)>
</CFLOOP>

<!--- Loop --->
<CFSET Start = GetTickCount()>
<CFLOOP ARRAY="#A#" INDEX="this"></CFLOOP>
<CFSET Stats["A"].Loop = Stats["A"].Loop + (GetTickCount() - Start)>

<CFSET Start = GetTickCount()>
<CFLOOP COLLECTION="#S#" ITEM="this"></CFLOOP>
<CFSET Stats["S"].Loop = Stats["S"].Loop + (GetTickCount() - Start)>

<CFSET Start = GetTickCount()>
<CFLOOP COLLECTION="#H#" ITEM="this"></CFLOOP>
<CFSET Stats["H"].Loop = Stats["H"].Loop + (GetTickCount() - Start)>

<CFSET Start = GetTickCount()>
<CFLOOP LIST="#L#" INDEX="this"></CFLOOP>
<CFSET Stats["L"].Loop = Stats["L"].Loop + (GetTickCount() - Start)>
</CFSILENT>

<CFOUTPUT><p>Executed at: #Now()#</p></CFOUTPUT>
<table>
<tr valign="top"><CFLOOP LIST="A,L,S,H" INDEX="this"><td><CFDUMP VAR="#Stats[this]#" Label="#Stats[this].ItemType#"></td></CFLOOP></tr>
</table>