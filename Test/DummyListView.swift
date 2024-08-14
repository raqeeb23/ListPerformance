//
//  DummyListView.swift
//  Test
//
//  Created by Shaikh Rakib on 18/07/24.
//

import SwiftUI
import Kingfisher
import SDWebImageSwiftUI

struct Place: Identifiable {
    let id: String = UUID().uuidString
    let image: String = randomImage()
}


struct DummyListView: View {
    @State var arrPlaces = [Place]()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(arrPlaces) { place in
                    Group {
                        listCell(place: place)
                            .onAppear {
                                paginate(place: place)
                            }
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            .onAppear {
                addElements()
            }
            .navigationTitle("Places")

        }
    }
    
    func paginate(place: Place) {
        if place.id == arrPlaces.last?.id {
            addElements()
        }
    }
    
    func addElements() {
        var places = [Place]()
        for _ in 1...10 {
            places.append(Place())
        }
        arrPlaces.append(contentsOf: places)
        print(arrPlaces.count)
    }
    
    func imageCarousel() -> some View {
        TabView {
            imageView(image: randomImage())
            imageView(image: randomImage())
            imageView(image: randomImage())
            imageView(image: randomImage())
        }
        .tabViewStyle(.page)
        .frame(height: 250)
    }
    
    @ViewBuilder
    func listCell(place: Place) -> some View {
           imageCarousel()
    }
    
    @ViewBuilder
    func imageView(image: String) -> some View {
        
//        WebImage(url: URL(string: image)) { image in
//                image.resizable()
//                .aspectRatio(contentMode: .fill)
//            } placeholder: {
//                    Rectangle().foregroundColor(.gray)
//            }
//            .indicator(.activity) // Activity Indicator
//            .transition(.fade(duration: 0.5)) // Fade Transition with duration
//            .scaledToFit()
//            .frame(width: 350, height: 250)
//            .clipped()
        
//        KFImage(URL(string: image))
//            .placeholder({
//                RoundedRectangle(cornerRadius: 10).fill(.gray)
//            })
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 350, height: 250)
//            .clipped()
        
        AsyncImage(url: URL(string: image)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 250)
                .clipped()
        } placeholder: {
            Rectangle()
                .fill(.gray)
                .frame(width: 350, height: 250)
        }

    }
}

#Preview {
    DummyListView()
}
