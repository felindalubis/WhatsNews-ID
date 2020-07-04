//
//  ContentView.swift
//  WhatsNews-ID
//
//  Created by Felinda Gracia Lubis on 7/4/20.
//  Copyright © 2020 Felinda Lubis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (alignment: .top) {
                        ForEach (networkManager.news) { item in
                            NavigationLink(destination: DetailView(url: item.url)) {
                                VStack(alignment: .center) {
                                    Image.init(uiImage: loadImage().loadImage(imgURL: item.urlToImage) ?? UIImage(imageLiteralResourceName: "placeholder"))
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(2, contentMode: .fill)
                                        .frame(width: 350, height: 620)
                                        .clipped()
                                        .cornerRadius(5)
                                    Text(item.title)
                                        .font(.callout)
                                        .foregroundColor(.primary)
                                        .bold()
                                        .frame(width: 350, alignment: .leading)
                                        .padding(.top)
                                }
                                .padding(.leading)
                            }
                        }
                    }
                    Spacer()
                }
                .onAppear(){
                    self.networkManager.fetchData()
                }
            }
            .navigationBarTitle("WhatsNews Indonesia")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct loadImage {
    func loadImage(imgURL : String)  -> UIImage? {
        let url = URL(string: imgURL)!
        do {
            let data = try Data(contentsOf: url)
            let img = UIImage(data: data)
            return img
        } catch {
            print(error)
        }
        return nil
    }
}

