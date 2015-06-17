<cfcontent type="application/pdf">
<cfheader name="Content-Disposition" value="attachment;filename=test.pdf">
<cfprocessingdirective pageencoding="utf-8">
<cfdocument format="PDF" localurl="yes" marginTop=".25" marginLeft=".25" marginRight=".25" marginBottom=".25" pageType="custom" pageWidth="8.5" pageHeight="10.2">
    <cfoutput>
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>PDF Export Example</title>
                <style>
                    body { font-family: Verdana; }
                </style>
            </head>
            <body>
                <h1>PDF Export Example</h1>
                <p>??????????????????????????????????????????????????</p>
                <h1>PDF Export English Example</h1>
                <p>This is an example.</p>
            </body>
        </html>
    </cfoutput>
</cfdocument>