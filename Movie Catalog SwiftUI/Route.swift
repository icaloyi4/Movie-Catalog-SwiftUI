//
//  Route.swift
//  Movie Catalog SwiftUI
//
//  Created by Rizky Haris Risaldi on 23/05/22.
//

import Foundation
import SwiftUI

enum Route{
    case detail(String)
}

struct Navigator{
    static func navigate<T: View>(_ route : Route, content:() -> T)-> AnyView{
        switch route {
        case .detail(let movieData):
            return AnyView(NavigationLink(
                destination: DetailMovies(dataMovies: movieData)) {
                content()
            })
        }
    }
}
