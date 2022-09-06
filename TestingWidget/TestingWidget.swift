//
//  TestingWidget.swift
//  TestingWidget
//
//  Created by Александр on 06.09.2022.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    @AppStorage("emoji", store: UserDefaults(suiteName: "group.Nothing.App-Extension"))
    var emojiData = Data()

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emojiDetails: EmojiProvider.random())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        guard let emoji = try? JSONDecoder().decode(EmojiDetails.self, from: emojiData) else { return }
        let entry = SimpleEntry(date: Date(), emojiDetails: emoji)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        guard let emoji = try? JSONDecoder().decode(EmojiDetails.self, from: emojiData) else { return }

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emojiDetails: emoji)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emojiDetails: EmojiDetails
}

struct TestingWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        EmojiWidgetView(emojiDetails: entry.emojiDetails)
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
        TestingWidgetEntryView(entry: SimpleEntry(date: Date(), emojiDetails: EmojiProvider.random()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
