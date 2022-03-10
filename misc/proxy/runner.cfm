<cfscript>
injector = new ProxyInjector()
target = new Target()
source = new Source("value1", "value2")

injector.proxyMethod(target, source, "returnTheProperties")

writeDump(target.callProxiedMethod())
</cfscript>
