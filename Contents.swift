import UIKit

//list of interest
enum Interest: String {
    case Basketball = "Basketball"
    case Soccer = "Soccer"
    case Cooking = "Cooking"
    case Climbing = "Climbing"
    case Swimming = "Swimming "
    case Travel = "Travel"
    case Fashion = "Fashion"
    case Programming = "Programming"
    case Gaming = "Gaming"
    case Movie = "Movie"
    case Books = "Books"
    case Running = "Running"
    case Photography = "Photography"
}

//list of characteristics
enum Characteristic  {
    case age
    case gender
    case homeTown
    
}

class generatePeople {
    struct Person: Equatable {
        static func == (lhs: generatePeople.Person, rhs:generatePeople.Person) -> Bool {
            return lhs.name == rhs.name
        }
        //properties
            let name: String
            let char: [Characteristic: Any]
            let interest: [Interest]
        }
      var people = [Person]()
  
    
    
//    initialization
    init() {
        people.append(Person(name: "Ally", char: [.age: 24, .gender: "Female",  .homeTown: "Paris, France"], interest: [.Climbing, .Travel, .Basketball, .Movie]  ))
        
        people.append(Person(name: "Tom", char: [.age: 32, .gender: "Male", .homeTown: "Rome"], interest: [.Cooking, .Travel, .Books, .Movie]  ))
        
        people.append(Person(name: "Patton", char: [.age: 20, .gender: "Male",  .homeTown: "Florida, USA"], interest: [.Photography, .Travel, .Basketball, .Movie]  ))
        
        people.append(Person(name: "John", char: [.age: 18, .gender: "Male",  .homeTown: "Cape Town, South Africa"], interest: [.Fashion, .Movie, .Photography, .Running, .Travel,.Cooking]  ))
        
        people.append(Person(name: "Sandy", char: [.age: 30, .gender: "Female",  .homeTown: "Honolulu, Hawaii"], interest: [.Movie, .Running, .Climbing, .Basketball, .Travel]  ))
        
        people.append(Person(name: "Cynthia", char: [.age: 27, .gender: "Female",  .homeTown: "Madrid, Spain"], interest: [.Fashion, .Cooking, .Travel, .Movie]  ))
        
        people.append(Person(name: "Alex", char: [.age: 28, .gender: "Male",  .homeTown: "Zurich Switzerland"], interest: [.Climbing, .Movie, .Programming, .Photography, .Travel]  ))
        
        people.append(Person(name: "Cathy", char: [.age: 23, .gender: "Female",  .homeTown: "Wellington, New Zealand"], interest: [.Programming, .Soccer, .Swimming, .Photography, .Movie, .Travel]  ))
        
        people.append(Person(name: "Jim", char: [.age: 32, .gender: "Male",  .homeTown: "Florida, USA"], interest: [.Basketball, .Movie, .Soccer, .Books, .Cooking, .Travel]  ))
        
        people.append(Person(name: "Amanda", char: [.age: 23, .gender: "Female",  .homeTown: "Bangkok, Thailand"], interest: [.Photography, .Programming, .Movie, .Gaming, .Travel] ))
    }
        //12 People introduce themselves. Notice: "?? 0" take away "Optional"
        func intro() {
            for p in people {
                print("Hi, my name is \(p.name), i am \(p.char[.age] ?? 0) years old, i am a \(p.char [.gender] ?? 0) living in \(p.char[.homeTown] ?? 0)")
            }
        }
        
        //12 persons share their interests.
        func share() {
            let list = people.shuffled()
            for p in list {
                var string = "Hi again, my name is \(p.name) and my interest are "
                for i in p.interest {
                    if p.interest.first!.rawValue == i.rawValue {
                        string.append(i.rawValue)
                    } else {
                        //                coma added between the interest
                        string.append(", \(i.rawValue)")
                    }
                }
                string.append(".")
                print(string)
            }
        }
        
        
        
        //matching results with 2+ interest
        func match()  {
            var togetherPeople = people.shuffled()
            var index = 1
            repeat {
                if index < togetherPeople.count {
                    let share = togetherPeople.first?.interest.filter(togetherPeople[index].interest.contains)
                    if togetherPeople[index].name != togetherPeople.first?.name && share?.count ?? 0 >= 2 {
                        print("\(togetherPeople.first?.name ?? "") is matching with \(togetherPeople[index].name) with \(share?.count ?? 0) common interests.")
                        togetherPeople.remove(at: index)
                        togetherPeople.removeFirst()
                    }
                    else {
                        index += 1
                    }
                }
            }
                while index <= togetherPeople.count
        }
    
}
        /// Run Algo Here
    
        generatePeople().intro()
        print("--")

        generatePeople().share()
        print("--")

        generatePeople().match()


