component extends=testbox.system.BaseSpec {

    function run() {
        describe("Testing Tom's function", () => {
            it("fulfils the requirement of the puzzle", () => {
                input = {
                    "payment_method_types" = ["card"],
                    "line_items" = [
                        {
                            "price_data" = {
                                "product_data" = {
                                    "name" = "Something"
                                },
                                "currency" = "gbp",
                                "unit_amount" = 123
                            },
                            "quantity" = 1
                        }
                    ]
                }
                expected = {
                    "payment_method_types[0]" = "card",
                    "line_items[0][price_data][product_data][name]" = "Something",
                    "line_items[0][price_data][currency]" = "gbp",
                    "line_items[0][price_data][unit_amount]" = 123,
                    "line_items[0][quantity]" = 1
                }

                actual = flattenStruct(input)

                expect(actual).toBe(expected)
            })

            it("handles top-level key/values with simple values", () => {
                input = {
                    "one" = "tahi",
                    "two" = {"second" = "rua"},
                    "three" = {
                        "third" = {"thrice" = "toru"}
                    }
                }
                expected = {
                    "one" = "tahi",
                    "two[second]" = "rua",
                    "three[third][thrice]" = "toru"
                }

                actual = flattenStruct(input)

                expect(actual).toBe(expected)
            })

            it("handles multiple top-level key/values with simple values", () => {
                input = {
                    "one" = "tahi",
                    "first" = "tuatahi",
                    "two" = {"second" = "rua"},
                    "three" = {
                        "third" = {"thrice" = "toru"}
                    }
                }
                expected = {
                    "one" = "tahi",
                    "first" = "tuatahi",
                    "two[second]" = "rua",
                    "three[third][thrice]" = "toru"
                }

                actual = flattenStruct(input)

                expect(actual).toBe(expected)
            })

            it("handles structs", () => {
                input = {
                    "one" = "tahi",
                    "first" = "tuatahi",
                    "two" = {"second" = "rua"},
                    "three" = {
                        "third" = {"thrice" = "toru"}
                    }
                }
                expected = {
                    "one" = "tahi",
                    "first" = "tuatahi",
                    "two[second]" = "rua",
                    "three[third][thrice]" = "toru"
                }

                actual = flattenStruct(input)

                expect(actual).toBe(expected)
            })

            it("handles arrays values", () => {
                input = {
                    "one" = "tahi",
                    "first" = "tuatahi",
                    "two" = {"second" = "rua"},
                    "three" = {
                        "third" = {"thrice" = "toru"}
                    },
                    "four" = ["fourth", "quaternary", "wha", "tuawha"]
                }
                expected = {
                    "one" = "tahi",
                    "first" = "tuatahi",
                    "two[second]" = "rua",
                    "three[third][thrice]" = "toru",
                    "four[0]" = "fourth",
                    "four[1]" = "quaternary",
                    "four[2]" = "wha",
                    "four[3]" = "tuawha"
                }

                actual = flattenStruct(input)

                expect(actual).toBe(expected)
            })

            it("qualifies the keys correctly and zero-indexes the arrays", () => {
                input = {
                    "one" = "tahi",
                    "first" = "tuatahi",
                    "two" = {"second" = "rua"},
                    "three" = {
                        "third" = {"thrice" = "toru"}
                    },
                    "four" = ["fourth", "quaternary", "wha", "tuawha"],
                    "five" = [
                        {"fifth" = "rima"},
                        ["tuarima"],
                        "quinary"
                    ]
                }
                expected = {
                    "one" = "tahi",
                    "first" = "tuatahi",
                    "two[second]" = "rua",
                    "three[third][thrice]" = "toru",
                    "four[0]" = "fourth",
                    "four[1]" = "quaternary",
                    "four[2]" = "wha",
                    "four[3]" = "tuawha",
                    "five[0][fifth]" = "rima",
                    "five[1][0]" = "tuarima",
                    "five[2]" = "quinary"
                }

                actual = flattenStruct(input)

                expect(actual).toBe(expected)
            })

            it("handles arguments objects", () => {
                input = {
                    "one" = "tahi",
                    "first" = "tuatahi",
                    "two" = {"second" = "rua"},
                    "three" = {
                        "third" = {"thrice" = "toru"}
                    },
                    "four" = ["fourth", "quaternary", "wha", "tuawha"],
                    "five" = [
                        {"fifth" = "rima"},
                        ["tuarima"],
                        "quinary"
                    ],
                    "six" = ((sixth, senary) => arguments)("ono", "tuaono", [6])
                }
                expected = {
                    "one" = "tahi",
                    "first" = "tuatahi",
                    "two[second]" = "rua",
                    "three[third][thrice]" = "toru",
                    "four[0]" = "fourth",
                    "four[1]" = "quaternary",
                    "four[2]" = "wha",
                    "four[3]" = "tuawha",
                    "five[0][fifth]" = "rima",
                    "five[1][0]" = "tuarima",
                    "five[2]" = "quinary",
                    "six[sixth]" = "ono",
                    "six[senary]" = "tuaono",
                    "six[2][0]" = 6
                }

                actual = flattenStruct(input)

                expect(actual).toBe(expected)
            })
        })
    }

    function flattenStruct(required struct struct) {
        flatten = (flattened, key, value, actual, prefix="") => {
            var offsetKey = isArray(actual) && isNumeric(key) ? key - 1 : key
            var qualifiedKey = prefix.len() > 0 ? "[#offsetKey#]" : offsetKey
            var prefixedKey = "#prefix##qualifiedKey#"

            if (isSimpleValue(value)) {
                return flattened.append({"#prefixedKey#" = value})
            }

            if (isStruct(value)) {
                return flattened.append(value.reduce(
                    function (flattened={}, key, value, actual, prefix=prefixedKey) {
                        return flattened.append(flatten(flattened, key, value, actual, prefix))
                    },
                    {}
                ))
            }

            if (isArray(value)) {
                return flattened.append(value.reduce(
                    function (flattened={}, value, index, actual, prefix=prefixedKey) {
                        return flattened.append(flatten(flattened, index, value, actual, prefix))
                    },
                    {}
                ))
            }
        }

        return struct.reduce(flatten, {})
    }
}
