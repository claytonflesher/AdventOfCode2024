%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import * from Day1
---
"Day1" describedBy [
    "day1_a" describedBy [
        "It return 11 with the sample data" in do {
            do {
                var data = "3   4
4   3
2   5
1   3
3   9
3   3"
                ---
                day1_a(data) must equalTo(11)
            }
        },
        "It should return result for full sample data" in do {
            do {
                var data = readUrl("classpath://samples/day1.txt", "text/plain")
                ---
                day1_a(data) must equalTo(2769675)
            }
        }
    ],
    "day1_b" describedBy  [
        "It returns 31 with the sample data" in do {
            do {
                var data = "3   4
4   3
2   5
1   3
3   9
3   3"
                ---
                day1_b(data) must equalTo(31)
            }
        },
        "It should return result for full sample data" in do {
            do {
                var data = readUrl("classpath://samples/day1.txt", "text/plain")
                ---
                day1_b(data) must equalTo(24643097)
            }
        }
    ]
]
