import UIKit

// 17-4 복수의 서브스크립트 구현
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
        self.number += 1
    }
    
    func addStudents(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int) -> Student? { // 첫 번째 서브스크립트
        get {
            if index < self.number {
                return self.students[index]
            }
            return nil
        }
        
        set {
            guard var newStudent: Student = newValue else {
                return
            }
            
            var number: Int = index
            
            if index > self.number {
                number = self.number
                self.number += 1
            }
            
            newStudent.number = number
            self.students[number] = newStudent
        }
    }
    
    subscript(name: String) -> Int? {   // 두 번째 서브스크립트
        get {
            return self.students.filter{ $0.name == name }.first?.number
        }
        
        set {
            guard var number: Int = newValue else {
                return
            }
            
            if number > self.number {
                number = self.number
                self.number += 1
            }
            
            let newStudent: Student = Student(name: name, number: number)
            self.students[number] = newStudent
        }
    }
    
    subscript(name:String, number: Int) -> Student? {   // 세 번째 서브스크립트
        return self.students.filter{ $0.name == name && $0.number == number }.first
    }
}

let highSchool: School = School()
highSchool.addStudents(names: "Mijeong", "Juhyun", "Jiyoung", "Seunguk", "Moonduk")

let aStudent: Student? = highSchool[1]
print("\(aStudent?.number) \(aStudent?.name)")  // Optional(1) Optional("Juhyun")

print(highSchool["Mijeong"])    // Optional(0)
print(highSchool["Dongjin"])    // nil

highSchool[0] = Student(name: "Hongeui", number: 0)
highSchool["Manggu"] = 1

print(highSchool["Juhyun"]) // nil
print(highSchool["Manggu"]) // Optional(1)
print(highSchool["Seunguk", 3]) // Optional(Student(name: "Seunguk",  number: 3))
print(highSchool["Heejin", 3])  // nil
