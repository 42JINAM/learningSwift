//
//  main.swift
//  Protocol and deligate Demo
//
//  Created by jinam on 4/25/25.
//

import Foundation

protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happend?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    let name: String
    init(name: String, handler: EmergencyCallHandler) {
        self.name = name
        handler.delegate = self
    }
    func performCPR() {
        print("The paramedic: \(name) does chest compression, 30 per second.")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("The doctor does chest compressions, 30 per second.`")
    }
    func useStethescope() {
       print("Listening for heart sounds.")
    }
    
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees.")
    }
    func useElectricDrill() {
        print("Whirr...")
    }
}


let emilio = EmergencyCallHandler()
let pete = Paramedic(name: "pete", handler: emilio)
let je = Paramedic(name: "je", handler: emilio)
let angela = Surgeon(handler: emilio)
emilio.assessSituation()
emilio.medicalEmergency()

