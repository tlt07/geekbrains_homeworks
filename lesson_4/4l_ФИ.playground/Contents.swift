import UIKit

// ДЗ №3 (ДЗ №4 ниже)
enum TypeCar { case sport, truck }
enum WindowState { case open, close }
enum EngineState { case isOn, isOff }
enum Actions {
    case changeEngineState (EngineState)
    case changeWindowState (WindowState)
    case changeTruckState (someVolume: Double)
    
    // Следующие действия для задания 4
    case drivengMode (DrivingMode)
    case truckBodyState (TruckBodyState)
}
enum Move {
    case straightAhead(Double)
    case left(Double)
    case right(Double)
}

struct Car {
    let type: TypeCar
    let brand: String
    let year: Int
    let truckVolume: Double
    
    var engineState: EngineState
    var windowState: WindowState
    var occupiedVolumeOfTruck: Double
    var x: Double
    var y: Double
    var way = [String] ()
    
    mutating func actions(action: Actions) {
        switch action {
        case .changeWindowState (let state):
            self.windowState = state
        case .changeEngineState (let state):
            self.engineState = state
        case .changeTruckState (someVolume: let value):
            self.occupiedVolumeOfTruck = value
        default:
            ""
        }
    }
    
    // Метод перемещения автомобиля
    mutating func move(direction: Move) {
        switch direction {
        case .straightAhead(let go) :
            self.x += go
            self.occupiedVolumeOfTruck -= go / 10
            self.way.append("прямо " + String(go)) // запись пути движения
        case .left(let go):
            self.y -= go
            self.occupiedVolumeOfTruck -= go / 10
            self.way.append("Право " + String(go))
        case .right(let go):
            self.y += go
            self.occupiedVolumeOfTruck -= go / 10
            self.way.append("Лево " + String(go))
        }
    }
}

func aboutTheCar (car: Car) {
    print("Доступная информация о машине: ")
    print("Марка - ", car.brand)
    print("Год выпуска - ", car.year)
    print("Объем бака - ", car.truckVolume)
}

var Honda = Car(type: .sport, brand: "Honda", year: 2020, truckVolume: 60,  engineState: .isOff, windowState: .close, occupiedVolumeOfTruck: 40, x: 0, y: 0, way: [])
Honda.actions(action: .changeEngineState(.isOn))
Honda.move(direction: .straightAhead(2))
Honda.move(direction: .right(2))
Honda.move(direction: .straightAhead(3))

aboutTheCar(car: Honda)
print("")
print("Координаты авто ", Honda.x, ", ", Honda.y)
print("Бензина в баке ", Honda.occupiedVolumeOfTruck, "л.")
print(Honda.way)
print("")

// ДЗ №4
/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести значения свойств экземпляров в консоль.
 */

enum DrivingMode { case comfort, sport }
enum TruckBodyState { case unloading, close }

class Car_2 {

    let type: TypeCar
    let brand: String
    let year: Int
    let truckVolume: Double
    
    var engineState: EngineState
    var windowState: WindowState
    var occupiedVolumeOfTruck: Double
    
    func action (action: Actions) {}
    
    init(type: TypeCar, brand: String, year: Int, truckVolume: Double, engineState: EngineState, windowState: WindowState, occupiedVolumeOfTruck: Double) {
        self.type = type
        self.brand = brand
        self.year = year
        
        self.truckVolume = truckVolume
        self.engineState = engineState
        self.windowState = windowState
        self.occupiedVolumeOfTruck = occupiedVolumeOfTruck
    }
}


class SportCar: Car_2 {
    
    let overclocking: Double // разгон до 100 км/ч (сек)
    var drivengMode: DrivingMode
    
    init(overclocking: Double, drivengMode: DrivingMode, type: TypeCar, brand: String, year: Int, truckVolume: Double, engineState: EngineState, windowState: WindowState, occupiedVolumeOfTruck: Double) {
        self.overclocking = overclocking
        self.drivengMode = drivengMode
        super.init(type: .sport, brand: brand, year: year, truckVolume: truckVolume, engineState: engineState, windowState: windowState, occupiedVolumeOfTruck: occupiedVolumeOfTruck)
    }
    override func action (action: Actions) {
        switch action {
        case .drivengMode(let mode):
            self.drivengMode = mode
        default:
            "Ошибка изменения режима"
        }
    }
}

class TruckCar: Car_2 {
    
    let volumeOfTruck: Double
    let availableVolumeOfTruck: Double
    var truckBodyState: TruckBodyState {
        willSet {
            print("Кузов машины сейчас примет значение - ", newValue)
        }
    }
    
    init(volumeOfTruck: Double, availableVolumeOfTruck: Double, truckBodyState: TruckBodyState, brand: String, year: Int, truckVolume: Double, engineState: EngineState, windowState: WindowState) {
        self.volumeOfTruck = volumeOfTruck
        self.availableVolumeOfTruck = availableVolumeOfTruck
        self.truckBodyState = truckBodyState
        super.init(type: .truck, brand: brand, year: year, truckVolume: truckVolume, engineState: engineState, windowState: windowState, occupiedVolumeOfTruck: (volumeOfTruck - availableVolumeOfTruck))
    }
    
    override func action (action: Actions) {
        switch action {
        case .truckBodyState (let state):
            self.truckBodyState = state
        default:
            "Ошибка изменения состояния"
        }
    }
}



var newSportCar = SportCar(overclocking: 6, drivengMode: .comfort, type: .sport, brand: "Ferrary", year: 2020, truckVolume: 100, engineState: .isOff, windowState: .close, occupiedVolumeOfTruck: 95)


var newTruckCar = TruckCar(volumeOfTruck: 300, availableVolumeOfTruck: 300, truckBodyState: .close, brand: "Камаз", year: 2000, truckVolume: 300, engineState: .isOff, windowState: .close)

newSportCar.action(action: .drivengMode(.sport))
newTruckCar.action(action: .truckBodyState(.unloading))

print(newTruckCar.truckBodyState)
print(newSportCar.drivengMode)
