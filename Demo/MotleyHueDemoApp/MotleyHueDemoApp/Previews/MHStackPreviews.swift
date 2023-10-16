//
//  MHStackPreviews.swift
//  
//
//  Created by Kjeld Groot on 02/06/2023.
//

import SwiftUI
import MotleyHue

typealias PreviewStackType = MHStack<TupleView<(MHIcon?, MHText?)>>

struct MHStack_Previews: PreviewProvider {
    static var previews: some View {
        MHStackDemo()
    }
}

struct MHStackDemo<Content: View>: View {
    
    // MARK: - Components
    
    private let navigationTitle: String
    private let context: DesignContext
    private let content: (PreviewStackType) -> Content
    private let text = "Text"
    private let icon = Image(systemName: "plus")
    
    // MARK: - Options
    
    @State private var axis = PreviewStackType.Axis.horizontal()
    
    @State private var variant = MHVariant.primary
    
    @State private var showText = true
    @State private var showIcon = true
    @State private var iconScale = MHScale.medium
    
    @State private var showGap = true
    @State private var showPadding = true
    @State private var showSize = false
    @State private var showBackground = true
    @State private var showBorder = true
    @State private var showCornerRadius = true
    @State private var showShadow = false
    
    init(
        navigationTitle: String = "Stack",
        context: DesignContext,
        @ViewBuilder content: @escaping (PreviewStackType) -> Content
    ) {
        self.navigationTitle = navigationTitle
        self.context = context
        self.content = content
    }
    
    init(
        context: DesignContext = DesignContext().component(.item)
    ) where Content == PreviewStackType {
        self.init(context: context, content: { $0 })
    }
    
    var body: some View {
        PreviewContainer {
            VStack(alignment: .leading, spacing: 16) {
                AxisPicker(axis: $axis)
                    .padding(.bottom, 8)
                
                VariantPicker(variant: $variant)
                    .padding(.bottom, 8)
                
                Group {
                    Toggle("Icon:", isOn: $showIcon)
                    ScalePicker(scale: $iconScale)
                        .disabled(!showIcon)
                    Toggle("Text:", isOn: $showText)
                        .padding(.bottom, 8)
                }
                
                Group {
                    Toggle("Padding:", isOn: $showPadding)
                    Toggle("Size:", isOn: $showSize)
                    Toggle("Background:", isOn: $showBackground)
                    Toggle("Border:", isOn: $showBorder)
                    Toggle("Corner radius:", isOn: $showCornerRadius)
                    Toggle("Shadow:", isOn: $showShadow)
                }
                
                HStack {
                    Text("Result")
                    Spacer()
                    content(MHStack(
                        axis: axis,
                        properties: [
                            showPadding ? .padding() : nil,
                            showSize ? .size() : nil,
                            showBackground ? .background : nil,
                            showBorder ? .border : nil,
                            showCornerRadius ? .cornerRadius : nil,
                            showShadow ? .shadow : nil,
                        ].compactMap { $0 },
                        context: context
                            .variant(variant)
                    ) { context in
                        if showIcon {
                            MHIcon(image: icon, context: context.scale(iconScale))
                        }
                        if showText {
                            MHText(text, context: context)
                        }
                    })
                }
                Spacer()
            }
            .padding(16)
            .navigationTitle(navigationTitle)
        }
    }
}

private struct AxisPicker: View {
    @Binding var axis: PreviewStackType.Axis
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Axis:")
            Picker("Axis", selection: $axis) {
                ForEach([PreviewStackType.Axis.horizontal(), .vertical()], id: \.description) {
                    Text($0.description.capitalized).tag($0)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

extension PreviewStackType.Axis: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
}

private extension PreviewStackType.Axis {
    var description: String {
        switch self {
        case .horizontal:
            return "horizontal"
        case .vertical:
            return "vertical"
        }
    }
}
