<cfscript>
// callMethodsFromWithinPackageA.cfm

include "udfs.cfm";

packageAObject = new packageA.PackageAComp();
packageBObject = new packageB.PackageBComp();

safelyCallMethod(packageAObject, "packageAPublicMethod");
safelyCallMethod(packageAObject, "packageAPackageMethod");
safelyCallMethod(packageBObject, "packageBPublicMethod");
safelyCallMethod(packageBObject, "packageBPackageMethod");
</cfscript>