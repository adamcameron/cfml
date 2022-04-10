<cfset result.myText = "The quick brown fox jumps over the lazy dog     ">
<cfset result.result.myKey = "12345678">

<!--- CF --->
<cfset result.encryptedTextCf = encrypt(result.myText, result.result.myKey, "BLOWFISH", "HEX")>
 

<!--- Java --->
<cfset Cipher = createObject("java", "javax.crypto.Cipher")>
<cfset encryptor = Cipher.getInstance("Blowfish/ECB/NoPadding")>
<!--- must convert the key string into a KeySpec object first --->
<cfset keySpec = createObject("java", "javax.crypto.spec.SecretKeySpec").init(result.result.myKey.getBytes(), "Blowfish")>
<!--- initialize the cipher for encrypting --->
<cfset encryptor.init(Cipher.ENCRYPT_MODE, keySpec)>
<!--- do the encrypt --->
<cfset encryptedTextFromJava = encryptor.doFinal(result.myText.getBytes())>
<!--- finally convert it to hex --->
<cfset result.encryptedTextJava = BinaryEncode(encryptedTextFromJava, "HEX")>

<cfdump var="#result#">