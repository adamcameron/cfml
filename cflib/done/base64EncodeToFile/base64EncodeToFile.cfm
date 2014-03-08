<cfscript>
void function base64EncodeToFile(required input, required string outputFilePath){
	var outputStream 		= 	createObject("java","java.io.FileOutputStream");
	var base64OutputStream 	= 	createObject("java","org.apache.commons.codec.binary.Base64OutputStream");
	var ioUtils				=	createObject("java","org.apache.commons.io.IOUtils");

	outputStream.init(arguments.outputFilePath);
	base64OutputStream.init(outputStream);

	if (isBinary(arguments.input)){
		var inputStream = createObject("java","java.io.ByteArrayInputStream");
	}else{
		var inputStream = createObject("java","java.io.FileInputStream");
	}

	inputStream.init(arguments.input);
	ioUtils.copy(inputStream,base64OutputStream);
	inputStream.close();
	base64OutputStream.close();
	inputStream.close();
	base64OutputStream.close();
}

dir = expandPath("./");
src = dir & "src.jpg";
b64File = dir & "dst.b64";
dst = dir & "dst.jpg";

base64EncodeToFile(src,b64File);

b64 = fileRead(b64File, "UTF-8");

bin = toBinary(b64);
fileWrite(dst, bin);
</cfscript>


