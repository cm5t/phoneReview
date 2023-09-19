/*
  ContentView.swift
 Project: List (Combined: L5, 6,7)
 Created by Dylan Kwok Heng Yi on 14/08/2023. Updated on 21/08/23.
  Total score = 1.5(performance) + price + durabillity + 4(goodness) + 1/2(battery)
 Posted to github on 17/09/23
 V1.0.0: Removed test variable, added VStack.
 V2.0.0: Added Pros and Cons variables, revamped Phone UI
 V2.1.0: Added 2 new phones
 V2.2.0: Added battery life stat
 V3.0.0: Added total score!
 V3.1.0: Changed a bit of code
 
*/

import SwiftUI

struct Phones: Identifiable {
    var id = UUID()
    var name: String
    var performanceVal: Int
    var priceVal: Int
    var hash: Int
    var durability: Int
    var goodness: Bool
    var pros: String = "No Pros"
    var cons: String = "No Cons"
    var batteryLife: Int
    var totalScore: Int
}

struct ContentView: View {
    @State var Sheetshown = false
    @State var toggle = false
    @State var count = 0
    @State var count2 = 0
    @State var count3 = 0
    @State var count4 = 0
    @State var tally = 0
    @State var hashtag = 4
    @State var phoneData = [
        Phones(name: "Nokia", performanceVal: 2, priceVal: 9, hash: 1, durability: 11, goodness: false, pros: "Very Durable and cheap, long battery life", cons: "Very Poor performance", batteryLife: 22, totalScore: 34),
        Phones(name: "Samsung Galaxy Fold", performanceVal: 6, priceVal: 3, hash: 2, durability: 1, goodness: false, pros: "Not bad battery life", cons: "VERY BAD DURABILITY", batteryLife: 10, totalScore: 18),
        Phones(name: "Apple iPhone 14 Pro Max", performanceVal: 9, priceVal: 3, hash: 3, durability: 6, goodness: true, pros: "Good performance and battery life", cons: "Expensive", batteryLife: 9, totalScore: 31),
        Phones(name: "Apple iPhone 15 Pro Max", performanceVal: 10, priceVal: 2, hash: 4, durability: 9, goodness: true, pros: "Very good performance and insane battery life", cons: "Very expensive", batteryLife: 12, totalScore: 36),
        Phones(name: "Google Pixel 7 pro", performanceVal: 8, priceVal: 4, hash: 5, durability: 7, goodness: false, pros: "Quite good performance", cons: "A bit expensive and not very good battery life", batteryLife: 6, totalScore: 26),
        Phones(name: "Galaxy S23 Ultra", performanceVal: 8, priceVal: 3, hash: 6, durability: 8, goodness: true, pros: "Quite good performance", cons: "A bit expensive", batteryLife: 7, totalScore: 27)
    ]
    @State var typing = "Please Enter Text Here"
    @State var typing2 = "Please Enter Pros"
    @State var typing3 = "Please Enter Cons"

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(phoneData) { phone in
                        NavigationLink {
                            VStack {
                                Text("\(phone.name)")
                                    .offset(y: -250)
                                    .font(.system(size: 30, weight: .bold))
                                Text("\(phone.totalScore) Points")
                                    .offset(y: -250)
                                    .font(.system(size: 20, weight: .bold))
                                Text("Performance: \(phone.performanceVal)/10")
                                Text("Price \(phone.priceVal)/10")
                                Text("Durability: \(phone.durability)/10")
                                Text("Battery Life: \(phone.batteryLife) hours")
                                Text("Is it worth it to buy? \(phone.goodness.description)")
                                Text("Pros: \(phone.pros.description)")
                                Text("Cons: \(phone.cons.description)")
                            }
                        } label: {
                            Text("\(phone.name)")
                        }
                        .id(phone.id)
                    }
                }
            }
            .navigationTitle("Mobile Phones")
            .toolbar {
                ToolbarItem {
                    VStack {
                        NavigationLink {
                            VStack {
                                Text("Model:")
                                    .offset(x: -150, y: -70)
                                TextField("Enter Text", text: $typing)
                                    .offset(x: 100, y: -102)
                                Text("Pros:")
                                    .offset(x: -150, y: -100)
                                TextField("Enter Text", text: $typing2)
                                    .offset(x: 100, y: -132)
                                Text("Cons:")
                                    .offset(x: -150, y: -130)
                                TextField("Enter Text", text: $typing3)
                                    .offset(x: 100, y: -162)
                            }
                            VStack {
                                Toggle("Good", isOn: $toggle)
                                Stepper("Performance", value: $count)
                                    .padding(.horizontal)
                                Stepper("Value", value: $count2)
                                    .padding(.horizontal)
                                Stepper("Durability", value: $count3)
                                    .padding(.horizontal)
                                Stepper("Battery Life - hrs", value: $count4)
                                    .padding(.horizontal)
                                Text("\(count)")
                                    .offset(y: -154)
                                Text("\(count2)")
                                    .offset(y: -132)
                                Text("\(count3)")
                                    .offset(y: -112)
                                Text("\(count4)")
                                    .offset(y: -92)
                                Button {
                                    // Calculate sub-expressions
                                    let performanceScore = count + count / 2
                                    let batteryScore = count4 / 2
                                    let toggleScore = toggle ? 4 : 0

                                    // Calculate the total tally by adding the sub-expressions
                                    tally = performanceScore + count2 + count3 + batteryScore + toggleScore
                                    hashtag += 1
                                    phoneData.append(Phones(name: typing, performanceVal: count, priceVal: count2, hash: hashtag, durability: count3, goodness: toggle, pros: typing2, cons: typing3, batteryLife: count4, totalScore: tally))
                                    count = 0
                                    count2 = 0
                                    count3 = 0
                                    count4 = 0
                                    tally = 0
                                    toggle = false
                                    typing = "Please Enter Text Here"
                                    typing2 = "Please Enter Pros"
                                    typing3 = "Please Enter Cons"
                                } label: {
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
