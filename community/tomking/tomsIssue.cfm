<cfscript>
    original = {
        'payment_method_types' = ['card'],
        'line_items' = [
            {
                "price_data" = {
                    "product_data" = {
                        "name" = "Something"
                    },
                    "currency" = 'gbp',
                    "unit_amount" = 123
                },
                "quantity" = 1
            }
        ]
    };

    wantedResult["payment_method_types[0]"] = 'card';
    wantedResult["line_items[0][price_data][product_data][name]"] ='Something';
    wantedResult["line_items[0][price_data][currency]"] = 'gbp';
    wantedResult["line_items[0][price_data][unit_amount]"] = 123;
    wantedResult["line_items[0][quantity]"] = 1;


    flatten = (flattened={}, key, value, actual, prefix="") => {
        var offsetKey = isArray(actual) ? key - 1 : key
        var qualifiedKey = prefix.len() > 0 ? "[#offsetKey#]" : offsetKey
        var prefixedKey = "#prefix##qualifiedKey#"
        if (isSimpleValue(value)) {
            var result = {"#prefixedKey#" = value}
        }
        if (isStruct(value)) {
            var result = value.reduce((flattened={}, key, value, actual, prefix=prefixedKey) => flattened.append(flatten(flattened, key, value, actual, prefix)), {})
        }
        if (isArray(value)) {
            var result = value.reduce((flattened={}, value, index, actual, prefix=prefixedKey) => flattened.append(flatten(flattened, index, value, actual, prefix)), {})
        }

        return flattened.append(result)
    }

    flattened = original.reduce(flatten, {})

    writeDump([
        wantedResult = wantedResult,
        actualResult = flattened,
        equal = wantedResult.equals(flattened)
    ])
    </cfscript>
