//
//  WeatherButton.swift
//  Weather App  SwiftUI
//
//  Created by Aasem Hany on 31/03/2023.
//

import SwiftUI

struct DefaultButton:View {
    let title:String
    let bgColor:Color
    let fgColor:Color
    var body: some View{
        Text(title)
            .frame(width: 280.0,height: 50.0)
            .background(bgColor)
            .foregroundColor(fgColor)
            .font(.system(size: 20,
                          weight: .bold,
                          design: .default))
            .cornerRadius(10.0)
    }
}
