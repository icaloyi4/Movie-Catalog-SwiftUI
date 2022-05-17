//
//  MotherView.swift
//  Movie Catalog SwiftUI
//
//  Created by Rizky Haris Risaldi on 17/05/22.
//

import SwiftUI

struct MotherView: View {
    
    @State var currentPage: Page = .page1
        
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .page1:
            ContentView(viewRouter: ViewRouter())
        case .page2:
            DetailMovies(viewRouter: ViewRouter())
        }
        
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
