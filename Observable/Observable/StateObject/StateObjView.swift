//
//  StateObjView.swift
//  Observable
//
//  Created by Private on 20/05/2025.
//

import SwiftUI

struct StateObjView: View {
    @StateObject var demoData: DemoData = DemoData()
    
    var body: some View {
        Text("\(demoData.currentUser), you are user number \(demoData.userCount)")
    }
}

#Preview {
    StateObjView()
}
