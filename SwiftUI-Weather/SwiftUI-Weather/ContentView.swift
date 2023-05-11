//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by admin on 4/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight: Bool = false
    
    let list: [(dayOfWeek: String, imageName: String, temp: Int)] = [(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temp: 74)]
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cuperatio CV")
        
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                .padding(.bottom, 40)
                HStack(spacing: 20) {
                    
                    ForEach(0..<5) { _ in
                        WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74 )
                    }
                    
                }
                
                    Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backColor: .white)
                }
                
                Spacer()
            }
      
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek:   String
    var imageName:   String
    var temperature: Int
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 40, height: 40)
                .aspectRatio(contentMode: .fit)
                
            
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 26))
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
   
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 72))
                .foregroundColor(.white)
        }
    }
}

struct WeatherButton: View {
    let title: String
    let textColor: Color
    let backColor: Color
    
    var body: some View {
        Text(title)
            .padding(.horizontal, 60)
            .padding(.vertical)
           
            .font(.system(size: 20, weight: .bold))
            .background(backColor)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}

