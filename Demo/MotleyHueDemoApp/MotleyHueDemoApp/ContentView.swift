//
//  ContentView.swift
//  MotleyHueDemoApp
//
//  Created by Kjeld Groot on 10/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Text") {
                    MHTextDemo()
                }
                NavigationLink("Icon") {
                    MHIconDemo()
                }
                NavigationLink("Button") {
                    MHButtonDemo()
                }
                NavigationLink("Stack") {
                    MHStackDemo()
                }
            }
            .navigationTitle("MotleyHue Demo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
