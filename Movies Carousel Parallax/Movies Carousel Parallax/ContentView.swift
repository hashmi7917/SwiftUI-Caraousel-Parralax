//
//  ContentView.swift
//  Movies Carousel Parallax
//
//  Created by hashmi syed muqtadeer on 10/04/21.
//

import SwiftUI

struct ContentView: View {
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 0.99
        
        let x = proxy.frame(in: .global).minX
        
        let diff = abs(x - 32)
        if diff < 100 {
            scale = 1 + (100 - diff) / 500
        }
        
        return scale
    }
    
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
            
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Text("Action Movies").bold()
                            .font(.title2)
                            .padding(.leading)
                            .padding(.top)
                            
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack(spacing: 50) {
                                ForEach(data) { item in
                                    GeometryReader {proxy in
                                        
                                        NavigationLink(
                                            destination: Image(item.avatar).resizable(),
                                            label: {
                                                VStack {
                                                    let scale = getScale(proxy: proxy)
                                                    Image(item.avatar)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 180)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5)
                                                        )
                                                        .clipped()
                                                        .cornerRadius(10)
                                                        .shadow(radius: 5)
                                                        .scaleEffect(CGSize(width: scale, height: scale))
                                                        .animation(.easeOut(duration: 0.5))
                                                        .padding()
                                                        
                                                    Text(item.name.uppercased())
                                                        .font(.headline)
                                                        .padding(.top, 20)
                                                        .multilineTextAlignment(.center)
                                                        .foregroundColor(Color(.label))
                                                        .shadow(radius: 5)
        //                                                .scaleEffect(CGSize(width: scale, height: scale / 2))

                                                }
                                            })
                                    }
                                    .frame(width: 180, height: 400)
                                        
                                }
                            }.padding(32)
                        }
                    }
                    
                    VStack {
                        Text("Animation Movies").bold()
                            .font(.title2)
                            .padding(.leading, -180)
                            
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 50) {
                                ForEach(data2) { item in
                                    GeometryReader {proxy in
                                        
                                        NavigationLink(
                                            destination: Image(item.avatar).resizable(),
                                            label: {
                                                VStack {
                                                    let scale = getScale(proxy: proxy)
                                                    Image(item.avatar)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 180)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5)
                                                        )
                                                        .clipped()
                                                        .cornerRadius(10)
                                                        .shadow(radius: 5)
                                                        .scaleEffect(CGSize(width: scale, height: scale))
                                                        .animation(.easeOut(duration: 0.5))
                                                        .padding()
                                                        
                                                    Text(item.name.uppercased())
                                                        .font(.headline)
                                                        .padding(.top, 20)
                                                        .multilineTextAlignment(.center)
                                                        .foregroundColor(Color(.label))
                                                        .shadow(radius: 5)
        //                                                .scaleEffect(CGSize(width: scale, height: scale / 2))

                                                }
                                            })
                                    }
                                    .frame(width: 180, height: 400)
                                        
                                }
                            }.padding(32)
                        }
                    }
                       
                }.navigationTitle("Carousel Parallax")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


struct Movies: Identifiable {
    var id = UUID()
    var avatar: String
    var name: String
}

var data = [
    Movies(avatar: "ironman", name: "Iron Man"),
    Movies(avatar: "avatar", name: "Avatar"),
    Movies(avatar: "blackpanther", name: "Black Panther"),
    Movies(avatar: "blackwidow", name: "Black Widow"),
    Movies(avatar: "captainamerica", name: "Captain America"),
    Movies(avatar: "hulk", name: "Hulk"),
    Movies(avatar: "spiderman3", name: "Spider Man"),
    Movies(avatar: "thor", name: "Thor"),
    Movies(avatar: "wonderwomen", name: "Wonder Women")
]

var data2 = [
    Movies(avatar: "angrybirds", name: "Angry Birds"),
    Movies(avatar: "nemo", name: "Nemo"),
    Movies(avatar: "despicable", name: "Despicable"),
    Movies(avatar: "frozen", name: "Frozen"),
    Movies(avatar: "shrek", name: "Shrek"),
    Movies(avatar: "dragon", name: "Dragon"),
    Movies(avatar: "incredibles", name: "Incredibles")
]
