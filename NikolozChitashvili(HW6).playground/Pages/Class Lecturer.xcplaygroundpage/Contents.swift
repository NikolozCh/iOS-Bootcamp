import Foundation

class Lecturer {
    struct Lecture {
        let subject: University.Subject
        let faculty: University.Faculty
        let startDate: String
        let endDate: String
        let roomNumber: String
    }
    struct Weekday {
        let lectures: [Lecture]
    }
    struct Timetable {
        let weekDays: [Weekday?]
    }
    let name: String
    let surname: String
    let faculty: University.Faculty
    let subjectsTeaching: [University.Subject]
    let timetable: Timetable
    
    init(name: String, surname: String, faculty: University.Faculty, subjectsTeaching: [University.Subject], timetable: Timetable) {
        self.name = name
        self.surname = surname
        self.faculty = faculty
        self.subjectsTeaching = subjectsTeaching
        self.timetable = timetable
    }
}

let abstractionsLecture = Lecturer.Lecture(subject: .programmingAbstractions, faculty: .macs, startDate: "21:00", endDate: "23:00", roomNumber: "200")
let weekdays = Lecturer.Weekday(lectures: [abstractionsLecture])
let timetable = Lecturer.Timetable(weekDays: [weekdays])


let iosLecturer = Lecturer(name: "Vasili", surname: "Baramidze", faculty: .macs, subjectsTeaching: [.programmingAbstractions, .math], timetable: timetable)

print(iosLecturer)
