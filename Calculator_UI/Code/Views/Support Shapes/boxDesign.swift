//
//  boxDesign.swift
//  CalculatorDesigProject
//
//  Created by Admin on 2023-10-26.
//
import SwiftUI

struct boxDesign: View {
    var body: some View {
        ForEach(0 ..< 4) { _ in
            ZStack {
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .frame(width: 10, height: 10)
                    .border(Color.gray, width: 5)
                
                Rectangle()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
                    .frame(width: 20, height: 20)
               
            }
            
        }
    }
}

struct boxDesign_Previews: PreviewProvider {
    static var previews: some View {
        boxDesign()
    }
}
