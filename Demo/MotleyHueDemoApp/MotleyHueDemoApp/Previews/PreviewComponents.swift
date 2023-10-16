//
//  PreviewComponents.swift
//  
//
//  Created by Kjeld Groot on 02/06/2023.
//

import SwiftUI
import AppLibrary
import MotleyHue

struct PreviewContainer<Content: View>: View {
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        ScrollView {
            content()
        }
        .environmentObject(DesignTokens.demo)
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

struct VariantPicker: View {
    @Binding var variant: MHVariant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Variant:")
            Picker("Variant", selection: $variant) {
                ForEach([
                    MHVariant.primary, .secondary, .tertiary
                ], id: \.keys) {
                    Text($0.keys[0].capitalized).tag($0)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

struct ScalePicker: View {
    @Binding var scale: MHScale
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Scale:")
            Picker("Scale", selection: $scale) {
                ForEach([
                    MHScale.extraExtraSmall, .extraSmall, .small, .medium, .large, .extraLarge, .extraExtraLarge
                ], id: \.keys) {
                    Text($0.keys[0].uppercased()).tag($0)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}
