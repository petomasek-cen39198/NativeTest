//
//  ContentView.swift
//  NativeTest
//
//  Created by Petr Tomášek on 06.12.2024.
//

import SwiftUI

struct Ditto: Decodable, Equatable {
    let name: String
}

struct ContentView: View {
    @State var icon = "globe"
    @State var text = ""
    @State var title = "Ahoj světe!"

    var body: some View {
        VStack {
            Image(systemName: icon.lowercased())
                .imageScale(.large)
                .foregroundStyle(.yellow)
            Text(title)
            Divider()
            TextField("Ikona", text: $text)
            Button("Submit") {
                let url = URL(string: "https://pokeapi.co/api/v2/pokemon/ditto")
                let urlSession = URLSession.shared
                let urlRequest = URLRequest(url: url!)
                urlSession.dataTask(with: urlRequest) { data, response, error in
                    guard let data else { return }
                    let ditto = try! JSONDecoder().decode(Ditto.self, from: data)
                    title = ditto.name
                }.resume()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

#Preview {
    ContentView(icon: "star")
}

#Preview {
    ContentView(icon: "arrow.down.circle")
}

#Preview {
    ContentView(icon: "heart")
}
