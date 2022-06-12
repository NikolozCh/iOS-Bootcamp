let carsCount = 15

let randomCars = (1...carsCount).map { _ in
    Car.randomCar()
}

print("--------------------- Cars ---------------------")
randomCars.forEach { car in
    print(car.toString())
}
print("------------------------------------------------")

// Solution
var combinedByMake = [String: [Car]]()

// Sorting by the make
randomCars.forEach { car in
    var writtenCars = combinedByMake[car.make.rawValue] ?? []
    writtenCars += [car]
    combinedByMake.updateValue(writtenCars, forKey: car.make.rawValue)
}

/* For debugging purposes
 ------------------------------------
combinedByMake.forEach { carMake, cars in
    print("[!] \(carMake.capitalized)")
    cars.forEach { car in
        print(car.toString())
    }
}
 */

var combinedAverage = [String: Double]() /* Stores average consumption by the make */
combinedByMake.forEach { carMake, cars in
    let gasolineNeedInTotal = cars.reduce(0) { (currentSum, car) -> Double in
        currentSum + car.fuelExpenses.fuelNeededPerHundred
    }
    let averageNeed = gasolineNeedInTotal / Double(cars.count)
    // For debugging
    // -----------------------------------
     print("[!] \(carMake.capitalized)", terminator: " ")
     print("Average:",averageNeed)
    // -----------------------------------
    combinedAverage.updateValue(averageNeed, forKey: carMake.capitalized)
}

let minNeedMakeSorted = combinedAverage.sorted { $0.value < $1.value }

if let unwrappedMake = minNeedMakeSorted.first {
    print("\(unwrappedMake.key) has the lowest average fuel need per 100 km")
}
else {
    let tacoEmoji = """
    \n{\\__/}
    (●_●)
    ( >🌮 Want a taco?\n
    """
    print(tacoEmoji)
}
