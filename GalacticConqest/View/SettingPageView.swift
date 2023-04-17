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
            Color.black
                .ignoresSafeArea()
            Text("Setting")
                .foregroundColor(.yellow)
                .font(.largeTitle)
        }
    }
}

struct SettingPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage()
    }
}
