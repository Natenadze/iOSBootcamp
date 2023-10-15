import UIKit


protocol Cannons {
    func firingCannons(count: Int)
    func cannonCount()
}

protocol RegularShip {
    var crew: CrewManaging { get set }
    var cargo: CargoManaging { get set }
}


// MARK: - PirateShip

class PirateShip: Cannons {
    let name: String
    var cannonsCount: Int
    private var crew: CrewManaging
    private var cargo: CargoManaging
    
    // MARK: - Init
    init(name: String, cannonsCount: Int, crew: CrewManaging, cargo: CargoManaging) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.crew = crew
        self.cargo = cargo
    }
    
    // MARK: - Methods
    func firingCannons(count: Int) {
        cannonsCount -= count
    }
    
    func cannonCount() {
        print("Remaining cannons: \(cannonsCount)")
    }
    
    // Cargo methods
    func addCargo(item: String) {
        cargo.addCargo(item: item)
    }
    
    func removeCargo(item: String) {
        cargo.removeCargo(item: item)
    }
    
    func listCargo() {
        cargo.listCargo()
    }
    
    // Crew methods
    func addCrew(count: Int) {
        crew.addCrew(count: count)
    }
    
    func removeCrew(count: Int) {
        crew.removeCrew(count: count)
    }
    
    func listCrew() {
        crew.listCrew()
    }
}


// MARK: - Ship without cannons

class someShip: RegularShip {
    
    var crew: CrewManaging
    
    var cargo: CargoManaging
    
    init(crew: CrewManaging, cargo: CargoManaging) {
        self.crew = crew
        self.cargo = cargo
    }
    
    // Cargo methods
    func addCargo(item: String) {
        cargo.addCargo(item: item)
    }
    
    func removeCargo(item: String) {
        cargo.removeCargo(item: item)
    }
    
    func listCargo() {
        cargo.listCargo()
    }
    
    // Crew methods
    func addCrew(count: Int) {
        crew.addCrew(count: count)
    }
    
    func removeCrew(count: Int) {
        crew.removeCrew(count: count)
    }
    
    func listCrew() {
        crew.listCrew()
    }
}


// MARK: - Cargo

protocol CargoManaging {
    func addCargo(item: String)
    func removeCargo(item: String)
    func listCargo()
}

class CargoManager: CargoManaging {
    
    var cargo = [String]()
    
    func addCargo(item: String) {
        cargo.append(item)
    }
    
    func removeCargo(item: String) {
        if let index = cargo.firstIndex(of: item) {
            cargo.remove(at: index)
        }
    }
    
    func listCargo() {
        print("Cargo list:")
        cargo.forEach { print($0) }
    }
}

// MARK: - Crew

protocol CrewManaging {
    func addCrew(count: Int)
    func removeCrew(count: Int)
    func listCrew()
}

class CrewManager: CrewManaging {
    
    var crew = 0
    
    // MARK: - Methods

    func addCrew(count: Int) {
        crew += count
    }
    
    func removeCrew(count: Int) {
        crew -= count
    }
    
    func listCrew() {
        print("Crew count is: \(crew)")
    }
}


// MARK: -


class Frigate: PirateShip {
    
}

class Galleon: PirateShip {
    
}


// MARK: - 2. TreasureMap

class TreasureMap {
    
    let trueX: Int
    let trueY: Int
    
    // MARK: - Init
    init(x: Int, y: Int) {
        trueX = x
        trueY = y
    }
    
    // MARK: - Methods
    func hintToTreasure(x: Int, y: Int) {
        if trueX == x, trueY == y {
            print("Treasure found!")
        } else {
            print("Treasure not found. Try x \(trueX) and y \(trueY) ")
        }
    }

}


// MARK: - 3


class SeaAdventure {
    
    let adventureType: String
    
    // MARK: - Init
    init(adventureType: String) {
        self.adventureType = adventureType
    }
    
    // MARK: - Methods
    func encounter() {
        print("Sea adventure: \(adventureType)")
    }

}


// MARK: - 4

class PirateCode {
    
    
    // MARK: - Methods
    
    private func discussTerms(term: String) {
        print("Discussing terms: \(term)")
    }
    
    func parley(term: String) {
        discussTerms(term: term)
    }
    
    func mutiny(term: String) {
        discussTerms(term: term)
    }
}


// MARK: - 5

let cargoM = CargoManager()
let crewM = CrewManager()

let pirateShip = PirateShip(name: "Black Pearl", cannonsCount: 20, crew: crewM, cargo: cargoM)

pirateShip.addCrew(count: 50)
pirateShip.addCargo(item: "asd")
pirateShip.addCargo(item: "Gadsadas")
pirateShip.listCargo()

//
let treasureMap = TreasureMap(x: 42, y: 17)

let initialX = 20
let initialY = 10

treasureMap.hintToTreasure(x: initialX, y: initialY)

//
let seaAdventure = SeaAdventure(adventureType: "Exploration")


seaAdventure.encounter()


let pirateCode = PirateCode()


pirateCode.parley(term: "Surrender the treasure!")

pirateCode.mutiny(term: "Captain's orders")


