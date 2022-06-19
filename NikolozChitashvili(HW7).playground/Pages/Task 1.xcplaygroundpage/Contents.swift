import Foundation

extension String {
    var vowelCount: Int {
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        return self.filter{ vowels.contains($0) }.count
    }
    var consonantCount: Int {
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        return self.filter{ !vowels.contains($0) }.count
    }
    func reversedStr() -> String {
        /*
         Lol, not using self.reversed() :}
         */
        var res: String = self[self.count - 1]
        for index in 1..<self.count { // Buggy Shmuggy on index 0, didn't want to subtract 1 on line 24 for code readability
            // Get characters from right to left by multiplying on -1 and starting index from the end : }
            /*
             Instead of writing this:
             res += String(self[self.index(self.endIndex, offsetBy: (index * -1) - 1)])
             We've created subscript extension for string to make code more readable
             */
            res += self[-index] // -index -> get characters from back
        }
        /*
         Or alternative solution with stride
         maybe more readable to you
         for reverseIndex in stride(from: self.count-1, through: 0, by: -1) {
             res += String(self[self.index(startIndex, offsetBy: reverseIndex)])
         }
         */
        return res
    }
    var isUppercasedMore: Bool {
        let uppercasedChars = self.filter { $0.isUppercase  }
        let lowercasedChars = self.filter { !$0.isUppercase }
        // For debugging
        // print("upper: \(uppercasedChars) lower: \(lowercasedChars)")
        return uppercasedChars.count > lowercasedChars.count
    }
    /*
     subsctipt overload is used to simply get character from the string
     by index as Int
     returning String straight because to simplify an beautify code while merging return with other String
     */
    subscript(index: Int) -> String {
        if index >= 0 {
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
        else {
            return String(self[self.index(self.endIndex, offsetBy: index - 1)])
        }
    }
}

let vowelCountData = "abcdi"
print("There are \(vowelCountData.vowelCount) vowels in \(vowelCountData)")

let consonantCountData = "nikolozi"
print("There are \(consonantCountData.consonantCount) vowels in \(consonantCountData)")


print(consonantCountData.reversedStr())

let uppercasedString = "ABCasdadfgdfgdfgsdVDFDDD"
print(uppercasedString.isUppercasedMore)

