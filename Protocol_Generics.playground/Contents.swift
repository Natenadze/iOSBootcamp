import UIKit

/*
 1. შევქმნათ Class-ი SuperEnemy with properties: String name, Int hitPoints (ანუ სიცოცხლის რაოდენობა).
 სურვილისამებრ დაამატებ properties რომელიც მას აღწერს.
 
 
 
 2. შევქმნათ Superhero Protocol-ი.
 
 შემდეგი get only properties: String name,
 String alias,
 Bool isEvil და
 დიქშენარი (dictionary) superPowers [String: Int], სადაც String-ი არის სახელი და Int არის დაზიანება (damage).
 
 Method attack, რომელიც მიიღებს target SuperEnemy-ის და დააბრუნებს (return) Int-ს ანუ დარჩენილ სიცოცხლე.
 Method performSuperPower, რომელიც მიიღებს SuperEnemy-ის და დააბრუნებს (return) Int-ს, აქაც დარჩენილ სიცოცხლე.
 
 3. Superhero-ს extension-ი გავაკეთოთ სადაც შევქმნით method-ს რომელიც დაგვი-print-ავს ინფორმაციას სუპერ გმირზე და მის დარჩენილ superPower-ებზე.
 
 4. შევქმნათ რამოდენიმე სუპერგმირი Struct-ი რომელიც ჩვენს Superhero protocol-ს დააიმპლემენტირებს მაგ:
 
 struct SpiderMan: Superhero და ავღწეროთ protocol-ში არსებული ცვლადები და მეთოდები.
 attack მეთოდში -> 20-იდან 40-ამდე დავაგენერიროთ Int-ის რიცხვი და ეს დაგენერებული damage დავაკლოთ SuperEnemy-ს სიცოცხლეს და დარჩენილი სიცოცხლე დავაბრუნოთ( return).
 performSuperPower-ს შემთხვევაში -> დიქშენერიდან ერთ superPower-ს ვიღებთ და ვაკლებთ enemy-ს (სიცოცხლეს ვაკლებთ). ვშლით ამ დიქშენერიდან გამოყენებულ superPower-ს.
 გამოყენებული superPower-ი უნდა იყოს დარანდომებული. დარჩენილ enemy-ს სიცოცხლეს ვაბრუნებთ (return).
 
 5. შევქმნათ class SuperherSquad,
 რომელიც ჯენერიკ Superhero-s მიიღებს. მაგ: class SuperheroSquad<T: Superhero>.
 შევქმნათ array სუპერგმირების var superheroes: [T].
 შევქმნათ init-ი.
 შევქმნათ method რომელიც ჩამოგვითვლის სქვადში არსებულ სუპერგმირებს.
 
 6.ამ ყველაფრის მერე მოვაწყოთ ერთი ბრძოლა. 🤺🤜🏻🤛🏻
 შევქმნათ method simulateShowdown. ეს method იღებს სუპერგმირების სქვადს და იღებს SuperEnemy-ს.
 სანამ ჩვენი super enemy არ მოკვდება, ან კიდევ სანამ ჩვენ სუპერგმირებს არ დაუმთავრდებათ სუპერ შესაძლებლობები გავმართოთ ბრძოლა.
 ჩვენმა სუპერ გმირებმა რანდომად შეასრულონ superPowers, ყოველი შესრულებული superPowers-ი იშლება ამ გმირის ლისტიდან. თუ გმირს დაუმთავრდა superPowers, მას აქვს ბოლო 1 ჩვეულებრივი attack-ის განხორციელება (ამ attack განხორიციელება მხოლოდ ერთხელ შეუძლია როცა superPowers უმთავრდება).
 
 
 
 ბოლოს შედეგი დავბეჭდოთ, მოიგეს სუპერ გმირება თუ enemy-მ,
 
 ასევე კარგი იქნება თუ ორთაბრძოლის მიმდინარეობასაც დავბეჭდავთ და გამოვიყენებთ extension-ის მეთოდს.
 
 */


// MARK: - 1 🟢

class SuperEnemy {
    
    var name: String
    var hitPoints: Int
    var isDefeated: Bool {hitPoints <= 0}
    
    
    // MARK: - Init
    init(name: String, hitPoints: Int) {
        self.name = name
        self.hitPoints = hitPoints
    }
    
}

let enemy = SuperEnemy(name: "ბოროტი ჯონი", hitPoints: 100)


// MARK: - 2 🟢

protocol Superhero {
    var name:  String { get }
    var alias: String { get }
    var isEvil: Bool  { get }
    var superPowers: [String: Int] { get }
    var hasSuperPowers: Bool { get }
    
