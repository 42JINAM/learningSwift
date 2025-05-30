//
//  SettingView.swift
//  OutlineGroupDemo
//
//  Created by Private on 30/05/2025.
//

import SwiftUI

struct SettingView: View {
    @State private var hybridState: Bool = false
    @State private var electricState: Bool = true
    @State private var fuelCellState: Bool = false
    @State private var inversionState: Bool = true
    @State private var filtersExpanded: Bool = true

    var body: some View {
        Form {
            DisclosureGroup(isExpanded: $filtersExpanded) {
                ToggleControll(title: " Hybrid Cars", state: hybridState)
                ToggleControll(title: " Electric Cars", state: electricState)
                ToggleControll(title: " Fuel Cell Cars", state: fuelCellState)
            } label: {
                Label("Categories Filters", systemImage: "car.2.fill")
            }

            DisclosureGroup(isExpanded: $filtersExpanded) {
                ColorControl(color: .red, label: "Background Color")
                ColorControl(color: .blue, label: "Foreground Color")
                ToggleControll(title: "Color Inversion", state: inversionState)
            } label: {
                Label("Color Settings", systemImage: "scribble.variable")
            }
        }
    }
}

struct ColorControl: View {
    var color: Color
    var label: String

    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Rectangle()
                .fill(color)
                .frame(width: 30, height: 30)
        }
        .padding(.leading)
        .scaledToFill()
    }
}

struct ToggleControll: View {
    var title: String
    @State var state: Bool

    var body: some View {
        Toggle(title, isOn: $state)
            .padding(.leading)
    }
}

#Preview {
    SettingView()
}
