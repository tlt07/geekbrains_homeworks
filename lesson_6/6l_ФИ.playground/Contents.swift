import Foundation

protocol Shape {
    var area: Double { get }
    var perimeter: Double { get }
    
    var coordinates:[Int] { get }
}

class Circle: Shape, CustomStringConvertible {
    let radius: Double
    var area: Double { Double.pi * pow(radius, 2) }
    var perimeter: Double { Double.pi * radius }
    
    var coordinates = [5, 15]
    
    var description: String {
        return "S=\(area), P=\(perimeter)"
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

class Oval: Shape, CustomStringConvertible {
    var smallLength: Double
    var bigLength: Double
    var area: Double { Double.pi * smallLength * bigLength }
    var perimeter: Double { 4 * ((Double.pi * smallLength * bigLength + (smallLength - bigLength)) / (smallLength + bigLength )) }
    
    var coordinates = [23, 29]
    
    var description: String {
        return "S=\(area), P=\(perimeter)"
    }
    
    init(smallLength: Double, bigLength: Double) {
        self.bigLength = bigLength
        self.smallLength = smallLength
    }
}


var oval = Oval(smallLength: 4, bigLength: 8)
var cicle = Circle(radius: 10)

struct Stack {
    private var elements: [Shape] = []
    mutating func push (_ element: Shape) {
        elements.append(element)
    }
    mutating func pop () -> Shape {
        return elements.removeLast()
    }
    // Задание 3-е. Добавим сабскрипт для получение суммы периметров фигур с доступом по индексу.
    subscript(indices: UInt ...) -> Double? {
            var sumPerimeter = 0.0
            for index in indices {
                if index < self.elements.count  { //сделаем проверк индекс, если индекс не существует, вернем nil
                    sumPerimeter += self.elements[Int(index)].perimeter
                } else { return nil }
            }
            return sumPerimeter
    }
}

var stack = Stack()

stack.push(Circle(radius: 15))
stack.push(cicle)
stack.push(Circle(radius: 3))
print(stack)
print(stack.pop())
print(stack)
print("")

// Задание 2-ое. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
// Создадим функцию высешго порядка, которая будет фильтровать массив по размеру площади фигуры.

let checkArea: (Double) -> Bool = { (element: Double) -> Bool in
    return element > 100
}

func filter(array: [Shape], predicate: (Double) -> Bool ) -> [Shape] {
    var tmpArray = [Shape] ()
    for element in array {
        if predicate (element.area) {
            tmpArray.append(element)
        }
    }
    return tmpArray
}

var arrayShape = [Shape] ()
arrayShape.append(Circle(radius: 2))
arrayShape.append(Circle(radius: 10))
arrayShape.append(Circle(radius: 11.5))
print(arrayShape)
print(filter(array: arrayShape, predicate: checkArea))
print("")

// Задание 3-е. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
stack[0,1]
stack[0,1,10]


