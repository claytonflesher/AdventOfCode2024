%dw 2.6
import some from dw::core::Arrays
fun getRows(data: String): Array = 
    (data splitBy "\n") map ((i) -> (i splitBy /\s/) map ((item) -> item as Number))

fun isSafe(row: Array<Number>): Boolean = 
    row reduce ((item, acc) -> isIncreasingOrDecreasing(row) and adjacentLevelsDifferCorrectly(row))

fun isKindaSafe(row: Array<Number>): Boolean = 
    do {
        var candidates = row map ((item, index) -> {entry: item, index: index})
        var allValidRows =     candidates reduce ((candidate, accumulator = []) -> 
            do {
                var validCandidates = 
                if (candidate.index == 0)
                    candidates[1 to -1]
                else if (candidate == candidates[-1])
                    candidates[0 to -2]
                else
                    (candidates[0 to (candidate.index - 1)]) ++ (candidates[(candidate.index + 1) to -1])
                var validRows = validCandidates map ((can) -> can.entry)
                ---
                accumulator << validRows
            })
        ---
        !isEmpty(allValidRows filter ((row) -> isSafe(row)))        
    }
fun isIncreasingOrDecreasing(row: Array): Boolean =
    do {
        var orderedRow = row orderBy $
        ---
        (row == orderedRow) or (row[-1 to 0] == orderedRow)
    }

fun adjacentLevelsDifferCorrectly(row: Array): Boolean =
    do {
        var results = (row[1 to -1] reduce ((entry, accumulator = {valid: true, last: row[0]}) -> 
        if (accumulator.valid == true)
            {last: entry, valid: isValid(accumulator.last, entry)}
        else
            {last: entry, valid: false}))
        ---
        results.valid
    }

fun isValid(a: Number, b: Number): Boolean =
    do {
        var candidate = abs(a - b)
        ---
        (candidate > 0) and (candidate < 4)
    }

fun day2_a(data: String): Number =
    do {
        var rows = getRows(data)
        ---
        sizeOf(rows filter ((row) -> isSafe(row)))
    }

fun day2_b(data: String): Number =
    do {
        var rows = getRows(data)
        ---
        sizeOf(rows filter ((row) -> isKindaSafe(row)))
    }