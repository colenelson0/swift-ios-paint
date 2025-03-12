//
//  ColorsView.swift
//  iOSPaint
//
//  Created by Cole Nelson on 3/11/25.
//

import SwiftUI
import PencilKit

struct ColorsView: View {
    @State var expandedView: Bool = false
    @Binding var selectedColor: Color
    @Binding var drawing: PKDrawing
    
    var body: some View {
        if !expandedView {
            HStack(spacing: 20) {
                ForEach([.black,
                         Color(.customBlue),
                         Color(.customRed),
                         Color(.customGray)],
                        id: \.self) { color in
                    ColorButton(bColor: color, selectedColor: $selectedColor)
                }
                TrashButton(drawing: $drawing)
                ExpandButton(expandedView: $expandedView)
            }
        } else {
            ExpandedTools(selectedColor: $selectedColor,
                          drawing: $drawing,
                          expandedView: $expandedView)
        }
    }
}

struct ExpandedTools: View {
    @Binding var selectedColor: Color
    @Binding var drawing: PKDrawing
    @Binding var expandedView: Bool
    
    var body: some View {
        HStack(spacing: 18) {
            ForEach([.black,
                     Color(.customRed),
                     Color(.customOrange),
                     Color(.customYellow),
                     Color(.customGreen),
                     Color(.customCyan),
                     Color(.customBlue)],
                    id: \.self) { color in
                ColorButton(bColor: color, selectedColor: $selectedColor)
            }
        }
        HStack(spacing: 18) {
            ForEach([Color(.customViolet),
                     Color(.customPink),
                     Color(.customFuchsia),
                     Color(.customGray),
                     Color(.customBrown)],
                    id: \.self) { color in
                ColorButton(bColor: color, selectedColor: $selectedColor)
            }
            TrashButton(drawing: $drawing)
            ExpandButton(expandedView: $expandedView)
        }
    }
}

struct ColorButton: View {
    var bColor: Color
    @Binding var selectedColor: Color
    
    var body: some View {
        Button {
            selectedColor = bColor
        } label: {
            IconImage(name: "pencil.tip.crop.circle", bColor: bColor)
        }
        .frame(width:40,height:40)
    }
}

struct TrashButton: View {
    @Binding var drawing: PKDrawing
    
    var body: some View {
        Button {
            drawing = PKDrawing()
        } label: {
            IconImage(name: "trash.circle", bColor: Color(.black))
        }
        .frame(width:40,height:40)
    }
}

struct ExpandButton: View {
    @Binding var expandedView: Bool
    
    var body: some View {
        Button {
            expandedView.toggle()
        } label: {
            IconImage(name: expandedView ? "minus.circle" : "plus.circle", bColor: Color(.black))
        }
        .frame(width:40,height:40)
    }
}

#Preview {
    @Previewable @State var selectedColor = Color.black
    @Previewable @State var drawing = PKDrawing()
    
    Text("Colors Preview")
        .font(.title2)
        .padding()
    ColorsView(selectedColor: $selectedColor,
               drawing: $drawing)
}
