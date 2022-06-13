// This file contains all the source for main class in order to work properly
// Don't mind this file at all
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
}

@propertyWrapper
struct StudentGrader {
    var wrappedValue: Double {
        didSet {
            if wrappedValue > 100 { self.wrappedValue = 100 }
            else if wrappedValue < 0 { self.wrappedValue = 0 }
        }
    }
    init(wrappedValue: Double) {
        if wrappedValue > 100 { self.wrappedValue = 100 }
        else if wrappedValue < 0 { self.wrappedValue = 0 }
        else { self.wrappedValue = wrappedValue }
    }
}

@propertyWrapper
struct GPAGrader {
    var wrappedValue: Double {
        didSet {
            if wrappedValue > 4.0 { self.wrappedValue = 4.0 }
            else if wrappedValue < 0.0 { self.wrappedValue = 0.0 }
        }
    }
    init(wrappedValue: Double) {
        if wrappedValue > 4.0 { self.wrappedValue = 4.0 }
        else if wrappedValue < 0.0 { self.wrappedValue = 0.0 }
        else { self.wrappedValue = wrappedValue }
    }
}

public class Student {
    struct Grade {
        let subjectName: University.Subject
        @StudentGrader var activityGrade: Double
        @StudentGrader var midtermGrade: Double
        @StudentGrader var finalExamGrade: Double
    }
    let name: String
    let surname: String
    let ID: String
    let faculty: University.Faculty
    let admissionYear: Int
    let gradesArray: [Grade]
    @GPAGrader var GPA: Double
    
    init(name: String, surname: String, ID: String, faculty: University.Faculty, admissionYear: Int, gradesArray: [Grade], GPA: Double) {
        self.name = name
        self.surname = surname
        self.ID = ID
        self.faculty = faculty
        self.admissionYear = admissionYear
        self.gradesArray = gradesArray
        self.GPA = GPA
    }
}
