import UIKit

// ЗАДАНИЕ 1. Написать функцию, которая определяет, четное число или нет.

func parityCheck(number:Int) {
    if (number % 2) == 0 {
        print("Число ", number, " четное.")
    } else {
        print("Число ", number, "не четное.")
    }
}
// Генерация случайного числа и запуск функции
let number = Int(arc4random())
parityCheck(number: number)


//ЗАДАНИЕ 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
// Создаем функцию генерации случайных чисел (массив).
func makingNumbers(count:Int) -> [Int] {
    var i = 0
    var array: [Int] = []
    while i < count {
        array.append(Int(arc4random()))
        i += 1
    }
    return array
}

// Создаем функцию для проверки деления на 3 всех эллементов массива. Возвращаем числа, которые не прошли проверку.
func chekDivisionBy3 (array: [Int]) -> [Int] {
    var arr: [Int] = []
    for number in array where ((number % 3) != 0) {
        arr.append(number)
    }
    return arr
}

// Запускаем функцию и создаем массив с пятью случайными числами.
var array: [Int] = makingNumbers(count: 5)
// Запускаем функцию проверки и получаем массив чисел, не прошедших проверку
var arrayWithFalse:[Int] = chekDivisionBy3(array: array)

// Выводим на экран результат проверки
switch arrayWithFalse.count {
case 0:
    print("В массиве", array, "все числа деляться на 3")
case 1:
    print("Из массива", array, "только одно число не делиться на 3 ",arrayWithFalse)
case 2:
    print("Из массива", array, "только два числа не делятся на 3 ",arrayWithFalse)
case 3:
    print("Из массива", array, "только три числа не делятся на 3 ",arrayWithFalse)
case 4:
    print("Из массива", array, "только четыре числа не делятся на 3 ",arrayWithFalse)
default:
    print("Из массива", array, "только ", arrayWithFalse.count, " чисел не деляться на 3 ",arrayWithFalse)
}

// комменты добавлен


