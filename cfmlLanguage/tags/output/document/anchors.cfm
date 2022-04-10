 <cfdocument format="pdf">
 <html>
 <head><title>Anchor test</title></head>
 <body>
 <a name="page1"></a>
 <h2>This is Page 1</h2>
 <br>
 Goto <a href="#page2">Page 2</a><br>
 Goto <a href="#page3">Page 3</a>
 <cfdocumentitem type="pagebreak" />


 <a name="page2"></a>
 <h2>This is Page 2</h2>
 <br>
 Goto <a href="#page1">Page 1</a><br>
 Goto <a href="#page3">Page 3</a>
 <cfdocumentitem type="pagebreak" />


 <a name="page3"></a>
 <h2>This is Page 3</h2>
 <br>
 Goto <a href="#page1">Page 1</a><br>
 Goto <a href="#page2">Page 2</a>
 </body>
 </html>
 </cfdocument>