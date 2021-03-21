import UIKit

/*
1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

5. Создать несколько объектов каждого класса. Применить к ним различные действия.

6. Вывести сами объекты в консоль.
*/

enum DrivingMode { case comfort, sport}
enum WindowState { case open, close }
enum TruckBodyState { case isOpen, isClose}
enum SomeActions { case setTruckBodyState, setDrivingMode }


protocol Car: AnyObject {
    var color: UIColor { get set }
    var engineState: Bool { get set }
    var mileage: Int { get }
    var windowState: WindowState { get set }
    
    func CostRecolor () // метод подсчета стоимости перекраски авто
}

extension Car {
    func Actions (setEngineState: Bool) {
        self.engineState = setEngineState
    }
    func WindowState (windowState: WindowState) {
        if windowState == .open {
            self.windowState = .close
        } else {
            self.windowState = .open
        }
    }
}

class Sedan: Car {
    
    func CostRecolor () {
        let c: Double = (Double(mileage) + 1) + 0.23
        print("Стоимость перекраски машины ", c)
    }
    
    
    var color = UIColor.init()
    var engineState = false
    var mileage = 0
    var windowState: WindowState
    var drivingMode: DrivingMode
    
    func setDrivingMode (drivingMode:DrivingMode) {
            self.drivingMode = drivingMode
    }
    
    
    init(color:UIColor, engineState: Bool, mileage: Int, windowState: WindowState, drivingMode: DrivingMode) {
        self.color = color
        self.engineState = engineState
        self.mileage = mileage
        self.windowState = windowState
        self.drivingMode = drivingMode
    }
}

var VW = Sedan(color: .black, engineState: false, mileage: 0, windowState: .close, drivingMode: .comfort)

VW.setDrivingMode(drivingMode: .sport)
VW.Actions(setEngineState: true)
print("Режим \(VW.drivingMode)")
print("Зажигание \(VW.engineState)")

extension Car {
    func Recolor (newColor: UIColor) {
        self.color = newColor
        print("Машина была перекрашена")
    }
}

VW.Recolor(newColor: .yellow)

class Truck: Car {
    func CostRecolor () {
        let c: Double = (Double(mileage) + 1) + 0.46
        print("Стоимость перекраски машины ", c)
    }
    
    var color = UIColor.init()
    var engineState = false
    var mileage = 0
    var windowState: WindowState
    
    
    
    init(color:UIColor, engineState: Bool, mileage: Int, windowState: WindowState) {
        self.color = color
        self.engineState = engineState
        self.mileage = mileage
        self.windowState = windowState
    }
    
}

var ford = Truck(color: .darkGray, engineState: false, mileage: 1, windowState: .close)
ford.CostRecolor()
