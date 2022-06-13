import Foundation

// Here goes the wrapper
@propertyWrapper
struct Capitalized {
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.capitalized
        }
    }
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

// Just casual Player struct
struct Player {
    @Capitalized var name: String
    @Capitalized var surname: String
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    func toString() -> String {
        "Player: \(name) \(surname)"
    }
}

let footballPlayer = Player(name: "gela", surname: "namoradze")
print(footballPlayer.toString())

