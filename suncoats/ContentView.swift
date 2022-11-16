//
//  ContentView.swift
//  suncoats
//
//  Created by Artem Bobrov on 14/11/2022.
//

import SwiftUI

let weather = weatherAPI()

struct ContentView: View {
    
    @State var deg: String = "N/A"
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "cloud.sun")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("suncoats")
                        .font(.title)
                    Spacer()
                    Text(deg)
                }.padding()
            }.frame(maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading)
        }.onAppear(perform: {
            weather.getWeather() { weatherData, errorData in
                deg = String(Int((weatherData?.current_weather.temperature)!)) + "\u{00B0}"
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


