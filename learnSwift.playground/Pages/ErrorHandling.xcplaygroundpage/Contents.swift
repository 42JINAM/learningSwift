//: [Previous](@previous)

import Foundation

let connectionOK = true
let connectionSpeed = 30.00
let fileFound = false

enum FileTransferError: Error {
    case noConnection
    case lowBandwidth
    case fileNotFound
}

func fileTransfer() throws {
    guard connectionOK else {
        throw FileTransferError.noConnection
    }
    guard connectionSpeed > 30 else {
        throw FileTransferError.lowBandwidth
    }
    
    guard fileFound else {
        throw FileTransferError.fileNotFound
    }
}

func sendFile() -> String {
    
    defer {
    }
    
    do {
        try fileTransfer()
    } catch FileTransferError.noConnection, FileTransferError.lowBandwidth {
        return "Connection Error"
    } catch FileTransferError.fileNotFound {
        return "File Not Found"
    } catch {
        return "Unknown Error"
    }
    return "File Sent Successfully"
}
//: [Next](@next)
