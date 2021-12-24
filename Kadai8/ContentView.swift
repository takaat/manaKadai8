//
//  ContentView.swift
//  Kadai8
//
//  Created by mana on 2021/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var value: Float = 0

    var body: some View {
        TabView {
            ItemView(sliderValue: $value, color: .pink)
                .tabItem({Text("Item")})

            ItemView(sliderValue: $value, color: .green)
                .tabItem({Text("Item")})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ItemView: View {
    @Binding var sliderValue: Float
    let color: Color

    var body: some View {
        ZStack {
            color
                .ignoresSafeArea(edges: .top)

            VStack {
                Text(sliderValueText ?? "")
                    .font(.title)

                Slider(value: $sliderValue)
                    .padding()
            }
        }
    }

    private var sliderValueText: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 6
        return formatter.string(from: .init(value: sliderValue))
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(sliderValue: .constant(0.3), color: .green)
    }
}
