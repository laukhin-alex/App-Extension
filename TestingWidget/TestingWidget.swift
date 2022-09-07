//
//  TestingWidget.swift
//  TestingWidget
//
//  Created by Александр on 06.09.2022.
//

import WidgetKit
import SwiftUI


struct Provider: TimelineProvider {
    @AppStorage("Suffix", store: UserDefaults(suiteName: "group.Nothing.App-Extension"))
    var suffix = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct TestingWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        TestingWidgetView()
    }
}

@main
struct TestingWidget: Widget {
    let kind: String = "TestingWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TestingWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct TestingWidget_Previews: PreviewProvider {
    static var previews: some View {
        TestingWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
