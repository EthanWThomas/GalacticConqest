//
//  PlayView.swift
//  GalacticConqest
//
//  Created by Ethan Thomas on 4/16/23.
//

import SpriteKit
import SwiftUI

struct PlayView: View {
    
    @State var isPresented = false
    
    var body: some View {
        VStack(spacing: 30) {
            NavigationStack {
                singlePlayerButton
                multiplayerButton
                    .padding()
            }
            
        }
    }
    
    
    var singlePlayerButton: some View {
        NavigationLink {
            SinglePlayerView(isPresented: $isPresented)
        } label: {
            Text("Single-Player")
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding()
        }

    }
    
    var multiplayerButton: some View {
        NavigationLink {
            //
        } label: {
            Text("Multiplayer")
                .font(.largeTitle)
                .foregroundColor(.black)
        }

    }
    
    struct PlayView_Previews: PreviewProvider {
        static var previews: some View {
            PlayView()
        }
    }
}
