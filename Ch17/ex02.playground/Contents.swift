import UIKit

// 17-3 School 클래스 서브스크립트 구현
struct Student {
    var name: String
    var number: Int
}

class School {
    var number: Int = 0
    var students: [Student] = [Student]()
    
    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        number += 1
    }
    func addStudents(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int = 0) -> Student? {
        if index < self.number {
            return self.students[index]
        }
        return nil
    }
}

let highSchool: School = School()
highSchool.addStudents(names: "Mijeong", "Juhyun", "Jiyoung", "Seunguk", "Moonduk")

let aStudent: Student? = highSchool[1]
print("\(aStudent?.number) \(aStudent?.name)")  // Optional(1) Optional("Juhyun")
print(highSchool[]?.name)   // 매개변수 기본 값 사용 : Optional("Mijeong")
