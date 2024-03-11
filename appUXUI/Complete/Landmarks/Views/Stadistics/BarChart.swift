//
//  BarChart.swift
//  Landmarks
//
//  Created by Alumno on 10/03/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import Charts

struct InfoBarra: Hashable {
    var id = UUID()
    var title: String
    var amount: Int
    var color: Color
}

struct BarChart: View {
    var info: [InfoBarra] = [
        .init(title: "Reportes de Agua Contaminada", amount: 39, color: .pink),
        .init(title: "Reportes de Suelo Contaminado", amount: 17, color: .orange),
        .init(title: "Reportes de Aire Contaminado", amount: 34, color: .purple)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Reportes de Contaminación")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color(red: 0.5, green: 0.8, blue: 0.7))
                Text("Febrero 2024")
                    .font(.footnote)
                Chart {
                    ForEach(info, id: \.self) { info in
                        BarMark(
                            x: .value("Tipo de Contaminacion", info.title),
                            y: .value("Amount", info.amount)
                        )
                        .foregroundStyle(info.color)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .frame(width: geometry.size.width / 1.1, height: 500) // Adjust only the height
            }
            .padding()
        }
    }
}


#Preview {
    BarChart()
}
