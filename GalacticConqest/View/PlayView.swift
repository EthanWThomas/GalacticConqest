//
//  PlayView.swift
//  GalacticConqest
//
//  Created by Ethan Thomas on 4/16/23.
//

import SpriteKit
import SwiftUI

struct PlayView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                VStack(spacing: 50) {
                    singlePlayerButton
                    multiplayerButton
                        .padding()
                }
            }
        }
    }

    var singlePlayerButton: some View {
        NavigationLink {
            SinglePlayerView()
        } label: {
            Text("Single-Player")
                .font(.custom("Super Mario Bros. 2", fixedSize: 25))
                .foregroundColor(Color("AppColors"))
                .padding()
        }

    }
    
    var multiplayerButton: some View {
        NavigationLink {
            //
        } label: {
            Text("Multiplayer")
                .font(.custom("Super Mario Bros. 2", fixedSize: 25))
                .foregroundColor(Color("AppColors"))
        }

    }
    
    struct PlayView_Previews: PreviewProvider {
        static var previews: some View {
            PlayView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
