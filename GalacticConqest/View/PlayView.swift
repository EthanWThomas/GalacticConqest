//
//  PlayView.swift
//  GalacticConqest
//
//  Created by Ethan Thomas on 4/16/23.
//

import SwiftUI

struct PlayView: View {
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
                // Navigate to the GameScene/single-player mode
            } label: {
                ZStack {
//                    RoundedRectangle(cornerRadius: 13)
//                        .style(strokeColor: Color.black, strokeWidth: 4, fill: Color.clear)
                    Text("Single-player")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding()
                }
            }
    }
    
    var multiplayerButton: some View {
        NavigationLink {
            //
        } label: {
            Text("Multiplayer")
                .foregroundColor(.black)
                .font(.largeTitle)
                .padding()
        }

    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
