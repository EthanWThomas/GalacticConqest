//
//  ShapePlusStroke.swift
//  GalacticConqest
//
//  Created by Ethan Thomas on 4/13/23.
//

import SwiftUI

extension Shape {
    
    func style( strokeColor: some ShapeStyle,
                strokeWidth: CGFloat,
                fill fillContent: some ShapeStyle ) -> some View {
        self.stroke(strokeColor, lineWidth: strokeWidth)
            .background(fill(fillContent))
        
    }
}
