<p>It's okay to use a dot in a struct key, as long as that is the end of the line, eg.</p>

<cfset plutarch=StructNew()>
<cfset plutarch['lives.antony']="Antony's grandfather was the orator Antonius, who joined the party of Sulla...">
<cfset plutarch['lives.brutus']="Marcus Brutus was a descendant of that Junius Brutus whose bronze statue, with...">
<cfset plutarch['lives.caesar']="The wife of Caesar was Cornelia, the daughter of the Cinna...">
<cfset plutarch['lives.caesar.notes']=StructNew()>
<cfset plutarch['lives.caesar.notes'].one = "Many think that opening paragraphs of this Life, describing the birth and boyhood of Caesar, have been lost.">

<p>It seems all these keys work independently of each other - ie. a dot is a valid character in a struct key.  But what happens now if we assign something to 'lives'?</p>

<cfdump var="#plutarch#">

<cfset plutarch['lives'] = "A series of biographies of famous Greeks and Romans, arranged in pairs to illuminate their common moral virtues and vices...">

<cfdump var="#plutarch#">

<p>Still good....</p>
<p>Or is it?  What if what we want to assign is another struct?</p>

<cfset plutarch['lives'] = StructNew()>

<cfdump var="#plutarch#">
<cfloop item="topKey" collection="#plutarch#">
	<cfoutput>
		[#topKey#]:
		<cfif isSimpleValue(plutarch[topKey])>
			[#plutarch[topKey]#]<br />
		<cfelse>
			<cfloop item="innerKey" collection="#plutarch[topKey]#">
				<cfoutput>
					<br>&nbsp;&nbsp;&nbsp;&nbsp;[#innerKey#]:
					[#plutarch[topKey][innerKey]#]<br />
				</cfoutput>
			</cfloop>
		</cfif>
	</cfoutput>
</cfloop>

<p>Ooops!</p>

