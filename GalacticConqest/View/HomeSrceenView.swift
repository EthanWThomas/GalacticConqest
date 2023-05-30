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
                spaceBackground
                VStack {
                    gameTitle
                        .padding(.bottom)
                    playButton
                    settingButton
                    gamePage
                    features
                        .padding(.bottom)
                }
            }
        }
    }
    
    var playButton: some View {
        VStack {
            NavigationLink {
                PlayView()
            } label: {
                Text("PLAY")
                    .font(.custom("Super Mario Bros. 2", fixedSize: 25))
                    .foregroundColor(Color("AppColors"))
            }

        }
    }
    
    var settingButton: some View {
        VStack {
            NavigationLink {
                SettingPage()
            } label: {
                Text("Setting")
                    .foregroundColor(Color("AppColors"))
                    .font(.custom("Super Mario Bros. 2", fixedSize: 15))
            }
        }
    }
    
    var gamePage: some View {
        VStack {
            Button {
                //this will navigate to the game pages
            } label: {
                Text("GAMEPAGE")
                    .foregroundColor(Color("AppColors"))
                    .font(.custom("Super Mario Bros. 2", fixedSize: 15))
            }
        }
    }
    
    var features: some View {
        VStack {
            Button {
                //this will navigate to the features pages
            } label: {
                Text("FEATURES")
                    .foregroundColor(Color("AppColors"))
                    .font(.custom("Super Mario Bros. 2", fixedSize: 15))
            }
        }
    }
    
    var gameTitle: some View {
        VStack {
            Image("GalacticConqest")
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
        }
    }
    
    var spaceBackground: some View {
        VStack {
            Spacer()
            Image("SpaceBackground")
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 408)
                .ignoresSafeArea()
                
               
        }
        
    }
    
    var gifView: some View {
        GifView(name: "planetGif")
            .frame(width: 320, height: 320)
    }
}

struct HomeSrceenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSrceenView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
