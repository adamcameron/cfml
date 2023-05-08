<style>
    .tinytest {background-color: black; color:white; font-family:monospace}
    .tinytest div {margin-left: 1em}
    .tinyTest .pass {color:green;}
    .tinyTest .fail {color:red;}
    .tinyTest .error {background-color:red; color:black}
</style>

<cfscript>
tinyTest = {
    results = {
        pass = 0,
        fail = 0,
        error = 0
    },
    runTests = () => {
        writeOutput('<div class="tinyTest">')
        
        try {
            run()
        } finally {
            tinyTest.handlers.keyExists("afterAllHandler") ? tinyTest.handlers.afterAllHandler() : false
        }
        tinyTest.showResults()
        writeOutput('</div>')
    },
    showResults = () => {
        savecontent variable="local.results" {
            writeOutput("<div>Results:")
            writeOutput(" [Pass: #tinyTest.results.pass#]")
            writeOutput(" [Fail: #tinyTest.results.fail#]")
            writeOutput(" [Error: #tinyTest.results.error#]")
            writeOutput(" [Total: #tinyTest.results.pass + tinyTest.results.fail + tinyTest.results.error#]")
            writeOutput("</div>")
        }
        writeOutput(local.results)
    },
    contexts = [],
    handlers = {},
    describe = (string label, function testGroup) => {
        tinyTest.handlers.keyExists("beforeAllHandler") ? tinyTest.handlers.beforeAllHandler() : false

        tinyTest.inDiv(() => {
            try {
                writeOutput("#label#<br>")
                tinyTest.contexts.push({})
                testGroup()
               
            } catch (any e) {
                writeOutput("Error: #e.message#<br>")
            } finally {
                tinyTest.contexts.pop()
            }
        })
    },
    beforeEach = (callback) => {
        tinyTest.contexts.last().beforeEachHandler = callback
    },
    afterEach = (callback) => {
        tinyTest.contexts.last().afterEachHandler = callback
    },
    aroundEach = (callback) => {
        tinyTest.contexts.last().aroundEachHandler = callback
    },
    beforeAll = (callback) => {
        tinyTest.handlers.beforeAllHandler = () => {
            callback()
            structDelete(tinyTest.handlers, "beforeAllHandler")
        }
    },
    afterAll = (callback) => {
        tinyTest.handlers.afterAllHandler = callback
    },
    it = (string label, function implementation) => {
        tinyTest.inDiv(() => {
            try {
                writeOutput("It #label#: ")
    
                tinyTest.contexts
                    .filter((context) => context.keyExists("beforeEachHandler"))
                    .each((context) => context.beforeEachHandler())
    
                decoratedImplementation = tinyTest.contexts
                    .filter((context) => context.keyExists("aroundEachHandler"))
                    .reduce((reversed, context) => reversed.prepend(context), [])
                    .reduce((decorated, context) => () => context.aroundEachHandler(decorated), () => {
                        try {
                            implementation()
                            tinyTest.testResult = true
                        } catch (any e) {
                            tinyTest.testResult = e
                        }                            
                    })
                    
                try {    
                    decoratedImplementation()
                    if (!tinyTest.testResult.equals(true)) {
                        throw(object=tinyTest.testResult)
                    }
                } finally {
                    tinyTest.contexts
                        .filter((context) => context.keyExists("afterEachHandler"))
                        .reduce((reversedContexts, context) => reversedContexts.prepend(context), [])
                        .each((context) => context.afterEachHandler())
                }

                tinyTest.handlePass()
            } catch (TinyTest e) {
                tinyTest.handleFail(e)
            } catch (any e) {
                tinyTest.handleError(e)
            }
        })
    },
    expect = (any actual) => {
        var proxy.actual = arguments?.actual
        return {
            toBe = (expected) => tinyTest.matchers.toBe(expected, actual),
            toBeTrue = () => tinyTest.matchers.toBe(true, actual),
            toBeFalse = () => tinyTest.matchers.toBe(false, actual),
            toBeNull = () => tinyTest.matchers.toBeNull(proxy?.actual),
            toThrow = () => tinyTest.matchers.toThrow(actual),
            toInclude = (needle) => tinyTest.matchers.toInclude(needle, actual),
            toHaveKey = (key) => tinyTest.matchers.toHaveKey(key, actual),
            toHaveLength = (length) => tinyTest.matchers.toHaveLength(length, actual),
            notToBe = (expected) => tinyTest.matchers.not((expected) => tinyTest.matchers.toBe(expected, actual)),
            notToBeTrue = (expected) => tinyTest.matchers.not((expected) => tinyTest.matchers.toBe(true, actual)),
            notToBeFalse = (expected) => tinyTest.matchers.not((expected) => tinyTest.matchers.toBe(false, actual)),
            notToBeNull = () => tinyTest.matchers.not(() => tinyTest.matchers.toBeNull(proxy?.actual)),
            notToThrow = () => tinyTest.matchers.not(() => tinyTest.matchers.toThrow(actual)),
            notToInclude = (needle) => tinyTest.matchers.not((needle) => tinyTest.matchers.toInclude(needle, actual)),
            notToHaveKey = (key) => tinyTest.matchers.not((key) => tinyTest.matchers.toHaveKey(key, actual)),
            notToHaveLength = (length) => tinyTest.matchers.not((length) => tinyTest.matchers.toHaveLength(length, actual))
        }
    },
    fail = () => {
        throw(type="TinyTest.FailureException")
    },
    matchers = {
        toBe = (expected, actual) => {
            if (actual.equals(expected)) {
                return true
            }
            throw(type="TinyTest.TestFailedException", message="Actual: [#serializeJson(actual)#] did not equal expected: [#serializeJson(expected)#]")
        },
        toBeNull = (actual) => {
            if (isNull(actual)) {
                return true
            }
            throw(type="TinyTest.TestFailedException")
        },
        toThrow = (callback) => {
            try {
                callback()
                throw(type="TinyTest.TestFailedException")
            } catch (TinyTest.TestFailedException e) {
                rethrow
            } catch (any e) {
                return true
            }
        },
        toInclude = (needle, haystack) => {
            return tinyTest.matchers.toBe(true, haystack.findNoCase(needle) > 0)
        },
        toHaveKey = (key, struct) => {
            return tinyTest.matchers.toBe(true, struct.keyExists(key))
        },
        toHaveLength = (length, object) => {
            return tinyTest.matchers.toBe(true, tinyTest.resolveLength(object) == length)
        },
        "not" = (callback) => {
            try {
                callback()
                throw(type="TinyTest.NotTestFailedException")
            } catch (TinyTest.NotTestFailedException e) {
                throw(type="TinyTest.TestFailedException")
            } catch (TinyTest.TestFailedException e) {
                return true
            } catch (any e) {
                rethrow
            }
        }
    },
    resolveLength = (object) => {
        if (isStruct(object)) {
            return object.count()
        }
        if (isArray(object)) {
            return object.len()
        }
        if (isQuery(object)) {
            return object.recordCount
        }
        if (isSimpleValue(object)) {
            return object.toString().len()
        }
        throw(type="TinyTest.UnsupportedTypeException", message="Cannot resolve length of #object.getClass().getName()#")
    },
    inDiv = (callback)  => {
        writeOutput("<div>")
        callBack()
        writeOutput("</div>")
    },
    handlePass = () => {
        tinyTest.results.pass++
        writeOutput('<span class="pass">OK</span>')
    },
    handleFail = (e) => {
        tinyTest.results.fail++
        writeOutput('<span class="fail"><em>Failed</em>: #e.message#</span>')
    },
    handleError = (e) => {
        tinyTest.results.error++
        var message = "Error: [#e.message#][#e.detail#]"
        writeOutput('<span class="error"><strong>#message#</strong></span>')
    }
}
describe = tinyTest.describe
it = tinyTest.it
expect = tinyTest.expect
fail = tinyTest.fail
beforeEach = tinyTest.beforeEach
afterEach = tinyTest.afterEach
aroundEach = tinyTest.aroundEach
beforeAll = tinyTest.beforeAll
afterAll = tinyTest.afterAll
</cfscript>


