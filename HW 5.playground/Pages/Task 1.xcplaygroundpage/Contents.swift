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
let sortedByNeed = randomCars.sorted { car1, car2 in
    car1.fuelExpenses.fuelNeededPerHundred < car2.fuelExpenses.fuelNeededPerHundred
}

if let carLowesNeed = sortedByNeed.first {
    print("Car with lowest need ->", carLowesNeed.toString(), "<-")
}
else {
    print("Bro, what have you done...")
}
