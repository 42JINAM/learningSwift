//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Private on 13/05/2025.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(
            byAdding: .year,
            value: -1,
            to: profile.goalDate
        )!
        let max = Calendar.current.date(
            byAdding: .year,
            value: 1,
            to: profile.goalDate
        )!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            Toggle(isOn: $profile.preferNotifivations) {
                Text("Enable Notification")
            }
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
