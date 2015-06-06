<cfobject type=".NET" name="myRijndael" class="System.Security.Cryptography.RijndaelManaged" assembly="C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\System.Security.dll">
<cfobject type=".NET" name="myConvert" class="System.Convert" assembly="C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\System.dll">
<cfobject type=".NET" name="myCipher" class="System.Security.Cryptography.CipherMode" assembly="C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\System.Security.dll">
<cfobject type=".NET" name="myEncoding" class="System.Text.UnicodeEncoding" assembly="C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\mscorlib.dll">

<cfscript>
str = "hello";
key = "vXPlTT0bI2Bd2zPwW2sqRRAn8TQ8YmV/iC4+qQgzeNY=";
myRijndael.Set_Key(myConvert.FromBase64String(key));
myRijndael.Set_Mode(myCipher.ECB);

encryptor = myRijndael.CreateEncryptor();
data = myEncoding.GetBytes(str);
dataEncrypted = encryptor.TransformFinalBlock(data, 0, myEncoding.GetByteCount(str));
returnString = myConvert.ToBase64String(dataEncrypted);
</cfscript>
<cfdump var="#variables#">