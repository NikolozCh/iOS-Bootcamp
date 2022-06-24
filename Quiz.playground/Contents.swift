import Foundation
enum Corner: CaseIterable {
    case left
    case right
    case top
    case bottom
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    case middle
}
var corners = (1...10).compactMap { _ in Corner.allCases.randomElement() }

func cornersToString(from arr: [Corner]) -> [String] {
    return arr.map { corner -> String in
        switch corner {
        case .left:
            return "left"
        case .right:
            return "right"
        case .top:
            return "top"
        case .bottom:
            return "bottom"
        case .topLeft:
            return "topLeft"
        case .topRight:
            return "topRight"
        case .bottomLeft:
            return "bottomLeft"
        case .bottomRight:
            return "bottomRight"
        case .middle:
            return "middle"
        }
    }
}
print(cornersToString(from: corners))

func allElements(in arr: [Corner], toCheck list: Corner...) -> Bool {
    var answers: [Bool] = []
    list.forEach { el in
        let uniques = Set(arr)
        let isEveryElement = uniques.count == 1 && uniques.contains(el)
        answers.append(isEveryElement)
    }
    return answers.contains(true)
}
//var corners = (1...10).compactMap { _ in Corner.left }
print(allElements(in: corners, toCheck: .top, .middle, .bottom))

func containsMinTwo(el enumElement: Corner, in arr: [Corner]) -> Bool {
    return arr.filter { $0 == enumElement }.count >= 2
}
print(containsMinTwo(el: .left, in: corners))

func getUniquesCount(in arr: [Corner]) -> Int {
    return Set(corners).count
}

func leftRightMassHigher(el enumElement: Corner, in arr: [Corner]) -> (left: Int, right: Int) {
    var leftRightCount = 0
    var rightRightCount = 0
    for i in 0..<arr.count/2 {
        leftRightCount += (arr[i] == enumElement ? 1 : 0)
    }
    for i in arr.count/2..<arr.count {
        rightRightCount += (arr[i] == enumElement ? 1 : 0)
    }
    return (leftRightCount, rightRightCount)
}
let elToSearch = Corner.right
let countsBySides = leftRightMassHigher(el: elToSearch, in: corners)

if(countsBySides.left > countsBySides.right) { print("Left side has more \(elToSearch)") }
else if(countsBySides.left < countsBySides.right) { print("Right side has more \(elToSearch)") }
else { print("\(elToSearch) count is equal in left and right") }

func filter(in arr: [Corner], by el: Corner) -> [Corner] {
    return arr.filter { $0 == el }
}
print(filter(in: corners, by: .bottomRight))

func printBefore(element el: Corner, in arr: [Corner]) -> Void {
    print("------- Print before -------")
    for corner in arr {
        if corner == el { break }
        print(corner)
    }
}
printBefore(element: .bottom, in: corners)

func printAfter(element el: Corner, in arr: [Corner]) -> Void {
    print("------- Print after -------")
    let elIndex = arr.firstIndex(of: el) ?? -1
    if elIndex == -1 { return }
    for i in elIndex+1..<arr.count-1 {
        print(arr[i])
    }
}
printAfter(element: .bottom, in: corners)

func elementIndexes(for el: Corner, in arr: [Corner]) -> [Int] {
    var result: [Int] = []
    for i in 0..<arr.count {
        if arr[i] == el { result.append(i) }
    }
    return result
}
print(elementIndexes(for: .bottom, in: corners))
