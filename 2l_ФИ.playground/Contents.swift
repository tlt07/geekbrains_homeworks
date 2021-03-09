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

// ЗАДАНИЕ 3. Создать возрастающий массив из 100 чисел.
var arrayNew: [Int] = []

for i in 1...100 {
    arrayNew.append(i)
}
print(arrayNew)

// ЗАДАНИЕ 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var i = arrayNew.count - 1
var ii = (arrayNew[98] % 3)
while i != 0 {
    if (arrayNew[i] % 2) == 0 || ((arrayNew[i] % 3) == 0) {
        arrayNew.remove(at: i)
    }
    i -= 1
}
print(arrayNew)

// ЗАДАНИЕ 5.Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов. Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
var f0 = 0
var f1 = 1
func fibonacci (_ f0: inout Int, _ f1: inout Int) -> Int {
    let result = f0 + f1
    f0 = f1
    f1 = result
    return result
}

for _ in 1...50 {
    arrayNew.append(fibonacci(&f0, &f1))
}
print(arrayNew)


