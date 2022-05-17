//
//  ViewRouter.swift
//  Movie Catalog SwiftUI
//
//  Created by Rizky Haris Risaldi on 17/05/22.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .page1
    
}

enum Page {
    case page1
    case page2
}
