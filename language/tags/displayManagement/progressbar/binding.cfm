

<cfprogressbar name="pb1" bind="cfc:shared.cf.cfml.P.progressbar.Progressbar.getStatus()" interval="200" width="500" />

<input type="button" name="btn1" id="btn1" value="Go!" onclick="ColdFusion.ProgressBar.start('pb1')" />
