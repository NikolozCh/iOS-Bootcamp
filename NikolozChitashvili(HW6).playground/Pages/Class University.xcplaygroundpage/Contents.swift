import Foundation

class University {
    enum Faculty {
        case macs
        case business
        case civilEngineering
        case lawSchool
        case sport
    }
    enum Subject {
        // Subject is associated with the university
        // So we declare it here
        case math
        case computerScience
        case programmingAbstractions
        case programmingParadigms
        case microEconomics
        case macroEconomics
        case history
    }
    let name: String
    let foundYear: Int
    var studentsArray: [Student]
    var lecturersArray: [Lecturer]
    var facultiesArray: [Faculty]
    
}
