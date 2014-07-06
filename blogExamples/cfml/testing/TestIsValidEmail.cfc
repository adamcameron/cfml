// TestConvertBBCodeToHtml.cfc
component extends="testbox.system.BaseSpec" {

	pageencoding "UTF-8";

	function run(){
		describe("Tests for isValid('email')", function(){
			describe("Basic testing", function(){
				it("accepts a simple email address", function(){
					expect(
						isValid("email", "example@example.com")
					).toBeTrue();
				});
				it("rejects an empty string", function(){
					expect(
						isValid("email", "")
					).toBeFalse();
				});
				it("rejects a missing local part", function(){
					expect(
						isValid("email", "@example.com")
					).toBeFalse();
				});
				it("rejects a missing domain part", function(){
					expect(
						isValid("email", "example@")
					).toBeFalse();
				});
				it("rejects missing local and domain parts", function(){
					expect(
						isValid("email", "@")
					).toBeFalse();
				});
				it("rejects missing separator", function(){
					expect(
						isValid("email", "exampleexample.com")
					).toBeFalse();
				});
				it("rejects address that is longer than 253 characters", function(){
					var testAddress = repeatString("A", 60) & "@" & repeatString("B", 200) & ".com"; // both local and domain separately are legal lengths
					expect(
						isValid("email", testAddress)
					).toBeFalse();
				});
			});
			describe("Tests for domain part (as per https://en.wikipedia.org/wiki/Email_address##Domain_part and https://en.wikipedia.org/wiki/Hostname)", function(){
				it("accepts a single domain element", function(){
					expect(
						isValid("email", "example@localhost")
					).toBeTrue();
				});
				it("accepts a multipe domain elements", function(){
					expect(
						isValid("email", "example@subdomain.example.com")
					).toBeTrue();
				});
				it("accepts a numeric host name", function(){
					expect(
						isValid("email", "example@127.0.0.1")
					).toBeTrue();
				});
				it("accepts a literal numeric host name", function(){
					expect(
						isValid("email", "example@[127.0.0.1]")
					).toBeTrue();
				});
				it("accepts a dash in the host name", function(){
					expect(
						isValid("email", "example@sub-domain.example.com")
					).toBeTrue();
				});
				it("rejects an underscore in the host name", function(){
					expect(
						isValid("email", "example@sub_domain.example.com")
					).toBeFalse();
				});
				it("accepts an non-ascii in the host name", function(){
					expect(
						isValid("email", "example@ουτοπία.δπθ.gr")	// from https://en.wikipedia.org/wiki/Internationalized_domain_name
					).toBeTrue();
				});
				it("accepts a leading comment in the host name", function(){
					expect(
						isValid("email", "example@(comment)example.com")
					).toBeTrue();
				});
				it("accepts a trailing comment in the host name", function(){
					expect(
						isValid("email", "example@example.com(comment)")
					).toBeTrue();
				});
				it("accepts an embedded comment in the host name", function(){
					expect(
						isValid("email", "example@exa(comment)mple.com")
					).toBeTrue();
				});
				it("rejects whitespace in the host name", function(){
					expect(
						isValid("email", "example@exa mple.com")
					).toBeFalse();
				});
				it("rejects trailing dot in the host name", function(){
					expect(
						isValid("email", "example@example.")
					).toBeFalse();
				});
				it("rejects leading dot in the host name", function(){
					expect(
						isValid("email", "example@.example.com")
					).toBeFalse();
				});
				it("rejects initial leading hyphen in the host name", function(){
					expect(
						isValid("email", "example@-example.com")
					).toBeFalse();
				});
				it("rejects final trailing hyphen in the host name", function(){
					expect(
						isValid("email", "example@example.com-")
					).toBeFalse();
				});
				it("rejects embedded leading hyphen in the host name", function(){
					expect(
						isValid("email", "example@example-.com")
					).toBeFalse();
				});
				it("rejects embedded trailing hyphen in the host name", function(){
					expect(
						isValid("email", "example@example.-com")
					).toBeFalse();
				});
				it("accepts initial leading digit in the host name", function(){
					expect(
						isValid("email", "example@9example.com")
					).toBeTrue();
				});
				it("accepts final trailing digit in the host name", function(){
					expect(
						isValid("email", "example@example.com9")
					).toBeTrue();
				});
				it("accepts embedded leading digit in the host name", function(){
					expect(
						isValid("email", "example@example9.com")
					).toBeTrue();
				});
				it("accepts embedded trailing digit in the host name", function(){
					expect(
						isValid("email", "example@example.9com")
					).toBeTrue();
				});
				describe("Length", function(){
					it("rejects a domain name longer than 253 characters", function(){
						var domainName = repeatString("a", 250) & ".com"; //so that's 254
						expect(
							isValid("email", "example@domainName")
						).toBeFalse();
					});
					it("rejects a subdomain part longer than 63 characters", function(){
						var subdomainPart = repeatString("a", 64) & ".com";
						expect(
							isValid("email", "example@subdomainPart")
						).toBeFalse();
					});
				});
			});
			describe("Tests for local part (as per https://en.wikipedia.org/wiki/Email_address)", function(){
				describe("Tests for ASCII letters", function(){
					it("accepts uppercase", function(){
						expect(
							isValid("email", "EXAMPLE@example.com")
						).toBeTrue();
					});
					it("accepts lowercase", function(){
						expect(
							isValid("email", "example@example.com")
						).toBeTrue();
					});
					it("accepts mixed-case", function(){
						expect(
							isValid("email", "exampleEXAMPLE@example.com")
						).toBeTrue();
					});
				});
				describe("Tests for valid non-ASCII letters", function(){
					var testAddresss = "παράδειγμα@example.com";
					it("accepts UTF-8-encoded characters: [#testAddresss#]", function(){
						expect(
							isValid("email", testAddresss)
						).toBeTrue();
					});
				});
				describe("Tests for other valid ASCII characters", function(){
					for (var char in ["!", "##", "$", "%", "&", "'", "*", "+", "-", "/", "=", "?", "^", "_", "`", "{", "|", "}", "~"]){
						var testAddress = "example#char#example@example.com";
						it("accepts #char#: [#testAddress#]", function(){
							expect(
								isValid("email", testAddress)
							).toBeTrue();
						});
					}
					it("accepts embedded dots", function(){
						expect(
							isValid("email", "example.example@example.com")
						).toBeTrue();
					});
					it("rejects leading dots", function(){
						expect(
							isValid("email", ".example@example.com")
						).toBefalse();
					});
					it("rejects trailing dots", function(){
						expect(
							isValid("email", "example.@example.com")
						).toBefalse();
					});
					it("rejects consecutive dots", function(){
						expect(
							isValid("email", "example..example@example.com")
						).toBefalse();
					});
					it("accepts leading comment", function(){
						expect(
							isValid("email", "(comment)example@example.com")
						).toBeTrue();
					});
					it("accepts embedded comment", function(){
						expect(
							isValid("email", "example(comment)example@example.com")
						).toBeTrue();
					});
					it("accepts trailing comment", function(){
						expect(
							isValid("email", "example(comment)@example.com")
						).toBeTrue();
					});
				});
				describe("Tests for invalid ASCII characters", function(){
					for (var char in [" ", "(", ")", ",", ":", ";", "<", ">", "@", "[", "]"]){
						var testAddress = "example#char#example@example.com";
						it("rejects [#char#]: [#testAddress#]", function(){
							expect(
								isValid("email", testAddress)
							).toBeFalse();
						});
						testAddress = '"example#char#example"@example.com';
						it("accepts [#char#] when quoted: [#testAddress#]", function(){
							expect(
								isValid("email", testAddress)
							).toBeTrue();
						});
					}
					for (var char in ['"', "\"]){
						var testAddress = '"example\#char#example"@example.com';
						it("accepts [#char#] when quoted and escaped: [#testAddress#]", function(){
							expect(
								isValid("email", testAddress)
							).toBeTrue();
						});
						testAddress = '"example#char#example"@example.com';
						it("rejects [#char#] when only quoted: [#testAddress#]", function(){
							expect(
								isValid("email", testAddress)
							).toBeFalse();
						});
						testAddress = 'example\#char#example@example.com';
						it("rejects [#char#] when only escaped: [#testAddress#]", function(){
							expect(
								isValid("email", testAddress)
							).toBeFalse();
						});
					}
					var charsTestedSeparately = ["!", "##", "$", "%", "&", "'", "*", "+", "-", "/", "=", "?", "^", "_", "`", "{", "|", "}", "~", " ", "(", ")", ",", ":", ";", "<", ">", "@", "[", "]", '"', "\"];
					for (var i=1; i <=127; i++){  // CFML just doesn't accept chr(0) in strings, so cannot test
						char = chr(i);
						if (
							(i >= 65 && i <= 90)	// A-Z
							||
							(i >= 97 && i <= 122)	// a-z
							||
							(i >= 48 && i <= 57)	// 0-9
							||
							arrayContains(charsTestedSeparately, char)
						){
							continue;
						}
						testAddress = '"example\#char#example"@example.com';
						it("rejects [ASCII #asc(char)#] even when quoted and escaped: [#encodeForHtml(testAddress)#]", function(){
							expect(
								isValid("email", testAddress)
							).toBeFalse();
						});
					}
				});
				describe("Tests for digits", function(){
					it("accepts only digits", function(){
						expect(
							isValid("email", "1@example.com")
						).toBeTrue();
					});
					it("accepts leading digit", function(){
						expect(
							isValid("email", "1example@example.com")
						).toBeTrue();
					});
					it("accepts trailing digit", function(){
						expect(
							isValid("email", "example1@example.com")
						).toBeTrue();
					});
				});
				describe("Length", function(){
					it("rejects a local part longer than 64 characters", function(){
						expect(
							isValid("email", "12345678901234567890123456789012345678901234567890123456789012345@example.com")
						).toBeFalse();
					});
				});
			});
		});
	}
}
