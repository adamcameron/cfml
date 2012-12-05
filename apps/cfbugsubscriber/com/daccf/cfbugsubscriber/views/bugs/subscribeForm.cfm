<h2>Subscribe to a bug</h2>
<p>Enter a bug ID and - if I can find it on the bugbase - it will be added to your subscription list.</p>
<cfform method="post" action="#event.buildLink('bug.create')#">
	<label for="bug">Adobe Bug Id: <span class="required">*</span></label>
	<cfinput type="text" name="bug" value="" validate="regex" pattern="#prc.bugIdRegex#" required="true" message="#prc.validationMessages.badBugId#" />
	<input type="submit" name="btnSubmit" value="Subscribe &raquo;" />
</cfform>