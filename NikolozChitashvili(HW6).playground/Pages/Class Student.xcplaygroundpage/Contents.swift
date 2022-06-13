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
        let subjectName: University.Subject
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
    
    init(name: String, surname: String, ID: String, faculty: [University.Faculty], admissionYear: Int, gradesArray: [Grade], GPA: Double) {
        self.name = name
        self.surname = surname
        self.ID = ID
        self.faculty = faculty
        self.admissionYear = admissionYear
        self.gradesArray = gradesArray
        self.GPA = GPA
    }
}

