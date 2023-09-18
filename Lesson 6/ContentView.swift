/*
  ContentView.swift
 Project: List (Combined: L5, 6,7)
 Created by Dylan Kwok Heng Yi on 14/08/2023. Updated on 21/08/23.
*/

import SwiftUI

struct Phones: Identifiable{
    var id = UUID()
    var name: String
    var performanceVal: Int
    var priceVal: Int
    var hash: Int
    var durability: Int
    var goodness: Bool
    var test:String=""
    var pros: String="No Pros"
    var cons: String="No Cons"
}

struct ContentView: View {
    @State var hello = "At"
    @State var Sheetshown = false
    @State var toggle = false
    @State var count = 0
    @State var count2 = 0
    @State var count3 = 0
    @State var hashtag = 4
    @State var phoneData = [
        Phones(name: "Nokia", performanceVal: 2, priceVal: 9, hash: 1, durability: 11, goodness: false, pros: "Very Durable and cheap", cons: "Bad performance"),
        Phones(name: "Samsung Galaxy Fold", performanceVal: 6, priceVal: 3, hash: 2, durability: 0, goodness: false, cons: "VERY BAD DURABILITY"),
        Phones(name: "Apple iPhone 14 Pro Max", performanceVal: 9, priceVal: 3, hash: 3, durability: 6, goodness: true, pros: "Good performance", cons: "Expensive"),
        Phones(name: "Apple iPhone 15 Pro Max", performanceVal: 10, priceVal: 2, hash: 4, durability: 9, goodness: true, pros: "Very good performance", cons: "Very expensive"),
        Phones(name: "Google Pixel 7 pro", performanceVal: 8, priceVal: 4, hash: 5, durability: 7, goodness: true, pros: "Quite good performance", cons: "A bit expensive"),
        Phones(name: "Galaxy S23 Ultra", performanceVal: 8, priceVal: 3, hash: 6, durability: 8, goodness: true, pros: "Quite good performance", cons: "A bit expensive")
    ]
    @State var typing = "Please Enter Text Here"
    @State var typing2 = "Please Enter Pros"
    @State var typing3 = "Please Enter Cons"
    var phones: [String] {
        phoneData.map { phone in
            "\(phone.name) (Performance: \(phone.performanceVal)/10, Price \(phone.priceVal)/10, \(phone.durability)/10)"
        }
    }
    var body: some View {
        NavigationStack{
            VStack {
                List{
                    ForEach($phoneData) { phone in
                        NavigationLink {
                            VStack {
                                Text("\(phone.name.wrappedValue.description)")
                                    .offset(y:-250)
                                    .font(.system(size: 30, weight: .bold))
                                Text("Performance: \(phone.performanceVal.wrappedValue)/10")
                                Text("Price \(phone.priceVal.wrappedValue)/10")
                                Text("Durability: \(phone.durability.wrappedValue)/10")
                                Text("Is it worth it to buy? \(phone.goodness.wrappedValue.description)")
                                Text("Pros: \(phone.pros.wrappedValue.description)")
                                Text("Cons: \(phone.cons.wrappedValue.description)")
                            }
                        } label: {
                            Text("\(phone.name.wrappedValue)")
                        }
                        .id(phone.id)
                    }
                    
                }
            }
            .navigationTitle("Mobile Phones")
            .sheet(isPresented: $Sheetshown) {
                DetailView(BindedHello: $hello)
            }
            .toolbar {
                ToolbarItem {
                    VStack{
                        NavigationLink {
                            VStack {
                                Text("Model:")
                                    .offset(x:-150, y:-100)
                                TextField("Enter Text", text: $typing)
                                    .offset(x:100,y:-132)
                                Text("Pros:")
                                    .offset(x:-150, y:-130)
                                TextField("Enter Text", text: $typing2)
                                    .offset(x:100,y:-162)
                                Text("Cons:")
                                    .offset(x:-150, y:-160)
                                TextField("Enter Text", text: $typing3)
                                    .offset(x:100,y:-192)
                            }
                            VStack {
                                Toggle ("Good", isOn: $toggle)
                                Stepper("Performance", value: $count)
                                    .padding(.horizontal)
                                Stepper("Value", value: $count2)
                                    .padding(.horizontal)
                                Stepper("Durability", value: $count3)
                                    .padding(.horizontal)
                                Text("\(count)")
                                    .offset(y:-113)
                                Text("\(count2)")
                                    .offset(y:-98)
                                Text("\(count3)")
                                    .offset(y:-72)
                                Button {
                                    hashtag += 1
                                    phoneData.append(Phones(name: typing, performanceVal: count, priceVal: count2, hash: hashtag, durability: count3, goodness: toggle, pros: typing2, cons: typing3))
                                    count = 0
                                    count2 = 0
                                    count3 = 0
                                    toggle = false
                                    typing = "Please Enter Text Here"
                                    typing2 = "Please Enter Pros"
                                    typing3 = "Please Enter Cons"
                                }label: {
                                    Text("Create phone review")
                                }
                            }
                            .navigationTitle("Create phone review")
                            .padding()
                        } label: {
                            Text("+")
                        }
                    }
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
