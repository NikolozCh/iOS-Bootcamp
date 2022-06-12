// Class declaration goes here...
import Foundation

public struct FuelExpenses {
    let maxVolume: Double
    public let fuelNeededPerHundred: Double
    func toString() -> String {
        return "vol: \(maxVolume), need: \(fuelNeededPerHundred)"
    }
}

public enum CarMake: String, CaseIterable {
    case bmw
    case mercedes
    case volvo
    case lamborghini
    case renault
}

func getRandomFuelExpenses() -> FuelExpenses {
    let volumeRange = 15.0...65.0
    let fuelNeededPerHundredRange = 5.0...35.0
    let randomVolume = Double.random(in: volumeRange).rounded(toPlaces: 1)
    let randomFuelNeeded = Double.random(in: fuelNeededPerHundredRange).rounded(toPlaces: 1)
    return FuelExpenses(maxVolume: randomVolume, fuelNeededPerHundred: randomFuelNeeded)
}

func getRandomColor() -> String {
    let hexValues = ["1","2","3","4","5","6","7","8","9","10","A","B","C","D","E","F"]
    let randomColor = (1...6).map { _ in
        hexValues.randomElement()!
    }.reduce("#", +)
    return randomColor
}

func getRandomDoorsCount() -> Int {
    let minDoorCount = 2
    let maxDoorCount = 6
    return Int.random(in: minDoorCount...maxDoorCount)
}

public class Car {
    let _fuel: FuelExpenses
    let _make: CarMake
    let color: String
    let doorsCount: Int
    
    public var fuelExpenses: FuelExpenses {
        get {
            return _fuel
        }
    }
    public var make: CarMake {
        get {
            return _make
        }
    }
    
    init(make carMake: CarMake, color carColor: String, doorsCount carDoors: Int, fuelInfo carFuel: FuelExpenses) {
        self._make = carMake
        self.color = carColor
        self.doorsCount = carDoors
        self._fuel = carFuel
    }
    
    public class func randomCar() -> Car {
        let randomMake = CarMake.allCases.randomElement()!
        let randomDoorsCount = getRandomDoorsCount()
        let randomColor = getRandomColor()
        let randomFuel = getRandomFuelExpenses()
        return Car(make: randomMake, color: randomColor, doorsCount: randomDoorsCount, fuelInfo: randomFuel)
    }
    
    public func toString() -> String {
        return "Make: \(make) | Color: \(color) | Doors: \(doorsCount) | Fuel: \(_fuel.toString())"
    }
}

extension Double {
    // Rounds the double to decimal places value
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
