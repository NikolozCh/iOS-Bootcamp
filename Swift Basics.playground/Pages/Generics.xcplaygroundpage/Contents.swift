import Foundation

func sumOf<T: Numeric>(num1: T, num2: T) {
    print(num1+num2)
}
sumOf(num1: 5, num2: 4)
sumOf(num1: 5.4, num2: 4.4)


func joined<T: RangeReplaceableCollection>(arg1: T, arg2: T) {
    print(arg1 + arg2)
}

joined(arg1: "David", arg2: "Dynamo")
