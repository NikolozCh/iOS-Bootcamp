// This file contains all the source for main class in order to work properly
// Don't mind this file at all
public class Lecturer {
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
