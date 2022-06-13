import Foundation

@propertyWrapper
struct StudentGrader {
    var wrappedValue: Double {
        get {
            self.wrappedValue
        }
        set {
            if newValue > 100 { self.wrappedValue = 100 }
            else if newValue < 0 { self.wrappedValue = 0 }
            else { self.wrappedValue = newValue }
        }
    }
}

@propertyWrapper
struct GPAGrader {
    var wrappedValue: Double {
        get {
            self.wrappedValue
        }
        set {
            if newValue > 4.0 { self.wrappedValue = 4.0 }
            else if newValue < 0.0 { self.wrappedValue = 0.0 }
            else { self.wrappedValue = newValue }
        }
    }
}

class Student {
    struct Grade {
        let subjectName: String
        @StudentGrader var activityGrade: Double
        @StudentGrader var midtermGrade: Double
        @StudentGrader var finalExamGrade: Double
    }
    let name: String
    let surname: String
    let ID: String
    let faculty: [University.Faculty]
    let admissionYear: Int
    let gradesArray: [Grade]
    @GPAGrader var GPA: Double
}
