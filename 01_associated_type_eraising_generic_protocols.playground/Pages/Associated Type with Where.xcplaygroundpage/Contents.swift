

/*:
 
 ## Generic Protocols with Associated Type
 Learn how to create generic protocol and override associated type
 
 Full tutotiral originally published on Medium by Bob Lee
 - Last Update on April 8th, 2017
 - Swift 3 & iOS 10
 
 */
//: Why Delegate is Weak


//: Generic Function
func genericFunc<T>(enter: T) {
  print(enter)
}

//: Generic Struct 
struct GenericStruct<T> {
  var property: T?
}


let explictStruct = GenericStruct<Bool>()
let implicitStruct = GenericStruct(property: "Bob")




//: Normal Protocol

// Begin with a normal protocol 
protocol NormalProtocol {
  var property: String { get set }
}

class NormalClass: NormalProtocol {
  var property: String = "Bob"
}



//: Introducing Protocol Associated Types
protocol GenericProtocol {
  associatedtype myType
  var anyProperty: myType { get set }
}




class SomeClass: GenericProtocol {
  // typealias myType = String
  // var anyProperty: type = "Bob"
  var anyProperty = "Bob"
}

struct SomeStruct: GenericProtocol {
  var anyProperty = 1996
}

extension GenericProtocol {
  static func introduce() {
    print("I'm Bob")
  }
}

SomeClass.introduce()
SomeStruct.introduce()


//: Generic Constraints
func function<T: GenericProtocol>(enter: T) {
}

// Where Clause and Self
extension GenericProtocol where myType == String, Self == SomeClass {
  func conclude(){
    print("Bob, out")
  }
}


let someClassInstance = SomeClass()
let someStructInstance = SomeStruct()

//: Override Associated Type
protocol Familiable {
  associatedtype FamilyType = Int
  func getName() -> [FamilyType]
}

/*
 class NumberFamily: Familyable {
 func getName() -> [FamilyType] {
 return [1, 2, 3]
 }
 }
 */

class NumberFamily: Familiable {
  func getName() -> [Int] {
    return [1, 2, 3]
  }
}


let numberFam = NumberFamily() // NumberFamily<Int>


struct NormalFamily<T: ExpressibleByStringLiteral>: Familiable  {
  func getName() -> [T] {
    return ["Bob", "Bobby", "Lee"]
  }
}


let normalFam = NormaFamily<String>()

String
// extension String : ExpressibleByExtendedGraphemeClusterLiteral { }



/*:
 > Follow me on [Instagram](https://instagram.com/bobthedev) and [Facebook Page](https://facebook.com/bobthedeveloper) for personal journey and regular updates! All of my free resources available [here](https://learnswiftwithbob.com/RESOURCES.html)
 */




