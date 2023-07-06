//
//  CharacterView.swift
//  GalacticConqest
//
//  Created by Ethan Thomas on 6/29/23.
//

import SwiftUI

struct CharacterView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(style: StrokeStyle())
                .stroke(Color.red)
                .frame(width: 130)
                )
            
            
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
