//
//  IconImage.swift
//  iOSPaint
//
//  Created by Cole Nelson on 3/11/25.
//

import SwiftUI

struct IconImage: View {
    var name: String
    var bColor: Color
    
    var body: some View {
        Image(systemName: name)
            .resizable(resizingMode: .stretch)
            .foregroundStyle(bColor)
    }
}
