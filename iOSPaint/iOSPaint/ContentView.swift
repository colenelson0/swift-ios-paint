//
//  ContentView.swift
//  iOSPaint
//
//  Created by Cole Nelson on 3/6/25.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State private var selectedColor = Color.black
    @State private var drawing = PKDrawing()
    @State private var penWidth: CGFloat = 5
    
    var body: some View {
        VStack(spacing: 22) {
            Text("Paint App")
                .font(.title)
                .fontWeight(.semibold)
            
            CanvasView(selColor: selectedColor,
                       penWidth: penWidth,
                       drawing: $drawing)
            
            ColorsView(selectedColor: $selectedColor,
                       drawing: $drawing)
            
            PenView(penWidth: $penWidth,
                    drawing: $drawing)
        }
    }
}

#Preview {
    ContentView()
}
