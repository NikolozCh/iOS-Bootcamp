import Foundation

public func randomId() -> String {
    (1...10).reduce("", { "\($0)" + "\($1)" })
}

public func randomRating() -> Double {
    Double.random(in: -1.0...6.7).rounded(toPlaces: 1) // from -1.0 to 6.7, because to test propertyWrapper functionality, as back-end dev can mess up sometimes lol
}

public func randomPrice() -> Int {
    Int.random(in: 400...50000)
}

public func randomMake() -> String {
    let makes = ["Volvo", "BMW", "Lamborghini", "Mercedes", "Alfa-Romeo", "Honda", "Renault", "Audi"]
    return makes.randomElement() ?? "Unknown Make"
}

public func randomName() -> String {
    let names = ["Grand Theft Auto", "Assassin's Creed", "Zombie Apocalypse", "Halo", "Forza Horizon", "The Last Of Us", "Counter-Strike"]
    return names.randomElement() ?? "Unknown Game"
}

public func randomTitle() -> String {
    let titles = ["Do Androids Dream of Electric Sheep?", "Everything I Never Told You", "Is Everyone Hanging Out Without Me?", "Are You There, Vodka? It’s Me, Chelsea", "The Devil Wears Prada", "The Curious Incident of the Dog", "How to Win Friends and Influence People", "Cloudy with a Chance of Meatballs", "Love in the Time of Cholera"]
    return titles.randomElement() ?? "Unknown Book Title"
}
// Code copied from: https://stackoverflow.com/a/32581409
extension Double {
    // Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
