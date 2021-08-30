//
//  User.swift
//  3_Segue
//
//  Created by Ravil on 29.08.2021.
//

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(userName: "Tim", password: "Cook", person: Person.getPerson())
    }
}

struct Person {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    let about: String
    let image: String
        
    static func getPerson() -> Person {
        Person(name: "Равиль",
               surname: "Габитов",
               about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
               image: "SteveJobsSquare")
    }
}

