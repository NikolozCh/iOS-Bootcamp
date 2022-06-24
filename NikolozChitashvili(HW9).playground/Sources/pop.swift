import Foundation

public protocol Person {
    var name: String { get set }
    var surname: String { get set }
    var personalID: String { get set }
    init(name: String, surname: String, personalID: String)
}
