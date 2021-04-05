import UIKit

protocol SecurityCheck {
    func PINRequest(PIN:Int)
    func CheckPIN() throws -> Bool
}

enum SecurityError: Error {
    case invalidPIN
    case endedAttempts
}


class ATM: SecurityCheck {
    var enteredPIN = 0
    var countEnteredPIN = 0
    var authorization = false
    var cardBlocked = false
    
    func PINRequest (PIN:Int) {
        enteredPIN = PIN
        countEnteredPIN += 1
        print("Введен PIN: \(PIN)")
    }
    
    func CheckPIN () throws -> Bool {
        let PIN = 4556
        guard countEnteredPIN < 3 else { throw SecurityError.endedAttempts }
        guard enteredPIN == PIN else { throw SecurityError.invalidPIN }
        authorization = true
        print("ПИН веррный. Авторизация выполнена")
        return true
    }
    
    
}

var SberbankATM = ATM()
print("Введите PIN")

SberbankATM.authorization
SberbankATM.cardBlocked

while SberbankATM.authorization == false && SberbankATM.countEnteredPIN != 3 && SberbankATM.cardBlocked == false {
    SberbankATM.PINRequest(PIN: 2222)
    do { try SberbankATM.CheckPIN() }
    catch SecurityError.invalidPIN {
        print("Не верный ПИН. Повторите попытку")
    }
    catch SecurityError.endedAttempts {
        print("Закончились попытки ввода ПИН. Карта заблокирована.")
            SberbankATM.cardBlocked = true
        break
    }
    
}

SberbankATM.authorization
