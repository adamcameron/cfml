<cfscript>
cfmlArray = ["tahi", "rua", "toru", "wha"];

jsFile = expandPath("./stringify.js");
js = createObject("java", "java.io.FileReader").init(jsFile);

engineManager = createObject("java", "javax.script.ScriptEngineManager");
engine = engineManager.getEngineByName("JavaScript");
invocable = createObject("java", "java.lang.Class").forName("javax.script.Invocable").cast(engine);
engine.eval(js);

result = invocable.invokeFunction("stringify", [cfmlArray]);
writeDump(result);

</cfscript>