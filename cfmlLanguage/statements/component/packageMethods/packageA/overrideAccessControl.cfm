<cfscript>
// overrideAccessControl.cfm
function overrideAccessControl(required string method){
	variables["__#method#"] = variables[method];
	this[method] = variables["__#method#"];
	this[method & "_public"] = variables["__#method#"];
}

packageBObject = new packageB.PackageBComp();

packageBObject.overrideAccessControl = overrideAccessControl;
packageBObject.overrideAccessControl("packageBPackageMethod");

include "udfs.cfm";

safelyCallMethod(packageBObject, "packageBPublicMethod");
//safelyCallMethod(packageBObject, "packageBPackageMethod");
safelyCallMethod(packageBObject, "packageBPackageMethod_public");

</cfscript>