//
//  SettingView.swift
//  Armin
//
//  Created by Junha on 7/17/24.
//

import SwiftUI
struct SettingView: View {
    var body: some View {
        VStack {
            Text("Setting")
                .font(.system(size: 50, weight: .ultraLight))
                .padding(.top, 35)
            List {
                Section("User Setting") {
                    HStack {
                        Image(systemName: "person")
                        Text("User")
                    }
                    HStack {
                        Image(systemName: "dog")
                        Text("Animal")
                    }
                    HStack {
                        Image(systemName: "character.bubble")
                        Text("Language")
                    }
                }
            }
        }
    }
}

#Preview {
    SettingView()
}