<cfscript>
    // tests
    void function run() {
        beforeAll(() => {
            tinyTest.debug.setByBeforeAll = true
        })

        describe("Tests of TinyTestFramework", () => {
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
                            expect(false).toBe(true)
                        })
                    }
                    expect(message).toInclude('It is a failing test: <span class="fail"><em>Failed</em>: Actual: [false] did not equal expected: [true]</span>')
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

                    types.each((type) => {
                        it("returns an exception with a message describing the failure if the test fails (expected: #type.getClass().getName()#)", () => {
                            var actual = "ACTUAL_VALUE"
                            var expected = type

                            try {
                                expect(actual).toBe(expected)
                            } catch (TinyTest.TestFailedException e) {
                                return expect(e.message).toBe("Actual: [#serializeJson(actual)#] did not equal expected: [#serializeJson(expected)#]")
                            }
                            throw(type="TinyTest.TestFailedException")
                        })
                        it("returns an exception with a message describing the failure if the test fails (actual: #type.getClass().getName()#)", () => {
                            var actual = type
                            var expected = "EXPECTED_VALUE"

                            try {
                                expect(actual).toBe(expected)
                            } catch (TinyTest.TestFailedException e) {
                                return expect(e.message).toBe("Actual: [#serializeJson(actual)#] did not equal expected: [#serializeJson(expected)#]")
                            }
                            throw(type="TinyTest.TestFailedException")
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
      
            describe("Tests of beforeEach", () => {
                describe("Tests without beforeEach (top)", () => {
                    result = []
                    it("was called before any usage of beforeEach", () => {
                        result.append("test before any beforeEach implementation")
                        
                        expect(result).toBe([
                            "test before any beforeEach implementation"
                        ])
                    })
                })
                
                describe("Testing first level implementation", () => {
                    result = []
                    beforeEach(() => {
                        result.append("beforeEach")
                    })
                    
                    it("was called before the first test in the set", () => {
                        result.append("first test")
                        
                        expect(result).toBe([
                            "beforeEach",
                            "first test"
                        ])
                    })
                    
                    it("was called before the second test in the set", () => {
                        result.append("second test")
                        
                        expect(result).toBe([
                            "beforeEach",
                            "first test",
                            "beforeEach",
                            "second test"
                        ])
                    })
                })
                
                describe("Testing cascade from ancestor", () => {
                    result = []
                    beforeEach(() => {
                        result.append("beforeEach in ancestor")
                    })
                    describe("descendant of ancestor", () => {
                        it("was called even though it is in an ancestor describe block", () => {
                            result.append("test in descendant")
                            
                            expect(result).toBe([
                                "beforeEach in ancestor",
                                "test in descendant"
                            ])
                        })
                    })
                })

                describe("Multiple sequential handlers", () => {
                    beforeEach(() => {
                        result = []
                        result.append("beforeEach in outer")
                    })
                    
                    it("is at the top of the hierarchy before any describe", () => {
                        result.append("at the top of the hierarchy before any describe")
                        
                        expect(result).toBe([
                            "beforeEach in outer",
                            "at the top of the hierarchy before any describe"
                        ])
                    })
                    
                    describe("first descendant of ancestor", () => {
                        beforeEach(() => {
                            result.append("beforeEach in middle")
                        })
                
                        it("is a test in the middle of the hierarchy, before the inner describe", () => {
                            result.append("test before the inner describe")

                            expect(result).toBe([
                                "beforeEach in outer",
                                "beforeEach in middle",
                                "test before the inner describe"
                            ])
                        })

                        describe("inner descendant of ancestor", () => {
                            it("is a test in the bottom of the hierarchy, before the inner beforeEach", () => {
                                result.append("in the bottom of the hierarchy, before the inner beforeEach")
        
                                expect(result).toBe([
                                    "beforeEach in outer",
                                    "beforeEach in middle",
                                    "in the bottom of the hierarchy, before the inner beforeEach"
                                ])
                            })
                            beforeEach(() => {
                                result.append("beforeEach in inner")
                            })
                            it("calls each beforeEach handler in the hierarchy, from outermost to innermost", () => {
                                result.append("test in innermost descendant")
                
                                expect(result).toBe([
                                    "beforeEach in outer",
                                    "beforeEach in middle",
                                    "beforeEach in inner",
                                    "test in innermost descendant"
                                ])
                            })
                            it("is another innermost test", () => {
                                result.append("is another innermost test")
                
                                expect(result).toBe([
                                    "beforeEach in outer",
                                    "beforeEach in middle",
                                    "beforeEach in inner",
                                    "is another innermost test"
                                ])
                            })
                        })
                
                        it("is a test in the middle of the hierarchy, after the inner describe", () => {
                            result.append("test after the inner describe")

                            expect(result).toBe([
                                "beforeEach in outer",
                                "beforeEach in middle",
                                "test after the inner describe"
                            ])
                        })
                    })
                    
                    describe("A second describe in the middle tier of the hierarchy", () => {
                        beforeEach(() => {
                            result.append("beforeEach second middle describe")
                        })

                        it("is a test in the second describe in the middle tier of the hierarchy", () => {
                            result.append("in the second describe in the middle tier of the hierarchy")

                            expect(result).toBe([
                                "beforeEach in outer",
                                "beforeEach second middle describe",
                                "in the second describe in the middle tier of the hierarchy"
                            ])
                        })
                    })
                    
                    it("is at the top of the hierarchy after any describe", () => {
                        result.append("at the top of the hierarchy after any describe")
                        
                        expect(result).toBe([
                            "beforeEach in outer",
                            "at the top of the hierarchy after any describe"
                        ])
                    })
                })

                describe("Tests a stack with some describes without a beforeEach (top)", () => {
                    result = []
                    describe("Tests a stack with some describes without a beforeEach (middle 1)", () => {
                        beforeEach(() => {
                            result.append("beforeEach in second level of hierarchy")
                        })
                        describe("Tests a stack with some describes without a beforeEach (middle 2)", () => {
                            describe("Tests a stack with some describes without a beforeEach (inner)", () => {
                                it("ran the 'grandparent' beforeEach", () => {
                                    result.append("in the fourth tier of the hierarchy")
                                    expect(result).toBe([
                                        "beforeEach in second level of hierarchy",
                                        "in the fourth tier of the hierarchy"
                                    ])
                                })
                            })
                        })
                    })
                })

                describe("Tests without beforeEach (bottom)", () => {
                    result = []
                    it("was called after all other tests", () => {
                        result.append("test after any beforeEach implementation")

                        expect(result).toBe([
                            "test after any beforeEach implementation"
                        ])
                    })
                })
            })
            
            
            describe("Tests of afterEach", () => {
                it("will not break if an afterEach is not specified for a given describe block", () => {
                    expect(true).toBeTrue()
                })
                
                describe("Baseline", () => {
                    result = []
                    afterEach(() => { 
                        result.append("set in afterEach")
                    })
                    
                    it("runs after a test (setup)", () => {
                        expect(result).toBe([])
                    })
                    
                    it("runs after a test (test)", () => {
                        expect(result).toBe(["set in afterEach"])
                    })
                })
                
                describe("Works in a hierarchy (top)", () => {
                    result = []
            
                    afterEach(() => { 
                        result.append("set in afterEach in outer describe")
                    })
                    
                    describe("Works in a hierarchy (middle)", () => {
                        afterEach(() => { 
                            result.append("set in afterEach in middle describe")
                        })
                        
                        describe("Works in a hierarchy (inner)", () => {
                            afterEach(() => { 
                                result.append("set in afterEach in inner describe")
                            })
                            
                            it("runs all afterEach handlers, from innermost to outermost (setup)", () => {
                                expect(result).toBe([])
                            })
                            
                            it("runs all afterEach handlers, from innermost to outermost (test)", () => {
                                expect(result).toBe([
                                    "set in afterEach in inner describe",
                                    "set in afterEach in middle describe",
                                    "set in afterEach in outer describe"
                                ])
                            })
                        })
                    })
                })
                
                describe("Tests with beforeEach as well", () => {
                    result = []
                    
                    afterEach(() => {
                        result.append("set by afterEach")
                    })
            
                    beforeEach(() => {
                        result.append("set by beforeEach")
                    })
            
                    it("is the setup test", () => {
                        expect(true).toBeTrue()
                    })

                    it("tests that both beforeEach and afterEach got run", () => {
                        result.append("testing that the preceding setup test had its afterEach called")
            
                        expect(result).toBe([
                            "set by beforeEach", // setup test
                            "set by afterEach", // setup test
                            "set by beforeEach", // this test
                            "testing that the preceding setup test had its afterEach called"
                        ])
                    })
                })
                
                describe("Tests on a failing test", () => {
                    result = []
                    
                    afterEach(() => {
                        result.append("set by afterEach")
                    })
            
                    it("is the setup test (this is expected to fail, don't worry about it)", () => {
                        expect(true).toBeFalse()
                    })

                    it("tests that afterEach runs even if the test fails", () => {
                        result.append("testing that the preceding failing setup test had its afterEach called")
            
                        expect(result).toBe([
                            "set by afterEach", // setup test
                            "testing that the preceding failing setup test had its afterEach called"
                        ])
                    })
                })
                
                describe("Tests on an erroring test", () => {
                    result = []
                    
                    afterEach(() => {
                        result.append("set by afterEach")
                    })
            
                    it("is the setup test (this is expected to error, don't worry about it)", () => {
                        throw("forcing an error")
                    })

                    it("tests that afterEach runs even if the test errors", () => {
                        result.append("testing that the preceding erroring setup test had its afterEach called")
            
                        expect(result).toBe([
                            "set by afterEach", // setup test
                            "testing that the preceding erroring setup test had its afterEach called"
                        ])
                    })
                })
            })
            
            describe("Tests of aroundEach", () => {
                describe("Tests hierarchical sequencing", () => {
                    result = []
                    aroundEach((test) => {
                        result.append("aroundEach top level before test")
                        test()
                        result.append("aroundEach top level after test")
                    })
                    describe("Tests hierarchical sequencing (second level: no aroundEach in this one)", () => {
                        describe("Tests hierarchical sequencing (third level)", () => {
                            aroundEach((test) => {
                                result.append("aroundEach third level before test")
                                test()
                                result.append("aroundEach third level after test")
                            })
                            describe("Tests hierarchical sequencing (inner level)", () => {
                                aroundEach((test) => {
                                    result.append("aroundEach inner before test")
                                    test()
                                    result.append("aroundEach inner after test")
                                })
                                
                                it("is the baseline test", ()=> {
                                    expect(true).toBeTrue()
                                })

                                it("tests the aroundEach handlers are called in the correct order", ()=> {
                                    result.append("tests the aroundEach handlers are called in the correct order")
                                    
                                    expect(result).toBe([
                                        "aroundEach top level before test",
                                        "aroundEach third level before test",
                                        "aroundEach inner before test",
                                        "aroundEach inner after test",
                                        "aroundEach third level after test",
                                        "aroundEach top level after test",
                                        "aroundEach top level before test",
                                        "aroundEach third level before test",
                                        "aroundEach inner before test",
                                        "tests the aroundEach handlers are called in the correct order"
                                    ])
                                })
                            })
                        })
                    })
                })
                
                describe("Tests with beforeEach and afterEach", () => {
                    result = []
                    
                    afterEach(() => {
                        result.append("set by afterEach")
                    })

                    beforeEach(() => {
                        result.append("set by beforeEach")
                    })
            
                    aroundEach((test) => {
                        result.append("set by aroundEach before test")
                        test()
                        result.append("set by aroundEach after test")
                    })
                                
                    it("is the baseline test", ()=> {
                        expect(true).toBeTrue()
                    })

                    it("tests the aroundEach handlers are called in the correct order", ()=> {
                        result.append("tests the aroundEach handlers are called in the correct order")

                        expect(result).toBe([
                            "set by beforeEach",
                            "set by aroundEach before test",
                            "set by aroundEach after test",
                            "set by afterEach",
                            "set by beforeEach",
                            "set by aroundEach before test",
                            "tests the aroundEach handlers are called in the correct order"
                        ])
                    })
                })
                
                describe("Tests with failing tests", () => {
                    result = []
                    
                    aroundEach((test) => {
                        result.append("set by aroundEach before test")
                        test()
                        result.append("set by aroundEach after test")
                    })
                                
                    it("It is the setup test (this is expected to fail, don't worry about it)", ()=> {
                        expect(true).toBefalse()
                    })

                    it("tests the 'after' part of the aroundEach handler is still called when a test fails", ()=> {
                        result.append("tests the 'after' part of the aroundEach handler is still called when a test fails")

                        expect(result).toBe([
                            "set by aroundEach before test",
                            "set by aroundEach after test",
                            "set by aroundEach before test",
                            "tests the 'after' part of the aroundEach handler is still called when a test fails"
                        ])
                    })
                })
                
                describe("Tests with erroring tests", () => {
                    result = []
                    
                    aroundEach((test) => {
                        result.append("set by aroundEach before test")
                        test()
                        result.append("set by aroundEach after test")
                    })

                    it("It is the setup test (this is expected to error, don't worry about it)", ()=> {
                        throw("forcing an error")
                    })

                    it("tests the 'after' part of the aroundEach handler is still called when a test errors", ()=> {
                        result.append("tests the 'after' part of the aroundEach handler is still called when a test errors")

                        expect(result).toBe([
                            "set by aroundEach before test",
                            "set by aroundEach after test",
                            "set by aroundEach before test",
                            "tests the 'after' part of the aroundEach handler is still called when a test errors"
                        ])
                    })
                })
            })
            
            describe("Tests of beforeAll", () => {
                it("is executed before tests", () => {
                    expect(tinyTest).toHaveKey("debug")
                    expect(tinyTest.debug).toHaveKey("setByBeforeAll")
                    expect(tinyTest.debug.setByBeforeAll).toBe(true)
                })            
            })
            
            describe("Tests for afterAll", () => {
                it("is executed after tests", () => {
                    /*  we can't test this directly here as it intrinsically runs *after the tests*
                        so call another test run that has an afterAll handler. The code for the test
                        run here is:
                        
                        function run() {
                            afterAll(() => {
                                writeOutput("afterAll ran OK")
                            })
                        
                            describe("Tests of afterAll", () => {
                                it("is a simple test", () => {
                                    expect(true).toBeTrue()
                                })
                            })
                        }
                        
                        tinyTest.runTests()
                    */
                    cfhttp(method="get", url="https://gist.githubusercontent.com/adamcameron/816ce84fd991c2682df612dbaf1cad11/raw/3d98b189c0062752928a6966a494084ae1af4c0c/tinyTestFramework.cfm", result="local.frameworkCodeResponse");
                    cfhttp(method="get", url="https://gist.githubusercontent.com/adamcameron/0df8bb82777d92387f0852c8e26feec8/raw/0168fdd943161b2c01161662ef1deff62ffb9be2/afterAllBasicTest.cfm", result="local.testCodeResponse");
                
                    var frameworkCode = frameworkCodeResponse.fileContent;
                    var testCode = testCodeResponse.fileContent;
                
                    cfhttp(method="post", url="https://acf14-sbx.trycf.com/getremote.cfm", result="local.testRunResponse") {
                        cfhttpparam(type="formField", name="setupcode", value=frameworkCode);
                        cfhttpparam(type="formField", name="code", value=testCode);
                        cfhttpparam(type="formField", name="asserts", value="");
                    }

                    expect(local.testRunResponse.fileContent).toInclude("afterAll ran OK")
                })
            })
        })
    }

    tinyTest.runTests()
</cfscript>