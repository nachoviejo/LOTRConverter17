//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by Kinamic Kinamic on 29/08/2024.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var currency: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(Currency.allCases) { currency in
                        if (self.currency == currency) {
                            CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                                .shadow(color: .black, radius: 10)
                                .overlay {
                                    RoundedRectangle (cornerRadius: 25)
                                        .stroke(lineWidth: 3)
                                        .opacity(0.5)
                                }
                        } else {
                            CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                                .onTapGesture {
                                    self.currency = currency
                                }
                        }
                    }
                }
                Text("Select the currency you would like to convert to:")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(currency: .silverPiece)
}
