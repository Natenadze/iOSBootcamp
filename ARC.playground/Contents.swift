import UIKit


// MARK: - 4 🟢

class StationModule {
    
    private let moduleName: String
    var drone: Drone?
    
    // MARK: - Init
    init(moduleName: String, drone: Drone? = nil) {
        self.moduleName = moduleName
        self.drone = drone
    }
    
    // MARK: - Methods
    func assignTaskToDrone(_ task: String) {
        drone?.performTask(task)
    }
}


// MARK: - 1 🟢

class ControlCenter: StationModule {
    private var isLockedDown: Bool = false
    var securityCode: String = ""
    
    // MARK: - Init
    init(securityCode: String, moduleName: String) {
        self.securityCode = securityCode
        super.init(moduleName: moduleName)
    }

    // MARK: - Methods
    func lockdown(withPassword password: String) {
        if password == securityCode {
            isLockedDown = true
        }
    }
    
    func printLockdownStatus() {
        if isLockedDown {
            print("The ControlCenter is locked down.")
        } else {
            print("The ControlCenter is not locked down.")
        }
    }
}



// MARK: - 2 🟢

class ResearchLab: StationModule {

    private var samples: [String] = []
    var drones: [Drone] = []


    // MARK: - Methods
    func addSample(_ sample: String) {
        samples.append(sample)
    }
}

// MARK: - 3 🟢

class LifeSupportSystem: StationModule {

    var oxygenLevel: Int = 0
    
    // MARK: - Init
    init(oxygenLevel: Int, moduleName: String) {
        self.oxygenLevel = oxygenLevel
        super.init(moduleName: moduleName)
    }


    // MARK: - Methods
    func reportOxygenStatus() {
        print("Oxygen level is at \(oxygenLevel)%.")
    }
}



// MARK: - 5 🟢
 // 5-ჩვენი ControlCenter-ი ResearchLab-ი და LifeSupportSystem-ა გავხადოთ StationModule-ის subClass.
 
// MARK: - 6 🟢

class Drone {

    var task: String?
    unowned var assignedModule: StationModule
    weak var missionControlLink: MissionControl?

    // MARK: - Init
    init(assignedModule: StationModule, missionControlLink: MissionControl? = nil ) {
        self.assignedModule = assignedModule
        self.missionControlLink = missionControlLink
    }

    // MARK: - Methods
    func checkAndPrintTaskStatus() {
        if let task {
            print("Drone's task: \(task)")
        } else {
            print("Drone has no assigned task.")
        }
    }

    func performTask(_ task: String) {
        self.task = task
        missionControlLink?.requestDroneStatus()
    }
}


// MARK: - 7 🟢

class OrbitronSpaceStation {
    
    let controlCenter = ControlCenter(securityCode: "12345", moduleName: "controlCentModule")
    let researchLab = ResearchLab(moduleName: "researchLabModule")
    let lifeSupportSystem = LifeSupportSystem(oxygenLevel: 150, moduleName: "lifeSupportSystemModule")


    // MARK: - Methods
    func lockdown(withPassword password: String) {
        controlCenter.lockdown(withPassword: password)
    }
}


// MARK: - 8 🟢

class MissionControl {

    private var spaceStation: OrbitronSpaceStation?

    // MARK: - Init
    init(spaceStation: OrbitronSpaceStation? = nil) {
        self.spaceStation = spaceStation
    }

    // MARK: - Methods
    func connectToSpaceStation(_ spaceStation: OrbitronSpaceStation) {
        self.spaceStation = spaceStation
    }

    func requestControlCenterStatus() {
        spaceStation?.controlCenter.printLockdownStatus()
    }

    func requestOxygenStatus() {
        spaceStation?.lifeSupportSystem.reportOxygenStatus()
    }

    func requestDroneStatus() {
        if let drone = spaceStation?.researchLab.drones.first {
            drone.checkAndPrintTaskStatus()
        }
    }
}


// MARK: - 9




//  შევქმნათ OrbitronSpaceStation,
let oss = OrbitronSpaceStation()

// შევქმნათ MissionControl-ი,
let ms = MissionControl()

//  missionControl-ი დავაკავშიროთ OrbitronSpaceStation სისტემასთან,
ms.connectToSpaceStation(oss)

//  როცა კავშირი შედგება missionControl-ით მოვითხოვოთ controlCenter-ის status-ი.
ms.requestControlCenterStatus()

//  controlCenter-ის, researchLab-ის და lifeSupport-ის მოდულების დრონებს დავურიგოთ თასქები.
let stationModule1 = StationModule(moduleName: "stationModule1", drone: nil)
oss.controlCenter.drone = Drone(assignedModule: stationModule1)
oss.controlCenter.assignTaskToDrone("task1")

let stationModule2 = StationModule(moduleName: "stationModule2", drone: nil)
oss.researchLab.drone = Drone(assignedModule: stationModule2)
oss.researchLab.assignTaskToDrone("task2")

let stationModule3 = StationModule(moduleName: "stationModule3", drone: nil)
oss.lifeSupportSystem.drone = Drone(assignedModule: stationModule3)
oss.lifeSupportSystem.assignTaskToDrone("task3")

//  შევამოწმოთ დრონების სტატუსები.
oss.controlCenter.drone?.checkAndPrintTaskStatus()
oss.researchLab.drone?.checkAndPrintTaskStatus()
oss.lifeSupportSystem.drone?.checkAndPrintTaskStatus()


//  შევამოწმოთ ჟანგბადის რაოდენობა.
oss.lifeSupportSystem.reportOxygenStatus()

// შევამოწმოთ ლოქდაუნის ფუნქციონალი და შევამოწმოთ დაილოქა თუ არა ხომალდი სწორი პაროლი შევიყვანეთ თუ არა.

oss.controlCenter.printLockdownStatus()
oss.controlCenter.lockdown(withPassword: "12345")
oss.controlCenter.printLockdownStatus()
