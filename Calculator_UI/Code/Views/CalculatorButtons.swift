//
//  CalculatorButtons.swift
//  Calculator_UI
//


import SwiftUI

struct CalculatorButtons: View {

   
    @EnvironmentObject var appModel: AppModel
    let width: CGFloat

    // MARK:- views
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Spacer()

            HStack(spacing: 20) {
                CalculatorPad(number: "AC") {
                    self.appModel.reset()
                }
                .gesture(
                    LongPressGesture(minimumDuration: 1)
                        .onEnded { _ in
                            self.appModel.reset()
                        }
                )
                .foregroundColor(Color(red: 129/255, green: 188/255, blue: 202/255, opacity: 1.0))
                CalculatorPad(number: "+/-") {
                    self.appModel.set(operation: .plusMinus)
                        
                }
                .foregroundColor(Color(red: 129/255, green: 188/255, blue: 202/255, opacity: 1.0))


                CalculatorPad(number: "%") {
                    self.appModel.set(operation: .percentage)
                }
                .foregroundColor(Color(red: 129/255, green: 188/255, blue: 202/255, opacity: 1.0))

                .foregroundColor(.red)
                CalculatorPad(number: "÷") {
                    self.appModel.addOperation(operation: .divide)
                }
                .foregroundColor(.orange)

            }
            

            HStack(spacing: 20) {
                CalculatorPad(number: "7") {
                    self.appModel.input += "7"
                }

                CalculatorPad(number: "8") {
                    self.appModel.input += "8"
                }

                CalculatorPad(number: "9") {
                    self.appModel.input += "9"
                }

                CalculatorPad(number: "X") {
                    self.appModel.addOperation(operation: .multiply)
                }
                .foregroundColor(.orange)
            }

            HStack(spacing: 20) {
                CalculatorPad(number: "4") {
                    self.appModel.input += "4"
                }
                CalculatorPad(number: "5") {
                    self.appModel.input += "5"
                }

                CalculatorPad(number: "6") {
                    self.appModel.input += "6"
                }
                CalculatorPad(number: "-") {
                    self.appModel.addOperation(operation: .minus)
                }
                .foregroundColor(.orange)
            }

            HStack(spacing: 20) {
                CalculatorPad(number: "1") {
                    self.appModel.input += "1"
                }
                CalculatorPad(number: "2") {
                    self.appModel.input += "2"
                }

                CalculatorPad(number: "3") {
                    self.appModel.input += "3"
                }
                CalculatorPad(number: "+") {
                    self.appModel.addOperation(operation: .plus)
                }
                .foregroundColor(.orange)
            }
            HStack(spacing: 20) {
                CalculatorPad( number: "0") {
                    appModel.addZero()
                }.frame(width: width / 2 - 4)

                CalculatorPad(number: ".") {
                    self.appModel.input += "."
                }

                CalculatorPad(number: "=") {
                    appModel.calculate()
                }
                .foregroundColor(.orange)
            }
        }.environmentObject(appModel)
    }
}

struct CalculatorButtons_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtons(width: 428)
            .frame(height: 450)
            .padding(24)
            .environmentObject(AppModel())
    }
}
