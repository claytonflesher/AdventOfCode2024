%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import * from Day2
---
"Day2" describedBy [
    "day2_a" describedBy [
        "It should return 2 on the simple sample data" in do {
            var data = "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9"
            ---
            day2_a(data) must equalTo(2)
        },
        "It should return the correct result for the full dataset" in do {
            var data = readUrl("classpath://samples/day2.txt", "text/plain")
            ---
            day2_a(data) must equalTo(660)
        }
    ],
    "day2_b" describedBy [
        "It should return 4 on the simple sample data" in do {
            var data = "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9"
            ---
            day2_b(data) must equalTo(4)
        },
        "It should return the correct result for the full dataset" in do {
            var data = readUrl("classpath://samples/day2.txt", "text/plain")
            ---
            day2_b(data) must equalTo(689)
        }
    ],
]
