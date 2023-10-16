//
//  MHTextPreviews.swift
//  
//
//  Created by Kjeld Groot on 06/09/2023.
//

import SwiftUI
import MotleyHue

struct MHText_Previews: PreviewProvider {
    static var previews: some View {
        MHTextDemo()
    }
}

struct MHTextDemo: View {
    var body: some View {
        PreviewContainer {
            VStack {
                Spacer()
                MHText(
                    "Primary",
                    context: DesignContext()
                        .component(.item)
                        .variant(.primary)
                )
                MHText(
                    "Secondary",
                    context: DesignContext()
                        .component(.item)
                        .variant(.secondary)
                )
                MHText(
                    "Tertiary",
                    context: DesignContext()
                        .component(.item)
                        .variant(.tertiary)
                )
                Spacer()
            }
        }
    }
}
