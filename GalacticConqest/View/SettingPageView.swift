//
//  SettingPage.swift
//  GalacticConqest
//
//  Created by Ethan Thomas on 4/13/23.
//

import SwiftUI

struct SettingPage: View {
    var body: some View {
        ZStack {
            settingBackground
            VStack {
               settingTopLogo
                HStack {
//                    music
//                    sound
                }
            }
        }
    }
    
    var settingTopLogo: some View {
        VStack(alignment: .leading) {
            Text("Setting")
                .foregroundColor(Color("SettingColor"))
                .font(.custom("Super Mario Bros. 2", size: 40))
                .offset(y: -130)
            HStack {
                sound
                music
            }
        }
    }
    
    var music: some View {
        HStack {
            Text("Music")
                .overlay(RoundedRectangle(cornerRadius: 4)
                    .stroke(style: StrokeStyle())
                    .stroke(Color.black)
                    .frame(width: 160, height: 40)
                    )
                .foregroundColor(Color("AppColors"))
                .font(.custom("Super Mario Bros. 2", size: 25))
                .offset(x: -300, y: -85)
                .padding(.bottom)
                
                
        }
    }
    
    var sound: some View {
        HStack {
            Text("Sound")
                .overlay(RoundedRectangle(cornerRadius: 4)
                    .stroke(style: StrokeStyle())
                    .stroke(Color.black)
                    .frame(width: 160, height: 40)
                    )
                .foregroundColor(Color("AppColors"))
                .font(.custom("Super Mario Bros. 2", size: 25))
//                .clipShape(Capsule())
                .offset(x: 300, y: -85)
                .padding(.bottom)
                
        }
    }
    
    var settingBackground: some View {
        ZStack {
           Image("SettingBackground")
                .resizable()
                .scaledToFit()
                .frame(width: 1094, height: 1094)
                .ignoresSafeArea()
        }
    }
}

struct SettingPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
