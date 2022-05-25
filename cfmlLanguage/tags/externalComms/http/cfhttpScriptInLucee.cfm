<cfscript>
    cfhttp(method="get", url="https://gist.githubusercontent.com/adamcameron/816ce84fd991c2682df612dbaf1cad11/raw/7f8d713d2515537f3e5b7321995d8e89dd06c9ca/tinyTestFramework.cfm", result="frameworkCodeResponse");
    cfhttp(method="get", url="https://gist.githubusercontent.com/adamcameron/0df8bb82777d92387f0852c8e26feec8/raw/0168fdd943161b2c01161662ef1deff62ffb9be2/afterAllBasicTest.cfm", result="testCodeResponse");

    frameworkCode = frameworkCodeResponse.fileContent;
    testCode = testCodeResponse.fileContent;

    cfhttp(method="post" url="https://acf14-sbx.trycf.com/getremote.cfm" result="testRunResponse") {
        cfhttpparam(type="formField" name="setupcode" value=frameworkCode);
        cfhttpparam(type="formField" name="code" value=testCode);
        cfhttpparam(type="formField" name="asserts" value="");
    }
    writeOutput(testRunResponse.fileContent)
</cfscript>
