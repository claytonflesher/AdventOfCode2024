%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import * from Day3
---
"Day3" describedBy [
    "day3_a" describedBy [
        "It should return 161 on the simple sample data" in do {
            var data = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
            ---
            day3_a(data) must equalTo(161)
        },
        "It should return the correct result for the full dataset" in do {
            var data = readUrl("classpath://samples/day3.txt", "text/plain")
            ---
            day3_a(data) must equalTo(167090022)
        }
    ],
    "day3_b" describedBy  [
        "It should return 48 on the simple sample data" in do {
            var data = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
            ---
            day3_b(data) must  equalTo(48)
        },
        "It should return the correct result for the full dataset" in do {
            var data = readUrl("classpath://samples/day3.txt", "text/plain")
            ---
            day3_b(data) must equalTo(89823704)
        }
    ]
]