    mutating func attack(target: SuperEnemy) -> Int
    mutating func performSuperPower(target: SuperEnemy) -> Int
}


// MARK: - 3 🟢

extension Superhero {
    func showSuperheroInfo() {
        print("Super Hero: \(self.name)")
        print("Is Evil: \(self.isEvil ? "Yes" : "No")")
        print("Superpowers:")
        for (power, damage) in self.superPowers {
            print("  \(power): \(damage)")
        }
    }
}



// MARK: - 4 🟢

struct Hero: Superhero {
    
    var name: String
    var alias: String
    var isEvil: Bool
    var superPowers: [String: Int]
    var hasAttack: Bool  = true
    var hasSuperPowers: Bool {
        !superPowers.isEmpty
    }
    
    // MARK: - Init

    init(name: String, alias: String, isEvil: Bool, superPowers: [String: Int]) {
        self.name = name
        self.alias = alias
        self.isEvil = isEvil
        self.superPowers = superPowers
    }
    
    // MARK: - Methods

    mutating func attack(target: SuperEnemy) -> Int {
        if hasAttack {
            let damage = Int.random(in: 20...40)
            target.hitPoints -= damage
            hasAttack = false
            print("\(name) used attack power. \(target.name) has \(target.hitPoints) points left")
        } else {
            print(print("\(name) has No attack powers left"))
        }
       
        return target.hitPoints
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        if let (power, damage) = self.superPowers.randomElement() {
            target.hitPoints -= damage
            self.superPowers.removeValue(forKey: power)
            print("\(name) used superPower. \(target.name) has \(target.hitPoints) points left")
            print("\(name) has \(superPowers.count) superpowers left")
        } else {
            print("\(name) has No superpowers left")
        }
        
        return target.hitPoints
    }
}



// Create 2 SuperHero
let Ivan = SuperEnemy(name: "Bidzina", hitPoints: 1000)

var hero1 = Hero(name: "Hero1", alias: "Hero2", isEvil: false, superPowers: ["power1": 15, "power2": 25])
var hero2 = Hero(name: "Hero2", alias: "Hero1", isEvil: true, superPowers: ["power1": 35])

//
let damage1 = hero1.attack(target: Ivan)
let damage2 = hero2.performSuperPower(target: Ivan)




// MARK: - 5 🟢

class SuperheroSquad<T: Superhero> {
    var superheroes: [T]
    
    init(superheroes: [T]) {
        self.superheroes = superheroes
    }
    
    func listSuperheroes() {
        print("")
        print("Superheroes in the squad:")
        superheroes.forEach { $0.showSuperheroInfo() }
    }
}

var superheroArray = [Hero]()

var spiderMan = Hero(name: "Spider-Man", alias: "Bondo", isEvil: false, superPowers: ["Web Shoot": 30, "Spider Sense": 25])
var bondo = Hero(name: "Bondo", alias: "Spider-Man", isEvil: false, superPowers: ["Taburetka Hit": 35])

superheroArray.append(spiderMan)
superheroArray.append(bondo)

let superheroSquad = SuperheroSquad(superheroes: superheroArray)
superheroSquad.listSuperheroes()


// MARK: - 6 🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

print("_______-------_______")
print("Let the battle BEGIN!!!!!!")
print("-------_______-------")


func simulateShowdown(squad: SuperheroSquad<Hero>, enemy: SuperEnemy) {
    
    var count = AllPowersCount(heroes: squad.superheroes)
    
    while !enemy.isDefeated && count > 0 {
        if (count - squad.superheroes.count) > 0 {
            if let heroIndex = squad.superheroes.firstIndex(where: { $0.hasSuperPowers }) {
                var hero = squad.superheroes[heroIndex]
                let hitPointLeft = hero.performSuperPower(target: enemy)
                squad.superheroes[heroIndex] = hero
                count -= 1
            }
        } else {
            if let heroIndex = squad.superheroes.firstIndex(where: { $0.hasAttack }) {
                var hero = squad.superheroes[heroIndex]
                let hitPointLeft = hero.attack(target: enemy)
                squad.superheroes[heroIndex] = hero
                count -= 1
            }
        }
    }

    printFinalResult(heroesWon: enemy.isDefeated)
}



// MARK: - Helpers

func printFinalResult(heroesWon: Bool) {
    
    if heroesWon {
        print("Superheroes won the battle")
    } else {
        print("Enemy won the battle")
    }

    print(enemy.name, "finished fight with: ", enemy.hitPoints)
}

func AllPowersCount(heroes: [Hero]) -> Int {
    var result = heroes.count
    
    for hero in heroes {
        result += hero.superPowers.count
    }
    
    return result
}



simulateShowdown(squad: superheroSquad, enemy: enemy)











