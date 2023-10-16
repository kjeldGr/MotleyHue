//
//  TestView.swift
//  
//
//  Created by Kjeld Groot on 05/09/2023.
//

import SwiftUI

struct TestView: View {
    private let font: Font?
    
    init(font: Font? = .system(size: 10)) {
        self.font = font
    }
    
    var body: some View {
        ZStack {
            Text("Text\nText")
                .optionalFont(font)
                .padding(16)
                .fixedSize()
        }
    }
}

private extension View {
    @ViewBuilder
    func optionalFont(_ font: Font?) -> some View {
        if let font {
            self.font(font)
        } else {
            self
        }
    }
}
