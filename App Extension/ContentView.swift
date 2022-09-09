//
//  ContentView.swift
//  App Extension
//
//  Created by Александр on 06.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State var tabSelection: Int = 0
    @AppStorage("Suffix", store: UserDefaults(suiteName: "group.Nothing.App-Extension"))
    var suffix = Data()
    
    var body: some View {
        TabView(selection: $tabSelection) {
            SuffixIteratorView()
                .tag(0)
                .tabItem {
                    Label("Text field", systemImage: "textformat.abc.dottedunderline")
                }

            ResultView()
                .tag(1)
                .tabItem {
                    Label("Result", systemImage: "checkmark.seal.fill")
                }
        }
        .onOpenURL { url in
            if url == Links.textView {
                tabSelection = 0
            } else if url == Links.resultView {
                tabSelection = 1
            }
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
