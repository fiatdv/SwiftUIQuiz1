//
//  CartView.swift
//  CCLHome
//
//  Created by Felipe on 8/12/22.
//

import SwiftUI

class CartViewModel: ObservableObject {
    @Published var items: [CocktailDO] = []
    
    func add(item: CocktailDO) {
        items.append(item)
    }
}

struct CartView: View {
    @EnvironmentObject var vm: CartViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text("Items in cart:  \(vm.items.count)  ")
        }
        .frame(height: 25)
        .foregroundColor(.red)
        .background(Color(UIColor.australiaGray))
        .cornerRadius(4.0)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .strokeBorder()
                .foregroundColor(Color(UIColor.carnivalUltraLightGray))
        )
        .padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 16))
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartViewModel())
    }
}
