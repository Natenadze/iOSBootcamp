//: [Previous](@previous)
import Foundation


// 1. Animal class
class Animal {
    
    var name: String
    var species: String
    var age: Int

    init(name: String, species: String, age: Int) {
        self.name = name
        self.species = species
        self.age = age
    }
    
    required init() {
        fatalError("Animal class is abstract and cannot be instantiated directly.")
    }

    func makeSound() {
        print("Animal makes a sound")
    }
}

// 2. Mammal class
class Mammal: Animal {
    
    var furColor: String

    init(name: String, age: Int, furColor: String) {
        self.furColor = furColor
        super.init(name: name, species: "Mammal", age: age)
    }

    convenience init(name: String, furColor: String) {
        self.init(name: name, age: 0, furColor: furColor)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("Mammal makes a sound")
    }
}

// 3. Bird class
class Bird: Animal {
    
    var canFly: Bool

    init(name: String, age: Int, canFly: Bool) {
        self.canFly = canFly
        super.init(name: name, species: "Bird", age: age)
    }

    convenience init(name: String, canFly: Bool) {
        self.init(name: name, age: 0, canFly: canFly)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("Bird makes a sound")
    }
}


// 4. Reptile class
class Reptile: Animal {
    
    var isColdBlooded: Bool

    init?(name: String, age: Int, isColdBlooded: Bool) {
        if age < 0 {
            return nil
        }
        self.isColdBlooded = isColdBlooded
        super.init(name: name, species: "Reptile", age: age)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("Reptile makes a sound")
    }
}



// 5. Lion class
class Lion: Mammal {
    
    var maneColor: String

    init(name: String, age: Int, furColor: String, maneColor: String) {
        self.maneColor = maneColor
        super.init(name: name, age: age, furColor: furColor)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("Lion makes a roar")
    }
}

// 6. Eagle class
class Eagle: Bird {
    
    var wingspan: Double

    init(name: String, age: Int, canFly: Bool, wingspan: Double) {
        self.wingspan = wingspan
        super.init(name: name, age: age, canFly: canFly)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("Eagle makes a screech")
    }
}



// 7. Snake class
class Snake: Reptile {
    
    var length: Double

    init?(name: String, age: Int, isColdBlooded: Bool, length: Double) {
        self.length = length
        super.init(name: name, age: age, isColdBlooded: isColdBlooded)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("Snake hisses")
    }
}


// 9. Creating an array of animals
var zooAnimals: [Animal] = []

let lion = Lion(name: "Simba", age: 5, furColor: "Golden", maneColor: "Dark Brown")
let eagle = Eagle(name: "Khabib", age: 35, canFly: true, wingspan: 2.5)
let snake = Snake(name: "Nargiza", age: 63, isColdBlooded: true, length: 4.0)
let mammal1 = Mammal(name: "Manny", furColor: "Brown")
let bird1 = Bird(name: "Buddy", canFly: true)
let reptile1 = Reptile(name: "Rex", age: 12, isColdBlooded: true)

zooAnimals.append(lion)
zooAnimals.append(eagle)
if let snake {zooAnimals.append(snake)}
zooAnimals.append(mammal1)
zooAnimals.append(bird1)
if let reptile1 {zooAnimals.append(reptile1)}

// 10. Printing animal information and making sounds
for animal in zooAnimals {
    print("Name: \(animal.name), Species: \(animal.species), Age: \(animal.age)")
    animal.makeSound()
}



/*
 1. Class-ი სახელით Animal, with properties: name, species, age. ამ class აქვს:
 Designated init ამ properties ინიციალიზაციისთვის.
 Method makeSound() რომელიც დაგვი-print-ავს ცხოველის ხმას.



 2. Animal-ის child class სახელად Mammal (ძუძუმწოვრები).
 დამატებითი String property -> furColor.
 Override method makeSound() სადაც აღწერთ შესაბამის ხმას.
 Init-ი -> სახელით, ასაკით, ბეწვის ფერით.
 convenience init -> სახელით, ბეწვის ფერით.



 3. Animal-ის child class: Bird.
 დამატებითი Bool property: canFly.
 Override method makeSound() სადაც ავღწერ შესაბამის ხმას.
 Init -> სახელით, ასაკით, შეუძლია თუ არა ფრენა.
 convenience init -> სახელით, შეუძლია თუ არა ფრენა.



 4. Animal-ის child class: Reptile.
 დამატებითი Bool property: isColdBlooded.
 Override method makeSound() სადაც ავღწერ შესაბამის ხმას.
 Failable Init თუ რეპტილიას ასაკი ნაკლებია 0-ზე ვაბრუნებთ nil-ს.



 5. Mammal-ის child class: Lion.
 დამატებით String property: maneColor.
 Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.



 6. Bird-ის child class: Eagle.
 დამატებით Double property: wingspan.
 Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.



 7. Reptil-ის child class: Snake.
 დამატებით Double property: length.
 Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.



 8. აბსტრაქციისათვის Animal class დავუმატოთ required init() შიგნით აღწერილი fatal error-ით სადაც ვიტყვით რომ Animal class არის აბსტრაქტული და არ უნდა იყოს მისი შექმნა პირდაპირ შესაძლებელი.



 9. შევქმნათ ზოოპარკის ცხოველების Array, დავამატოთ მასში სხვადასხვა სახის ცხოველები: 2-2 Mammal, Bird, Reptile ასევე შევქმნათ 1-1 Lion, Eagle, Snake.



 10. დავბეჭდოთ ჩვენი Array-იდან, ყველა ცხოველის სახელი, სახეობა, ასაკი, და ასე გამოვიძახოთ makeSound მეთოდი.

 */
