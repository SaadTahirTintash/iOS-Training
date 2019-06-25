import Foundation

let json = """
{
"user_data": {
"full_name": "John Sundell",
"user_age": 31
}
}
"""

struct User: Codable{
    var name: String
    var age: Int
}

extension User{
    struct CodingData: Codable{
        struct Container: Codable {
            var full_name : String
            var user_age : Int
        }
        var user_data: Container
    }
}

extension User.CodingData{
    var user: User{
        return User(name: user_data.full_name, age: user_data.user_age)
    }
}

do {
    //    let user = User(name: "Saad", age: 23)
    //    let encoder = JSONEncoder()
    //    let data = try encoder.encode(user)
    
    let data = Data(json.utf8)
    
    let decoder = JSONDecoder()
    //    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let codingData = try decoder.decode(User.CodingData.self, from: data)
    let secondUser = codingData.user
} catch{
    print("Whoops! An error occured: \(error)")
}


