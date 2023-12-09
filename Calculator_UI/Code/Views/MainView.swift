//
//  MainView.swift
//  Calculator_UI
//


import SwiftUI

struct MainView: View {
    
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @StateObject var appModel: AppModel = AppModel()
    
    let duration: TimeInterval = 0.3
    
   
    var body: some View {
        GeometryReader { proxy in
            
            let width: CGFloat = proxy.size.width - 48
            let height: CGFloat = proxy.size.height
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
               
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading, spacing: 28) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("CASIO")
                                .font(.custom("EurostileExtended-Black", size: 26))
                            
                            Text("Calculator")
                            
                                .font(Font.custom("Orienta-Regular", size: 12))
                               
                                .textCase(.uppercase)
                                .opacity(0.4)
                                .offset(x: 2)
                        }
                        Spacer()
                        HStack(spacing: 12) {
                            ForEach(0 ..< 4) { _ in
                                ZStack {
                                    boxDesign()
                                }
                            }
                        }
                    }
                    
                    DisplayView(height: height, colorScheme: colorScheme, duration: duration)
                        .environmentObject(appModel)
                        .padding(.horizontal, -18)
                    
                    CalculatorButtons(width: width)
                        .environmentObject(appModel)
                }.padding(.horizontal, 24)
                .padding(.vertical, 12)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
