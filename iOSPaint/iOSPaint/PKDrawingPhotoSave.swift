//
//  Copied from this tutorial: https://medium.com/@danielcrompton5/create-a-drawing-app-with-pencilkit-more-5c5a2a8a4738
//

import PencilKit
import UIKit

extension PKDrawing {
    func saveToPhotoLibrary() {
            let savedDrawing = self.image(from: self.bounds, scale: 2)
            
            UIImageWriteToSavedPhotosAlbum(savedDrawing, nil, nil, nil)
        }
}
