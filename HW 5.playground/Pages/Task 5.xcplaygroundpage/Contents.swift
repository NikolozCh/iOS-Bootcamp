// ⚠️ No idea what are you expecting from RGB colours..
// Maybe they coincide? Lol, there is 1 in a 16,777,216 chances of that
// Anyways, I will still solve this taks :}
// Okay enough talk..
// I've created special randomizer for this task
// randomCar(withColor:)
let carsCount = 15

let colors = ["Red", "Black", "Green", "White", "Silver", "Orange"]
let randomCars = (1...carsCount).map { _ in
    Car.randomCar(withColor: colors.randomElement()!)
}

print("--------------------- Cars ---------------------")
randomCars.forEach { car in
    print(car.toString())
}
print("------------------------------------------------")

// Solution
// key -> Color
// value -> number of color occured
var colourScheme = [String: Int]()

randomCars.forEach { car in
    var alreadyOccuredColour = colourScheme[car.color] ?? 0
    alreadyOccuredColour += 1
    colourScheme.updateValue(alreadyOccuredColour, forKey: car.color)
}

print("Colour scheme: \(colourScheme)")

let popularColoursSorted = colourScheme.sorted { $0.value > $1.value }

if let color = popularColoursSorted.first {
    let popularCount = color.value
    let allPopularColors = colourScheme.filter({ pair in
        pair.value == popularCount
    }).keys
    if allPopularColors.count == 1 {
        // There is only one the most popular color
        print("Popular color is: \(color.key)")
    }
    else {
        // Prints all popular colours, which have the same value as the most popular :}
        print("Popular colors are: ")
        allPopularColors.forEach { color in
            print("\t->", color)
        }
    }
}
else {
    print("... okay... please, leave")
}
