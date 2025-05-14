//: [Previous](@previous)

import Foundation

class BankAccount {
    var accountBalance: Float
    var accountNumber: Int
    
    init(accountBalance: Float, accountNumber: Int) {
        self.accountBalance = accountBalance
        self.accountNumber = accountNumber
    }
    
    func displayBalance() {
        print("Number: \(accountNumber), Balance: \(accountBalance)")
    }
}

class SavingAccount: BankAccount {
    var interstRate: Float = 0
    
    init(accountBalance: Float, accountNumber: Int, interstRate: Float) {
        self.interstRate = interstRate
        super.init(accountBalance: accountBalance, accountNumber: accountNumber)
    }
    
    func calculateInterest() -> Float {
        return accountBalance * interstRate
    }
    
    override func displayBalance() {
        print("Number: \(accountNumber), Balance: \(accountBalance), Interest: \(calculateInterest())")
    }
}

//: Extension

extension Double {
    var squared: Double {
        return self * self
    }
    
    var cubed: Double {
        return self * self * self
    }
}

let myDouble: Double = 5
print(myDouble.squared)
print(myDouble.cubed)

print(11.squared)


//: [Next](@next)
