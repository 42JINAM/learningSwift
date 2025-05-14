//: [Previous](@previous)

import Foundation

class BankAccount: AccountSummary {
    //: stored property
    var accountBalance: Float = 0
    var accountNumber: Int = 0
    let fees: Float = 25.00
    
    //: computed property
    var blanceLessFeess: Float {
        get {
            return accountBalance - fees
        }
        
        set(newBalance) {
            accountBalance = newBalance - fees
            
        }
    }
    
    lazy var myProperty: String = {
        return "hello \(self.accountNumber)"
    }()
    
    
    init(number: Int, balance: Float) {
        accountNumber = number
        accountBalance = balance
    }
    
    deinit {}
    //: instance method
    
    //: type method BankAccount.getMaxBalaance()
    //: Concrete return type
    class func getMaxBalance() -> Float {
        return 100000
    }
    //: opaque return type
    func makeSummary() -> some AccountSummary{
        return self
    }
    func summary() -> String {
        return  "Number of account: \(accountNumber) \nBalance: \(accountBalance)"
    }
}

//protocol
protocol AccountSummary {
    func summary() -> String
}

//dot notation
print(BankAccount.getMaxBalance())

let bankAccount = BankAccount(number: 3, balance: 3000)
print(bankAccount.makeSummary().summary())

//: [Next](@next)
