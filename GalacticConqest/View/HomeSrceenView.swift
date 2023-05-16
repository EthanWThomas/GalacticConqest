//
//  HomeSrceenView.swift
//  GalacticConqest
//
//  Created by Ethan Thomas on 4/13/23.
//

import SwiftUI

struct HomeSrceenView: View {
    var body: some View {
        NavigationStack {
            ZStack {
               Color("SpaceColors")
                .ignoresSafeArea()
                moonDrop
                    .padding(-25)
                VStack {
                    gameTitle
                        .padding(.bottom)
                    playButton
                    settingButton
                    gamePage
                    features
                }
            }
        }
    }
    
    var colorBackground: some View {
        VStack {
            
        }
    }
    
    var playButton: some View {
        VStack {
            NavigationLink {
                PlayView()
            } label: {
                Text("PLAY")
                    .font(.custom("Super Mario Bros. 2", fixedSize: 25))
                    .foregroundColor(.yellow)
//                    .padding()
//                Image("Earth1313")
//                    .resizable()
//                    .scaledToFit()
//                    .aspectRatio(contentMode: .fit)
            }

        }
    }
    
    var settingButton: some View {
        VStack {
            NavigationLink {
                SettingPage()
            } label: {
                Text("Setting")
                    .foregroundColor(.yellow)
                    .font(.custom("Super Mario Bros. 2", fixedSize: 15))
//                Image("Tulia")
//                    .resizable()
//                    .scaledToFit()
//                    .aspectRatio(contentMode: .fit)
            }
        }
    }
    
    var gamePage: some View {
        VStack {
            Button {
                //this will navigate to the game pages
            } label: {
                Text("GAMEPAGE")
                    .foregroundColor(.yellow)
                    .font(.custom("Super Mario Bros. 2", fixedSize: 15))
                    
//                Image("Droutera 4IX")
//                    .resizable()
//                    .scaledToFit()
//                    .aspectRatio(contentMode: .fit)
            }
        }
    }
    
    var features: some View {
        VStack {
            Button {
                //this will navigate to the features pages
            } label: {
                Text("FEATURES")
                    .foregroundColor(.yellow)
                    .font(.custom("Super Mario Bros. 2", fixedSize: 15))
//                Image("Moon1313")
//                    .resizable()
//                    .scaledToFit()
//                    .aspectRatio(contentMode: .fit)
            }
        }
    }
    
    var gameTitle: some View {
        VStack {
            Text("Galactic")
                .foregroundColor(.yellow)
                .font(.custom("Super Mario Bros. 2", size: 45))
            Text("Conqest")
                .foregroundColor(.yellow)
                .font(.custom("Super Mario Bros. 2", fixedSize: 45))
                .padding()
               
        }
    }
    
    var moonDrop: some View {
        VStack {
            Spacer()
            Image("MoonDropCropOff")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 875)
                .fixedSize()
                .ignoresSafeArea()
                .padding(.top)
        }
        .ignoresSafeArea()
    }
}

struct HomeSrceenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSrceenView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
