//
//  DetailView.swift
//  Lesson 6
//
//  Created by Dylan Kwok Heng Yi on 14/08/2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var BindedHello: String
    var body: some View {
        Text(BindedHello)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(BindedHello: .constant("hello"))
    }
}
