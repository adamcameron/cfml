<style>
    .tinytest {background-color: black; color:white; font-family:monospace}
    .tinytest div {margin-left: 1em}
    .tinyTest .pass {color:green;}
    .tinyTest .fail {color:red;}
    .tinyTest .error {background-color:red; color:black}
</style>

<cfscript>
tinyTest = {
    runTests = () => {
        writeOutput('<div class="tinyTest">')
        run()
        writeOUtput('</div>')
    },
    describe = (string label, function testGroup) => {
        tinyTest.inDiv(() => {
            try {
                writeOutput("#label#<br>")
                testGroup()
            } catch (any e) {
                writeOutput("Error: #e.message#<br>")
            }
        })
    },
    it = (string label, function implementation) => {
        tinyTest.inDiv(() => {
            try {
                writeOutput("It #label#: ")
                implementation()
                tinyTest.showPass("OK")
            } catch (TinyTest e) {
                tinyTest.showFail("Failed")
            } catch (any e) {
                tinyTest.showError("Error: [#e.message#][#e.detail#]")
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
            throw(type="TinyTest.TestFailedException")
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
    showPass = (message) => {
        writeOutput('<span class="pass">#message#</span>')
    },
    showFail = (message) => {
        writeOutput('<span class="fail"><em>#message#</em></span>')
    },
    showError = (message) => {
        writeOutput('<span class="error"><strong>#message#</strong></span>')
    }

}

describe = tinyTest.describe
it = tinyTest.it
expect = tinyTest.expect
fail = tinyTest.fail
</cfscript>
