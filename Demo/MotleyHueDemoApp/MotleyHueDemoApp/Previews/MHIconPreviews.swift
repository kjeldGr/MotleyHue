//
//  MHIconPreviews.swift
//  
//
//  Created by Kjeld Groot on 06/09/2023.
//

import SwiftUI
import MotleyHue

struct MHIcon_Previews: PreviewProvider {
    static var previews: some View {
        MHIconDemo()
    }
}

struct MHIconDemo: View {
    
    @State private var scale = MHScale.medium
    
    private let image = Image(systemName: "plus")
    
    init() {}
    
    var body: some View {
        PreviewContainer {
            VStack(alignment: .leading, spacing: 16) {
                ScalePicker(scale: $scale)
                HStack {
                    Text("Icon")
                    Spacer()
                    MHIcon(
                        image: image,
                        context: DesignContext()
                            .component(.item)
                            .scale(scale)
                    )
                }
                Spacer()
            }
            .padding(16)
            .navigationTitle("Icon")
        }
    }
}
