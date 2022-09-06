//
//  ContentView.swift
//  App Extension
//
//  Created by Александр on 06.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State var tabSelection: Int = 0

    var body: some View {
        TabView(selection: $tabSelection) {
            SuffixIteratorView()
                .tag(0)
                .tabItem {
                    Label("Suffix", systemImage: "textformat.abc.dottedunderline")
                }

            TestingView()
                .tag(1)
                .tabItem {
                    Label("Test", systemImage: "testtube.2")
                }
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
