//
//  ContentView.swift
//  CCLHome
//
//  Created by Felipe on 8/4/22.
//

/// SWIFTUI QUIZ #2: Add Item to the Cart when tapping on the row

import SwiftUI

struct CocktailDO: Identifiable {
    let id = UUID()
    let name: String
    let size: Int
    let price: Double
    let icon: String
}

class CocktailOO: ObservableObject {
    @Published var data: [CocktailDO] = []
    
    func fetch() {
        data = [
            CocktailDO(name: "Sex On The Beach", size: 12, price: 10.50, icon: "C1SexOnTheBeach"),
            CocktailDO(name: "Bahama Mama", size: 12, price: 10.50, icon: "C2BahamaMama"),
            CocktailDO(name: "Margarita", size: 12, price: 10.50, icon: "C3Margarita"),
            CocktailDO(name: "Strawberry Frozen Daiquiri", size: 12, price: 10.50, icon: "C4Strawberry Frozen Daiquiri"),
            CocktailDO(name: "Tequila Sunrise", size: 12, price: 10.50, icon: "C5TequilaSunrise"),
            CocktailDO(name: "Rum & Ginger Beer", size: 12, price: 10.50, icon: "C6Rum&GingerBeer"),
            CocktailDO(name: "Pirate Punch", size: 12, price: 10.50, icon: "C7PiratePunch"),
            CocktailDO(name: "The Twilight Zone", size: 12, price: 10.50, icon: "C8TheTwilightZone"),
            CocktailDO(name: "Sangria Swirl", size: 12, price: 10.50, icon: "C9SangriaSwirl"),
            CocktailDO(name: "The Cruiser", size: 12, price: 10.50, icon: "CATheCruiser"),
            CocktailDO(name: "Mocha Chocolate Getaway", size: 12, price: 10.50, icon: "CBMochaChocolateGetaway"),
        ]
    }
}

struct CocktailRow : View {
    let item: CocktailDO
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            HStack(alignment: .center, spacing: 10) {
                Spacer().frame(width:10)
                Image(item.icon)
                    .frame(width: 112, height: 112)
                Spacer().frame(width:10)
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.name)
                        .cclFont(name: .helveticaNeueBold, size: 16, color: UIColor.carnivalLightNavy)
                    Text("\(item.size) oz")
                        .cclFont(name: .helveticaNeue, size: 14, color: UIColor.carnivalTextGray)
                    Text("$\(item.price)")
                        .cclFont(name: .helveticaNeueBold, size: 14, color: UIColor.black)
                }
                Spacer()
            }
            .onTapGesture {
                print("Tapped on Row: \(item)")
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(4.0)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .strokeBorder()
                .foregroundColor(Color(UIColor.carnivalUltraLightGray))
        )
    }
}

//@State -> Structs
//@StateObject -> class
//@ObservedObject -> class

struct CocktailView : View {
    @EnvironmentObject var vm: CartViewModel
    @ObservedObject var oo = CocktailOO()

    private var list: some View {
        LazyVStack {
            ForEach(oo.data) { item in
                CocktailRow(item: item)
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }

    var body: some View {
        CartView(vm: _vm)
        ScrollView {
            list
        }
        .padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0))
        .background(Color(UIColor.australiaGray))
        .onAppear {
            oo.fetch()
        }
    }
}

struct CocktailView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailView()
            .environmentObject(CartViewModel())
    }
}
