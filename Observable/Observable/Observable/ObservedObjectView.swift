//
//  ObservedObjectView.swift
//  Observable
//
//  Created by Private on 20/05/2025.
//

import SwiftUI

struct ObservedObjectView: View {
    @ObservedObject var demodata: DemoData
    
    var body: some View {
        Text("\(demodata.currentUser), you are user number \(demodata.userCount)")
    }
}

#Preview {
    ObservedObjectView(demodata: DemoData())
}
