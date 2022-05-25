<cfscript>
    include "./tinyTestFramework.cfm";

    // tests
    void function run() {
        describe("Tests of TinyTestFramework", () => {
            describe("Tests of runTests", () => {
                it("wraps the output in a div that enables styling to work", () => {
                    variables.run = () => {
                        writeOutput("TEST_RESULTS")
                    }
                    savecontent variable="output" {
                        tinyTest.runTests()
                    }
                    expect(output).toBe('<div class="tinyTest">TEST_RESULTS<div>Results: [Pass: 0] [Fail: 0] [Error: 0]</div></div>')
                })
            })

            describe("Tests of it", () => {
                it("prefixes its message with ""It""", () => {
                    savecontent variable="message" {
                        it("IS A TEST MESSAGE", () => {})
                    }
                    tinyTest.results.pass--
                    expect(message).toInclude("It IS A TEST MESSAGE")
                })
            })

            describe("Tests of expect", () => {
                it("exists", () => {
                    expect("NOT_TESTED")
                })

                it("returns a struct with keys for matcher callbacks", () => {
                    var result = expect("NOT_TESTED")
                    if (isNull(result) || isNull(result.toBe) || !isCustomFunction(local.result.toBe)) {
                        throw(type="TinyTest.TestFailedException")
                    }
                })
            })

            describe("Tests of fail", () => {
                it("fails a test", (type) => {
                    try {
                        fail()
                    } catch (TinyTest.FailureException e) {
                        // OK
                    } catch (any e) {
                        throw(type="TinyTest.TestFailedException")
                    }
                })
            })

            describe("Test of test result visualisations", () => {
                it("specifies that a pass should have positive emphasis",  () => {
                    savecontent variable="message" {
                        it("is a passing test", () => {
                            expect(true).toBeTrue()
                        })
                    }
                    expect(message).toInclude('is a passing test: <span class="pass">OK</span>')
                })
                it("specifies that a fail should have negative emphasis",  () => {
                    savecontent variable="message" {
                        it("is a failing test", () => {
                            expect(false).toBeTrue()
                        })
                    }
                    expect(message).toInclude('is a failing test: <span class="fail"><em>Failed</em></span>')
                })
                it("specifies that an error should have more emphasis than a fail",  () => {
                    savecontent variable="message" {
                        it("is an erroring test", () => {
                            throw(type="", message="TEST_EXCEPTION", detail="TEST_EXCEPTION_DETAIL")
                        })
                    }
                    expect(message).toInclude('is an erroring test: <span class="error"><strong>Error: [TEST_EXCEPTION][TEST_EXCEPTION_DETAIL]</strong></span>')
                })
                tinyTest.results.pass--
                tinyTest.results.fail--
                tinyTest.results.error--
            })

            describe("Tests of matchers", () => {
                describe("Tests of toBe", () => {
                    it("passes if the actual and expected values are equal", () => {
                        var actual = "TEST_VALUE"
                        var expected = "TEST_VALUE"

                        result = expect(actual).toBe(expected)
                        if (isNull(result) || !result) {
                            throw(type="TinyTest.TestFailedException")
                        }
                    })

                    it("fails if the actual and expected values are not equal", () => {
                        var actual = "ACTUAL_VALUE"
                        var expected = "EXPECTED_VALUE"

                        try {
                            expect(actual).toBe(expected)
                        } catch (TinyTest.TestFailedException e) {
                            return
                        }
                        throw(type="TinyTest.TestFailedException")
                    })

                    var types = ["string", 0, 0.0, true, ["array"], {struct="struct"}, queryNew("")]
                    types.each((type) => {
                        it("expects #type.getClass().getName()# to work with toBe", (type) => {
                            expect(type).toBe(type)
                        })
                    })

                    describe("Tests of notToBe", () => {
                        it("passes if the actual and expected values are not equal", () => {
                            var actual = "ACTUAL_VALUE"
                            var expected = "EXPECTED_VALUE"

                            expect(actual).notToBe(expected)
                        })

                        it("fails if the actual and expected values are equal", () => {
                            var actual = "TEST_VALUE"
                            var expected = "TEST_VALUE"

                            try {
                                expect(actual).notToBe(expected)
                            } catch (TinyTest.TestFailedException e) {
                                // OK
                            } catch (any e) {
                                fail()
                            }
                        })

                        var types = ["string", 0, 0.0, true, ["array"], {struct="struct"}, queryNew("")]
                        types.each((type) => {
                            it("expects #type.getClass().getName()# to work with notToBe", (type) => {
                                try {
                                    expect(type).notToBe(type)
                                } catch (TinyTest.TestFailedException e) {
                                    // OK
                                } catch (any e) {
                                    fail()
                                }
                            })
                        })
                    })
                })

                describe("Tests of toBeTrue", () => {
                    it("passes if the value is true", (type) => {
                        expect(true).toBeTrue()
                    })

                    it("fails if the value is false", (type) => {
                        try {
                            expect(false).toBeTrue()
                        } catch (TinyTest.TestFailedException e) {
                            // OK
                        } catch (any e) {
                            fail()
                        }
                    })
                    describe("Tests of notToBeTrue", () => {
                        it("passes if the value is not true", () => {
                            expect(false).notToBeTrue()
                        })

                        it("fails if the value is true", () => {
                            try {
                                expect(true).notToBeTrue()
                            } catch (TinyTest.TestFailedException e) {
                                // OK
                            } catch (any e) {
                                fail()
                            }
                        })
                    })
                })

                describe("Tests of toBeFalse", () => {
                    it("passes if the value is false", (type) => {
                        expect(false).toBeFalse()
                    })

                    it("fails if the value is true", (type) => {
                        try {
                            expect(true).toBeFalse()
                        } catch (TinyTest.TestFailedException e) {
                            // OK
                        } catch (any e) {
                            fail()
                        }
                    })

                    describe("Tests of notToBeFalse", () => {
                        it("passes if the value is not false", () => {
                            expect(true).notToBeFalse()
                        })

                        it("fails if the value is false", () => {
                            try {
                                expect(false).notToBeFalse()
                            } catch (TinyTest.TestFailedException e) {
                                // OK
                            } catch (any e) {
                                fail()
                            }
                        })
                    })
                })

                describe("Tests of toThrow", () => {
                    it("expects an exception to be thrown from its callback argument", (type) => {
                        expect(() => {
                            throw(type="ExpectedTestException")
                        }).toThrow()
                    })

                    it("fails if an exception is not thrown from its callback argument", (type) => {
                        try {
                            expect(() => {
                                // NOP
                            }).toThrow()
                        } catch (TinyTest.TestFailedException e) {
                            // OK
                        } catch (any e) {
                            fail()
                        }
                    })
                    describe("Tests of notToThrow", () => {
                        it("passes if the callback does not throw an exception", () => {
                            expect(() => {}).notToThrow()
                        })

                        it("fails if the callback does throw an exception", () => {
                            try {
                                expect(() => {
                                    throw(type="ExpectedTestException")
                                }).notToThrow()
                                fail()
                            } catch (TinyTest.TestFailedException e) {
                                // OK
                            } catch (any e) {
                                fail()
                            }

                        })
                    })
                })

                describe("Tests of toBeNull", () => {
                    var getNull = () => {}

                    it("passes if the value is null", () => {
                        expect(getNull()).toBeNull()
                    })

                    it("fails if the value is not null", () => {
                        try {
                            expect("NOT_NULL").toBeNull()
                        } catch (TinyTest.TestFailedException e) {
                            // OK
                        } catch (any e) {
                            fail()
                        }
                    })
                    describe("Tests of notToBeNull", () => {
                        it("passes if the value is not null", () => {
                            expect("NOT_NULL").notToBeNull()
                        })

                        it("fails if the value is null", () => {
                            try {
                                expect(getNull()).notToBeNull()
                            } catch (TinyTest.TestFailedException e) {
                                // OK
                            } catch (any e) {
                                fail()
                            }
                        })
                    })
                })

                describe("Tests of toInclude", () => {
                    it("passes if the haystack contains the needle", () => {
                        expect("my string").toInclude("string")
                    })

                    it("passes if the haystack and needle exactly match", () => {
                        expect("my string").toInclude("my string")
                    })

                    it("ignores case", () => {
                        expect("my string").toInclude("MY STRING")
                    })

                    it("fails if the haystack does not contain the needle", () => {
                        try {
                            expect("my string").toInclude("integer")
                        } catch (TinyTest.TestFailedException e) {
                            // OK
                        } catch (any e) {
                            fail()
                        }
                    })

                    describe("Tests of notToInclude", () => {
                        it("passes if a haystack does not contains the needle", () => {
                            expect("my string").notToInclude("different string")
                        })

                        it("fails if the haystack contains the needle", () => {
                            try {
                               expect("my string").notToInclude("string")
                            } catch (TinyTest.TestFailedException e) {
                                // OK
                            } catch (any e) {
                                fail()
                            }
                        })
                    })
                })

                describe("Tests of toHaveKey", () => {
                    describe("Works with structs", () => {
                        var testCaseValues = [
                            "Normal structs" = [
                                populated = {key="value"},
                                empty = {}
                            ],
                            "Ordered structs" = [
                                populated = [key="value"],
                                empty = [=]
                            ]
                        ]

                        testCaseValues.each((suite, caseValues) => {
                            describe(suite, () => {
                                it("passes if the struct contains the key", () => {
                                    expect(caseValues.populated).toHaveKey("key")
                                })

                                it("fails if the struct does not contain the key", () => {
                                    try {
                                        expect(caseValues.populated).toHaveKey("differentKey")
                                    } catch (TinyTest.TestFailedException e) {
                                        // OK
                                    } catch (any e) {
                                        fail()
                                    }
                                })

                                it("works with an empty struct", () => {
                                    try {
                                        expect(caseValues.empty).toHaveKey("key")
                                    } catch (TinyTest.TestFailedException e) {
                                        // OK
                                    } catch (any e) {
                                        fail()
                                    }
                                })

                                describe("Tests of notToHaveKey", () => {
                                    it("passes if a struct does not contains the key", () => {
                                        expect(caseValues.populated).notToHaveKey("differentKey")
                                    })

                                    it("fails if the struct contains the key", () => {
                                        try {
                                           expect(caseValues.populated).notToHaveKey("key")
                                        } catch (TinyTest.TestFailedException e) {
                                            // OK
                                        } catch (any e) {
                                            fail()
                                        }
                                    })
                                })
                            })
                        })
                    })
                })

                describe("Tests of toHaveLength", () =>{
                    describe("With structs", () => {
                        var testCaseValues = [
                            "Normal structs" = {"one"=1, "two"=2, "three"=3},
                            "Ordered structs" = ["one"=1, "two"=2, "three"=3]
                        ]
                        testCaseValues.each((suite, testStruct) => {
                            describe(suite, () => {

                                it("passes if the struct has the expected key count", () => {
                                    expect(testStruct).toHaveLength(testStruct.count())
                                })

                                it("fails if the struct does not have the expected key count", () => {
                                    try {
                                        expect(testStruct).toHaveLength(testStruct.count() + 1)
                                    } catch (TinyTest.TestFailedException e) {
                                        // OK
                                    } catch (any e) {
                                        fail()
                                    }
                                })

                                describe("Tests of notToHaveLength", () => {
                                    it("passes if the struct does not have the specified key count", () => {
                                        expect(testStruct).notToHaveLength(testStruct.count() + 1)
                                    })

                                    it("fails if the struct has the specified key count", () => {
                                        try {
                                           expect(testStruct).notToHaveLength(testStruct.count())
                                        } catch (TinyTest.TestFailedException e) {
                                            // OK
                                        } catch (any e) {
                                            fail()
                                        }
                                    })
                                })
                            })
                        })
                    })

                    describe("With arrays", () => {
                        it("passes if the array has the expected length", () => {
                            expect(["one", "two", "three"]).toHaveLength(3)
                        })

                        it("fails if the array does not have the expected length", () => {
                            try {
                                expect(["one", "two", "three"]).toHaveLength(4)
                            } catch (TinyTest.TestFailedException e) {
                                // OK
                            } catch (any e) {
                                fail()
                            }
                        })
                        describe("Tests of notToHaveLength", () => {
                            it("passes if the array does not have the specified length", () => {
                                expect(["one", "two", "three"]).notToHaveLength(4)
                            })

                            it("fails if the array has the specified length", () => {
                                try {
                                   expect(["one", "two", "three"]).notToHaveLength(3)
                                } catch (TinyTest.TestFailedException e) {
                                    // OK
                                } catch (any e) {
                                    fail()
                                }
                            })
                        })
                    })

                    describe("With strings", () => {
                        it("passes if the string has the expected length", () => {
                            expect("string").toHaveLength(6)
                        })

                        it("fails if the string does not have the expected length", () => {
                            try {
                                expect("string").toHaveLength(5)
                            } catch (TinyTest.TestFailedException e) {
                                // OK
                            } catch (any e) {
                                fail()
                            }
                        })
                        describe("Tests of notToHaveLength", () => {
                            it("passes if the string does not have the specified length", () => {
                                expect("string").notToHaveLength(5)
                            })

                            it("fails if the string has the specified length", () => {
                                try {
                                   expect("string").notToHaveLength(6)
                                } catch (TinyTest.TestFailedException e) {
                                    // OK
                                } catch (any e) {
                                    fail()
                                }
                            })
                        })
                    })

                    describe("With queries", () => {
                        it("passes if the query has the expected recordCount", () => {
                            expect(queryNew("id", "integer", [[1],[2],[3]])).toHaveLength(3)
                        })

                        it("works if the query has no rows or columns at all", () => {
                            expect(queryNew("")).toHaveLength(0)
                        })

                        it("fails if the query does not have the expected recordCount", () => {
                            try {
                                expect(queryNew("id", "integer", [[1],[2],[3]])).toHaveLength(4)
                            } catch (TinyTest.TestFailedException e) {
                                // OK
                            } catch (any e) {
                                fail()
                            }
                        })

                        describe("Tests of notToHaveLength", () => {
                            it("passes if the query does not have the specified recordCount", () => {
                                expect(queryNew("id", "integer", [[1],[2],[3]])).notToHaveLength(4)
                            })

                            it("works if the query has no rows or columns at all", () => {
                                expect(queryNew("")).notToHaveLength(1)
                            })

                            it("fails if the query has the specified recordCount", () => {
                                try {
                                   expect(queryNew("id", "integer", [[1],[2],[3]])).notToHaveLength(3)
                                } catch (TinyTest.TestFailedException e) {
                                    // OK
                                } catch (any e) {
                                    fail()
                                }
                            })
                        })
                    })

                    describe("With unsupported types", () => {
                        it("throws a TinyTest.UnsupportedTypeException if the object cannot be length-checked", () => {
                            try {
                                expect(queryNew("")).toHaveLength(0)
                            } catch (TinyTest.UnsupportedTypeException e) {
                                // OK
                            } catch (any e) {
                                fail()
                            }
                        })
                        describe("Tests of notToHaveLength", () => {
                            it("throws a TinyTest.UnsupportedTypeException if the object cannot be length-checked", () => {
                                try {
                                   expect(queryNew("")).notToHaveLength(1)
                                } catch (TinyTest.UnsupportedTypeException e) {
                                    // OK
                                } catch (any e) {
                                    fail()
                                }
                            })
                        })
                    })
                })
            })
        })
    }

    tinyTest.runTests()
</cfscript>
