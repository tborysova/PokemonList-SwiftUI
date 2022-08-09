//
//  PokemonWidget.swift
//  PokemonWidget
//
//  Created by Tetiana Borysova on 09.08.22.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), pokemon: pokemons.randomElement()!, configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), pokemon: pokemons.randomElement()!, configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, pokemon: pokemons.randomElement()!, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let pokemon: Pokemon
    let configuration: ConfigurationIntent
}

struct PokemonWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack{
        Image(entry.pokemon.imageName)
                .resizable()
        .scaledToFit()
        .frame(height: 80)
            Text(entry.pokemon.name)
        .font(.system(size:25))
        .fontWeight(.bold)
            Text(entry.date, style: .time)
        }
    }
}

@main
struct PokemonWidget: Widget {
    let kind: String = "PokemonWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            PokemonWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example.")
    }
}

struct PokemonWidget_Previews: PreviewProvider {
    static var previews: some View {
        PokemonWidgetEntryView(entry: SimpleEntry(date: Date(), pokemon: pokemons.randomElement()!, configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
