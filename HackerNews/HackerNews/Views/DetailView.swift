//
//  DetailView.swift
//  HackerNews
//
//  Created by Private on 06/05/2025.
//

import SwiftUI

struct DetailView: View {
    let url: String
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "google.com")
}
