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

    
    @ObservedObject var nowPlayingData = NowPlayingViewModel()
    @ObservedObject var upcomingData = UpcomingViewModel()
    @State var navTitle : String = ""
    @State var isNavigationBarHidden: Bool = true
        var body :some View{
        let columns = Array(
        repeating: GridItem(.flexible(), spacing : 25), count: 2
        )
            NavigationView{
                ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: HorizontalAlignment.leading, spacing: 10){
                    Text("Upcoming Movies").padding(.leading)
                
                    ScrollView(.horizontal, showsIndicators: false){
                            HStack {
                                
                                ForEach(upcomingData.upcoming, id: \.id) { photo in
                                    
                                    Button(action: {
                                        navTitle = photo.originalTitle
                                    }, label: {Navigator.navigate( .detail(photo.originalTitle)){
                                        UpcomingItem(upcoming: photo)
                                    }})
            //                        UpcomingItem(upcoming: photo)
                                    
                                }
                            }.padding()
                        
                    }.padding(.trailing)
                    Text("Now Playing").padding(.leading, 15)
        //            Text("Now Playing").padding()
                    
                    ScrollView{
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(nowPlayingData.nowPlaying, id: \.id) { photo in
                                NowPlayingItem(nowPlaying: photo)
                            }
                        }.padding([.leading,.trailing], 20)
                    }
                }
                    }.navigationBarTitle(navTitle)
                    .navigationBarHidden(self.isNavigationBarHidden)
                    .onAppear {
                        self.isNavigationBarHidden = true
                    }.padding(.top, 10)
            }
        
    }
}

struct UpcomingItem : View{
    var upcoming : UpcomingResult
    
    var body: some View{
        VStack(alignment: .leading){
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500/"+upcoming.posterPath)).resizable()
                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: (UIScreen.main.bounds.width - 50) * 0.5, height: 200)
                                                    .cornerRadius(5)
                          
            Text(upcoming.originalTitle).lineLimit(1)
        }.frame(width: (UIScreen.main.bounds.width - 50) * 0.5)
    }
}

struct NowPlayingItem : View {
    
    var nowPlaying : Result
    
    var body: some View {
        VStack(alignment: .leading){
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500/"+nowPlaying.posterPath)).resizable()
                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: (UIScreen.main.bounds.width - 50) * 0.5, height: 200)
                                                    .cornerRadius(5)
                          
            Text(nowPlaying.originalTitle).lineLimit(1)
        }.frame(width: (UIScreen.main.bounds.width - 50) * 0.5)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


