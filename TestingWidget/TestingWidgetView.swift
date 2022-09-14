//
//  TestingWidgetView.swift
//  App Extension
//
//  Created by Александр on 07.09.2022.
//
import WidgetKit
import SwiftUI
import Intents

struct MainWidgetView: View {
    var top3: Array<String>
    @Environment(\.widgetFamily) var family
    @ViewBuilder
    var body: some View {
        ZStack {
            Color(UIColor.systemCyan)
            HStack{
                VStack(alignment: .leading){
                    Spacer()
                    Link(destination: URL(string: Links.newTextPath)!, label: {
                        Text("New text")
                            .foregroundColor(Color.white)
                            .font(.title)
                            .multilineTextAlignment(.leading)

                    })
                    if (family != .systemSmall){
                        Spacer()
                        Link(destination: URL(string: Links.resultPath)!, label: {
                            Text("Result")
                                .foregroundColor(Color.blue)
                                .font(.title)
                                .multilineTextAlignment(.leading)
                        })
                        Spacer()
                        Link(destination: URL(string: Links.historyPath)!, label: {
                            Text("History")
                                .foregroundColor(Color.red)
                                .font(.title)
                                .multilineTextAlignment(.leading)
                        })
                    }
                    Spacer()
                }
                .padding(.horizontal)
                VStack(alignment: .leading){
                    Spacer()
                    ForEach(top3, id: \.self) { string in
                        Text(string)
                            .font(.title)
                            .foregroundColor(Color.yellow)
                        Spacer()

                    }

                }
                Spacer()
            }
        }
    }
}
