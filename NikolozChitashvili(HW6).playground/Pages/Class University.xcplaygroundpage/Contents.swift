import Foundation

class University {
    enum Faculty {
        case macs
        case business
        case civilEngineering
        case lawSchool
        case sport
    }
    
    let name: String
    let foundYear: Int
    var studentsArray: [Student]
    var lecturersArray: [Lecturer]
    var facultiesArray: [Faculty]
    
}
