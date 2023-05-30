//
//  SinglePlayerView.swift
//  GalacticConqest
//
//  Created by Ethan Thomas on 4/16/23.
//

import SwiftUI
import SpriteKit

struct SinglePlayerView: View {
    
    var scene: SKScene {
        let scene = GameScene(fileNamed: "GameScene") ?? GameScene()
        
        
        return scene
    }
    var body: some View {
        ZStack {
            SpriteView(scene: scene)
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
    }
}

//struct SinglePlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SinglePlayerView()
//    }
//}
