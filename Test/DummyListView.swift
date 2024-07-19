//
//  DummyListView.swift
//  Test
//
//  Created by Shaikh Rakib on 18/07/24.
//

import SwiftUI

struct Place: Identifiable {
    let id: String = UUID().uuidString
    let image: String = "https://picsum.photos/400"
}


struct DummyListView: View {
    @State var arrPlaces = [Place]()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(arrPlaces) { place in
                    listCell(place: place)
                        .onAppear {
                            paginate(place: place)
                        }
                        .listRowSeparator(.hidden)
                        .listStyle(.plain)
                }
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
    
    func imageCarousel(place: Place) -> some View {
        TabView {
            imageView(image: place.image)
            imageView(image: place.image)
            imageView(image: place.image)
            imageView(image: place.image)
        }
        .tabViewStyle(.page)
        .frame(height: 250)
    }
    
    @ViewBuilder
    func listCell(place: Place) -> some View {
           imageCarousel(place: place)
    }
    
    @ViewBuilder
    func imageView(image: String) -> some View {
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
