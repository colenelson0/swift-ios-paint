//
//  PenView.swift
//  iOSPaint
//
//  Created by Cole Nelson on 3/11/25.
//

import SwiftUI
import PencilKit

struct PenView: View {
    @Binding var penWidth: CGFloat
    @Binding var drawing: PKDrawing
    
    var body: some View {
        HStack(spacing: 12) {
            SizeDecreaseButton(penWidth: $penWidth)
            Text(String(format: "Size: %.0f", penWidth))
                .font(.title3)
                .fontWeight(.semibold)
            SizeIncreaseButton(penWidth: $penWidth)
            Spacer()
            SaveButton(drawing: $drawing)
        }
        .padding(.horizontal, 40)
    }
}

struct SizeDecreaseButton: View {
    @Binding var penWidth: CGFloat
    
    var body: some View {
        Button {
            if penWidth > 1 {
                penWidth -= 1
            } else {
                print("Pen size minimum")
            }
        } label: {
            IconImage(name: "minus.square.fill", bColor: Color(.customBlue))
        }
        .frame(width:28,height:28)
    }
}

struct SizeIncreaseButton: View {
    @Binding var penWidth: CGFloat
    
    var body: some View {
        Button {
            if penWidth < 18 {
                penWidth += 1
            } else {
                print("Pen size maximum")
            }
        } label: {
            IconImage(name: "plus.square.fill", bColor: Color(.customBlue))
        }
        .frame(width:28,height:28)
    }
}

struct SaveButton: View {
    @Binding var drawing: PKDrawing
    
    var body: some View {
        Button {
            drawing.saveToPhotoLibrary()
        } label: {
            Text("Save Drawing")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 160, height: 30)
                .background(Color(.customBlue))
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 5))
        }
    }
}

#Preview {
    @Previewable @State var penWidth: CGFloat = 3
    @Previewable @State var drawing = PKDrawing()
    
    Text("Pen Size Preview")
        .font(.title2)
        .padding()
    PenView(penWidth: $penWidth,
            drawing: $drawing)
}
