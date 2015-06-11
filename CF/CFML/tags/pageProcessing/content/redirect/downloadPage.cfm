<!--- downloadPage.cfm --->
<!--- This is the page that generates the Word document, saving it as /worddata.txt--->
<cfheader name="content-disposition" value="attachment;filename=#createUUID()#.doc">
<cfcontent type="application/msword" file="C:\JRun4\servers\cfusion_shado7\cfusion-ear\cfusion-war\junk\tests\cfcontent\redirect\worddata.txt">