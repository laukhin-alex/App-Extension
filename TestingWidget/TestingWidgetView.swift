//
//  TestingWidgetView.swift
//  App Extension
//
//  Created by Александр on 07.09.2022.
//

import SwiftUI
import WidgetKit

struct TestingWidgetView: View {
    var body: some View {
        ZStack{
            Color(UIColor.systemIndigo)
            VStack{
                Spacer()
                Link(destination: Links.textView) {
                    HStack{
                        Image(systemName: "textformat.abc.dottedunderline")
                        .frame(width: 15.0, height: 15.0)
                        Text("Text field")
                    }
                }
                .foregroundColor(.green)
                Spacer()
                Link(destination: Links.resultView) {
                    HStack{
                        Image(systemName: "checkmark.seal.fill")
                            .padding(.trailing)
                        .frame(width: 15.0, height: 15.0)
                    Text("Results")
                    }
                }
                .foregroundColor(.red)
                Spacer()
            }
        }
    }

}

