import Foundation

protocol Flyable: AnyObject {
    var currentSpeed: Double { get set }
    var maxSpeed: Double { get }
    var isSpiritual: Bool { get set }
    func increaseSpeed()
}

extension Array where Element == Flyable {
    func printCurrentAndMaxSpeed() {
        self.forEach { item in
            print(item.maxSpeed)
        }
    }
}


