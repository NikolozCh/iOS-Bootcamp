/*
 Link to the problem: https://edabit.com/challenge/nZwmcCgce2ARLQkYs
 */

import Foundation

func isIdentical(_ s: String) -> Bool {
    return Set(s).count == 1
}

let data = "aaaaa"
isIdentical(data)
