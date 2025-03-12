//
//  Some code here is copied from this tutorial: https://medium.com/@danielcrompton5/create-a-drawing-app-with-pencilkit-more-5c5a2a8a4738
//

import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
    var selColor: Color
    var penWidth: CGFloat
    @Binding var drawing: PKDrawing
    private let canvasView = PKCanvasView()
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.delegate = context.coordinator
        
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.monoline,
                                       color: UIColor(selColor),
                                       width: pow(1.3,penWidth-1))
        
        return canvasView
    }
    
    func updateUIView(_ canvasView: PKCanvasView, context: Context) {
        canvasView.tool = PKInkingTool(.monoline,
                                       color: UIColor(selColor),
                                       width: pow(1.3,penWidth-1))
        if drawing != canvasView.drawing {
                    canvasView.drawing = drawing
                }
    }
    
    class Coordinator: NSObject, PKCanvasViewDelegate {
        var drawing: Binding<PKDrawing>
        
        init(drawing: Binding<PKDrawing>) {
            self.drawing = drawing
        }
        
        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            drawing.wrappedValue = canvasView.drawing
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(drawing: $drawing)
    }
}

#Preview {
    @Previewable @State var selectedColor = Color.black
    @Previewable @State var drawing = PKDrawing()
    @Previewable @State var penWidth: CGFloat = 3
    
    Text("Canvas Preview")
        .font(.title2)
        .padding()
    CanvasView(selColor: selectedColor,
               penWidth: penWidth,
               drawing: $drawing)
}
