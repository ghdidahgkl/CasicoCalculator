//
//  CalculatorPad.swift
//  Calculator_UI
//

import SwiftUI

enum Type {
    case primary
    case normal
    
    func getColorForBackground() -> Color {
        switch self {
        case .primary:
            return  Color(UIColor(named: "primary")!)
        case .normal:
            return Color(UIColor(named: "normal")!)
        }
    }
    
    
    func getColorForForeground() -> Color {
        switch self {
        case .primary:
            return Color(UIColor(named: "primaryButton")!)
        case .normal:
            return Color(UIColor(named: "normalButton")!)
        }
    }
}

struct CalculatorPad: View {
    
    @State var scale: CGFloat = 1
    @State var foregroundColor = Color.white
    @EnvironmentObject var appModel: AppModel
    
    var type: Type = .normal
    var number = ""
    var action: () -> () = {}
    
    
    
    
    var body: some View {
        ZStack {
        RoundedRectangle(cornerRadius: 12)
        
        
       
            .shadow(color: .black, radius: 1.5, x: 8, y: 8) 
            .foregroundColor(self.appModel.currentOperation.rawValue == number ? Type.primary.getColorForBackground().opacity(0.6) : foregroundColor)
           
         
            .overlay(
                Text(number)
                    .font(Font.custom("Rajdhani-SemiBold", size: 30))
            )
            
            .scaleEffect(scale)
            .onAppear() {
                self.foregroundColor = type.getColorForBackground()
            }
            .onTapGesture {
                action()
                withAnimation(.easeIn(duration: 0.15)) {
                    scale = 1.1
                }
                withAnimation(.default) {
                    self.foregroundColor = Type.primary.getColorForBackground().opacity(0.2)
                }
                Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false) { _ in
                    withAnimation(.default) {
                        scale = 1
                        self.foregroundColor = type.getColorForBackground()
                    }
                }
            }
                RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 1) 
            }
        
    }
}

struct CalculatorPad_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorPad(number: "0378657")
            .environmentObject(AppModel())
            .frame(width: 100, height: 70)
    }
}


