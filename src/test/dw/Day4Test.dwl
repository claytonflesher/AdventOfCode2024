%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import * from Day4
---
"Day4" describedBy [
    "day4_a" describedBy [
        "It should return ??? from the simple sample data" in do {
            var data = ""
            ---
            day4_a(data) must equalTo(0)
        },
    ],
]
