import Foundation

class Animal {
    let isDomestic: Bool
    
    init(isDomestic: Bool) {
        self.isDomestic = isDomestic
    }
    
    func makeSound() {
        fatalError("\(Self.self) can't have the sound")
    }
}

class Dog: Animal {
    let isOld: Bool
    
    init(isOld: Bool) {
        self.isOld = isOld
        super.init(isDomestic: true)
    }
    
    override func makeSound() {
        print("Waff")
    }
}

class Cat: Animal {
    let hairLength: Int
    
    init(hairLength: Int) {
        self.hairLength = hairLength
        super.init(isDomestic: true)
    }
    
    override func makeSound() {
        print("I am a cat, I go miaww")
    }
}

let cat1 = Cat(hairLength: 10)
let dog1 = Dog(isOld: false)

let allAnimals = [
    cat1,
    dog1
]

for animal in allAnimals {
    print(animal.makeSound())
}
