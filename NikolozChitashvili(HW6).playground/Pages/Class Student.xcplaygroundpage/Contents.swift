import Foundation

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
    
    // Task 1
    func yearsCountInUniversity(byDate date: Int) -> Int {
        if date < admissionYear {
            return -1 // error code
        }
        return date - admissionYear
    }
    
    // Task 2
    func getInfo() -> (String, String) {
        // I have name and surname already seperated
        // but if I hadn't, the solution would be as follows
        /*
         // assume fullName contains the full name of the student (for ex.: let fullName = "Mark Zuckerberg")
         let name    = fullName.split(separator: " ")[0]
         let surname = fullName.split(separator: " ")[1]
         return (firstName: name, lastName: surname)
         */
        return (firstName: name, lastName: surname)
    }
    
    // Task 3
    // Why do we need to pass admission year to this function, I don't understand
    // but task requires me to implement still
    func studentAge(admissionYear year: Int?) -> Int {
        let yearToSubtractFrom = year ?? admissionYear
        return yearToSubtractFrom - 18
    }
    
    // Task 4
    func ezPzSubjects() -> [University.Subject] {
        // Subjects where student has 89+ points?
        // ..... no idea me understanding requirement... (cuz there are 3 points acquired in a subject)
        // I will include subject if user has 89+ on average
        return gradesArray.filter { ($0.finalExamGrade + $0.activityGrade + $0.midtermGrade) / 3 >= 89.0 /* first, filter all the subjects */ }
                          .map { $0.subjectName /* group them into the array */ }
    }
    
    // Task 5
    func tooToughSubjects() -> [University.Subject] {
        // returning subjects where student has lower than 51.0 points on average
        return gradesArray.filter { ($0.finalExamGrade + $0.activityGrade + $0.midtermGrade) / 3 < 51.0 /* first, filter all the subjects */ }
                          .map { $0.subjectName /* group them into the array */ }
    }
    
    // Task 6
    func tooToughByFinal() -> [University.Subject] {
        return gradesArray.filter { grade in // first, filter all the subjects
            let hasFailedOnAverage = (grade.finalExamGrade + grade.activityGrade + grade.midtermGrade) / 3 < 51.0
            let hasFailedOnFinal = grade.finalExamGrade < 20.0
            return hasFailedOnFinal || hasFailedOnAverage
        }.map { grade in // group them into the array
            grade.subjectName
        }
    }
    
    // Task 7
    func mostlyActiveInASubject() -> University.Subject {
        return gradesArray.sorted { $0.activityGrade > $1.activityGrade }.first!.subjectName
        // შემდეგ შეადარეთ ჯამური ქულა... Didn't understand, really.
    }
}

let faculty = University.Faculty.macs
let gradeOne = Student.Grade(subjectName: .microEconomics, activityGrade: 99, midtermGrade:  45, finalExamGrade:  19)
let gradeTwo = Student.Grade(subjectName: .math, activityGrade: 89, midtermGrade: 87, finalExamGrade:  123)
let dummyGrades = [gradeOne, gradeTwo]
let dummyStudent = Student(name: "Zoe", surname: "Williams", ID: "01034987134", faculty: faculty, admissionYear: 1983, gradesArray: dummyGrades, GPA: 5)

// Testing if GPA was setted 4.0 or not
print("Student's GPA:", dummyStudent.GPA)
// Testing if grade was setted correctly
//print("Student GPA:", dummyStudent.gradesArray[1].finalExamGrade)
// print student faculty
print("Student's Faculty:", dummyStudent.faculty)
// print ez pz subjects
print("Student's EZ PZ Subjects:", dummyStudent.ezPzSubjects())
// print tough subjects
print("Student's tough subjects:", dummyStudent.tooToughSubjects())
// print tough subjects by final
print("Student' tough subjects by final:", dummyStudent.tooToughByFinal())
// print where student was too active
print("Student was mostly active in:", dummyStudent.mostlyActiveInASubject())
