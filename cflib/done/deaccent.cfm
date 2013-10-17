<cfprocessingdirective pageencoding="utf-8">
<cfscript>
/**
 * Replaces accented characters with their non accented closest equivalents.
 *
 * @return Returns a string.
 * @author Rachel Lehman (raelehman@gmail.com)
 * @version 1, November 15, 2010
 */
function deAccentOld(str){
    var newstr = "";
    var list1 ="á,é,í,ó,ú,ý,à,è,ì,ò,ù,â,ê,î,ô,û,ã,ñ,õ,ä,ë,ï,ö,ü,ÿ,À,È,Ì,Ò,Ù,Á,É,Í,Ó,Ú,Ý,Â,Ê,Î,Ô,Û,Ã,Ñ,Õ,Ä,Ë,Ï,Ö,Ü,x";
    var list2 = "a,e,i,o,y,u,a,e,i,o,u,a,e,i,o,u,a,n,o,a,e,i,o,u,y,A,E,I,O,U,A,E,I,O,U,Y,A,E,I,O,U,A,N,O,A,E,I,O,U,Y";

    newstr = ReplaceList(str,list1,list2);
    return newstr;
}



function deAccent(str){
	var i		= 0;
	var ascList	= "225,233,237,243,250,253,224,232,236,242,249,226,234,238,244,251,227,241,245,228,235,239,246,252,255,192,200,204,210,217,193,201,205,211,218,221,194,202,206,212,219,195,209,213,196,203,207,214,220";
	var list1	= "";
	var list2	= "";
	for (i=1; i LTE listLen(ascList); i++){
		list1 = listAppend( list1, chr(listGetAt(ascList,i)) );
	}
	list2 = "a,e,i,o,y,u,a,e,i,o,u,a,e,i,o,u,a,n,o,a,e,i,o,u,y,A,E,I,O,U,A,E,I,O,U,Y,A,E,I,O,U,A,N,O,A,E,I,O,U";
	return replaceList(str, list1, list2);
}

function deAccentJava(str){
	//based on the approach found here: http://stackoverflow.com/a/1215117/894061
	var Normalizer = createObject("java","java.text.Normalizer");
	var NormalizerForm = createObject("java","java.text.Normalizer$Form");
	var normalizedString = Normalizer.normalize(str, createObject("java","java.text.Normalizer$Form").NFD);
	var pattern = createObject("java","java.util.regex.Pattern").compile("\p{InCombiningDiacriticalMarks}+");
	return pattern.matcher(normalizedString).replaceAll("");
}


s = "òéışöç";
writeOutput(s& ": " & deAccentOld(s) & "<br />");
writeOutput(s& ": " & deAccent(s) & "<br />");
writeOutput(s& ": " & deAccentJava(s) & "<br />");
</cfscript>

