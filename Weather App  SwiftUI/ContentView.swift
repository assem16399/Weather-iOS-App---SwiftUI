//
//  ContentView.swift
//  Weather App  SwiftUI
//
//  Created by Aasem Hany on 28/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        
        ZStack{
            BackgroundView(isNight: isNight)
            
            VStack{
                CityTextView(city: "Cairo, EG")
                
                CurrentDayWeatherView(
                    imageName: isNight
                    ? "moon.stars.fill"
                    : "cloud.sun.fill",
                    temperature: "24")
                
                Spacer()
                    .frame(height:40)
                
                HStack(spacing:10 ){
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        systemName: "cloud.sun.fill",
                        degree: "20")
                    
                    WeatherDayView(
                        dayOfWeek: "WED",
                        systemName: "sun.max.fill",
                        degree: "25")
                    
                    WeatherDayView(
                        dayOfWeek: "THU",
                        systemName: "wind",
                        degree: "30")
                    
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        systemName: "sunset.fill",
                        degree: "22")
                    
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        systemName: "cloud.rain.fill",
                        degree: "19")
                    
                }
                
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    
                    DefaultButton(
                        title: "Change Day Time",
                        bgColor: .white,
                        fgColor: .blue)
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
    let dayOfWeek:String
    let systemName:String
    let degree:String
    
    var body: some View {
        VStack(spacing:8){
            Text(dayOfWeek)
                .font(.system(
                    size: 16,
                    weight: .medium,
                    design: .default))
                .foregroundColor(.white)
            
            if #available(iOS 15.0, *) {
                // SFSymbol .hierarchical rendering mode
                // Gives you hierarchical layers of opacity
                // of the selected color
                Image(systemName: systemName)
                    .symbolRenderingMode(.hierarchical)
                    .resizable()
                    .foregroundColor(.blue)
                    .aspectRatio(
                        contentMode: .fit)
                    .frame(width: 40,
                           height: 40)
                
                // SFSymbol .palette rendering mode
                // Gives you full control over the SFSymoble layers colors
//                Image(systemName: systemName)
//                    .symbolRenderingMode(.palette)
//                    .resizable()
//                    .foregroundStyle(.blue, .green, .yellow)
//                    .aspectRatio(
//                        contentMode: .fit)
//                    .frame(width: 40,
//                           height: 40)
            } else {
                // Fallback on earlier versions
                Image(systemName: systemName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(
                        contentMode: .fit)
                    .frame(width: 40,
                           height: 40)
            }
            
            Text("\(degree)°")
                .font(.system(
                    size: 28,
                    weight: .bold,
                    design: .default))
                .foregroundColor(.white)
            
            
        }
    }
}


struct BackgroundView:View {
    let isNight:Bool
    
    var body: some View{
        LinearGradient(gradient: Gradient(
            colors: isNight
            ? [.black,.gray]
            : [.blue, Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView:View{
    let city:String
    
    var body: some View{
        Text(city)
            .font(.system(size: 32,
                          weight: .medium,
                          design: .default))
            .foregroundColor(.white )
            .padding()
    }
}


struct CurrentDayWeatherView:View {
    
    let imageName:String
    let temperature:String
    
    var body: some View{
        VStack(spacing:10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(
                    .system(size: 70,
                            weight: .medium,
                            design:.default))
        }
    }
}

