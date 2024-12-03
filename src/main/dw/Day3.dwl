%dw 2.6
fun day3_a(data: String): Number =
    do {
        var entries = (data scan /(mul\(\d+,\d+\))/) map $[0]
        var multiples = entries map ((item) -> do {
            var numbers = flatten(item scan /\d+/)
            ---
            (numbers[0] as Number) * (numbers[1] as Number)
        })
        ---
        sum(multiples)
    }

fun day3_b(data: String): Number =
    do {
        var removedNewLines = data replace "\n" with ""
        var removedDisabled = removedNewLines replace /don't\(\).*?do\(\)/ with ""
        ---
        day3_a(removedDisabled)
    }