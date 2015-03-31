<cfscript>
// wurfl.cfm
wurflXmlPath = expandPath("\WEB-INF\lucee\lib\wurfl.xml")
userAgent = "Mozilla/5.0 (Linux; Android 4.4.2; Nexus 5 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.99 Mobile Safari/537.36";

resource = createObject("java", "net.sourceforge.wurfl.core.resource.XMLResource").init(wurflXmlPath)
wurflModel = createObject("java", "net.sourceforge.wurfl.core.resource.DefaultWURFLModel").init(resource, [])
engine = createObject("java", "net.sourceforge.wurfl.core.GeneralWURFLEngine").init(wurflModel)
device = engine.getDeviceForRequest(userAgent)

dump(var=device, label="Device")

os = device.getCapability("device_os")
dump(var=[os], label="OS")

capabilities = device.getCapabilities()
dump(var=capabilities, label="Capabilities")
</cfscript>