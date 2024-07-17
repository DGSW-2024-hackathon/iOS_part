//
//  TabView.swift
//  Armin
//
//  Created by Junha on 7/17/24.
//

import SwiftUI
struct TapView: View {
    @State private var showAlert = false
    
    var body: some View {
        @State var selection = 2
        VStack {
            TabView(selection: $selection) {
                JobView()
                    .tabItem {
                        Image(systemName: "laptopcomputer")
                        Text("Job")
                    }
                    .tag(0)
                EducationView()
                    .tabItem {
                        Image(systemName: "graduationcap")
                        Text("Education")
                    }
                    .tag(1)
                ContentView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(2)
                GrowingPetView()
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Pet")
                    }
                    .tag(3)
                
                SettingView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Setting")
                    }
                    .tag(4)
            }
        }
        .alert(isPresented: $showAlert) {
                        Alert(title: Text("알림"), message: Text("이것은 알림 메시지입니다."), dismissButton: .default(Text("확인")))
                    }
        
    }
}

#Preview {
    TapView()
}

