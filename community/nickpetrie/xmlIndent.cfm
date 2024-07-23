<cfscript>

string function prettyPrintByTransformer(string xmlString, numeric indent=4, boolean ignoreDeclaration=true) {
    try {
        var xmlAsStringReader = createObject("java", "java.io.StringReader").init(xmlString)

        var src = createObject("java", "org.xml.sax.InputSource").init(xmlAsStringReader)
        var dbf = createObject("java", "javax.xml.parsers.DocumentBuilderFactory").newInstance()
        dbf.setIgnoringElementContentWhitespace(true)
        var document = dbf.newDocumentBuilder().parse(src)
        var transformerFactory = createObject("java", "javax.xml.transform.TransformerFactory").newInstance()

        var transformer = transformerFactory.newTransformer()
        var outputKeys = createObject("java", "javax.xml.transform.OutputKeys")
        transformer.setOutputProperty(outputKeys.ENCODING, "UTF-8")
        transformer.setOutputProperty(outputKeys.INDENT, "yes")
        transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", indent)

        var out = createObject("java", "java.io.StringWriter").init()
        var documentAsDomSource = createObject("java", "javax.xml.transform.dom.DOMSource").init(document)
        var outAsStreamResult = createObject("java", "javax.xml.transform.stream.StreamResult").init(out)
        transformer.transform(documentAsDomSource, outAsStreamResult)

        return out.toString()
    } catch (any e) {
        rethrow;
        throw(message="Error occurs when pretty-printing xml", detail=xmlString)
    }
}
try {
    x = prettyPrintByTransformer('<aaa><bbb ccc="ddd"><eee/></bbb></aaa>')
    writeOutput(formatForHtml(x))
} catch (any e) {
    writeDump(e)
}

s = '<aaa> <bbb ccc="ddd"><eee/> </bbb></aaa>'
writeOutput(formatForHtml(prettyPrintByTransformer(s)))
x = xmlParse(s)
s = x.toString()
writeOutput(formatForHtml(prettyPrintByTransformer(s)))


function formatForHtml(s) {
    return "<pre>#encodeForHtml(s)#</pre>"
}
</cfscript>
