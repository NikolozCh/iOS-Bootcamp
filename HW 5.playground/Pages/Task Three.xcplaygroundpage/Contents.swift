/*
 Sort, Group...
 I wasn't able to undestand :')
 I have combined both of them
 */

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
// Key - doors count
// Value - cars array
var groupedByDoorsCount = [Int: [Car]]()

randomCars.forEach { car in
    var carsOnDoorNumber = groupedByDoorsCount[car.doorsCount] ?? []
    carsOnDoorNumber += [car]
    groupedByDoorsCount.updateValue(carsOnDoorNumber, forKey: car.doorsCount)
}

let sortedByDoorsCount = groupedByDoorsCount.sorted { $0.key < $1.key }

sortedByDoorsCount.forEach { pair in
    print("Door count: \(pair.key)")
    pair.value.forEach { car in
        print(car.toString())
    }
}
