//
//  ContentView.swift
//  Armin
//
//  Created by Junha on 7/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("HI!\nI'm Armin.")
                    .font(.system(size:50, weight: .ultraLight))
                    .bold()
                    .padding(25)
                    .padding(.top, -20)
                Spacer()
            }
            
            HStack {
                Spacer()
                Link(destination: URL(string: "https://dgsw.hs.kr")!, label: {
                    Image("AdBanner")
                        .resizable()
                        .frame(width:325, height:175)
                        .padding(.top, -10)
                })
                
                Spacer()
            }
            
            Text("Recent Company")
                .padding(20)
                .font(.system(size:20, weight: .light))
                .padding(.top, -10)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray)
                    .frame(width: 50, height:50)
                    .padding(.leading, -140)
                    .padding(.top, -10)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.3))
                    .frame(width: 320, height:75)
                    .padding(.leading, 20)
                    .padding(.top, -10)
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.3))
                    .frame(width: 320, height:75)
                    .padding(.leading, 20)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray)
                    .frame(width: 50, height:50)
                    .padding(.leading, -140)
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.3))
                    .frame(width: 320, height:75)
                    .padding(.leading, 20)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray)
                    .frame(width: 50, height:50)
                    .padding(.leading, -140)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
