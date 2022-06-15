import Foundation

public class Player {
    let name: String?
    var salary: Int
    private(set) var clubName: String
    let yellowCardsCount = 0
    
    public init(name: String, salary: Int) {
        self.name = name
        self.salary = salary
    }    
}

class Club {
    let players = [Player]()
    
    func showSalaryOfFirstPlayer() {
        print(players.first!.salary)
    }
}
