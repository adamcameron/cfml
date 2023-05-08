<cfsetting enablecfoutputonly="true">
This is not within CFOUTPUT, in any meaningful way, eg: "#now()#" is not resolved (as opposed to <cfoutput>#now()#</cfoutput>), therefore should not display.

<cfoutput>#getPageContext().getCFOutput().getOutputCount()#</cfoutput>