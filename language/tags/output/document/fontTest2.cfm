 <cfdocument
 	backgroundvisible = "yes"
 	encryption = "none"
 	format = "PDF"
 	name = "myPdf"
 	fontembed = "yes"
 	marginbottom = "0.25"
 	marginleft = "0.25"
 	marginright = "0.25"
 	margintop = "0.25"
 	overwrite="Yes">
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html>
 <head>
 	<title></title>
 </head>

 <body>
 <span style="font-family:ShelleyAllegro BT; font-size:42px;">
 	this text displays as times new roman
 </span>
 </body>
 </html>
 </cfdocument>
<cfcontent type="application/pdf" reset="true" variable="#toBinary(myPdf)#">