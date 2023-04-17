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
            VStack {
                gameTitle
                Spacer()
                playButton
                settingButton
                features
                gamePage
            }
        }
    }
    
    var playButton: some View {
        VStack {
            NavigationLink {
                PlayView()
            } label: {
                Text("Play")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }

        }
    }
    
    var settingButton: some View {
        VStack {
            NavigationLink {
                SettingPage()
            } label: {
                Text("Setting")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }

        }
    }
    
    var gamePage: some View {
        VStack {
            Button {
                //this will navigate to the game pages
            } label: {
                Text("GamePage")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
        }
    }
    
    var features: some View {
        VStack {
            Button {
                //this will navigate to the features pages
            } label: {
                Text("Features")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }

        }
    }
    
    var gameTitle: some View {
        VStack {
            Text("Galactic Conqest")
                .foregroundColor(.yellow)
                .font(.largeTitle)
                .padding(30)
        }
    }
    
    var galacticBackground: some View {
        VStack {
            foregroundColor(.white)
            
        }
    }
}

struct HomeSrceenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSrceenView()
    }
}
