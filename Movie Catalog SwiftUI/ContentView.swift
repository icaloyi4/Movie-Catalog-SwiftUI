//
//  ContentView.swift
//  Movie Catalog SwiftUI
//
//  Created by Rizky Haris Risaldi on 12/05/22.
//

import SwiftUI
import SDWebImageSwiftUI



struct ContentView: View {
//    var body: some View {
//        Text("Hello, world!")
//            .padding()
//    }
    

    @StateObject var viewRouter: ViewRouter
    
    @ObservedObject var nowPlayingData = NowPlayingViewModel()
    @ObservedObject var upcomingData = UpcomingViewModel()
        var body :some View{
        let columns = Array(
        repeating: GridItem(.flexible(), spacing : 25), count: 2
        )
        
        
            ScrollView(.vertical, showsIndicators: false){
        VStack(alignment: HorizontalAlignment.leading, spacing: 20){
            Text("Upcoming Movies").padding(.leading)
        
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(upcomingData.upcoming, id: \.id) { photo in
                        VStack(alignment: .leading){
                            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500/"+photo.posterPath)).resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                                    .frame(width: 150, height: 200)
                                                                    .cornerRadius(5)
                                          
                            Text(photo.originalTitle).lineLimit(1)
                        }.frame(width: 150, height: 200)
                    }
                }.padding()
            }.frame(width: UIScreen.main.bounds.size.width - 20)
            Text("Now Playing").padding(.leading)
//            Text("Now Playing").padding()
            
            ScrollView{
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(nowPlayingData.nowPlaying, id: \.id) { photo in
                        NowPlayingItem(nowPlaying: photo)
                    }
                }.padding()
            }
        }
            }
        
    }
}

struct NowPlayingItem : View {
    
    var nowPlaying : Result
    
    var body: some View {
        VStack(alignment: .leading){
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500/"+nowPlaying.posterPath)).resizable()
                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 150, height: 200)
                                                    .cornerRadius(5)
                          
            Text(nowPlaying.originalTitle).lineLimit(1)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}


