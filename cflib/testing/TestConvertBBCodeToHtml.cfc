// TestConvertBBCodeToHtml.cfc
component extends="testbox.system.BaseSpec" {

	function run(){
		include "udfs/convertBBCodeToHtml.cfm";

		describe("Tests for convertBBCodeToHtml()", function(){
			it("is handles an empty string", function(){
				expect(
					convertBBCodeToHtml("")
				).toBe("");
			});
			it("handles an isolated substitution", function(){
				expect(
					convertBBCodeToHtml("[i]italicised[/i]")
				).toBe("<i>italicised</i>");
			});
			it("handles multiple same substitutions", function(){
				expect(
					convertBBCodeToHtml("[i]italicised[/i][i]italicised again[/i]")
				).toBe("<i>italicised</i><i>italicised again</i>");
			});
			it("handles different substitutions", function(){
				expect(
					convertBBCodeToHtml("[i]italicised[/i][b]bold[/b]")
				).toBe("<i>italicised</i><strong>bold</strong>");
			});
			it("handles leading, embedded and trailing text", function(){
				expect(
					convertBBCodeToHtml("text before[code]code[/code]text between[quote]quote[/quote]text after")
				).toBe('text before<pre>code</pre>text between<blockquote><p>"quote"</p></blockquote>text after');
			});
			it("handles complex substitution", function(){
				expect(
					convertBBCodeToHtml("[list][*] item 1[*] item 2[/list]")
				).toMatch("\s*<ul>\s*<li>\s*item 1</li>\s*<li>\s*item 2</li></ul>\s*");
			});
			it("handles multi-line substitution", function(){
				expect(
					convertBBCodeToHtml("
						[list]
							[*] item 1
							[*] item 2
						[/list]
					")
				).toMatch("\s*<ul>\s*<li>\s*item 1\s*</li>\s*<li>\s*item 2\s*</li></ul>\s*");
			});
			it("handles custom substitution", function(){
				expect(
					convertBBCodeToHtml("[foo]moo[/foo]", [{match="\[foo\](.*?)\[\/foo\]",replace="<foo>\1</foo>"}])
				).toMatch("<foo>moo</foo>");
			});
		});
	}

}