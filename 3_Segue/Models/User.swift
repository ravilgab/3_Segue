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
    
    static func testUser() -> [User] {
        [
            User(userName: "Tim", password: "Cook", person: .init(personName: "Равиль",
                                                                  personSurname: "Габитов",
                                                                  hobby: "Игра в пятнашки"))
        ]
    }
}

struct Person {
    let personName: String
    let personSurname: String
    
    let hobby: String
        
}

