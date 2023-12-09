//
//  DisplayView.swift
//  Calculator_UI
//

/*
import SwiftUI

struct DisplayView: View {
    
    // MARK:- variables
    @EnvironmentObject var appModel: AppModel
    
    let height: CGFloat
    let colorScheme: ColorScheme
    let duration: TimeInterval
    
    
    var body: some View {
        ZStack {
            DisplayShape()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1.5, x: 5, y: 8)
            .foregroundColor(Color(UIColor(named: "displayColor")!))
                .frame(height: height * 0.275)
            .frame(height: height * 0.275)
            DisplayShape()
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(height: height * 0.275)
                .padding(.horizontal, 2.25)
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    //Text(appModel.input.prefix(80))
                       
                    Text(limitInputText(appModel.input, maxLength: 80))
                        .foregroundColor(.label)
                        
                        .font(Font.custom("Rajdhani-SemiBold", size: fontSizeForInputText(appModel.input, maxSize: 40)))
                        .lineLimit(1)
                        .opacity(self.appModel.valueComputed ?  0.6 : 1)
                        .offset(x: self.appModel.valueComputed ? -20 : 0)
                        
                    Text(appModel.result.clean(places: 3))
                        .foregroundColor(.black)
                            .font(Font.custom("Rajdhani-SemiBold", size: fontSizeForInputText(appModel.input, maxSize: 60)))
                            .opacity(self.appModel.valueComputed ? 0.6 : 1)
                            .offset(x: self.appModel.valueComputed ? -20 : 0)
                            
                }
            }.padding(.trailing, 25)
        }.padding(.trailing, 8)
    }
    func limitInputText(_ input: String, maxLength: Int) -> String {
            return String(input.prefix(maxLength))
        }
    func fontSizeForInputText(_ input: String, maxSize: CGFloat) -> CGFloat {
           let maxSize: CGFloat = maxSize
           let minSize: CGFloat = 1
           let maxInputLength: CGFloat = 80
           let adjustedSize = maxSize - (maxSize - minSize) * CGFloat(input.count) / maxInputLength
           
           return max(min(adjustedSize, maxSize), minSize)
       }
}
struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(height: 818, colorScheme: .dark, duration: 0.1)
            .environmentObject(AppModel())
    }
}
*/
import SwiftUI

struct DisplayView: View {
    
    // MARK:- variables
    @EnvironmentObject var appModel: AppModel
    
    let height: CGFloat
    let colorScheme: ColorScheme
    let duration: TimeInterval
    
    var body: some View {
        ZStack {
            DisplayShape()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1.5, x: 5, y: 8)
                .foregroundColor(Color(UIColor(named: "displayColor")!))
                .frame(height: height * 0.275)
                .frame(height: height * 0.275)
            DisplayShape()
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(height: height * 0.275)
                .padding(.horizontal, 2.25)
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text(limitInputText(appModel.input, maxLength: 80))
                        .foregroundColor(.label)
                        .font(Font.custom("Rajdhani-SemiBold", size: fontSizeForInputText(appModel.input, maxSize: 60)))
                        .lineLimit(1)
                        .opacity(self.appModel.valueComputed ? 0.6 : 1)
                        .offset(x: self.appModel.valueComputed ? -10 : 0)
                    Text(String(appModel.result.clean(places: 3)))
                        .foregroundColor(.label)
                        .font(Font.custom("Rajdhani-SemiBold", size: fontSizeForInputText(String(appModel.result), maxSize: 60)))
                        .lineLimit(1)
                        .opacity(self.appModel.valueComputed ? 0.6 : 1)
                        .offset(x: self.appModel.valueComputed ? -10 : 0)
                }
            }.padding(.trailing, 25)
        }.padding(.trailing, 8)
    }
    
    func limitInputText(_ input: String, maxLength: Int) -> String {
        return String(input.prefix(maxLength))
    }
    
    func fontSizeForInputText(_ input: String, maxSize: CGFloat) -> CGFloat {
        let maxSize: CGFloat = maxSize
        let minSize: CGFloat = 1
        let maxInputLength: CGFloat = 80
        let adjustedSize = maxSize - (maxSize - minSize) * CGFloat(input.count) / maxInputLength
        return max(min(adjustedSize, maxSize), minSize)
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(height: 818, colorScheme: .dark, duration: 0.00000001)
            .environmentObject(AppModel())
    }
}


