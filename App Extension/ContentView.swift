//
//  ContentView.swift
//  App Extension
//
//  Created by Александр on 06.09.2022.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @State var tabSelection: Int = 1
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.Nothing.App-Extension"))
    var emojiData = Data()


    var body: some View {
        Button(action: {
            print("Action")
            save(EmojiProvider.random())
            WidgetCenter.shared.reloadTimelines(ofKind: "TestingWidget")
        }, label: {
            Text("Tap me!")
        })
    }

    private func save(_ emoji: EmojiDetails) {
        guard let data = try? JSONEncoder().encode(emoji) else {
            return
        }
        emojiData = data
    }



//        TabView(selection: $tabSelection) {
//            SuffixIteratorView()
//                .tag(0)
//                .tabItem {
//                    Label("Suffix", systemImage: "textformat.abc.dottedunderline")
//                }
//
//            TestingView()
//                .tag(1)
//                .tabItem {
//                    Label("Test", systemImage: "testtube.2")
//                }
//        }
//}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
