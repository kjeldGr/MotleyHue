//
//  MHButtonPreviews.swift
//  
//
//  Created by Kjeld Groot on 06/09/2023.
//

import SwiftUI
import MotleyHue

struct MHButton_Previews: PreviewProvider {
    static var previews: some View {
        MHButtonDemo()
    }
}

struct MHButtonDemo: View {
    
    @State private var context = DesignContext()
    @State private var isEnabled = true
    @State private var selectionStyle: MHButton<PreviewStackType>.SelectionStyle = .default
    
    init() {}
    
    var body: some View {
        PreviewContainer {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 16) {
                    Toggle("Enabled:", isOn: $isEnabled)
                    Text("Selection style:")
                    Picker("Selection style", selection: $selectionStyle) {
                        ForEach([
                            MHButton<PreviewStackType>
                                .SelectionStyle.default,
                            .toggle()
                        ], id: \.description) {
                            Text($0.description).tag($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.horizontal, 16)
                MHStackDemo(
                    navigationTitle: "Button",
                    context: context
                ) { stack in
                    MHButton(
                        selectionStyle: selectionStyle
                    ) { context -> PreviewStackType in
                        Task { @MainActor in
                            self.context = context
                        }
                        return stack
                    } action: {}
                        .disabled(!isEnabled)
                }
            }
        }
    }
}

extension MHButton<PreviewStackType>.SelectionStyle: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
}

private extension MHButton<PreviewStackType>.SelectionStyle {
    var description: String {
        switch self {
        case .default:
            return "Default"
        case .toggle:
            return "Toggle"
        }
    }
}
