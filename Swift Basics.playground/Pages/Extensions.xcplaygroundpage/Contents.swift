import Foundation

extension String {
    mutating func removeVowels() {
        let vowels: [Character] = ["a", "e", "i", "o", "e"]
        self = self.filter {
            !vowels.contains($0)
        }
    }
    
    func getWithoutVowels() -> String {
        let vowels: [Character] = ["a", "e", "i", "o", "e"]
        return self.filter {
            !vowels.contains($0)
        }
    }
    
    func printSelfValue() {
        print("Out string value is: \(self)")
    }
}

extension Array {
    var middleElement: Element? {
        if self.count.isMultiple(of: 2) {
            return nil
        }
        else {
            let middleElement = self.count / 2
            return self[middleElement]
        }
    }
}

extension Int {
    func square() -> Int {
        self * self
    }
}

extension Double {
    func toString() -> String {
        String(self)
    }
    
    var stringValue: String {
        get {
            String(self)
        }
    }
}


extension Dictionary where Key == String, Value == Int {
    var duplicatedValues: [String: Int] {
        self.mapValues { $0 * 2 }
    }
}


extension Int {
    var isPositive: Bool {
        self > 0
    }
    var isPrime: Bool {
        for i in 2..<self {
            if self % i == 0 { return false }
        }
        return true
    }
    
}

extension String {
    func hasMoreThanTwoSymbols() -> Bool {
        var encountered = [Character: Int]()
        self.forEach { char in
            let alreadyCount = encountered[char] ?? 0
            encountered[char] = alreadyCount + 1
        }
        var answer = false
        encountered.forEach { pair in
            if pair.value > 2 {
                answer = true
                return
            }
        }
        return answer
    }
    
    func hasMoreThanTwoSymbolsFlex() -> Bool {
        var encountered = [Character: Int]()
        
        for (_, char) in self.enumerated() {
            if encountered[char] != nil { return false }
            let alreadySeenTimes = encountered[char] ?? 0
            encountered[char] = alreadySeenTimes + 1
        }
        return true
    }
}



print("abbbbc".hasMoreThanTwoSymbolsFlex())

var someDict = [String: Int]()
someDict["SomeData"] = 10
someDict["DummyData"] = 20

print(someDict.duplicatedValues)

print(0.5.stringValue)

var myName: String = "Nikolozi"

myName.removeVowels()
print(myName)

let elements = [1,2,3,4,5]
print(elements.middleElement!)

