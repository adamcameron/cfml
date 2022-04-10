<cfset multiplier = 100>
<cfset varNames = listToArray("a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z")>
<!---<cfset scopes = getPageContext().getBuiltInScopes()>--->
<cfset scopes = {
	cffile 		= cffile,
	cfthread	= cfthread,
	cgi			= cgi,
	client		= client,
	cookie		= cookie,
	file		= file,
	form		= form,
	http		= http,
	request		= request,
	server		= server,
	url			= url,
	variables	= variables
}>
<cfset scopeNames = structKeyArray(scopes)>

<p><strong>Where s is a string representing the name of a ColdFusion built-in scope and i is the name of a variable in that scope:</strong></p>
<cfoutput>
	<cfset startMs = getTickCount()>
	<cfloop array="#scopeNames#" index="s">
		<cfset s = lCase(s)>
		<cfloop from="1" to="#multiplier#" index="m">
			<cfloop array="#varNames#" index="i">
				<cfset structKeyExists(evaluate("#s#"),i)>
			</cfloop>
		</cfloop>
	</cfloop>
	<cfset endMs = getTickCount()>
	<p>structKeyExists(evaluate("##s##"),i) did #arrayLen(scopeNames)*arrayLen(varNames)*multiplier# iterations in #(endMs-startMs)/1000# seconds.</p>
	<cfflush />
	
	<cfset startMs = getTickCount()>
	<cfloop array="#scopeNames#" index="s">
		<cfset s = lCase(s)>
		<cfloop from="1" to="#multiplier#" index="m">
			<cfloop array="#varNames#" index="i">
				<cfset structKeyExists(scopes[s],i)>
			</cfloop>
		</cfloop>
	</cfloop>
	<cfset endMs = getTickCount()>
	<p>structKeyExists(scopes[s],i) did #arrayLen(scopeNames)*arrayLen(varNames)*multiplier# iterations in #(endMs-startMs)/1000# seconds.</p>
	<cfflush />
	
	<cfset startMs = getTickCount()>
	<cfloop array="#scopeNames#" index="s">
		<cfset s = lCase(s)>
		<cfloop from="1" to="#multiplier#" index="m">
			<cfloop array="#varNames#" index="i">
				<cfset structKeyExists(structGet(s),i)>
			</cfloop>
		</cfloop>
	</cfloop>
	<cfset endMs = getTickCount()>
	<p>structKeyExists(structGet(s),varName) did #arrayLen(scopeNames)*arrayLen(varNames)*multiplier# iterations in #(endMs-startMs)/1000# seconds.</p>
	<cfflush />
	
	<cfset startMs = getTickCount()>
	<cfloop array="#scopeNames#" index="s">
		<cfset s = lCase(s)>
		<cfloop from="1" to="#multiplier#" index="m">
			<cfloop array="#varNames#" index="i">
				<cfset structKeyExists(form,i)>
			</cfloop>
		</cfloop>
	</cfloop>
	<cfset endMs = getTickCount()>
	<p>structKeyExists(form,varName) (static scope) did #arrayLen(scopeNames)*arrayLen(varNames)*multiplier# iterations in #(endMs-startMs)/1000# seconds.</p>
	<cfflush />
	
	<cfset startMs = getTickCount()>
	<cfloop array="#scopeNames#" index="s">
		<cfset s = lCase(s)>
		<cfloop from="1" to="#multiplier#" index="m">
			<cfloop array="#varNames#" index="i">
				<cfset isDefined("#s#.#i#")>
			</cfloop>
		</cfloop>
	</cfloop>
	<cfset endMs = getTickCount()>
	<p>isDefined("##scope##.##var##"") (dynamic qualified var name) did #arrayLen(scopeNames)*arrayLen(varNames)*multiplier# iterations in #(endMs-startMs)/1000# seconds.</p>
	<cfflush />
	
	<cfset startMs = getTickCount()>
	<cfloop array="#scopeNames#" index="s">
		<cfset s = lCase(s)>
		<cfloop from="1" to="#multiplier#" index="m">
			<cfloop array="#varNames#" index="i">
				<cfset isDefined("form.#i#")>
			</cfloop>
		</cfloop>
	</cfloop>
	<cfset endMs = getTickCount()>
	<p>isDefined("form.##var##"") (static scope) did #arrayLen(scopeNames)*arrayLen(varNames)*multiplier# iterations in #(endMs-startMs)/1000# seconds.</p>
	<cfflush />
	
	<cfset startMs = getTickCount()>
	<cfloop array="#scopeNames#" index="s">
		<cfset s = lCase(s)>
		<cfloop from="1" to="#multiplier#" index="m">
			<cfloop array="#varNames#" index="i">
				<cfset isDefined("#i#")>
			</cfloop>
		</cfloop>
	</cfloop>
	<cfset endMs = getTickCount()>
	<p>isDefined("##var##"") (no scope) did #arrayLen(scopeNames)*arrayLen(varNames)*multiplier# iterations in #(endMs-startMs)/1000# seconds.</p>
</cfoutput>