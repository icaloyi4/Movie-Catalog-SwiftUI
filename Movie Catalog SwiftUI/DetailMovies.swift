//
//  DetailMovies.swift
//  Movie Catalog SwiftUI
//
//  Created by Rizky Haris Risaldi on 17/05/22.
//

import SwiftUI

struct DetailMovies: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailMovies_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovies(viewRouter: ViewRouter())
    }
}
