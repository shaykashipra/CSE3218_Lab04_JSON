//
//  UserModel.swift
//  json parsing
//
//


import Foundation

struct Person: Codable{
    let firstName, surname, gender: String
    let age: Int
    let address: Address
    let phoneNumbers: [PhoneNumber]
    
    // Generate samples
    static let allPeople: [Person] = Bundle.main.decode(file: "json_example.json")
    static let samplePerson: Person = allPeople[0]
}

struct Address: Codable {
    let streetAddress, city, state, postalCode: String
}

struct PhoneNumber: Codable {
    let type, number: String
}


extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}

