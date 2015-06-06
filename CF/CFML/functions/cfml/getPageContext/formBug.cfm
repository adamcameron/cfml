 <cfif isDefined('form.submit')>
     <cfscript>
             GetPageContext().forward('test.cfm');
     </cfscript>
 </cfif>

 <form action="./formBug.cfm" name="form1" method="post" enctype="multipart/form-data">
             <input type="file">
     <input type="submit" name="submit" id="submit">
 </form>