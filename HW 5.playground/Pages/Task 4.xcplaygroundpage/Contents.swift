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
let theLongestRunCarsSorted = randomCars.sorted { car1, car2 in
    car1.runInKmWORefuel() > car2.runInKmWORefuel()
}

if let theLongestRunCar = theLongestRunCarsSorted.first {
    print("-> \(theLongestRunCar.toString()) <- can run the longest without refuel ;)")
}
else {
    print("... I have no words.. How did you get here?")
}
