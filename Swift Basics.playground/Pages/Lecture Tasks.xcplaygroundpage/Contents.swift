//import Foundation
//
//var numbersArray = [Int]()
//var stringsArray: [String] = [
//    "ABC", "SDF", "AS", "A", "GGT", "ASDAS", "CDFV", "EWQ", "ASQ", "GPO"
//]
//
//let arrSize = 10
//
//for _ in 0..<arrSize {
//    numbersArray += [Int.random(in: 1...999)]
//}
//
//var concideIndexes = [Int]()
//
//// ციკლის გამოყენებით შეადარეთ, მასივების რომელ ინდექსზე ემთხვევა ელემენტებში _ სტრინგებში Char-ების და რიცხვში ციფრების რაოდენობა და დათვალეთ ესეთი ინდექსები
//for i in 0..<arrSize {
//    // 13 becomes "13"
//    // "ABC" is already a string
//    // so we check count for both of them, if they equals, we save the index
//    if "\(numbersArray[i])".count == stringsArray[i].count { concideIndexes += [i] }
//}
//
//// დაასორტირეთ მასივი ზრდადობის მიხედვით
//print("before sort: ", numbersArray)
//numbersArray = numbersArray.sorted(by: <)
//print("after sort: ", numbersArray)
//
//
//// გაიგეთ, რომელ მასივშია უფრო მეტი სიმბოლო
//var numbersStringToBeSet: String = ""
//var stringsStringToBeSet: String = ""
//// Add all elements in oneee big string
//numbersArray.forEach { numbersStringToBeSet += "\($0)" }
//stringsArray.forEach { stringsStringToBeSet += $0 }
//
//if Set(numbersStringToBeSet).count > Set(stringsStringToBeSet).count {
//    print("numbers set has more symbols")
//}
//else if Set(numbersStringToBeSet).count < Set(stringsStringToBeSet).count {
//    print("strings set has more symbols")
//}
//else {
//    print("same length")
//}
//
//// სტრინგების მასივი გადააკეთეთ ქარაქთერების მასივად და დათვალეთ, რომელი სიმბოლო მეორდება ყველაზე ხშირად
//var charsArray = [Character]()
//stringsArray.forEach { el in
//    el.forEach { ch in
//        charsArray += [ch]
//    }
//}
//
//var occurance = [Character: Int]()
//charsArray.forEach { occurance[$0] = (occurance[$0] ?? 0) + 1 }
//
//let sortedOccurance = occurance.sorted { elOne, elTwo in
//    elOne.value > elTwo.value
//}
//
//if let firstPair = sortedOccurance.first {
//    print("Most occured ch: \(firstPair.key) for \(firstPair.value) times")
//}

//import Foundation
//
//let numbers = [1, 2, 3, 4, 6]
//func myFilter(arr: [Int], someClosure: (Int) -> Bool) -> [Int] {
////    var answer = [Int]()
////    for integ in arr {
////        if someClosure(integ) {
////            answer += [integ]
////        }
////    }
////    return answer
//    return arr.filter { someClosure($0) }
//}
//
//print(myFilter(arr: numbers) { $0 > 2 })

import Foundation

let numbers = [1, 2, 3, 4, 6]
func myFilter(arr: [Int], someClosure: (Int) -> Bool) -> Int {
//    var answer = [Int]()
//    for integ in arr {
//        if someClosure(integ) {
//            answer += [integ]
//        }
//    }
//    return answer.count
    arr.filter { someClosure($0) }.count
}

print(myFilter(arr: numbers) { $0 > 10 })

let string: String = "Hello"
print((0..<10).reduce("", {res, _ in
  res + string
}))
