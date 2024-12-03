%dw 2.6
fun day1_a(data: String): Number =
    do {
        var pairs = (data splitBy "\n") map ((item, index) -> item splitBy  /\s+/)
        var groups = pairs reduce ((item, accumulator = {lefts: [], rights: []}) -> {lefts: accumulator.lefts + item[0] as Number, rights: accumulator.rights + item[1] as Number})
        var lefts = groups.lefts orderBy $
        var rights = groups.rights orderBy $
        ---
        sum((lefts zip rights) map ((item) -> abs(item[0] - item[1])))
    }

fun day1_b(data: String): Number =
    do {
        var pairs = (data splitBy "\n") map ((item, index) -> item splitBy  /\s+/)
        var groups = pairs reduce ((item, accumulator = {lefts: [], rights: []}) -> {lefts: accumulator.lefts + item[0] as Number, rights: accumulator.rights + item[1] as Number})

        ---
        groups.lefts reduce ((item, accumulator = 0) -> accumulator + (item * (sizeOf(groups.rights filter ((i) -> i == item)))))
    }