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

randomCars.forEach { car in
    var writtenCars = combinedByMake[car.make.rawValue] ?? []
    writtenCars += [car]
    combinedByMake.updateValue(writtenCars, forKey: car.make.rawValue)
}

combinedByMake.forEach { carMake, cars in
    print("[!] \(carMake.capitalized)")
    cars.forEach { car in
        print(car.toString())
    }
}
