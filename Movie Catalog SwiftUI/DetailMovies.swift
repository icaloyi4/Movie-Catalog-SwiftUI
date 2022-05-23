//
//  DetailMovies.swift
//  Movie Catalog SwiftUI
//
//  Created by Rizky Haris Risaldi on 17/05/22.
//

import SwiftUI

struct DetailMovies: View {
    let dataMovies : String
    
    @State var isNavigationBarHidden: Bool = true
    
    var body: some View {
        VStack{
            Text(dataMovies)
            
        }.navigationBarTitle(dataMovies)
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        
    }
}

